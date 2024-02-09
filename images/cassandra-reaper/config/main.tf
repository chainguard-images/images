terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "environment" {
  default = {}
}

variable "extra_packages" {
  description = "The additional packages to install"
  default = [
    "cassandra-reaper",
    "openjdk-11-default-jvm"
  ]
}

module "accts" { source = "../../../tflib/accts" }

output "config" {
  value = jsonencode({
    contents = {
      packages = var.extra_packages,
    },
    accounts = module.accts.block,
    entrypoint = {
      command = "/usr/local/bin/entrypoint.sh",
    },
    cmd = "cassandra-reaper",

    # Currently there are some packages required that are only available in
    # the x86_64 variety.
    archs = ["x86_64"],
    paths = [
      {
        path        = "/etc/cassandra-reaper/",
        type        = "directory",
        permissions = 511, // 0o777 in decimal
        recursive   = true,
      },
    ],
    environment = merge({
      REAPER_SEGMENT_COUNT_PER_NODE                       = "64",
      REAPER_REPAIR_PARALELLISM                           = "DATACENTER_AWARE",
      REAPER_REPAIR_INTENSITY                             = "0.9",
      REAPER_MAX_PENDING_COMPACTIONS                      = "20",
      REAPER_SCHEDULE_DAYS_BETWEEN                        = "7",
      REAPER_REPAIR_RUN_THREADS                           = "15",
      REAPER_HANGING_REPAIR_TIMEOUT_MINS                  = "30",
      REAPER_STORAGE_TYPE                                 = "memory",
      REAPER_ENABLE_CROSS_ORIGIN                          = "true",
      REAPER_INCREMENTAL_REPAIR                           = "false",
      REAPER_BLACKLIST_TWCS                               = "false",
      REAPER_ENABLE_DYNAMIC_SEED_LIST                     = "true",
      REAPER_REPAIR_MANAGER_SCHEDULING_INTERVAL_SECONDS   = "30",
      REAPER_JMX_CONNECTION_TIMEOUT_IN_SECONDS            = "20",
      REAPER_USE_ADDRESS_TRANSLATOR                       = "false",
      REAPER_DATACENTER_AVAILABILITY                      = "ALL",
      REAPER_AUTO_SCHEDULING_ENABLED                      = "false",
      REAPER_AUTO_SCHEDULING_INITIAL_DELAY_PERIOD         = "PT15S",
      REAPER_AUTO_SCHEDULING_PERIOD_BETWEEN_POLLS         = "PT10M",
      REAPER_AUTO_SCHEDULING_TIME_BEFORE_FIRST_SCHEDULE   = "PT5M",
      REAPER_AUTO_SCHEDULING_SCHEDULE_SPREAD_PERIOD       = "PT6H",
      REAPER_AUTO_SCHEDULING_ADAPTIVE                     = "true",
      REAPER_AUTO_SCHEDULING_INCREMENTAL                  = "false",
      REAPER_AUTO_SCHEDULING_PERCENT_UNREPAIRED_THRESHOLD = "10",
      REAPER_AUTO_SCHEDULING_EXCLUDED_CLUSTERS            = "[]",
      REAPER_AUTO_SCHEDULING_EXCLUDED_KEYSPACES           = "[]",
      REAPER_JMX_PORTS                                    = "{}",
      REAPER_JMX_AUTH_USERNAME                            = "",
      REAPER_JMX_AUTH_PASSWORD                            = "",
      REAPER_JMX_CREDENTIALS                              = "",
      REAPER_LOGGING_ROOT_LEVEL                           = "INFO",
      REAPER_LOGGING_LOGGERS                              = "{}",
      REAPER_LOGGING_APPENDERS_CONSOLE_LOG_FORMAT         = "\"%-6level [%d] [%t] %logger{5} - %msg %n\"",
      REAPER_LOGGING_APPENDERS_CONSOLE_THRESHOLD          = "INFO",
      REAPER_SERVER_APP_PORT                              = "8080",
      REAPER_SERVER_APP_BIND_HOST                         = "0.0.0.0",
      REAPER_SERVER_ADMIN_PORT                            = "8081",
      REAPER_SERVER_ADMIN_BIND_HOST                       = "0.0.0.0",
      REAPER_CASS_ACTIVATE_QUERY_LOGGER                   = "false",
      REAPER_CASS_CLUSTER_NAME                            = "clustername",
      REAPER_CASS_CONTACT_POINTS                          = "[]",
      REAPER_CASS_PORT                                    = "9042",
      REAPER_CASS_KEYSPACE                                = "reaper_db",
      REAPER_CASS_LOCAL_DC                                = "",
      REAPER_CASS_AUTH_ENABLED                            = "false",
      REAPER_CASS_AUTH_USERNAME                           = "cassandra",
      REAPER_CASS_AUTH_PASSWORD                           = "cassandra",
      REAPER_CASS_NATIVE_PROTOCOL_SSL_ENCRYPTION_ENABLED  = "false",
      REAPER_DB_URL                                       = "",
      REAPER_DB_USERNAME                                  = "",
      REAPER_DB_PASSWORD                                  = "",
      REAPER_METRICS_ENABLED                              = "false",
      REAPER_METRICS_FREQUENCY                            = "1 minute",
      REAPER_METRICS_REPORTERS                            = "[]",
      REAPER_AUTH_ENABLED                                 = "true",
      REAPER_AUTH_USER                                    = "",
      REAPER_AUTH_PASSWORD                                = "",
      REAPER_SHIRO_INI                                    = "",
      REAPER_JMXMP_ENABLED                                = "false",
      REAPER_JMXMP_SSL                                    = "false",
      JAVA_OPTS                                           = "",
      REAPER_MAX_PARALLEL_REPAIRS                         = "2",
      REAPER_MGMT_API_METRICS_PORT                        = "9000",
      REAPER_HTTP_MANAGEMENT_ENABLE                       = "false",
    }, var.environment),
  })
}
