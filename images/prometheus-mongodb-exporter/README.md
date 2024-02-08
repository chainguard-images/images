<!--monopod:start-->
# prometheus-mongodb-exporter
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/prometheus-mongodb-exporter` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/prometheus-mongodb-exporter/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimalist Wolfi-based Prometheus MongoDB Exporter image for exporting various metrics about MongoDB.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/prometheus-mongodb-exporter:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

This image listens on port 9216 by default.

The easiest way to install the Prometheus MongoDB Exporter is to use the Helm chart.

```bash
$ helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
$ helm repo update
$ helm install prom-mongodb-exporter prometheus-community/prometheus-mongodb-exporter \
 --set image.repository=cgr.dev/chainguard/prometheus-mongodb-exporter --set image.tag=latest
```

For more detail, please refer to the [MongoDB Exporter documentation](https://github.com/percona/mongodb_exporter).


## Configuration

The image can be configured through flags.
Run it with the `--help` flag to see the full list:

```shell
$ docker run cgr.dev/chainguard-private/prometheus-mongodb-exporter-fips --help
usage: mongodb_exporter [<flags>]

Flags:
  -h, --help                     Show context-sensitive help.
      --mongodb.collstats-colls=db1,db2.col2
                                 List of comma separared databases.collections
                                 to get $collStats
      --mongodb.indexstats-colls=db1.col1,db2.col2
                                 List of comma separared databases.collections
                                 to get $indexStats
      --mongodb.uri=mongodb://user:pass@127.0.0.1:27017/admin?ssl=true
                                 MongoDB connection URI ($MONGODB_URI)
      --[no-]mongodb.global-conn-pool
                                 Use global connection pool instead of creating
                                 new pool for each http request.
      --[no-]mongodb.direct-connect
                                 Whether or not a direct connect should be made.
                                 Direct connections are not valid if multiple
                                 hosts are specified or an SRV URI is used.
      --web.listen-address=":9216"
                                 Address to listen on for web interface and
                                 telemetry
      --web.telemetry-path="/metrics"
                                 Metrics expose path
      --web.config=STRING        Path to the file having Prometheus TLS config
                                 for basic auth
      --log.level="error"        Only log messages with the given severity or
                                 above. Valid levels: [debug, info, warn, error,
                                 fatal]
      --collector.diagnosticdata
                                 Enable collecting metrics from
                                 getDiagnosticData
      --collector.replicasetstatus
                                 Enable collecting metrics from replSetGetStatus
      --collector.dbstats        Enable collecting metrics from dbStats
      --collector.topmetrics     Enable collecting metrics from top admin
                                 command
      --collector.indexstats     Enable collecting metrics from $indexStats
      --collector.collstats      Enable collecting metrics from $collStats
      --metrics.overridedescendingindex
                                 Enable descending index name override to
                                 replace -1 with _DESC
      --collect-all              Enable all collectors. Same as specifying all
                                 --collector.<name>
      --collector.collstats-limit=0
                                 Disable collstats, dbstats, topmetrics and
                                 indexstats collector if there are more than <n>
                                 collections. 0=No limit
      --[no-]discovering-mode    Enable autodiscover collections
      --[no-]compatible-mode     Enable old mongodb-exporter compatible metrics
      --version                  Show version and exit
```

<!--body:end-->
