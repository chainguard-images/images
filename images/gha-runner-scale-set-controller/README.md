<!--monopod:start-->
# gha-runner-scale-set-controller
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/gha-runner-scale-set-controller` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/gha-runner-scale-set-controller/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
Kubernetes controller for GitHub Actions self-hosted runners
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/gha-runner-scale-set-controller:latest
```
<!--getting:end-->

<!--body:start-->

## Usage

This document outlines how to test our `gha-runner-scale-set-controller` image. You can set up ARC on Kubernetes using Helm, then create and run a workflow that uses runner scale sets. 

For more information about runner scale sets, you should refer to the official documentation, [_Quickstart for Actions Runner Controller_](https://docs.github.com/en/actions/hosting-your-own-runners/managing-self-hosted-runners-with-actions-runner-controller/quickstart-for-actions-runner-controller#installing-actions-runner-controller).

## Prerequisites

You can find a detailed list of prerequisites in the official documentation, (here)[https://docs.github.com/en/actions/hosting-your-own-runners/managing-self-hosted-runners-with-actions-runner-controller/quickstart-for-actions-runner-controller#prerequisites).

But for the sake of simplicity, all you need is:
- A Kubernetes cluster
- Helm 3
- A GitHub repository with a workflow that uses runner scale sets

that's all.

## Testing

To test the `gha-runner-scale-set-controller` image, you can follow these steps:

1. Install the Actions Runner Controller on your Kubernetes cluster using Helm. You can find the installation instructions [here](https://docs.github.com/en/actions/hosting-your-own-runners/managing-self-hosted-runners-with-actions-runner-controller/quickstart-for-actions-runner-controller#installing-actions-runner-controller).

```shell
NAMESPACE="arc-systems"
helm install arc \
    --namespace "${NAMESPACE}" \
    --create-namespace \
    oci://ghcr.io/actions/actions-runner-controller-charts/gha-runner-scale-set-controller \
    --set image.repository=cgr.dev/chainguard/gha-runner-scale-set-controller \
    --set image.tag=latest
```

> ⚠️ Please ensure that the `arc-gha-rs-controller` pod is running in the `arc-system` namespace before proceeding to the next step.

2. To configure the runner scale set, you can follow the official documentation [here](https://docs.github.com/en/actions/hosting-your-own-runners/managing-self-hosted-runners-with-actions-runner-controller/quickstart-for-actions-runner-controller#configuring-a-runner-scale-set).

For that, you will need two things:
- A GitHub repository with a workflow that uses runner scale sets
- A runner registration token which we refer `GITHUB_PAT`

```shell
INSTALLATION_NAME="arc-runner-set"
NAMESPACE="arc-runners"
GITHUB_CONFIG_URL="https://github.com/<org/repo/enterprise>" # make sure to replace this with your GitHub repository URL or GitHub Enterprise URL
GITHUB_PAT="<PAT>" # make sure to replace this with your GitHub PAT

helm install "${INSTALLATION_NAME}" \
    --namespace "${NAMESPACE}" \
    --create-namespace \
    --set githubConfigUrl="${GITHUB_CONFIG_URL}" \
    --set githubConfigSecret.github_token="${GITHUB_PAT}" \
    oci://ghcr.io/actions/actions-runner-controller-charts/gha-runner-scale-set
```

> ⚠️ Please ensure that the `arc-runner-set` pod is running in the `arc-runners` namespace before proceeding to the next step.

> ⚠️ The GITHUB_PAT is not the only way to authenticate with GitHub. You can use other methods like GitHub App. You can check the values.yaml file for more information: https://github.com/actions/actions-runner-controller/blob/master/charts/gha-runner-scale-set/values.yaml

Once you did that you can create and run a workflow that uses runner scale sets like the following:

> 🤖 You can see the self-hosted runner that you registered within the project's runners tab.
> To get more detail about using self-hosted runners in workflow, [here](https://docs.github.com/en/actions/hosting-your-own-runners/managing-self-hosted-runners/using-self-hosted-runners-in-a-workflow) is the official documentation you can refer to.

```yaml
name: Actions Runner Controller Demo
on:
  workflow_dispatch:

jobs:
  Explore-GitHub-Actions:
    # You need to use the INSTALLATION_NAME from the previous step
    runs-on: arc-runner-set
    steps:
    - run: echo "🎉 This job uses runner scale set runners!"

```

That's it! You have successfully tested the `gha-runner-scale-set-controller` image.
<!--body:end-->
