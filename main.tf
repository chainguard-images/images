terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

variable "extra_repositories" {
  type    = list(string)
  default = []
}

variable "extra_keyring" {
  type    = list(string)
  default = []
}

variable "extra_packages" {
  type    = list(string)
  default = []
}

provider "apko" {
  extra_repositories = concat(["https://packages.wolfi.dev/os"], var.extra_repositories)
  extra_keyring      = concat(["https://packages.wolfi.dev/os/wolfi-signing.rsa.pub"], var.extra_keyring)
  extra_packages     = concat(["wolfi-baselayout"], var.extra_packages)
  default_archs      = ["x86_64", "aarch64"]
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

module "apko" {
  source            = "./images/apko"
  target_repository = "${var.target_repository}/apko"
}

module "argocd" {
  source            = "./images/argocd"
  target_repository = "${var.target_repository}/argocd"
}

module "argocd-repo-server" {
  source            = "./images/argocd-repo-server"
  target_repository = "${var.target_repository}/argocd-repo-server"
}

module "aspnet-runtime" {
  source            = "./images/aspnet-runtime"
  target_repository = "${var.target_repository}/aspnet-runtime"
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

module "aws-load-balancer-controller" {
  source            = "./images/aws-load-balancer-controller"
  target_repository = "${var.target_repository}/aws-load-balancer-controller"
}

module "bash" {
  source            = "./images/bash"
  target_repository = "${var.target_repository}/bash"
}

module "bazel" {
  source            = "./images/bazel"
  target_repository = "${var.target_repository}/bazel"
}

module "buck2" {
  source            = "./images/buck2"
  target_repository = "${var.target_repository}/buck2"
}

module "cc-dynamic" {
  source            = "./images/cc-dynamic"
  target_repository = "${var.target_repository}/cc-dynamic"
}

module "clang" {
  source            = "./images/clang"
  target_repository = "${var.target_repository}/clang"
}

module "cert-manager" {
  source            = "./images/cert-manager"
  target_repository = "${var.target_repository}/cert-manager"
}

module "cluster-autoscaler" {
  source            = "./images/cluster-autoscaler"
  target_repository = "${var.target_repository}/cluster-autoscaler"
}

module "consul" {
  source            = "./images/consul"
  target_repository = "${var.target_repository}/consul"
}

module "cosign" {
  source            = "./images/cosign"
  target_repository = "${var.target_repository}/cosign"
}

module "crane" {
  source            = "./images/crane"
  target_repository = "${var.target_repository}/crane"
}

module "curl" {
  source            = "./images/curl"
  target_repository = "${var.target_repository}/curl"
}

module "deno" {
  source            = "./images/deno"
  target_repository = "${var.target_repository}/deno"
}

module "dive" {
  source            = "./images/dive"
  target_repository = "${var.target_repository}/dive"
}

module "dotnet-runtime" {
  source            = "./images/dotnet-runtime"
  target_repository = "${var.target_repository}/dotnet-runtime"
}

module "dotnet-sdk" {
  source            = "./images/dotnet-sdk"
  target_repository = "${var.target_repository}/dotnet-sdk"
}

module "envoy" {
  source            = "./images/envoy"
  target_repository = "${var.target_repository}/envoy"
}

module "etcd" {
  source            = "./images/etcd"
  target_repository = "${var.target_repository}/etcd"
}

module "ffmpeg" {
  source            = "./images/ffmpeg"
  target_repository = "${var.target_repository}/ffmpeg"
}

module "fluentd" {
  source            = "./images/fluentd"
  target_repository = "${var.target_repository}/fluentd"
}

module "flux" {
  source            = "./images/flux"
  target_repository = "${var.target_repository}/flux"
}

module "gcc-glibc" {
  source            = "./images/gcc-glibc"
  target_repository = "${var.target_repository}/gcc-glibc"
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

module "gradle" {
  source            = "./images/gradle"
  target_repository = "${var.target_repository}/gradle"
}

module "haproxy" {
  source            = "./images/haproxy"
  target_repository = "${var.target_repository}/haproxy"
}

module "helm" {
  source            = "./images/helm"
  target_repository = "${var.target_repository}/helm"
}

module "helm-chartmuseum" {
  source            = "./images/helm-chartmuseum"
  target_repository = "${var.target_repository}/helm-chartmuseum"
}

module "helm-controller" {
  source            = "./images/helm-controller"
  target_repository = "${var.target_repository}/helm-controller"
}

module "hugo" {
  source            = "./images/hugo"
  target_repository = "${var.target_repository}/hugo"
}

module "http-echo" {
  source            = "./images/http-echo"
  target_repository = "${var.target_repository}/http-echo"
}

module "jdk" {
  source            = "./images/jdk"
  target_repository = "${var.target_repository}/jdk"
}

module "jenkins" {
  source            = "./images/jenkins"
  target_repository = "${var.target_repository}/jenkins"
}

module "jre" {
  source            = "./images/jre"
  target_repository = "${var.target_repository}/jre"
}

module "k8s-sidecar" {
  source            = "./images/k8s-sidecar"
  target_repository = "${var.target_repository}/k8s-sidecar"
}

module "k8sgpt" {
  source            = "./images/k8sgpt"
  target_repository = "${var.target_repository}/k8sgpt"
}

module "kafka" {
  source            = "./images/kafka"
  target_repository = "${var.target_repository}/kafka"
}

module "karpenter" {
  source            = "./images/karpenter"
  target_repository = "${var.target_repository}/karpenter"
}

module "ko" {
  source            = "./images/ko"
  target_repository = "${var.target_repository}/ko"
}

module "kubectl" {
  source            = "./images/kubectl"
  target_repository = "${var.target_repository}/kubectl"
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

module "kubernetes-ingress-defaultbackend" {
  source            = "./images/kubernetes-ingress-defaultbackend"
  target_repository = "${var.target_repository}/kubernetes-ingress-defaultbackend"
}

module "kyverno-cli" {
  source            = "./images/kyverno-cli"
  target_repository = "${var.target_repository}/kyverno-cli"
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

module "minio" {
  source            = "./images/minio"
  target_repository = "${var.target_repository}/minio"
}

module "minio-client" {
  source            = "./images/minio-client"
  target_repository = "${var.target_repository}/minio-client"
}

module "nats" {
  source            = "./images/nats"
  target_repository = "${var.target_repository}/nats"
}

module "netcat" {
  source            = "./images/netcat"
  target_repository = "${var.target_repository}/netcat"
}

module "nginx" {
  source            = "./images/nginx"
  target_repository = "${var.target_repository}/nginx"
}

module "node" {
  source            = "./images/node"
  target_repository = "${var.target_repository}/node"
}

module "ntpd-rs" {
  source            = "./images/ntpd-rs"
  target_repository = "${var.target_repository}/ntpd-rs"
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

module "paranoia" {
  source            = "./images/paranoia"
  target_repository = "${var.target_repository}/paranoia"
}

module "php" {
  source            = "./images/php"
  target_repository = "${var.target_repository}/php"
}

module "postgres" {
  source            = "./images/postgres"
  target_repository = "${var.target_repository}/postgres"
}

module "powershell" {
  source            = "./images/powershell"
  target_repository = "${var.target_repository}/powershell"
}

module "prometheus" {
  source            = "./images/prometheus"
  target_repository = "${var.target_repository}/prometheus"
}

module "prometheus-alertmanager" {
  source            = "./images/prometheus-alertmanager"
  target_repository = "${var.target_repository}/prometheus-alertmanager"
}

module "prometheus-cloudwatch-exporter" {
  source            = "./images/prometheus-cloudwatch-exporter"
  target_repository = "${var.target_repository}/prometheus-cloudwatch-exporter"
}

module "prometheus-elasticsearch-exporter" {
  source            = "./images/prometheus-elasticsearch-exporter"
  target_repository = "${var.target_repository}/prometheus-elasticsearch-exporter"
}

module "prometheus-mysqld-exporter" {
  source            = "./images/prometheus-mysqld-exporter"
  target_repository = "${var.target_repository}/prometheus-mysqld-exporter"
}

module "prometheus-postgres-exporter" {
  source            = "./images/prometheus-postgres-exporter"
  target_repository = "${var.target_repository}/prometheus-postgres-exporter"
}

module "pulumi" {
  source            = "./images/pulumi"
  target_repository = "${var.target_repository}/pulumi"
}

module "python" {
  source            = "./images/python"
  target_repository = "${var.target_repository}/python"
}

module "rabbitmq" {
  source            = "./images/rabbitmq"
  target_repository = "${var.target_repository}/rabbitmq"
}

module "redis" {
  source            = "./images/redis"
  target_repository = "${var.target_repository}/redis"
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

module "secrets-store-csi-driver-provider-gcp" {
  source            = "./images/secrets-store-csi-driver-provider-gcp"
  target_repository = "${var.target_repository}/secrets-store-csi-driver-provider-gcp"
}

module "secrets-store-csi-driver" {
  source            = "./images/secrets-store-csi-driver"
  target_repository = "${var.target_repository}/secrets-store-csi-driver"
}

module "skaffold" {
  source            = "./images/skaffold"
  target_repository = "${var.target_repository}/skaffold"
}

module "terraform" {
  source            = "./images/terraform"
  target_repository = "${var.target_repository}/terraform"
}

module "thanos" {
  source            = "./images/thanos"
  target_repository = "${var.target_repository}/thanos"
}

module "traefik" {
  source            = "./images/traefik"
  target_repository = "${var.target_repository}/traefik"
}

module "vela-cli" {
  source            = "./images/vela-cli"
  target_repository = "${var.target_repository}/vela-cli"
}

module "vertical-pod-autoscaler-recommender" {
  source            = "./images/vertical-pod-autoscaler-recommender"
  target_repository = "${var.target_repository}/vertical-pod-autoscaler-recommender"
}

module "vertical-pod-autoscaler-updater" {
  source            = "./images/vertical-pod-autoscaler-updater"
  target_repository = "${var.target_repository}/vertical-pod-autoscaler-updater"
}

module "vt" {
  source            = "./images/vt"
  target_repository = "${var.target_repository}/vt"
}

module "wait-for-it" {
  source            = "./images/wait-for-it"
  target_repository = "${var.target_repository}/wait-for-it"
}

module "wavefront-proxy" {
  source            = "./images/wavefront-proxy"
  target_repository = "${var.target_repository}/wavefront-proxy"
}

module "wolfi-base" {
  source            = "./images/wolfi-base"
  target_repository = "${var.target_repository}/wolfi-base"
}

module "zookeeper" {
  source            = "./images/zookeeper"
  target_repository = "${var.target_repository}/zookeeper"
}

module "zot" {
  source            = "./images/zot"
  target_repository = "${var.target_repository}/zot"
}
