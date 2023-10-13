<!--monopod:start-->
# gitlab
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/gitlab` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/gitlab/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

# Gitlab Images

## Get It!

The images are available on `cgr.dev`, e.g. `gitlab-kas`:

```
docker pull cgr.dev/chainguard/gitlab-kas:latest
```

## Usage

This replace the Gitlab images used in the deployment by our Chainguar images for Gitlab.
See the [full documentation](https://docs.gitlab.com/charts/) for installation and usage.

We can use the different Gitlab Chainguard images that we've built for Gitlab with the Helm chart of the project using the following commands.

First, you need to install the Helm repository:

```shell
helm repo add gitlab https://charts.gitlab.io/
helm repo update
```

Once you did this, you can install Gatekeeper to the target cluster:

```shell
    helm upgrade --install gitlab gitlab/gitlab \
        --timeout 600s \
        --set global.hosts.domain=example.com \
        --set gitlab.kas.image.repository="cgr.dev/chainguard/gitlab-kas" \
        --set gitlab.kas.image.tag="latest" \
        --set global.hosts.externalIP=10.10.10.10 \
        --set certmanager-issuer.email=me@example.com \
        --set postgresql.image.tag=13.6.0
```
