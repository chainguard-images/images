<!--monopod:start-->
# influxdb
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/influxdb` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/influxdb/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for influxdb

Minimal image with influxdb.

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/influxdb:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
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

## Contact Support

If you have a Zendesk account (typically set up for you by your Customer Success Manager) you can reach out to Chainguard's Customer Success team through our [Zendesk portal](https://support.chainguard.dev/hc/en-us).

## What are Chainguard Images?

[Chainguard Images](https://www.chainguard.dev/chainguard-images?utm_source=readmes) are a collection of container images designed for security and minimalism.

Many Chainguard Images are [distroless](https://edu.chainguard.dev/chainguard/chainguard-images/getting-started-distroless/); they contain only an open-source application and its runtime dependencies. These images do not even contain a shell or package manager. Chainguard Images are built with [Wolfi](https://edu.chainguard.dev/open-source/wolfi/overview), our Linux _undistro_ designed to produce container images that meet the requirements of a secure software supply chain.

The main features of Chainguard Images include:

* Minimal design, with no unnecessary software bloat
* Automated nightly builds to ensure Images are completely up-to-date and contain all available security patches
* [High quality build-time SBOMs](https://edu.chainguard.dev/chainguard/chainguard-images/working-with-images/retrieve-image-sboms/) (software bills of materials) attesting the provenance of all artifacts within the Image
* [Verifiable signatures](https://edu.chainguard.dev/chainguard/chainguard-images/working-with-images/retrieve-image-sboms/) provided by [Sigstore](https://edu.chainguard.dev/open-source/sigstore/cosign/an-introduction-to-cosign/)
* Reproducible builds with Cosign and apko ([read more about reproducibility](https://www.chainguard.dev/unchained/reproducing-chainguards-reproducible-image-builds))

### `-dev` Variants

As mentioned previously, Chainguard’s distroless Images have no shell or package manager by default. This is great for security, but sometimes you need these things, especially in builder images. For those cases, most (but not all) Chainguard Images come paired with a `-dev` variant which does include a shell and package manager.

Although the `-dev` image variants have similar security features as their distroless versions, such as complete SBOMs and signatures, they feature additional software that is typically not necessary in production environments. The general recommendation is to use the `-dev` variants only to build the application and then copy all application artifacts into a distroless image, which will result in a final container image that has a minimal attack surface and won’t allow package installations or logins.

That being said, it’s worth noting that `-dev` variants of Chainguard Images are completely fine to run in production environments. After all, the `-dev` variants are still **more secure** than many popular container images based on fully-featured operating systems such as Debian and Ubuntu since they carry less software, follow a more frequent patch cadence, and offer attestations for what they include.

## Learn More

To better understand how to work with Chainguard Images, we encourage you to visit [Chainguard Academy](https://edu.chainguard.dev/), our documentation and education platform.