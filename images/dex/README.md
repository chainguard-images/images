<!--monopod:start-->
# dex
| | |
| - | - |
| **Status** | experimental |
| **OCI Reference** | `cgr.dev/chainguard/dex` |
| **Variants/Tags** | ![](https://storage.googleapis.com/chainguard-images-build-outputs/summary/dex.svg) |

*[Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

[dex](https://dexidp.io) is a federated OpenID Connect provider.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/dex
```

## Using dex

`dex` has several operating, modes, the most common being kubernetes, installed via helm.

An example `values.yaml` file is provided below:

```yaml
image:
  repository: "${IMAGE_REGISTRY}/${IMAGE_REPOSITORY}"
  tag: "${IMAGE_TAG}"

config:
  issuer: "http://127.0.0.1:5556/dex"

  storage:
    type: memory

  web:
    http: 0.0.0.0:5556

  expiry:
    deviceRequests: "5m"
    signingKeys: "6h"
    idTokens: "24h"
    authRequests: "24h"

  logger:
    level: "info"
    format: "text"

  oauth2:
    responseTypes: [ "code" ]
    skipApprovalScreen: false
    alwaysShowLoginScreen: false

  enablePasswordDB: true

  connectors:
  - type: mockCallback
    id: mock
    name: Example
```

> WARNING: The example above should _not_ be used in production, it simply exists to get up and running quickly.

For an incomplete values file that only contains the minimum required settings to use the Chainguard Images variant, use the snipet below:

```yaml
# non functional defaults! fill in with your own values.yaml
image:
  repository: cgr.dev/chainguard/dev
  tag: latest
```
