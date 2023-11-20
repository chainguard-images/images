<!--monopod:start-->
# sigstore-policy-controller

<!--url:start-->
<a href="https://sigstore.dev">
<!--logo:start-->
  <img src="https://storage.googleapis.com/chainguard-academy/logos/sigstore-policy-controller/logo.svg" width="36px" height="36px" />
<!--logo:end-->
</a>
<!--url:end-->

| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/sigstore-policy-controller` |

* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/sigstore-policy-controller/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*
---
<!--monopod:end-->

<!--overview:start-->
Policy Controller image that is part of the Sigstore stack
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/sigstore-policy-controller:latest
```
<!--getting:end-->

<!--body:start-->
# Minimal `sigstore/policy-controller` image

This image can be used with the upstream helm chart with the following
overrides:

```bash
IMAGE=cgr.dev/chainguard/sigstore-policy-controller

helm repo add sigstore https://sigstore.github.io/helm-charts

helm install policy-controller sigstore/policy-controller \
	--namespace policy-controller \
	--create-namespace \
	--set webhook.image.repository="${IMAGE}" \
	--set webhook.image.version="$(crane digest ${IMAGE})"
```
<!--body:end-->
