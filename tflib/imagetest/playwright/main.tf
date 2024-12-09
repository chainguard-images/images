terraform {
  required_providers {
    random = { source = "hashicorp/random" }
  }
}

resource "random_string" "suffix" {
  length  = 4
  special = false
  upper   = false
}

variable "tests" {
  description = "A map of test files to run."
  type        = map(string)

  default = {}
}

variable "playwright_image" {
  description = "The Playwright Docker image to use"
  type        = string
  default     = "mcr.microsoft.com/playwright"
}

variable "playwright_version" {
  description = "The :tag@digest component of the image. Used to discover the npm version to install."
  type        = string
  default     = "v1.49.0-noble@sha256:0fc07c73230cb7c376a528d7ffc83c4bdcdcd3fc7efbe54a2eed72b1ec118377"
}

locals {
  pw_version_tag = split("@", var.playwright_version)[0]
  pw_tag         = trimprefix(local.pw_version_tag, "v")
  pw_version     = trimsuffix(local.pw_tag, "-noble")

  name = "pw-tests-${random_string.suffix.result}"

  job_spec = <<-EOJOB
apiVersion: batch/v1
kind: Job
metadata:
  name: ${local.name}
spec:
  template:
    spec:
      containers:
        - name: playwright
          image: "${var.playwright_image}:${var.playwright_version}"
          command: ["/bin/sh", "-c"]
          args:
            - |
              # Copy all files from ConfigMap into a working directory
              mkdir -p /playwright/tests
              cp /config/tests/* /playwright/tests/
              cd /playwright

              npm install @playwright/test@${local.pw_version}

              # Run tests using the npm script
              npx playwright test
          env:
            - name: CI
              value: "true"
          volumeMounts:
            - name: tests-config
              mountPath: /config/tests
              readOnly: true
            - name: playwright-tests-dir
              mountPath: /playwright
      restartPolicy: Never
      volumes:
        - name: tests-config
          configMap:
            name: ${local.name}
        - name: playwright-tests-dir
          emptyDir: {}
  EOJOB
}

output "run_cmd" {
  value = <<-EOrun
set -o errexit -o nounset -o errtrace -o pipefail -x

apk add kubectl

mkdir -p /tmp/${local.name}

%{for test, contents in var.tests~}
cat <<EOF > /tmp/${local.name}/${test}
${contents}
EOF
%{endfor~}

mkdir -p /tmp/${local.name}/k8s

kubectl create configmap ${local.name} \
  %{for test, contents in var.tests~}
  --from-file=/tmp/${local.name}/${test} \
  %{endfor~}
  --dry-run=client -o yaml > /tmp/${local.name}/k8s/configmap.yaml

cat <<EOF > /tmp/${local.name}/k8s/job.yaml
${templatestring(local.job_spec, {})}
EOF

echo "Applying Kubernetes resources..."
kubectl apply -f /tmp/${local.name}/k8s/

echo "Waiting for Playwright tests to complete..."
kubectl wait --for=condition=complete job/${local.name} --timeout=600s

echo "Tests completed successfully!"
  EOrun
}
