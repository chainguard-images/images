# distroless.dev/php

This repository contains the source files for the PHP distroless image `distroless.dev/php`. This is a minimal PHP image based on Alpine, using PHP apks available on the Alpine Community repositories (not built from source as of now).

## PHP Version

While this image is being developed, we'll stick to the latest stable PHP version which at this moment is `8.1`. Supported versions in the long term are TBD.

## Usage

To try out the image, run:

```shell
docker run -iv --rm distroless.dev/php --version
```


```
PHP 8.1.8 (cli) (built: Jul  8 2022 13:20:32) (NTS)
Copyright (c) The PHP Group
Zend Engine v4.1.8, Copyright (c) Zend Technologies
```


## Signing

All distroless images are signed using [Sigstore](https://sigstore.dev)!
To verify an image, download [cosign](https://github.com/sigstore/cosign) and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify distroless.dev/php | jq

Verification for distroless.dev/nginx:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/distroless/nginx"
      },
      "image": {
        "docker-manifest-digest": "sha256:3b28db71687f52741598f4f68d2e4bea8ee86db57d7394337118316d1f4c8b9f"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/nginx/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "2626578822"
      ...
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.

