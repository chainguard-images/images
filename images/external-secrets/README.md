<!--monopod:start-->
# external-secrets
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/external-secrets` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/external-secrets/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimal Kubernetes [External Secrets Operator](https://external-secrets.io/) image
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/external-secrets:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

This image is a drop-in replacement for the upstream image.
You can run it using the helm chart with:

```shell

$ helm repo add external-secrets https://charts.external-secrets.io
$ helm install external-secrets \
   external-secrets/external-secrets \
    -n external-secrets \
    --set image.repository=cgr.dev/chainguard/external-secrets  \
    --set image.tag=latest \
    --create-namespace
    <other configuration parameters here>
```

See the [configuration](https://github.com/external-secrets/external-secrets/tree/main/deploy/charts/external-secrets) docs for more examples.
<!--body:end-->
