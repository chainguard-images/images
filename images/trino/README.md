<!--monopod:start-->
# trino

<!--url:start-->
<a href="https://github.com/trinodb/trino">
<!--logo:start-->
  <img src="https://storage.googleapis.com/chainguard-academy/logos/trino/logo.svg" width="36px" height="36px" />
<!--logo:end-->
</a>
<!--url:end-->

| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/trino` |

* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/trino/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*
---
<!--monopod:end-->

<!--overview:start-->
Fast distributed SQL query engine for big data analytics that helps you explore your data universe.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/trino:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

There is a TrinoDB Helm Chart exists, [here](https://github.com/trinodb/charts), which makes it easy to deploy TrinoDB on Kubernetes.

Here is the command that can be used to deploy TrinoDB on Kubernetes:

```
helm repo add trino https://trinodb.github.io/charts
helm repo update
helm install trino trino/trino \
      --set image.repository=cgr.dev/chainguard/trino
```

That's it, now, you have TrinoDB running on Kubernetes.
<!--body:end-->
