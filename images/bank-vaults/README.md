<!--monopod:start-->
# bank-vaults
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/bank-vaults` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/bank-vaults/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimal Image for [Bank Vaults](https://bank-vaults.dev/), a CLI tool to init, unseal and configure Vault 
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/bank-vaults:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

This image is a drop-in replacement for the upstream image.
You can run it using the helm chart with:

```shell
$ helm repo add bank-vaults oci://ghcr.io/bank-vaults/helm-charts/vault-operator
$ helm install bank-vaults bank-vaults/bank-vaults \
    --set bankVaults.image.repository=cgr.dev/chainguard/bank-vaults \
    --set bankVaults.image.tag=latest
    <other configuration parameters here>
```
<!--body:end-->
