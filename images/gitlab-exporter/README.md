<!--monopod:start-->
# gitalb-exporter
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/gitalb-exporter` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/gitalb-exporter/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
Measure various GitLab metrics pulled from Redis and the database in Linux package instances.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/gitalb-exporter:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

Chainguard's GitLab exporter image can be used with the GitLab Helm chart.

Below is an example of how to deploy the helm chart, using Chainguard's GitLab exporter image:

```bash
helm install gitlab gitlab/gitlab \
  --set gitlab.gitlab-exporter.image.repository=cgr.dev/chainguard-private/gitlab-exporter \
  --set gitlab.gitlab-exporter.image.tag=latest
```

<!--body:end-->
