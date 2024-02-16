<!--monopod:start-->
# temporal-server
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/temporal-server` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/temporal-server/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimal image for [Temporal](https://docs.temporal.io/), a durable execution platform that handles intermittent failures and retries failed operations
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/temporal-server:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

The default entrypoint for this image is `/etc/temporal/entrypoint.sh`

To test:

```shell
$ docker run cgr.dev/chainguard/temporal-server:latest start --config <config dir path relative to root (default: "config")>

USAGE:
   temporal-server [global options] command [command options]  

VERSION:
   1.22.0

COMMANDS:
   start    Start Temporal server
   help, h  Shows a list of commands or help for one command

GLOBAL OPTIONS:
   --root value, -r value    root directory of execution environment (default: ".") [$TEMPORAL_ROOT]
   --config value, -c value  config dir path relative to root (default: "config") [$TEMPORAL_CONFIG_DIR]
   --env value, -e value     runtime environment (default: "development") [$TEMPORAL_ENVIRONMENT]
   --zone value, --az value  availability zone [$TEMPORAL_AVAILABILITY_ZONE, $TEMPORAL_AVAILABILTY_ZONE]
   --allow-no-auth           allow no authorizer (default: false) [$TEMPORAL_ALLOW_NO_AUTH]
   --help, -h                show help (default: false)
   --version, -v             print the version (default: false)
```

Notes: 

* Here's the docker compose repo link for further reference on how this image can run https://github.com/temporalio/docker-compose
* For Helm Chart working, here's the reference: https://github.com/temporalio/helm-charts/tree/master#install-temporal-with-helm-chart 
TLDR, for a miminal helm installation:

```
helm -n temporaltest install \
    --set server.replicaCount=1 \
    --namespace temporaltest \
    --create-namespace \
    --set cassandra.config.cluster_size=1 \
    --set prometheus.enabled=false \
    --set grafana.enabled=false \
    --set elasticsearch.enabled=false \
    --set server.image.repository=cgr.dev/chainguard/temporal-server \
    --set server.image.tag=latest \
    temporaltest . --timeout 15m
```
<!--body:end-->
