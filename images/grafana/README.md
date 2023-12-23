<!--monopod:start-->
# grafana
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/grafana` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/grafana/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
A minimal wolfi-based image for grafana, which is an open-source monitoring and observability application
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/grafana:latest
```
<!--getting:end-->

<!--body:start-->
## Upstream documentation
For more information on grafana, refer to the [grafana documentation](https://grafana.com/docs/).
Additionally the grafana GitHub reposiory can be [found here](https://github.com/grafana/grafana).

## Helm
grafana can be deployed using the following helm chart:
- [https://artifacthub.io/packages/helm/grafana/grafana](https://artifacthub.io/packages/helm/grafana/grafana)

Follow the instructions in the link above to deploy grafana using helm. Note you
will need to override the default image and tag used, replacing with the
chainguard image, example:

```bash
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update

helm install grafana https://grafana.github.io/helm-charts \
  --set image.repository=cgr.dev/chainguard/grafana \
  --set image.tag=latest
```

Refer to the [helm chart documentation](https://artifacthub.io/packages/helm/grafana/grafana)
for full instructions on how to use the helm chart.

## Docker
grafana can be launched using docker. Refer to the
[grafana docker image documentation](https://grafana.com/docs/grafana/latest/setup-grafana/installation/docker)
for full instructions.

Example:

```bash
docker run --name=local-grafana -p 3000:3000 cgr.dev/chainguard/grafana:latest
```

The grafana Web UI would be accessible via:
- [http://localhost:3000](http://localhost:3000)
<!--body:end-->
