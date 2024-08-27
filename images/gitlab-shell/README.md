<!--monopod:start-->
# gitlab-shell
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/gitlab-shell` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/gitlab-shell/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
Gitlab Shell
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/gitlab-shell:latest
```
<!--getting:end-->

<!--body:start-->
## Usage
Please refer to the following helm chart documentation for instructions on how to deploy GitLab in Kubernetes: see [here]().

The GitLab helm chart is composed of multiple sub-charts, one of which deploys the GitLab shell component.

### Step 1: Pull down the source
The upstream Gitlab Helm repo contains custom values for deploying a compatible kind cluster, as well as values files for the helm chat to deploy with SSL disabled:
```bash
git clone https://gitlab.com/gitlab-org/charts/gitlab.git && cd gitlab
```

### Step 2: Create new kind cluster#
This needs to be run from the root of the gitlab repo, step 1

```kind create cluster --config examples/kind/kind-no-ssl.yaml```

### Step 3: Create default password

Creates a secret containing a default password for the root user, which we’ll need to pass into the helm chart:
```bash
kubectl create secret generic gitlab-gitlab-initial-root-password --from-literal=password='P@ssw3rd'
```
### Step 4: Identify your public IP#
```
export MY_IP_ADDRESS=$(ipconfig getifaddr en0)
```

### Step 5: Add the Gitlab helm repo#
```helm repo add gitlab https://charts.gitlab.io/```

### Step 6: Deploy Gitlab helm chart!#
```bash
helm upgrade --install gitlab gitlab/gitlab \
  --set gitlab.gitlab-shell.image.repository=cgr.dev/chainguard-private/gitlab-shell \
  --set gitlab.gitlab-shell.image.repository=latest \
  --set global.hosts.domain=$MY_IP_ADDRESS.nip.io \
  --set gitlab.gitlab-root-password.secret=gitlab-gitlab-initial-root-password \
  -f examples/kind/values-base.yaml \
  -f examples/kind/values-no-ssl.yaml
  ```

Also, you can find the installation parameters related to the shell sub-chart [here](https://docs.gitlab.com/charts/charts/registry/#installation-parameters).

<!--body:end-->
