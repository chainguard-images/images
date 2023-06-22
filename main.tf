terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
    oci = {
      source  = "chainguard-dev/oci"
      version = "0.0.5"
    }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

provider "apko" {
  extra_repositories = ["https://packages.wolfi.dev/os"]
  extra_keyring      = ["https://packages.wolfi.dev/os/wolfi-signing.rsa.pub"]
  extra_packages     = ["wolfi-baselayout"]
  default_archs      = ["x86_64", "aarch64"]
}

module "apko" {
  source            = "./images/apko"
  target_repository = "${var.target_repository}/apko"
}

module "aspnet-runtime" {
  source            = "./images/aspnet-runtime"
  target_repository = "${var.target_repository}/aspnet-runtime"
}

module "bash" {
  source            = "./images/bash"
  target_repository = "${var.target_repository}/bash"
}

module "bazel" {
  source            = "./images/bazel"
  target_repository = "${var.target_repository}/bazel"
}

module "clang" {
  source            = "./images/clang"
  target_repository = "${var.target_repository}/clang"
}

module "consul" {
  source            = "./images/consul"
  target_repository = "${var.target_repository}/consul"
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

module "envoy" {
  source            = "./images/envoy"
  target_repository = "${var.target_repository}/envoy"
}

module "ffmpeg" {
  source            = "./images/ffmpeg"
  target_repository = "${var.target_repository}/ffmpeg"
}

module "gcc-glibc" {
  source            = "./images/gcc-glibc"
  target_repository = "${var.target_repository}/gcc-glibc"
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

module "k8sgpt" {
  source            = "./images/k8sgpt"
  target_repository = "${var.target_repository}/k8sgpt"
}

module "ko" {
  source            = "./images/ko"
  target_repository = "${var.target_repository}/ko"
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

module "kyverno-cli" {
  source            = "./images/kyverno-cli"
  target_repository = "${var.target_repository}/kyverno-cli"
}

module "mariadb" {
  source            = "./images/mariadb"
  target_repository = "${var.target_repository}/mariadb"
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

module "netcat" {
  source            = "./images/netcat"
  target_repository = "${var.target_repository}/netcat"
}

module "postgres" {
  source            = "./images/postgres"
  target_repository = "${var.target_repository}/postgres"
}

module "prometheus" {
  source            = "./images/prometheus"
  target_repository = "${var.target_repository}/prometheus"
}

module "prometheus-alertmanager" {
  source            = "./images/prometheus-alertmanager"
  target_repository = "${var.target_repository}/prometheus-alertmanager"
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

module "rabbitmq" {
  source            = "./images/rabbitmq"
  target_repository = "${var.target_repository}/rabbitmq"
}

module "redis" {
  source            = "./images/redis"
  target_repository = "${var.target_repository}/redis"
}

module "terraform" {
  source            = "./images/terraform"
  target_repository = "${var.target_repository}/terraform"
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

module "wait-for-it" {
  source            = "./images/wait-for-it"
  target_repository = "${var.target_repository}/wait-for-it"
}

module "wolfi-base" {
  source            = "./images/wolfi-base"
  target_repository = "${var.target_repository}/wolfi-base"
}
