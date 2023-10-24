terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

variable "war_url" {
  description = "The URL to the WAR file to deploy."
  default     = "https://tomcat.apache.org/tomcat-10.0-doc/appdev/sample/sample.war"
}

data "oci_exec_test" "run" {
  digest = var.digest
  script = "${path.module}/run.sh"
  env {
    name  = "WAR_URL"
    value = var.war_url
  }
}

data "oci_exec_test" "smoke" {
  digest = var.digest
  script = "${path.module}/smoke.sh"
  env {
    name  = "WAR_URL"
    value = var.war_url
  }
}
