# node

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/node/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/node/actions/workflows/release.yaml)

WORK IN PROGRESS

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/node:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:b9e089aef6e64b0ef8d10413133673ab1a5f32e4af58e38d304e789c9e80815a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:b9e089aef6e64b0ef8d10413133673ab1a5f32e4af58e38d304e789c9e80815a) | `amd64` |


## Usage

Minimal container image for running NodeJS apps

The image specifies a default non-root `node` user (UID 65532), and a working directory at `/app`, owned by that `node` user, and accessible to all users.

It specifies `NODE_PORT=3000` by default.

### Example

Navigate to the `example/` directory:

```
cd example/
```

The Dockerfile is based on Docker's [Build your Node image](https://docs.docker.com/language/nodejs/build-images/) tutorial, but uses the Chainguard node base image instead.

Build the application on the node base image.

```
docker build \
  --tag node-docker \
  --platform=linux/amd64 \
  .
```

Then you can run the image:

```
docker run \
  --rm -it \
  -p 8000:8000 \
  --platform=linux/amd64 \
  node-docker
```

...and test to see that it works:

```
curl --request POST \
  --url http://localhost:8000/test \
  --header 'content-type: application/json' \
  --data '{"msg": "testing" }'
```


## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/node:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/node:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/node"
      },
      "image": {
        "docker-manifest-digest": "sha256:b9e089aef6e64b0ef8d10413133673ab1a5f32e4af58e38d304e789c9e80815a"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "e085ecee802b39e756866e8c22d415bbe13978d6",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/node",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIC5RwslpmjY1jKhKiiJdp8KoKhQmu1aEB3uLpJ8S3nK1AiBJu8lgxjAqZH+wbcLC3cxzv9A0ecL0gTJZ27gc1typSg==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI3NzJlOWUwM2FmYmU1MzljOGJhOWIzOTU0NGM1YTk1MzliODNiMDRkM2M2YzJiNmE4MTA5ZDI1NWVjMmMyYzcxIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNkMWY5WjllRmdTUkpuTUZBdzFIeXlwRnF4SFpZZG1NYldyR2lqRVhNNFFBSWhBTlNOUFVZbkpHVTltYmZuMXRETy9CVmJxR25odUhvcWVnSk9HQXh2aG1rWCIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndla05EUVhreVowRjNTVUpCWjBsVlpFeDFVV2N5ZG1Sb2MxRndjMnMxUTFacU1GcG1OMFpQY0RZNGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlRCTlJFRXhUMFJKTUZkb1kwNU5ha2w0VFZSRk1FMUVSWGRQUkVrd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVV5YlZGaGMwbFdiV051TDNVeFkwTkpNWGcxVDFOR1NVdzNhMHB1VEdaVlZ5OUxVVGtLZFdOaGRqRjNOamRLZW5ORlJIbElibWRWU21wcWIwbHVTV3BpT1doWU4yRnBORmwxTVdOMGJXWnhNak5aTUVOeE56WlBRMEZyZDNkblowcEpUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZHWWxwMENrVXZMM0JGVjNST2VVVmtiMnQ2V2k4MVIwUjNWbUp2ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwbldVUldVakJTUVZGSUwwSkdkM2RYYjFwWllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TlhaYVIxVjJURzFrY0dSSGFERlphVGt6WWpOS2NscHRlSFprTTAxMlkyMVdjMXBYUm5wYVV6VTFXVmN4YzFGSVNteGFiazEyQ21GSFZtaGFTRTEyWWxkR2NHSnFRVFZDWjI5eVFtZEZSVUZaVHk5TlFVVkNRa04wYjJSSVVuZGplbTkyVEROU2RtRXlWblZNYlVacVpFZHNkbUp1VFhVS1dqSnNNR0ZJVm1sa1dFNXNZMjFPZG1KdVVteGlibEYxV1RJNWRFMUNXVWREYVhOSFFWRlJRbWMzT0hkQlVVbEZRMGhPYW1GSFZtdGtWM2hzVFVSWlJ3cERhWE5IUVZGUlFtYzNPSGRCVVUxRlMwZFZkMDlFVm14Wk1sWnNUMFJCZVZscVRUVmFWR014VG1wbk1rNXRWVFJaZWtsNVdrUlJlRTVYU21sYVZFVjZDazlVWXpSYVJGbDNTRUZaUzB0M1dVSkNRVWRFZG5wQlFrSkJVVTlSTTBwc1dWaFNiRWxHU214aVIxWm9ZekpWZDBwQldVdExkMWxDUWtGSFJIWjZRVUlLUWxGUlYxa3lhR2hoVnpWdVpGZEdlVnBETVhCaVYwWnVXbGhOZG1KdE9XdGFWRUZrUW1kdmNrSm5SVVZCV1U4dlRVRkZSMEpCT1hsYVYxcDZUREpvYkFwWlYxSjZUREl4YUdGWE5IZG5XVzlIUTJselIwRlJVVUl4Ym10RFFrRkpSV1pCVWpaQlNHZEJaR2RFWkZCVVFuRjRjMk5TVFcxTldraG9lVnBhZW1ORENtOXJjR1YxVGpRNGNtWXJTR2x1UzBGTWVXNTFhbWRCUVVGWlVucHdVVVZxUVVGQlJVRjNRa2hOUlZWRFNVUTVTR1JrVmtoU05IUXphMlpXVkhCelEzb0tTRmx4ZFZFd05tSXhUVFpQZDA1NGNqWmxOakJyTDJwV1FXbEZRWEJzWlV3NGNuRkNjSGR3WjNoMVNrNTBZMFJ4VW1KU00wdGhTMEozVTFWS2JsZEhhQXAyYURKU1JWTk5kME5uV1VsTGIxcEplbW93UlVGM1RVUmhRVUYzV2xGSmVFRk9OMlpoYmpGMlJHUnFiVzF3VUZkdU1rWnVORTluUzNwS1NWSjRMM2xqQ25kc2QycG1OVTkzVVVwdlJXTjBObmd3WkVnMFdFVlJXbUZvYzBNeE1rWXZaMEZKZDBoTWFscFVTbWxFWmtsa1RXUlJWbmxaWVdaQmNsRklabE01Tm5VS1dGQmFOVnBCZVhkWlVYRnpkemRxU0dKcGVHRTBTVVUzT1ZWaFNFSTJiMWRpYW1OeENpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1668387507,
          "logIndex": 7021918,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/node/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/node",
      "githubWorkflowSha": "e085ecee802b39e756866e8c22d415bbe13978d6",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3457710442",
      "sha": "e085ecee802b39e756866e8c22d415bbe13978d6"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

