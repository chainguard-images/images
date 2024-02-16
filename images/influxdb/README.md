<!--monopod:start-->
# influxdb
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/influxdb` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/influxdb/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimal image with influxdb. **EXPERIMENTAL**
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/influxdb:latest
```
<!--getting:end-->

<!--body:start-->
## Using Influxdb

The Chainguard Influxdb image contains the `influxd` server binary, the `influx` client, and the docker `entrypoint.sh` script.

The entrypoint script contains logic to bootstrap, initialize, and upgrade existing installations.
For full documentation, see the [script docs](https://hub.docker.com/_/influxdb).

This image can be run directly:

```shell
$ docker run -p 8086:8086 cgr.dev/chainguard/influxdb:latest
2023-04-15T11:56:12.%NZ warn    boltdb not found at configured path, but DOCKER_INFLUXDB_INIT_MODE not specified, skipping setup wrapper        {"system": "docker", "bolt_path": ""}
ts=2023-04-15T11:56:12.323316Z lvl=info msg="Welcome to InfluxDB" log_id=0hDCD0dW000 version=v2.7.0 commit=85f725f build_date=2023-04-15T11:56:12Z log_level=info
ts=2023-04-15T11:56:12.323358Z lvl=warn msg="nats-port argument is deprecated and unused" log_id=0hDCD0dW000
ts=2023-04-15T11:56:12.326781Z lvl=info msg="Resources opened" log_id=0hDCD0dW000 service=bolt path=/var/lib/influxdb2/influxd.bolt
ts=2023-04-15T11:56:12.326920Z lvl=info msg="Resources opened" log_id=0hDCD0dW000 service=sqlite path=/var/lib/influxdb2/influxd.sqlite
ts=2023-04-15T11:56:12.327433Z lvl=info msg="Bringing up metadata migrations" log_id=0hDCD0dW000 service="KV migrations" migration_count=20
ts=2023-04-15T11:56:12.352187Z lvl=info msg="Bringing up metadata migrations" log_id=0hDCD0dW000 service="SQL migrations" migration_count=8
ts=2023-04-15T11:56:12.370027Z lvl=info msg="Using data dir" log_id=0hDCD0dW000 service=storage-engine service=store path=/var/lib/influxdb2/engine/data
ts=2023-04-15T11:56:12.370132Z lvl=info msg="Compaction settings" log_id=0hDCD0dW000 service=storage-engine service=store max_concurrent_compactions=6 throughput_bytes_per_second=50331648 throughput_bytes_per_second_burst=50331648
ts=2023-04-15T11:56:12.370144Z lvl=info msg="Open store (start)" log_id=0hDCD0dW000 service=storage-engine service=store op_name=tsdb_open op_event=start
ts=2023-04-15T11:56:12.370198Z lvl=info msg="Open store (end)" log_id=0hDCD0dW000 service=storage-engine service=store op_name=tsdb_open op_event=end op_elapsed=0.055ms
ts=2023-04-15T11:56:12.370254Z lvl=info msg="Starting retention policy enforcement service" log_id=0hDCD0dW000 service=retention check_interval=30m
ts=2023-04-15T11:56:12.370273Z lvl=info msg="Starting precreation service" log_id=0hDCD0dW000 service=shard-precreation check_interval=10m advance_period=30m
ts=2023-04-15T11:56:12.371172Z lvl=info msg="Starting query controller" log_id=0hDCD0dW000 service=storage-reads concurrency_quota=1024 initial_memory_bytes_quota_per_query=9223372036854775807 memory_bytes_quota_per_query=9223372036854775807 max_memory_bytes=0 queue_size=1024
ts=2023-04-15T11:56:12.373840Z lvl=info msg="Configuring InfluxQL statement executor (zeros indicate unlimited)." log_id=0hDCD0dW000 max_select_point=0 max_select_series=0 max_select_buckets=0
ts=2023-04-15T11:56:12.378435Z lvl=info msg=Starting log_id=0hDCD0dW000 service=telemetry interval=8h
ts=2023-04-15T11:56:12.378653Z lvl=info msg=Listening log_id=0hDCD0dW000 service=tcp-listener transport=http addr=:8086 port=8086
```

Or using the helm chart:

```shell
$ helm repo add influxdata https://helm.influxdata.com/
$ helm upgrade --install influxdb \
    influxdata/influxdb2 \
    --set image.repository=cgr.dev/chainguard/influxdb \
    --set image.tag=latest-arm64
Release "influxdb" does not exist. Installing it now.
NAME: influxdb
LAST DEPLOYED: Sat Apr 15 07:57:28 2023
NAMESPACE: default
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
InfluxDB 2 is deployed as a StatefulSet on your cluster.

You can access it by using the service name: influxdb-influxdb2

To retrieve the password for the 'admin' user:

  echo $(kubectl get secret influxdb-influxdb2-auth -o "jsonpath={.data['admin-password']}" --namespace default | base64 --decode)

Note: with enabled persistence, admin password is only set once during the initial deployment. The password is not changed when InfluxDB 2 is re-deployed with different password.
```
<!--body:end-->
