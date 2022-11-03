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
| `latest` | `sha256:2fe1cb1b5fe6da054d17ac6edf98d638ac210de196628c89dc00b53f4b239086`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:2fe1cb1b5fe6da054d17ac6edf98d638ac210de196628c89dc00b53f4b239086) | `amd64` |


## Usage

Minimal container image for running NodeJS apps

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
        "docker-manifest-digest": "sha256:2fe1cb1b5fe6da054d17ac6edf98d638ac210de196628c89dc00b53f4b239086"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "fb3c8def54777027d0d3ed57213778e91b85baaa",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/node",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCfvHnn3ChBFMOjGEEE91Z38zhpKz8fKJimENa97KaRkgIhAMkbeddgzPu8n9NqCZJ90CEqdsuaHIz6Jq9JRh/oQT3a",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIwMDU0ZWYzOTE4NWNmNDRmZTQ0NDIzOGMzOGU1N2Q1NzY2NDJiN2ZlNjBiN2IwMDUzMzA3ZDg0ODhmMWEyNDRmIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJREFaUERIbFFHcGtla0lnNWhPMmFVcUpIeThIZDdGNUJ2N3B0SVdYVEp1akFpRUFvelpZWTJnMXVSODM0eURpNnBkaHpDWUhFWXJybHF4bURwQUFsY1NNNktnPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndla05EUVhreVowRjNTVUpCWjBsVlZqbE9jMXBITjNaYU1YUnhja05IVWpSa2FXMWhOR2R0WTJVNGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVhwTlJFVjNUa1JCZWxkb1kwNU5ha2w0VFZSQmVrMUVSWGhPUkVGNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZTTVhoT1ptVnRSSFpGVW10b1l6TXpXV2hEVVZVeE5GZEdaSGxRYVhaVldsZ3JSV0VLVmpKT04ybzBUR3hFYWpWMlREQkdZblk1YlZkQ04wTlVNVWxJWWxkelkzcFdNbGRpTnpoWGREZHZURXhrZGtnNVV6WlBRMEZyZDNkblowcEpUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZyVUhvNENuRjJOamN6WkhnMlVucFpOVzVWUjJSdGMzbE9LMWhGZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwbldVUldVakJTUVZGSUwwSkdkM2RYYjFwWllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TlhaYVIxVjJURzFrY0dSSGFERlphVGt6WWpOS2NscHRlSFprTTAxMlkyMVdjMXBYUm5wYVV6VTFXVmN4YzFGSVNteGFiazEyQ21GSFZtaGFTRTEyWWxkR2NHSnFRVFZDWjI5eVFtZEZSVUZaVHk5TlFVVkNRa04wYjJSSVVuZGplbTkyVEROU2RtRXlWblZNYlVacVpFZHNkbUp1VFhVS1dqSnNNR0ZJVm1sa1dFNXNZMjFPZG1KdVVteGlibEYxV1RJNWRFMUNXVWREYVhOSFFWRlJRbWMzT0hkQlVVbEZRMGhPYW1GSFZtdGtWM2hzVFVSWlJ3cERhWE5IUVZGUlFtYzNPSGRCVVUxRlMwZGFhVTB5VFRSYVIxWnRUbFJSTTA1NlkzZE5hbVJyVFVkUmVscFhVVEZPZWtsNFRYcGpNMDlIVlRWTlYwazBDazVYU21oWlYwVjNTRUZaUzB0M1dVSkNRVWRFZG5wQlFrSkJVVTlSTTBwc1dWaFNiRWxHU214aVIxWm9ZekpWZDBwQldVdExkMWxDUWtGSFJIWjZRVUlLUWxGUlYxa3lhR2hoVnpWdVpGZEdlVnBETVhCaVYwWnVXbGhOZG1KdE9XdGFWRUZrUW1kdmNrSm5SVVZCV1U4dlRVRkZSMEpCT1hsYVYxcDZUREpvYkFwWlYxSjZUREl4YUdGWE5IZG5XVzlIUTJselIwRlJVVUl4Ym10RFFrRkpSV1pCVWpaQlNHZEJaR2RFWkZCVVFuRjRjMk5TVFcxTldraG9lVnBhZW1ORENtOXJjR1YxVGpRNGNtWXJTR2x1UzBGTWVXNTFhbWRCUVVGWlVUZENSR2RQUVVGQlJVRjNRa2hOUlZWRFNVaENWVTh4Y1ZKa2FXZHpaMWxSTkd4Q1Fqa0tWazFEYVdvMkwyMU9SM2cxWlZOVVprbHFSa3d3YmxCR1FXbEZRVGRPWTBVcmFuaG9TV1F3S3psWVpYTlRWVE5KZEVWUFRFUllaVU54Ymt4U2FTdGlSZ3BVT0RrelNXZDNkME5uV1VsTGIxcEplbW93UlVGM1RVUmhRVUYzV2xGSmQwOVBVRXRTTTA1cFJtZHNjbkUzVWtkek1tWlVRakJvUkV4UVpIUXhOMFp2Q210cUswRnlTakJ6S3poNFNXMXVWbVpqWVc1QmQyeExRV00zY1UxVFl6QklRV3BGUVRWUFV6UjZPRVkyYWtOdGNubE9UbUY2Y200M09GVjRTVVJYWWtNS05ETndWVEJ6V1ZJdldHbGtaak5vVTFsMk1sSjZka3czZGs5U1NucHNSalZ3U0U1ckNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1667437448,
          "logIndex": 6392712,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/node/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/node",
      "githubWorkflowSha": "fb3c8def54777027d0d3ed57213778e91b85baaa",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3382264487",
      "sha": "fb3c8def54777027d0d3ed57213778e91b85baaa"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

