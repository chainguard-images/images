<!--monopod:start-->
# jitsucom-bulker
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/jitsucom-bulker` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/jitsucom-bulker/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
Service for bulk-loading data to databases with automatic schema management (Redshift, Snowflake, BigQuery, ClickHouse, Postgres, MySQL)
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/jitsucom-bulker:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

```sh
helm upgrade --install jitsucom-bulker oci://registry-1.docker.io/stafftasticcharts/jitsu \
    -n jitsucom-bulker \
    --create-namespace \
    --set bulker.image.repository=cgr.dev/chainguard/jitsucom-bulker \
    --set bulker.image.tag=latest \
    --set ingest.image.repository=cgr.dev/chainguard/jitsucom-ingest \
    --set ingest.image.tag=latest \
    --set syncctl.image.repository=cgr.dev/chainguard/jitsucom-syncctl \
    --set syncctl.image.tag=latest \
    --set tokenGenerator.image.tag=1.30.0 # `:latest` tag doesn't not exist, so set to _latest_ version
```

* Refer to [values.yaml](https://github.com/stafftastic/jitsu-chart/blob/main/values.yaml) file for more configuration options.

> [!WARNING]
> The Helm Chart we used in the tests is the official, stable and is used to run Jitsu in production, according to maintainer's [comment](https://github.com/jitsucom/jitsu/issues/880#issuecomment-1987928495).
<!--body:end-->
