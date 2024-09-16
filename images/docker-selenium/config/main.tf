terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  description = "The additional packages to install (e.g. docker-selenium)."
  default     = ["docker-selenium"]
}

variable "environment" {
  default = {}
}

module "accts" {
  source = "../../../tflib/accts"
  run-as = 0
  uid    = 65532
  gid    = 65532
  name   = "seluser"
}

output "config" {
  value = jsonencode({
    archs = ["x86_64"]
    contents = {
      packages = concat([
        "docker-selenium-supervisor-config",
      ], var.extra_packages)
    }
    accounts = module.accts.block
    environment = merge({
      "PATH" : "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
      "DEBIAN_FRONTEND" : "noninteractive"
      "DEBCONF_NONINTERACTIVE_SEEN" : "true"
      "TZ" : "UTC"
      "LANG_WHICH" : "en"
      "LANG_WHERE" : "US"
      "ENCODING" : "UTF-8"
      "LANGUAGE" : "en_US.UTF-8"
      "LANG" : "en_US.UTF-8"
      "SEL_USER" : "seluser"
      "SEL_UID" : "65532"
      "SEL_GID" : "65532"
      "HOME" : "/home/seluser"
      "SEL_DOWNLOAD_DIR" : "/home/seluser/Downloads"
      "SE_BIND_HOST" : "false"
      "SE_SCREEN_WIDTH" : "1360"
      "SE_SCREEN_HEIGHT" : "1020"
      "SE_SCREEN_DEPTH" : "24"
      "SE_SCREEN_DPI" : "96"
      "SE_START_XVFB" : "true"
      "SE_START_VNC" : "true"
      "SE_START_NO_VNC" : "true"
      "SE_NO_VNC_PORT" : "7900"
      "SE_VNC_PORT" : "5900"
      "DISPLAY" : ":99.0"
      "DISPLAY_NUM" : "99"
      "CONFIG_FILE" : "/opt/selenium/config.toml"
      "GENERATE_CONFIG" : "true"
      "SE_DRAIN_AFTER_SESSION_COUNT" : "0"
      "SE_OFFLINE" : "true"
      "SE_NODE_MAX_SESSIONS" : "1"
      "SE_NODE_SESSION_TIMEOUT" : "300"
      "SE_NODE_OVERRIDE_MAX_SESSIONS" : "false"
      "DBUS_SESSION_BUS_ADDRESS" : "/dev/null"
      "SE_RELAX_CHECKS" : "true"
      "FONTCONFIG_PATH" : "/etc/fonts"
      "LC_CTYPE" : "en_US"
      "OPENBLAS_NUM_THREADS" : "1"
      "SE_SESSION_REQUEST_TIMEOUT" : "300"
      "SE_SESSION_RETRY_INTERVAL" : "15"
      "SE_HEALTHCHECK_INTERVAL" : "120"
      "SE_REJECT_UNSUPPORTED_CAPS" : "false"
      "SE_OTEL_JAVA_GLOBAL_AUTOCONFIGURE_ENABLED" : "true"
      "SE_OTEL_TRACES_EXPORTER" : "otlp"
      "SE_OTEL_SERVICE_NAME" : "selenium-node-chrome"
      "CHROMIUM_USER_FLAGS" : "--headless --disable-gpu --no-sandbox"
      "SE_SUPERVISORD_LOG_LEVEL" : "info"
      "SE_SUPERVISORD_CHILD_LOG_DIR" : "/tmp"
      "SE_SUPERVISORD_LOG_FILE" : "/tmp/supervisord.log"
      "SE_SUPERVISORD_PID_FILE" : "/tmp/supervisord.pid"
    }, var.environment)
    entrypoint = {
      command = "/opt/bin/entry_point.sh"
    }
    paths = [{
      path        = "/opt/bin"
      type        = "directory"
      uid         = module.accts.uid
      gid         = module.accts.gid
      permissions = 509
      recursive   = true
      }, {
      path        = "/opt/selenium"
      type        = "directory"
      uid         = module.accts.uid
      gid         = module.accts.gid
      permissions = 509
      recursive   = false
      }, {
      path        = "/etc/supervisor"
      type        = "directory"
      uid         = module.accts.uid
      gid         = module.accts.gid
      permissions = 509
      recursive   = true
      }, {
      path        = "/etc/supervisor/conf.d"
      type        = "directory"
      uid         = module.accts.uid
      gid         = module.accts.gid
      permissions = 509
      recursive   = true
      }, {
      path        = "/var/log/supervisor"
      type        = "directory"
      uid         = module.accts.uid
      gid         = module.accts.gid
      permissions = 509
      recursive   = true
      }, {
      path        = "/var/run/supervisor"
      type        = "directory"
      uid         = module.accts.uid
      gid         = module.accts.gid
      permissions = 509
      recursive   = true
      }, {
      path        = "/tmp"
      type        = "directory"
      uid         = module.accts.uid
      gid         = module.accts.gid
      permissions = 509
      recursive   = true
      }, {
      path        = "/home/seluser"
      type        = "directory"
      uid         = module.accts.uid
      gid         = module.accts.gid
      permissions = 509
      recursive   = true
    }]
    }
  )
}
