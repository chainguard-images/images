<!--monopod:start-->
# trino
| | |
| - | - |
| **Status** | stable |
| **OCI Reference** | `cgr.dev/chainguard/trino` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/trino/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
*[Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

[cAdvisor (Container Advisor)](https://github.com/google/cadvisor) provides container users an understanding of the resource usage and performance characteristics of their running containers.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/trino
```

## Usage

There is a TrinoDB Helm Chart exists, [here](https://github.com/trinodb/charts), which makes it easy to deploy TrinoDB on Kubernetes.

Here is the command that can be used to deploy TrinoDB on Kubernetes:

```
helm repo add trino https://trinodb.github.io/charts
helm repo update
helm install trino trino/trino \
      --set image.repository=cgr.dev/chainguard-dev/trino
      --set image.tag=latest
```

That's it, now, you have TrinoDB running on Kubernetes.

