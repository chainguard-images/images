<!--monopod:start-->
# tekton
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/tekton` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/tekton/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
[Tekton](https://tekton.dev) provides a cloud-native Pipeline resource, mainly intended for CI/CD use cases.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/tekton:latest
```
<!--getting:end-->

<!--body:start-->
[Tekton](https://tekton.dev) provides a cloud-native Pipeline resource, mainly intended for CI/CD use cases.

[Tekton Chains](https://tekton.dev/docs/chains/) provides additional supply chain security features.

The [Tekton CLI](https://tekton.dev/docs/cli/) is a command-line interface for Tekton.

## Usage

These images a drop-in replacement for the upstream images.

You can use an [upstream release](https://github.com/tektoncd/pipeline/releases) and replace the released images with those from Chainguard.

```shell
curl -sL https://storage.googleapis.com/tekton-releases/pipeline/latest/release.yaml | \
    sed "s|gcr.io/tekton-releases/github.com/tektoncd/pipeline/cmd/controller[a-z0-9:@.]\{1,\}|cgr.dev/chainguard/tekton-controller|g" | \
    sed "s|gcr.io/tekton-releases/github.com/tektoncd/pipeline/cmd/entrypoint[a-z0-9:@.]\{1,\}|cgr.dev/chainguard/tekton-entrypoint|g" | \
    sed "s|gcr.io/tekton-releases/github.com/tektoncd/pipeline/cmd/events[a-z0-9:@.]\{1,\}|cgr.dev/chainguard/tekton-events|g" | \
    sed "s|gcr.io/tekton-releases/github.com/tektoncd/pipeline/cmd/nop[a-z0-9:@.]\{1,\}|cgr.dev/chainguard/tekton-nop|g" | \
    sed "s|gcr.io/tekton-releases/github.com/tektoncd/pipeline/cmd/resolvers[a-z0-9:@.]\{1,\}|cgr.dev/chainguard/tekton-resolvers|g" | \
    sed "s|gcr.io/tekton-releases/github.com/tektoncd/pipeline/cmd/sidecarlogresults[a-z0-9:@.]\{1,\}|cgr.dev/chainguard/tekton-sidecarlogresults|g" | \
    sed "s|gcr.io/tekton-releases/github.com/tektoncd/pipeline/cmd/webhook[a-z0-9:@.]\{1,\}|cgr.dev/chainguard/tekton-webhook|g" | \
    sed "s|gcr.io/tekton-releases/github.com/tektoncd/pipeline/cmd/workingdirinit[a-z0-9:@.]\{1,\}|cgr.dev/chainguard/tekton-workingdirinit|g" | \
    kubectl apply -f -
```

For Tekton Chains:

```shell
curl -sL https://storage.googleapis.com/tekton-releases/chains/latest/release.yaml | \
    sed "s|gcr.io/tekton-releases/github.com/tektoncd/chains/cmd/controller[a-z0-9:@.]\{1,\}|cgr.dev/chainguard/tekton-chains|g" | \
    kubectl apply -f -
```

For Tekton CLI:

```
docker run cgr.dev/chainguard/tekton-cli version
```
<!--body:end-->
