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
# Chainguard Image for gha-runner-scale-set-controller

Kubernetes controller for GitHub Actions self-hosted runners

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/gha-runner-scale-set-controller:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
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

## Contact Support

If you have a Zendesk account (typically set up for you by your Customer Success Manager) you can reach out to Chainguard's Customer Success team through our [Zendesk portal](https://support.chainguard.dev/hc/en-us).

## What are Chainguard Images?

[Chainguard Images](https://www.chainguard.dev/chainguard-images?utm_source=readmes) are a collection of container images designed for security and minimalism.

Many Chainguard Images are [distroless](https://edu.chainguard.dev/chainguard/chainguard-images/getting-started-distroless/); they contain only an open-source application and its runtime dependencies. These images do not even contain a shell or package manager. Chainguard Images are built with [Wolfi](https://edu.chainguard.dev/open-source/wolfi/overview), our Linux _undistro_ designed to produce container images that meet the requirements of a secure software supply chain.

The main features of Chainguard Images include:

* Minimal design, with no unnecessary software bloat
* Automated nightly builds to ensure Images are completely up-to-date and contain all available security patches
* [High quality build-time SBOMs](https://edu.chainguard.dev/chainguard/chainguard-images/working-with-images/retrieve-image-sboms/) (software bills of materials) attesting the provenance of all artifacts within the Image
* [Verifiable signatures](https://edu.chainguard.dev/chainguard/chainguard-images/working-with-images/retrieve-image-sboms/) provided by [Sigstore](https://edu.chainguard.dev/open-source/sigstore/cosign/an-introduction-to-cosign/)
* Reproducible builds with Cosign and apko ([read more about reproducibility](https://www.chainguard.dev/unchained/reproducing-chainguards-reproducible-image-builds))

### `-dev` Variants

As mentioned previously, Chainguard’s distroless Images have no shell or package manager by default. This is great for security, but sometimes you need these things, especially in builder images. For those cases, most (but not all) Chainguard Images come paired with a `-dev` variant which does include a shell and package manager.

Although the `-dev` image variants have similar security features as their distroless versions, such as complete SBOMs and signatures, they feature additional software that is typically not necessary in production environments. The general recommendation is to use the `-dev` variants only to build the application and then copy all application artifacts into a distroless image, which will result in a final container image that has a minimal attack surface and won’t allow package installations or logins.

That being said, it’s worth noting that `-dev` variants of Chainguard Images are completely fine to run in production environments. After all, the `-dev` variants are still **more secure** than many popular container images based on fully-featured operating systems such as Debian and Ubuntu since they carry less software, follow a more frequent patch cadence, and offer attestations for what they include.

## Learn More

To better understand how to work with Chainguard Images, we encourage you to visit [Chainguard Academy](https://edu.chainguard.dev/), our documentation and education platform.