<!--monopod:start-->
# gitalb-kas
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/gitalb-kas` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/gitalb-kas/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
GitLab Agent for Kubernetes is an active in-cluster component for solving any GitLab<->Kubernetes integration tasks.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/gitalb-kas:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

Chainguard's GitLab KAS image can be used with the GitLab Helm chart.

Below is an example of how to deploy the helm chart, using Chainguard's GitLab KAS image:

```bash
helm install gitlab gitlab/gitlab \
  --set gitlab.kas.image.repository=cgr.dev/chainguard-private/gitlab-kas \
  --set gitlab.kas.image.tag=latest
```

<!--body:end-->
