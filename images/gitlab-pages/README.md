<!--monopod:start-->
# gitalb-pages
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/gitalb-pages` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/gitalb-pages/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Publish static websites directly from a repository in GitLab.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/gitalb-pages:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

Chainguard's GitLab pages image can be used with the GitLab Helm chart.

Below is an example of how to deploy the helm chart, using Chainguard's GitLab pages image:

```bash
helm install gitlab gitlab/gitlab \
  --set gitlab.gitlab-pages.image.repository=cgr.dev/chainguard-private/gitlab-pages \
  --set gitlab.gitlab-pages.image.tag=latest
```

<!--body:end-->
