terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

locals { parsed = provider::oci::parse(var.digest) }

variable "namespace" {
  default = "datadog-agent-system"
}

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "datadog-agent-jmx"
  inventory = data.imagetest_inventory.this

  sandbox = {
    mounts = [
      {
        source      = path.module
        destination = "/tests"
      }
    ]
    envs = {
      "DATADOG_JMX_IMAGE" = "${local.parsed.registry_repo}:${local.parsed.pseudo_tag}"
    }
  }
}

module "helm-datadog-operator-thing" {
  source = "../../../../tflib/imagetest/helm"

  namespace = var.namespace
  repo      = "https://helm.datadoghq.com"
  chart     = "datadog-operator"

  values = {
    watchNamespaces : [""]
    datadog = {
      apiKey      = "dummy"
      dd_url      = "http://fakeintake.${var.namespace}.svc.cluster.local"
      clusterName = "chainguard"
    }
  }
}

resource "imagetest_feature" "basic-helm-operator" {
  name        = "Basic"
  description = "Basic datadog-agent-operator Helm install test"
  harness     = imagetest_harness_k3s.this

  steps = [
    {
      name = "Setup fakeintake"
      cmd  = "kubectl apply --wait -f /tests/fakeintake.yaml"
    },
    {
      name = "Helm install"
      cmd  = module.helm-datadog-operator-thing.install_cmd
    },
    {
      name  = "Check datadog-agent-operator pods"
      cmd   = "kubectl wait --for=condition=Ready pods --all --namespace ${var.namespace}"
      retry = { attempts = 5, delay = "10s" }
    },
    {
      name = "Check datadog-agent pods"
      cmd  = <<EOFagent
        cat <<EOF > /tmp/datadog-agent.yaml
apiVersion: "datadoghq.com/v2alpha1"
kind: "DatadogAgent"
metadata:
  name: "datadog"
spec:
  global:
    site: "http://fakeintake.${var.namespace}.svc.cluster.local"
    clusterName: "chainguard"
    credentials:
      apiKey: "dummy"
  override:
    nodeAgent:
      env:
        - name: DD_HOSTNAME
          valueFrom:
            fieldRef:
              fieldPath: spec.nodeName
      image:
        name: $DATADOG_JMX_IMAGE
        jmxEnabled: true
EOF
        kubectl apply -f /tmp/datadog-agent.yaml
        kubectl get datadogagents
        # wait until the agent is ready
        kubectl wait --for=condition=Ready datadogagent/datadog --timeout=5m

        # let's deploy a JMX application
        kubectl apply -f /tests/tomcat.yaml

        # wait until tomcat is ready
        kubectl wait pod --for=condition=Ready tomcat-test --timeout 5m

        # wait until jmx metrics are available
        sleep 120

        # get the name of the pod which has label agent.datadoghq.com/component=agent
        AGENT_POD=$(kubectl get pods -l agent.datadoghq.com/component=agent -o jsonpath='{.items[0].metadata.name}')

        echo "Agent pod: $AGENT_POD"
        
        # check if the JMX metrics are available
        kubectl exec $AGENT_POD -c agent -- agent status "jmx fetch" | grep "status: OK"
EOFagent
    }
  ]

  labels = {
    type = "k8s",
  }
}
