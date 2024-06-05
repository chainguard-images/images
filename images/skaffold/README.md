<!--monopod:start-->
# skaffold
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/skaffold` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/skaffold/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimal container image for running skaffold apps
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/skaffold:latest
```
<!--getting:end-->

<!--compatibility:start-->
## Compatibility Notes

The image specifies a default non-root `skaffold` user (UID 65532), and a working directory at `/app`, owned by that `skaffold` user, and accessible to all users.
<!--compatibility:end-->

<!--body:start-->

This image includes `skaffold`, `helm`, `kubectl`, `kpt`, `kustomize`, and the `google-cloud-sdk.`

## Usage

This image should be a drop-in replacement for the upstream `skaffold-slim` image.
See the [full documentation](https://skaffold.dev/docs/install/#standalone-binary) for usage.


```
% docker run cgr.dev/chainguard/skaffold:latest
A tool that facilitates continuous development for Kubernetes applications.

  Find more information at: https://skaffold.dev/docs/getting-started/

End-to-end Pipelines:
  run               Run a pipeline
  dev               Run a pipeline in development mode
  debug             Run a pipeline in debug mode

Pipeline Building Blocks:
  build             Build the artifacts
  test              Run tests against your built application images
  deploy            Deploy pre-built artifacts
  delete            Delete any resources deployed by Skaffold
  render            Generate rendered Kubernetes manifests
  apply             Apply hydrated manifests to a cluster
  verify            Run verification tests against skaffold deployments

Getting Started With a New Project:
  init              Generate configuration for deploying an application

Other Commands:
  completion        Output shell completion for the given shell (bash, fish or zsh)
  config            Interact with the global Skaffold config file (defaults to `$HOME/.skaffold/config`)
  diagnose          Run a diagnostic on Skaffold
  fix               Update old configuration to a newer schema version
  schema            List JSON schemas used to validate skaffold.yaml configuration
  survey            Opens a web browser to fill out the Skaffold survey
  version           Print the version information

Usage:
  skaffold [flags] [options]

Use "skaffold <command> --help" for more information about a given command.
Use "skaffold options" for a list of global command-line options (applies to all commands).
```
<!--body:end-->
