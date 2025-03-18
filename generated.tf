# DO NOT EDIT - this file is autogenerated by tfgen

module "apko" {
  source            = "./images/apko"
  target_repository = "${var.target_repository}/apko"
  test_repository   = var.test_repository
}

module "aspnet-runtime" {
  source            = "./images/aspnet-runtime"
  target_repository = "${var.target_repository}/aspnet-runtime"
  test_repository   = var.test_repository
}

module "bash" {
  source            = "./images/bash"
  target_repository = "${var.target_repository}/bash"
  test_repository   = var.test_repository
}

module "cosign" {
  source            = "./images/cosign"
  target_repository = "${var.target_repository}/cosign"
  test_repository   = var.test_repository
}

module "crane" {
  source            = "./images/crane"
  target_repository = "${var.target_repository}/crane"
  test_repository   = var.test_repository
}

module "curl" {
  source            = "./images/curl"
  target_repository = "${var.target_repository}/curl"
  test_repository   = var.test_repository
}

module "dive" {
  source            = "./images/dive"
  target_repository = "${var.target_repository}/dive"
  test_repository   = var.test_repository
}

module "docker-dind" {
  source            = "./images/docker-dind"
  target_repository = "${var.target_repository}/docker-dind"
  test_repository   = var.test_repository
}

module "dotnet" {
  source            = "./images/dotnet"
  target_repository = "${var.target_repository}/dotnet"
  test_repository   = var.test_repository
}

module "gcc-glibc" {
  source            = "./images/gcc-glibc"
  target_repository = "${var.target_repository}/gcc-glibc"
  test_repository   = var.test_repository
}

module "glibc-dynamic" {
  source            = "./images/glibc-dynamic"
  target_repository = "${var.target_repository}/glibc-dynamic"
  test_repository   = var.test_repository
}

module "go" {
  source            = "./images/go"
  target_repository = "${var.target_repository}/go"
  test_repository   = var.test_repository
}

module "gradle" {
  source            = "./images/gradle"
  target_repository = "${var.target_repository}/gradle"
  test_repository   = var.test_repository
}

module "grype" {
  source            = "./images/grype"
  target_repository = "${var.target_repository}/grype"
  test_repository   = var.test_repository
}

module "haproxy" {
  source            = "./images/haproxy"
  target_repository = "${var.target_repository}/haproxy"
  test_repository   = var.test_repository
}

module "helm" {
  source            = "./images/helm"
  target_repository = "${var.target_repository}/helm"
  test_repository   = var.test_repository
}

module "hugo" {
  source            = "./images/hugo"
  target_repository = "${var.target_repository}/hugo"
  test_repository   = var.test_repository
}

module "jdk" {
  source            = "./images/jdk"
  target_repository = "${var.target_repository}/jdk"
  test_repository   = var.test_repository
}

module "jre" {
  source            = "./images/jre"
  target_repository = "${var.target_repository}/jre"
  test_repository   = var.test_repository
}

module "k3s" {
  source            = "./images/k3s"
  target_repository = "${var.target_repository}/k3s"
  test_repository   = var.test_repository
}

module "ko" {
  source            = "./images/ko"
  target_repository = "${var.target_repository}/ko"
  test_repository   = var.test_repository
}

module "kubectl" {
  source            = "./images/kubectl"
  target_repository = "${var.target_repository}/kubectl"
  test_repository   = var.test_repository
}

module "laravel" {
  source            = "./images/laravel"
  target_repository = "${var.target_repository}/laravel"
  test_repository   = var.test_repository
}

module "malcontent" {
  source            = "./images/malcontent"
  target_repository = "${var.target_repository}/malcontent"
  test_repository   = var.test_repository
}

module "mariadb" {
  source            = "./images/mariadb"
  target_repository = "${var.target_repository}/mariadb"
  test_repository   = var.test_repository
}

module "melange" {
  source            = "./images/melange"
  target_repository = "${var.target_repository}/melange"
  test_repository   = var.test_repository
}

module "mongodb" {
  source            = "./images/mongodb"
  target_repository = "${var.target_repository}/mongodb"
  test_repository   = var.test_repository
}

module "nginx" {
  source            = "./images/nginx"
  target_repository = "${var.target_repository}/nginx"
  test_repository   = var.test_repository
}

module "node" {
  source            = "./images/node"
  target_repository = "${var.target_repository}/node"
  test_repository   = var.test_repository
}

module "openscap" {
  source            = "./images/openscap"
  target_repository = "${var.target_repository}/openscap"
  test_repository   = var.test_repository
}

module "php" {
  source            = "./images/php"
  target_repository = "${var.target_repository}/php"
  test_repository   = var.test_repository
}

module "postgres" {
  source            = "./images/postgres"
  target_repository = "${var.target_repository}/postgres"
  test_repository   = var.test_repository
}

module "python" {
  source            = "./images/python"
  target_repository = "${var.target_repository}/python"
  test_repository   = var.test_repository
}

module "pytorch" {
  source            = "./images/pytorch"
  target_repository = "${var.target_repository}/pytorch"
  test_repository   = var.test_repository
}

module "redis" {
  source            = "./images/redis"
  target_repository = "${var.target_repository}/redis"
  test_repository   = var.test_repository
}

module "ruby" {
  source            = "./images/ruby"
  target_repository = "${var.target_repository}/ruby"
  test_repository   = var.test_repository
}

module "rust" {
  source            = "./images/rust"
  target_repository = "${var.target_repository}/rust"
  test_repository   = var.test_repository
}

module "stunnel" {
  source            = "./images/stunnel"
  target_repository = "${var.target_repository}/stunnel"
  test_repository   = var.test_repository
}

module "tomcat" {
  source            = "./images/tomcat"
  target_repository = "${var.target_repository}/tomcat"
  test_repository   = var.test_repository
}

module "valkey" {
  source            = "./images/valkey"
  target_repository = "${var.target_repository}/valkey"
  test_repository   = var.test_repository
}

module "wait-for-it" {
  source            = "./images/wait-for-it"
  target_repository = "${var.target_repository}/wait-for-it"
  test_repository   = var.test_repository
}

module "wolfi-base" {
  source            = "./images/wolfi-base"
  target_repository = "${var.target_repository}/wolfi-base"
  test_repository   = var.test_repository
}

module "wordpress" {
  source            = "./images/wordpress"
  target_repository = "${var.target_repository}/wordpress"
  test_repository   = var.test_repository
}

output "summary_apko" {
  value = module.apko.summary
}

output "summary_aspnet-runtime" {
  value = module.aspnet-runtime.summary
}

output "summary_bash" {
  value = module.bash.summary
}

output "summary_cosign" {
  value = module.cosign.summary
}

output "summary_crane" {
  value = module.crane.summary
}

output "summary_curl" {
  value = module.curl.summary
}

output "summary_dive" {
  value = module.dive.summary
}

output "summary_docker-dind" {
  value = module.docker-dind.summary
}

output "summary_dotnet" {
  value = module.dotnet.summary
}

output "summary_gcc-glibc" {
  value = module.gcc-glibc.summary
}

output "summary_glibc-dynamic" {
  value = module.glibc-dynamic.summary
}

output "summary_go" {
  value = module.go.summary
}

output "summary_gradle" {
  value = module.gradle.summary
}

output "summary_grype" {
  value = module.grype.summary
}

output "summary_haproxy" {
  value = module.haproxy.summary
}

output "summary_helm" {
  value = module.helm.summary
}

output "summary_hugo" {
  value = module.hugo.summary
}

output "summary_jdk" {
  value = module.jdk.summary
}

output "summary_jre" {
  value = module.jre.summary
}

output "summary_k3s" {
  value = module.k3s.summary
}

output "summary_ko" {
  value = module.ko.summary
}

output "summary_kubectl" {
  value = module.kubectl.summary
}

output "summary_laravel" {
  value = module.laravel.summary
}

output "summary_malcontent" {
  value = module.malcontent.summary
}

output "summary_mariadb" {
  value = module.mariadb.summary
}

output "summary_melange" {
  value = module.melange.summary
}

output "summary_mongodb" {
  value = module.mongodb.summary
}

output "summary_nginx" {
  value = module.nginx.summary
}

output "summary_node" {
  value = module.node.summary
}

output "summary_openscap" {
  value = module.openscap.summary
}

output "summary_php" {
  value = module.php.summary
}

output "summary_postgres" {
  value = module.postgres.summary
}

output "summary_python" {
  value = module.python.summary
}

output "summary_pytorch" {
  value = module.pytorch.summary
}

output "summary_redis" {
  value = module.redis.summary
}

output "summary_ruby" {
  value = module.ruby.summary
}

output "summary_rust" {
  value = module.rust.summary
}

output "summary_stunnel" {
  value = module.stunnel.summary
}

output "summary_tomcat" {
  value = module.tomcat.summary
}

output "summary_valkey" {
  value = module.valkey.summary
}

output "summary_wait-for-it" {
  value = module.wait-for-it.summary
}

output "summary_wolfi-base" {
  value = module.wolfi-base.summary
}

output "summary_wordpress" {
  value = module.wordpress.summary
}

