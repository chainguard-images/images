terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }

  # We don't take advantage of terraform.tfstate, so we don't need to save state anywhere.
  #
  # The default "local" backend has pathological performance as state gets large, see:
  # https://github.com/opentofu/opentofu/issues/578
  #
  # Consider removing this if that's ever fixed and/or if we want to use tfstate.
  backend "inmem" {}
}

variable "target_repository" {
  type        = string
  description = "The root repo into which the images should be published (e.g., cgr.dev/chainguard). Individual images will be published within this root repo."
}

variable "extra_repositories" {
  type        = list(string)
  default     = []
  description = "Extra repositories to look for when finding packages."
}

variable "extra_keyring" {
  type        = list(string)
  default     = []
  description = "Extra keyrings to use when finding packages."
}

variable "extra_packages" {
  type        = list(string)
  default     = []
  description = "Extra packages to install in all images."
}

variable "archs" {
  type        = list(string)
  default     = []
  description = "The architectures to build for. If empty, defaults to x86_64 and aarch64."
}

provider "apko" {
  extra_repositories = concat(["https://packages.wolfi.dev/os"], var.extra_repositories)
  extra_keyring      = concat(["https://packages.wolfi.dev/os/wolfi-signing.rsa.pub"], var.extra_keyring)
  extra_packages     = concat(["wolfi-baselayout"], var.extra_packages)
  default_archs      = length(var.archs) == 0 ? ["x86_64", "aarch64"] : var.archs
}

provider "apko" {
  alias = "alpine"

  extra_repositories = ["https://dl-cdn.alpinelinux.org/alpine/edge/main"]
  # These packages match chainguard-images/static
  extra_packages = ["alpine-baselayout-data", "alpine-release", "ca-certificates-bundle"]
  default_archs  = length(var.archs) == 0 ? ["386", "amd64", "arm/v6", "arm/v7", "arm64", "ppc64le", "s390x"] : var.archs // All arches *except* riscv64
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

variable "newrelic_license_key" { default = "foo" } # set something valid to avoid targetted local runs

module "apko" {
  source            = "./images/apko"
  target_repository = "${var.target_repository}/apko"
}

module "argo" {
  source            = "./images/argo"
  target_repository = "${var.target_repository}/argo"
}

module "argocd" {
  source            = "./images/argocd"
  target_repository = "${var.target_repository}/argocd"
}

module "aspnet-runtime" {
  source            = "./images/aspnet-runtime"
  target_repository = "${var.target_repository}/aspnet-runtime"
}

module "atlantis" {
  source            = "./images/atlantis"
  target_repository = "${var.target_repository}/atlantis"
}

module "aws-cli" {
  source            = "./images/aws-cli"
  target_repository = "${var.target_repository}/aws-cli"
}

module "aws-ebs-csi-driver" {
  source            = "./images/aws-ebs-csi-driver"
  target_repository = "${var.target_repository}/aws-ebs-csi-driver"
}

module "aws-efs-csi-driver" {
  source            = "./images/aws-efs-csi-driver"
  target_repository = "${var.target_repository}/aws-efs-csi-driver"
}

module "aws-for-fluent-bit" {
  source            = "./images/aws-for-fluent-bit"
  target_repository = "${var.target_repository}/aws-for-fluent-bit"
}

module "aws-load-balancer-controller" {
  source            = "./images/aws-load-balancer-controller"
  target_repository = "${var.target_repository}/aws-load-balancer-controller"
}

module "bank-vaults" {
  source            = "./images/bank-vaults"
  target_repository = "${var.target_repository}/bank-vaults"
}

module "bash" {
  source            = "./images/bash"
  target_repository = "${var.target_repository}/bash"
}

module "bazel" {
  source            = "./images/bazel"
  target_repository = "${var.target_repository}/bazel"
}

module "boring-registry" {
  source            = "./images/boring-registry"
  target_repository = "${var.target_repository}/boring-registry"
}

module "buck2" {
  source            = "./images/buck2"
  target_repository = "${var.target_repository}/buck2"
}

module "buildkit" {
  source            = "./images/buildkit"
  target_repository = "${var.target_repository}/buildkit"
}

module "busybox" {
  source            = "./images/busybox"
  target_repository = "${var.target_repository}/busybox"
  providers = {
    apko.alpine = apko.alpine
  }
}

module "caddy" {
  source            = "./images/caddy"
  target_repository = "${var.target_repository}/caddy"
}

module "cadvisor" {
  source            = "./images/cadvisor"
  target_repository = "${var.target_repository}/cadvisor"
}

module "calico" {
  source            = "./images/calico"
  target_repository = "${var.target_repository}/calico"
}

module "cass-operator" {
  source            = "./images/cass-operator"
  target_repository = "${var.target_repository}/cass-operator"
}

module "cassandra" {
  source            = "./images/cassandra"
  target_repository = "${var.target_repository}/cassandra"
}

module "cc-dynamic" {
  source            = "./images/cc-dynamic"
  target_repository = "${var.target_repository}/cc-dynamic"
}

module "cedar" {
  source            = "./images/cedar"
  target_repository = "${var.target_repository}/cedar"
}

module "cert-manager" {
  source            = "./images/cert-manager"
  target_repository = "${var.target_repository}/cert-manager"
}

// This isn't intended to be run in production, but it's useful for testing
// that the cert-manager test module can be run by multiple modules. To test this, run:
// terraform apply -target=module.cert-manager -target=module.cert-manager-again-for-testing -auto-approve
module "cert-manager-again-for-testing" {
  source            = "./images/cert-manager"
  target_repository = "${var.target_repository}/cert-manager"
}

module "cfssl" {
  source            = "./images/cfssl"
  target_repository = "${var.target_repository}/cfssl"
}

module "cilium" {
  source            = "./images/cilium"
  target_repository = "${var.target_repository}/cilium"
}

module "clang" {
  source            = "./images/clang"
  target_repository = "${var.target_repository}/clang"
}

module "cluster-autoscaler" {
  source            = "./images/cluster-autoscaler"
  target_repository = "${var.target_repository}/cluster-autoscaler"
}

module "cluster-proportional-autoscaler" {
  source            = "./images/cluster-proportional-autoscaler"
  target_repository = "${var.target_repository}/cluster-proportional-autoscaler"
}

module "conda" {
  source            = "./images/conda"
  target_repository = "${var.target_repository}/conda"
}

module "configmap-reload" {
  source            = "./images/configmap-reload"
  target_repository = "${var.target_repository}/configmap-reload"
}

module "consul" {
  source            = "./images/consul"
  target_repository = "${var.target_repository}/consul"
}

module "coredns" {
  source            = "./images/coredns"
  target_repository = "${var.target_repository}/coredns"
}

module "cosign" {
  source            = "./images/cosign"
  target_repository = "${var.target_repository}/cosign"
}

module "crane" {
  source            = "./images/crane"
  target_repository = "${var.target_repository}/crane"
}

module "crossplane" {
  source            = "./images/crossplane"
  target_repository = "${var.target_repository}/crossplane"
}

module "crossplane-aws" {
  source            = "./images/crossplane-aws"
  target_repository = "${var.target_repository}/crossplane-aws"
}

module "crossplane-azure" {
  source            = "./images/crossplane-azure"
  target_repository = "${var.target_repository}/crossplane-azure"
}

module "ctlog" {
  source            = "./images/ctlog"
  target_repository = "${var.target_repository}/ctlog"
}

module "curl" {
  source            = "./images/curl"
  target_repository = "${var.target_repository}/curl"
}

module "dask-gateway" {
  source            = "./images/dask-gateway"
  target_repository = "${var.target_repository}/dask-gateway"
}

module "deno" {
  source            = "./images/deno"
  target_repository = "${var.target_repository}/deno"
}

module "dependency-track" {
  source            = "./images/dependency-track"
  target_repository = "${var.target_repository}/dependency-track"
}

module "dex" {
  source            = "./images/dex"
  target_repository = "${var.target_repository}/dex"
}

module "dive" {
  source            = "./images/dive"
  target_repository = "${var.target_repository}/dive"
}

module "dotnet" {
  source            = "./images/dotnet"
  target_repository = "${var.target_repository}/dotnet"
}

module "dynamic-localpv-provisioner" {
  source            = "./images/dynamic-localpv-provisioner"
  target_repository = "${var.target_repository}/dynamic-localpv-provisioner"
}

module "envoy" {
  source            = "./images/envoy"
  target_repository = "${var.target_repository}/envoy"
}

module "envoy-ratelimit" {
  source            = "./images/envoy-ratelimit"
  target_repository = "${var.target_repository}/envoy-ratelimit"
}

module "erlang" {
  source            = "./images/erlang"
  target_repository = "${var.target_repository}/erlang"
}

module "etcd" {
  source            = "./images/etcd"
  target_repository = "${var.target_repository}/etcd"
}

module "external-dns" {
  source            = "./images/external-dns"
  target_repository = "${var.target_repository}/external-dns"
}

module "external-secrets" {
  source            = "./images/external-secrets"
  target_repository = "${var.target_repository}/external-secrets"
}

module "falco-no-driver" {
  source            = "./images/falco-no-driver"
  target_repository = "${var.target_repository}/falco-no-driver"
}

module "falcoctl" {
  source            = "./images/falcoctl"
  target_repository = "${var.target_repository}/falcoctl"
}

module "ffmpeg" {
  source            = "./images/ffmpeg"
  target_repository = "${var.target_repository}/ffmpeg"
}

module "fluent-bit" {
  source            = "./images/fluent-bit"
  target_repository = "${var.target_repository}/fluent-bit"
}

module "fluentd" {
  source            = "./images/fluentd"
  target_repository = "${var.target_repository}/fluentd"
}

module "flux" {
  source            = "./images/flux"
  target_repository = "${var.target_repository}/flux"
}

module "fulcio" {
  source            = "./images/fulcio"
  target_repository = "${var.target_repository}/fulcio"
}

module "gatekeeper" {
  source            = "./images/gatekeeper"
  target_repository = "${var.target_repository}/gatekeeper"
}

module "gcc-glibc" {
  source            = "./images/gcc-glibc"
  target_repository = "${var.target_repository}/gcc-glibc"
}

module "git" {
  source            = "./images/git"
  target_repository = "${var.target_repository}/git"
  providers = {
    apko.alpine = apko.alpine
  }
}

module "gitlab" {
  source            = "./images/gitlab"
  target_repository = "${var.target_repository}/gitlab"
}

module "gitness" {
  source            = "./images/gitness"
  target_repository = "${var.target_repository}/gitness"
}

module "glibc-dynamic" {
  source            = "./images/glibc-dynamic"
  target_repository = "${var.target_repository}/glibc-dynamic"
}

module "go" {
  source            = "./images/go"
  target_repository = "${var.target_repository}/go"
}

module "google-cloud-sdk" {
  source            = "./images/google-cloud-sdk"
  target_repository = "${var.target_repository}/google-cloud-sdk"
}

module "graalvm-native" {
  source            = "./images/graalvm-native"
  target_repository = "${var.target_repository}/graalvm-native"
}

module "gradle" {
  source            = "./images/gradle"
  target_repository = "${var.target_repository}/gradle"
}

module "grafana" {
  source            = "./images/grafana"
  target_repository = "${var.target_repository}/grafana"
}

module "grype" {
  source            = "./images/grype"
  target_repository = "${var.target_repository}/grype"
}

module "guacamole-server" {
  source            = "./images/guacamole-server"
  target_repository = "${var.target_repository}/guacamole-server"
}

module "haproxy" {
  source            = "./images/haproxy"
  target_repository = "${var.target_repository}/haproxy"
}

module "haproxy-ingress" {
  source            = "./images/haproxy-ingress"
  target_repository = "${var.target_repository}/haproxy-ingress"
}

module "helm" {
  source            = "./images/helm"
  target_repository = "${var.target_repository}/helm"
}

module "helm-chartmuseum" {
  source            = "./images/helm-chartmuseum"
  target_repository = "${var.target_repository}/helm-chartmuseum"
}

module "http-echo" {
  source            = "./images/http-echo"
  target_repository = "${var.target_repository}/http-echo"
}

module "hugo" {
  source            = "./images/hugo"
  target_repository = "${var.target_repository}/hugo"
}

module "influxdb" {
  source            = "./images/influxdb"
  target_repository = "${var.target_repository}/influxdb"
}

module "ingress-nginx-controller" {
  source            = "./images/ingress-nginx-controller"
  target_repository = "${var.target_repository}/ingress-nginx-controller"
}

module "ip-masq-agent" {
  source            = "./images/ip-masq-agent"
  target_repository = "${var.target_repository}/ip-masq-agent"
}

module "istio" {
  source            = "./images/istio"
  target_repository = "${var.target_repository}/istio"
}

module "jdk" {
  source            = "./images/jdk"
  target_repository = "${var.target_repository}/jdk"
}

module "jdk-lts" {
  source            = "./images/jdk-lts"
  target_repository = "${var.target_repository}/jdk-lts"
}

module "jenkins" {
  source            = "./images/jenkins"
  target_repository = "${var.target_repository}/jenkins"
}

module "jre" {
  source            = "./images/jre"
  target_repository = "${var.target_repository}/jre"
}

module "jre-lts" {
  source            = "./images/jre-lts"
  target_repository = "${var.target_repository}/jre-lts"
}

module "k3s" {
  source            = "./images/k3s"
  target_repository = "${var.target_repository}/k3s"
}

module "k8s-sidecar" {
  source            = "./images/k8s-sidecar"
  target_repository = "${var.target_repository}/k8s-sidecar"
}

module "k8sgpt" {
  source            = "./images/k8sgpt"
  target_repository = "${var.target_repository}/k8sgpt"
}

module "k8sgpt-operator" {
  source            = "./images/k8sgpt-operator"
  target_repository = "${var.target_repository}/k8sgpt-operator"
}

module "k8ssandra-operator" {
  source            = "./images/k8ssandra-operator"
  target_repository = "${var.target_repository}/k8ssandra-operator"
}

module "kafka" {
  source            = "./images/kafka"
  target_repository = "${var.target_repository}/kafka"
}

module "karpenter" {
  source            = "./images/karpenter"
  target_repository = "${var.target_repository}/karpenter"
}

module "keda" {
  source            = "./images/keda"
  target_repository = "${var.target_repository}/keda"
}

module "keycloak" {
  source            = "./images/keycloak"
  target_repository = "${var.target_repository}/keycloak"
}

module "ko" {
  source            = "./images/ko"
  target_repository = "${var.target_repository}/ko"
}

module "kor" {
  source            = "./images/kor"
  target_repository = "${var.target_repository}/kor"
}

module "kube-bench" {
  source            = "./images/kube-bench"
  target_repository = "${var.target_repository}/kube-bench"
}

module "kube-downscaler" {
  source            = "./images/kube-downscaler"
  target_repository = "${var.target_repository}/kube-downscaler"
}

module "kube-fluentd-operator" {
  source            = "./images/kube-fluentd-operator"
  target_repository = "${var.target_repository}/kube-fluentd-operator"
}

module "kube-logging-operator" {
  source            = "./images/kube-logging-operator"
  target_repository = "${var.target_repository}/kube-logging-operator"
}

module "kube-logging-operator-fluentd" {
  source            = "./images/kube-logging-operator-fluentd"
  target_repository = "${var.target_repository}/kube-logging-operator-fluentd"
}

module "kube-state-metrics" {
  source            = "./images/kube-state-metrics"
  target_repository = "${var.target_repository}/kube-state-metrics"
}

module "kubectl" {
  source            = "./images/kubectl"
  target_repository = "${var.target_repository}/kubectl"
}

module "kubeflow" {
  source            = "./images/kubeflow"
  target_repository = "${var.target_repository}/kubeflow"
}

module "kubeflow-centraldashboard" {
  source            = "./images/kubeflow-centraldashboard"
  target_repository = "${var.target_repository}/kubeflow-centraldashboard"
}

module "kubeflow-katib" {
  source            = "./images/kubeflow-katib"
  target_repository = "${var.target_repository}/kubeflow-katib"
}

module "kubeflow-pipelines" {
  source            = "./images/kubeflow-pipelines"
  target_repository = "${var.target_repository}/kubeflow-pipelines"
}

module "kubernetes-csi-external-attacher" {
  source            = "./images/kubernetes-csi-external-attacher"
  target_repository = "${var.target_repository}/kubernetes-csi-external-attacher"
}

module "kubernetes-csi-external-provisioner" {
  source            = "./images/kubernetes-csi-external-provisioner"
  target_repository = "${var.target_repository}/kubernetes-csi-external-provisioner"
}

module "kubernetes-csi-external-resizer" {
  source            = "./images/kubernetes-csi-external-resizer"
  target_repository = "${var.target_repository}/kubernetes-csi-external-resizer"
}

module "kubernetes-csi-external-snapshot-controller" {
  source            = "./images/kubernetes-csi-external-snapshot-controller"
  target_repository = "${var.target_repository}/kubernetes-csi-external-snapshot-controller"
}

module "kubernetes-csi-external-snapshot-validation-webhook" {
  source            = "./images/kubernetes-csi-external-snapshot-validation-webhook"
  target_repository = "${var.target_repository}/kubernetes-csi-external-snapshot-validation-webhook"
}

module "kubernetes-csi-external-snapshotter" {
  source            = "./images/kubernetes-csi-external-snapshotter"
  target_repository = "${var.target_repository}/kubernetes-csi-external-snapshotter"
}

module "kubernetes-csi-livenessprobe" {
  source            = "./images/kubernetes-csi-livenessprobe"
  target_repository = "${var.target_repository}/kubernetes-csi-livenessprobe"
}

module "kubernetes-csi-node-driver-registrar" {
  source            = "./images/kubernetes-csi-node-driver-registrar"
  target_repository = "${var.target_repository}/kubernetes-csi-node-driver-registrar"
}

module "kubernetes-dashboard" {
  source            = "./images/kubernetes-dashboard"
  target_repository = "${var.target_repository}/kubernetes-dashboard"
}

module "kubernetes-dns-node-cache" {
  source            = "./images/kubernetes-dns-node-cache"
  target_repository = "${var.target_repository}/kubernetes-dns-node-cache"
}

module "kubernetes-event-exporter" {
  source            = "./images/kubernetes-event-exporter"
  target_repository = "${var.target_repository}/kubernetes-event-exporter"
}

module "kubernetes-ingress-defaultbackend" {
  source            = "./images/kubernetes-ingress-defaultbackend"
  target_repository = "${var.target_repository}/kubernetes-ingress-defaultbackend"
}

module "kubewatch" {
  source            = "./images/kubewatch"
  target_repository = "${var.target_repository}/kubewatch"
}

module "kyverno" {
  source            = "./images/kyverno"
  target_repository = "${var.target_repository}/kyverno"
}

module "kyverno-policy-reporter" {
  source            = "./images/kyverno-policy-reporter"
  target_repository = "${var.target_repository}/kyverno-policy-reporter"
}

module "loki" {
  source            = "./images/loki"
  target_repository = "${var.target_repository}/loki"
}

module "mariadb" {
  source            = "./images/mariadb"
  target_repository = "${var.target_repository}/mariadb"
}

module "maven" {
  source            = "./images/maven"
  target_repository = "${var.target_repository}/maven"
}

module "mdbook" {
  source            = "./images/mdbook"
  target_repository = "${var.target_repository}/mdbook"
}

module "meilisearch" {
  source            = "./images/meilisearch"
  target_repository = "${var.target_repository}/meilisearch"
}

module "melange" {
  source            = "./images/melange"
  target_repository = "${var.target_repository}/melange"
}

module "memcached" {
  source            = "./images/memcached"
  target_repository = "${var.target_repository}/memcached"
}

module "memcached-exporter" {
  source            = "./images/memcached-exporter"
  target_repository = "${var.target_repository}/memcached-exporter"
}

module "memcached-exporter-bitnami" {
  source            = "./images/memcached-exporter-bitnami"
  target_repository = "${var.target_repository}/memcached-exporter-bitnami"
}

module "metacontroller" {
  source            = "./images/metacontroller"
  target_repository = "${var.target_repository}/metacontroller"
}

module "metrics-server" {
  source            = "./images/metrics-server"
  target_repository = "${var.target_repository}/metrics-server"
}

module "minio" {
  source            = "./images/minio"
  target_repository = "${var.target_repository}/minio"
}

module "ml-metadata-store-server" {
  source            = "./images/ml-metadata-store-server"
  target_repository = "${var.target_repository}/ml-metadata-store-server"
}

module "nats" {
  source            = "./images/nats"
  target_repository = "${var.target_repository}/nats"
}

module "netcat" {
  source            = "./images/netcat"
  target_repository = "${var.target_repository}/netcat"
}

module "newrelic-fluent-bit-output" {
  source            = "./images/newrelic-fluent-bit-output"
  target_repository = "${var.target_repository}/newrelic-fluent-bit-output"
  license_key       = var.newrelic_license_key
}

module "newrelic-infrastructure-bundle" {
  source            = "./images/newrelic-infrastructure-bundle"
  target_repository = "${var.target_repository}/newrelic-infrastructure-bundle"
  license_key       = var.newrelic_license_key
}

module "newrelic-k8s-events-forwarder" {
  source            = "./images/newrelic-k8s-events-forwarder"
  target_repository = "${var.target_repository}/newrelic-k8s-events-forwarder"
  license_key       = var.newrelic_license_key
}

module "newrelic-kube-events" {
  source            = "./images/newrelic-kube-events"
  target_repository = "${var.target_repository}/newrelic-kube-events"
  license_key       = var.newrelic_license_key
}

module "newrelic-kubernetes" {
  source            = "./images/newrelic-kubernetes"
  target_repository = "${var.target_repository}/newrelic-kubernetes"
  license_key       = var.newrelic_license_key
}

module "newrelic-prometheus" {
  source            = "./images/newrelic-prometheus"
  target_repository = "${var.target_repository}/newrelic-prometheus"
  license_key       = var.newrelic_license_key
}

module "newrelic-prometheus-configurator" {
  source            = "./images/newrelic-prometheus-configurator"
  target_repository = "${var.target_repository}/newrelic-prometheus-configurator"
  license_key       = var.newrelic_license_key
}

module "nfs-subdir-external-provisioner" {
  source            = "./images/nfs-subdir-external-provisioner"
  target_repository = "${var.target_repository}/nfs-subdir-external-provisioner"
}

module "nginx" {
  source            = "./images/nginx"
  target_repository = "${var.target_repository}/nginx"
}

module "node" {
  source            = "./images/node"
  target_repository = "${var.target_repository}/node"
}

module "node-lts" {
  source            = "./images/node-lts"
  target_repository = "${var.target_repository}/node-lts"
}

module "node-problem-detector" {
  source            = "./images/node-problem-detector"
  target_repository = "${var.target_repository}/node-problem-detector"
}

module "nodetaint" {
  source            = "./images/nodetaint"
  target_repository = "${var.target_repository}/nodetaint"
}

module "ntia-conformance-checker" {
  source            = "./images/ntia-conformance-checker"
  target_repository = "${var.target_repository}/ntia-conformance-checker"
}

module "ntpd-rs" {
  source            = "./images/ntpd-rs"
  target_repository = "${var.target_repository}/ntpd-rs"
}

module "nvidia-device-plugin" {
  source            = "./images/nvidia-device-plugin"
  target_repository = "${var.target_repository}/nvidia-device-plugin"
}

module "oauth2-proxy" {
  source            = "./images/oauth2-proxy"
  target_repository = "${var.target_repository}/oauth2-proxy"
}

module "openai" {
  source            = "./images/openai"
  target_repository = "${var.target_repository}/openai"
}

module "opensearch" {
  source            = "./images/opensearch"
  target_repository = "${var.target_repository}/opensearch"
}

module "opentelemetry-collector-contrib" {
  source            = "./images/opentelemetry-collector-contrib"
  target_repository = "${var.target_repository}/opentelemetry-collector-contrib"
}

module "opentofu" {
  source            = "./images/opentofu"
  target_repository = "${var.target_repository}/opentofu"
}

module "paranoia" {
  source            = "./images/paranoia"
  target_repository = "${var.target_repository}/paranoia"
}

module "pgbouncer" {
  source            = "./images/pgbouncer"
  target_repository = "${var.target_repository}/pgbouncer"
}

module "php" {
  source            = "./images/php"
  target_repository = "${var.target_repository}/php"
}

module "php-fpm_exporter" {
  source            = "./images/php-fpm_exporter"
  target_repository = "${var.target_repository}/php-fpm_exporter"
}

module "postgres" {
  source            = "./images/postgres"
  target_repository = "${var.target_repository}/postgres"
}

module "postgres-helm-compat" {
  source            = "./images/postgres-helm-compat"
  target_repository = "${var.target_repository}/postgres-helm-compat"
}

module "powershell" {
  source            = "./images/powershell"
  target_repository = "${var.target_repository}/powershell"
}

module "prometheus" {
  source            = "./images/prometheus"
  target_repository = "${var.target_repository}/prometheus"
}

module "prometheus-adapter" {
  source            = "./images/prometheus-adapter"
  target_repository = "${var.target_repository}/prometheus-adapter"
}

module "prometheus-cloudwatch-exporter" {
  source            = "./images/prometheus-cloudwatch-exporter"
  target_repository = "${var.target_repository}/prometheus-cloudwatch-exporter"
}

module "prometheus-elasticsearch-exporter" {
  source            = "./images/prometheus-elasticsearch-exporter"
  target_repository = "${var.target_repository}/prometheus-elasticsearch-exporter"
}

module "prometheus-mongodb-exporter" {
  source            = "./images/prometheus-mongodb-exporter"
  target_repository = "${var.target_repository}/prometheus-mongodb-exporter"
}

module "prometheus-node-exporter" {
  source            = "./images/prometheus-node-exporter"
  target_repository = "${var.target_repository}/prometheus-node-exporter"
}

module "prometheus-postgres-exporter" {
  source            = "./images/prometheus-postgres-exporter"
  target_repository = "${var.target_repository}/prometheus-postgres-exporter"
}

module "prometheus-pushgateway-bitnami" {
  source = "./images/prometheus-pushgateway-bitnami"
  # -bitnami is added in the module
  target_repository = "${var.target_repository}/prometheus-pushgateway"
}

module "prometheus-redis-exporter" {
  source            = "./images/prometheus-redis-exporter"
  target_repository = "${var.target_repository}/prometheus-redis-exporter"
}

module "prometheus-statsd-exporter" {
  source            = "./images/prometheus-statsd-exporter"
  target_repository = "${var.target_repository}/prometheus-statsd-exporter"
}

module "promtail" {
  source            = "./images/promtail"
  target_repository = "${var.target_repository}/promtail"
}

module "proxysql" {
  source            = "./images/proxysql"
  target_repository = "${var.target_repository}/proxysql"
}

module "pulumi" {
  source            = "./images/pulumi"
  target_repository = "${var.target_repository}/pulumi"
}

module "python" {
  source            = "./images/python"
  target_repository = "${var.target_repository}/python"
}

module "qdrant" {
  source            = "./images/qdrant"
  target_repository = "${var.target_repository}/qdrant"
}

module "r-base" {
  source            = "./images/r-base"
  target_repository = "${var.target_repository}/r-base"
}

module "rabbitmq" {
  source            = "./images/rabbitmq"
  target_repository = "${var.target_repository}/rabbitmq"
}

module "rabbitmq-cluster-operator" {
  source            = "./images/rabbitmq-cluster-operator"
  target_repository = "${var.target_repository}/rabbitmq-cluster-operator"
}

module "rabbitmq-messaging-topology-operator" {
  source            = "./images/rabbitmq-messaging-topology-operator"
  target_repository = "${var.target_repository}/rabbitmq-messaging-topology-operator"
}

module "redis" {
  source            = "./images/redis"
  target_repository = "${var.target_repository}/redis"
}

module "redis-bitnami" {
  source = "./images/redis-bitnami"
  # -bitnami is added in the module
  target_repository = "${var.target_repository}/redis"
}

module "redis-sentinel" {
  source            = "./images/redis-sentinel"
  target_repository = "${var.target_repository}/redis-sentinel"
}

module "rekor" {
  source            = "./images/rekor"
  target_repository = "${var.target_repository}/rekor"
}

module "rqlite" {
  source            = "./images/rqlite"
  target_repository = "${var.target_repository}/rqlite"
}

module "ruby" {
  source            = "./images/ruby"
  target_repository = "${var.target_repository}/ruby"
}

module "rust" {
  source            = "./images/rust"
  target_repository = "${var.target_repository}/rust"
}

module "secrets-store-csi-driver" {
  source            = "./images/secrets-store-csi-driver"
  target_repository = "${var.target_repository}/secrets-store-csi-driver"
}

module "secrets-store-csi-driver-provider-gcp" {
  source            = "./images/secrets-store-csi-driver-provider-gcp"
  target_repository = "${var.target_repository}/secrets-store-csi-driver-provider-gcp"
}

module "semgrep" {
  source            = "./images/semgrep"
  target_repository = "${var.target_repository}/semgrep"
}

module "sigstore-policy-controller" {
  source            = "./images/sigstore-policy-controller"
  target_repository = "${var.target_repository}/sigstore-policy-controller"
}

module "sigstore-scaffolding" {
  source            = "./images/sigstore-scaffolding"
  target_repository = "${var.target_repository}/sigstore-scaffolding"
}

module "skaffold" {
  source            = "./images/skaffold"
  target_repository = "${var.target_repository}/skaffold"
}

module "slim-toolkit-debug" {
  source            = "./images/slim-toolkit-debug"
  target_repository = "${var.target_repository}/slim-toolkit-debug"
}

module "smarter-device-manager" {
  source            = "./images/smarter-device-manager"
  target_repository = "${var.target_repository}/smarter-device-manager"
}

module "solr" {
  source            = "./images/solr"
  target_repository = "${var.target_repository}/solr"
}

module "spark-operator" {
  source            = "./images/spark-operator"
  target_repository = "${var.target_repository}/spark-operator"
}

module "spire" {
  source            = "./images/spire"
  target_repository = "${var.target_repository}/spire"
}

// This isn't intended to be run in production, but it's useful for testing
// that the spire test module can be run by multiple modules. To test this, run:
// terraform apply -target=module.spire -target=module.spire-again-for-testing -auto-approve
module "spire-again-for-testing" {
  source            = "./images/spire"
  target_repository = "${var.target_repository}/spire"
}

module "sqlpad" {
  source            = "./images/sqlpad"
  target_repository = "${var.target_repository}/sqlpad"
}

module "stakater-reloader" {
  source            = "./images/stakater-reloader"
  target_repository = "${var.target_repository}/stakater-reloader"
}

module "static" {
  source            = "./images/static"
  target_repository = "${var.target_repository}/static"
  providers = {
    apko.alpine = apko.alpine
  }
}

module "stunnel" {
  source            = "./images/stunnel"
  target_repository = "${var.target_repository}/stunnel"
}

module "tekton" {
  source            = "./images/tekton"
  target_repository = "${var.target_repository}/tekton"
}

module "telegraf" {
  source            = "./images/telegraf"
  target_repository = "${var.target_repository}/telegraf"
}

module "temporal-admin-tools" {
  source            = "./images/temporal-admin-tools"
  target_repository = "${var.target_repository}/temporal-admin-tools"
}

module "temporal-server" {
  source            = "./images/temporal-server"
  target_repository = "${var.target_repository}/temporal-server"
}

module "temporal-ui-server" {
  source            = "./images/temporal-ui-server"
  target_repository = "${var.target_repository}/temporal-ui-server"
}

module "terraform" {
  source            = "./images/terraform"
  target_repository = "${var.target_repository}/terraform"
}

module "thanos" {
  source            = "./images/thanos"
  target_repository = "${var.target_repository}/thanos"
}

module "thanos-operator" {
  source            = "./images/thanos-operator"
  target_repository = "${var.target_repository}/thanos-operator"
}

module "tigera-operator" {
  source            = "./images/tigera-operator"
  target_repository = "${var.target_repository}/tigera-operator"
}

// This isn't intended to be run in production, but it's useful for testing
// that the tigera-operator test module can be run by multiple modules. To test this, run:
// terraform apply -target=module.tigera-operator -target=module.tigera-operator-again-for-testing -auto-approve
module "tigera-operator-again-for-testing" {
  source            = "./images/tigera-operator"
  target_repository = "${var.target_repository}/tigera-operator"
}

module "timestamp-authority" {
  source            = "./images/timestamp-authority"
  target_repository = "${var.target_repository}/timestamp-authority"
}

module "timoni" {
  source            = "./images/timoni"
  target_repository = "${var.target_repository}/timoni"
}

module "tomcat" {
  source            = "./images/tomcat"
  target_repository = "${var.target_repository}/tomcat"
}

module "traefik" {
  source            = "./images/traefik"
  target_repository = "${var.target_repository}/traefik"
}

module "trillian" {
  source            = "./images/trillian"
  target_repository = "${var.target_repository}/trillian"
}

module "trino" {
  source            = "./images/trino"
  target_repository = "${var.target_repository}/trino"
}

module "trust-manager" {
  source            = "./images/trust-manager"
  target_repository = "${var.target_repository}/trust-manager"
}

module "vault" {
  source            = "./images/vault"
  target_repository = "${var.target_repository}/vault"
}

module "vector" {
  source            = "./images/vector"
  target_repository = "${var.target_repository}/vector"
}

module "vela-cli" {
  source            = "./images/vela-cli"
  target_repository = "${var.target_repository}/vela-cli"
}

module "vertical-pod-autoscaler" {
  source            = "./images/vertical-pod-autoscaler"
  target_repository = "${var.target_repository}/vertical-pod-autoscaler"
}

module "vt" {
  source            = "./images/vt"
  target_repository = "${var.target_repository}/vt"
}

module "wait-for-it" {
  source            = "./images/wait-for-it"
  target_repository = "${var.target_repository}/wait-for-it"
}

module "wasmer" {
  source            = "./images/wasmer"
  target_repository = "${var.target_repository}/wasmer"
}

module "wasmtime" {
  source            = "./images/wasmtime"
  target_repository = "${var.target_repository}/wasmtime"
}

module "wavefront-proxy" {
  source            = "./images/wavefront-proxy"
  target_repository = "${var.target_repository}/wavefront-proxy"
}

module "wazero" {
  source            = "./images/wazero"
  target_repository = "${var.target_repository}/wazero"
}

module "weaviate" {
  source            = "./images/weaviate"
  target_repository = "${var.target_repository}/weaviate"
}

module "wolfi-base" {
  source            = "./images/wolfi-base"
  target_repository = "${var.target_repository}/wolfi-base"
}

module "zig" {
  source            = "./images/zig"
  target_repository = "${var.target_repository}/zig"
}

module "zookeeper" {
  source            = "./images/zookeeper"
  target_repository = "${var.target_repository}/zookeeper"
}

module "zot" {
  source            = "./images/zot"
  target_repository = "${var.target_repository}/zot"
}
