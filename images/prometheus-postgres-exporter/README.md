<!--monopod:start-->
# prometheus-postgres-exporter
| | |
| - | - |
| **Status** | experimental |
| **OCI Reference** | `cgr.dev/chainguard/prometheus-postgres-exporter` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/prometheus-postgres-exporter/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
*[Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

Minimal Prometheus Postgres Exporter Image

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/prometheus-postgres-exporter:latest
```

## Usage

This image listens on port 9187 by default.

To test:

```shell
ts=2023-05-01T19:06:49.164Z caller=proc.go:250 msg="Excluded databases" databases=[]
ts=2023-05-01T19:06:49.179Z caller=tls_config.go:232 level=info msg="Listening on" address=[::]:9187
ts=2023-05-01T19:06:49.179Z caller=tls_config.go:235 level=info msg="TLS is disabled." http2=false address=[::]:9187
```

## Configuration

The image can be configured through flags.
Run it with the `--help` flag to see the full list:

```shell
$ docker run cgr.dev/chainguard/prometheus-postgres-exporter --help
usage: postgres_exporter [<flags>]


Flags:
  -h, --[no-]help                Show context-sensitive help (also try
                                 --help-long and --help-man).
      --[no-]collector.database  Enable the database collector (default:
                                 enabled).
      --[no-]collector.bgwriter  Enable the bgwriter collector (default:
                                 enabled).
      --[no-]collector.replication_slot
                                 Enable the replication_slot collector (default:
                                 enabled).
      --config.file="postgres_exporter.yml"
                                 Postgres exporter configuration file.
      --[no-]web.systemd-socket  Use systemd socket activation listeners instead
                                 of port listeners (Linux only).
      --web.listen-address=:9187 ...
                                 Addresses on which to expose metrics and web
                                 interface. Repeatable for multiple addresses.
      --web.config.file=""       [EXPERIMENTAL] Path to configuration file that
                                 can enable TLS or authentication.
      --web.telemetry-path="/metrics"
                                 Path under which to expose metrics.
                                 ($PG_EXPORTER_WEB_TELEMETRY_PATH)
      --[no-]disable-default-metrics
                                 Do not include default metrics.
                                 ($PG_EXPORTER_DISABLE_DEFAULT_METRICS)
      --[no-]disable-settings-metrics
                                 Do not include pg_settings metrics.
                                 ($PG_EXPORTER_DISABLE_SETTINGS_METRICS)
      --[no-]auto-discover-databases
                                 Whether to discover the databases
                                 on a server dynamically.
                                 ($PG_EXPORTER_AUTO_DISCOVER_DATABASES)
      --extend.query-path=""     Path to custom queries to run.
                                 ($PG_EXPORTER_EXTEND_QUERY_PATH)
      --[no-]dumpmaps            Do not run, simply dump the maps.
      --constantLabels=""        A list of label=value separated by comma(,).
                                 ($PG_EXPORTER_CONSTANT_LABELS)
      --exclude-databases=""     A list of databases to remove when
                                 autoDiscoverDatabases is enabled
                                 ($PG_EXPORTER_EXCLUDE_DATABASES)
      --include-databases=""     A list of databases to include when
                                 autoDiscoverDatabases is enabled
                                 ($PG_EXPORTER_INCLUDE_DATABASES)
      --metric-prefix="pg"       A metric prefix can be used to have non-default
                                 (not "pg") prefixes for each of the metrics
                                 ($PG_EXPORTER_METRIC_PREFIX)
      --[no-]version             Show application version.
      --log.level=info           Only log messages with the given severity or
                                 above. One of: [debug, info, warn, error]
      --log.format=logfmt        Output format of log messages. One of: [logfmt,
                                 json]
```
