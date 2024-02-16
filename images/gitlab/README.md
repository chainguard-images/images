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

<!--overview:start-->
GitLab is an open source end-to-end software development platform with built-in version control, issue tracking, code review, CI/CD, and more.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/gitlab:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

This replaces the GitLab images used in the deployment by our Chainguard images for GitLab.
See the [full documentation](https://docs.gitlab.com/charts/) for installation and usage.

We can use the different GitLab Chainguard images that we've built for GitLab with the Helm chart of the project using the following commands.

First, you need to install the Helm repository:

```shell
helm repo add gitlab https://charts.gitlab.io/
helm repo update
```

Once you did this, you can install Gitlab Kas to the target cluster:

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
<!--body:end-->
