<!--monopod:start-->
# docker-credential-acr-env
| | |
| - | - |
| **Status** | stable |
| **OCI Reference** | `cgr.dev/chainguard/docker-credential-acr-env` |
| **Variants/Tags** | ![](https://storage.googleapis.com/chainguard-images-build-outputs/summary/docker-credential-acr-env.svg) |

*[Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

The ACR docker credential helper is an alternative to the existing file store based ACR helper located here which relies on az command line and is not optimised for use in CI environments. Primary use case for this helper is for use with kaniko and other tools running in CI scenarios wishing to push to Azure Container Registry.

To get more detail, please refer to the GitHub page of the project, [here](https://github.com/chrismellard/docker-credential-acr-env).

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/docker-credential-acr-env:latest
```

# Usage

The credential helper sources its configuration from well-known Azure environmental information. It attempts to authenticate firstly via client credentials grant if the following environment config is present

AZURE_CLIENT_ID=<clientID>
AZURE_CLIENT_SECRET=<clientSecret>
AZURE_TENANT_ID=<tenantId>

```shell
docker run --rm cgr.dev/chainguard/docker-credential-acr-env:latest
  -e AZURE_CLIENT_ID=$AZURE_CLIENT_ID \
  -e AZURE_CLIENT_SECRET=$AZURE_CLIENT_SECRET \
  -e AZURE_TENANT_ID=$AZURE_TENANT_ID \
  get
```