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
| `latest` | `sha256:9b24ce4e3194e22872514769aa44bdaf42ef736bc6a581b7f3b65ad08167fa36`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:9b24ce4e3194e22872514769aa44bdaf42ef736bc6a581b7f3b65ad08167fa36) | `amd64` |


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
        "docker-manifest-digest": "sha256:9b24ce4e3194e22872514769aa44bdaf42ef736bc6a581b7f3b65ad08167fa36"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "44e9d70eda3a5abf04d0ece6daa5df2c21ae33c0",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/node",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIE8N4G98YySJVFMldG917/w3EhHHtLCjqfYmm0p31Dv6AiEA97XxYkMT8XrC66BPXvjrj5ASvjQQwv67w5V6j2rD3k8=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJjZTcxMTY4YzUwZDc2NGVhYzNjMzBkNzZkMDc2OTkwM2E4NzFlYmY0ZWNlY2Y5ZWMyMjFmNjRiNzI5YzZjNTc1In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUQxNEtnN3pCWnh3cVN4VTIzaEgzeUEvaXFSdlJ2UTRLdTRqOFRQUENlVHlnSWdFRmx2VW8zQ3psVmx1YUlKeDlGZk1jVm1tKzFTb2ZxR1c4T2pIVkN1SzVBPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndha05EUVhsNVowRjNTVUpCWjBsVlRqQk1lVWd6YW1KRGVubzRVak5aZERsT1QzUm1kVzE2Y21nd2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlRGTlJFRXhUMVJKZDFkb1kwNU5ha2w0VFZSRk1VMUVSWGRQVkVsM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZKVmpOSk0xVjFkSG8zYnpSYVN5dHRMMHBtTVhWbFdUSjFhbTlNU1hZMmFqazFjMjhLUVdSWWQxTjRUVGhSYW5wbGVIZGFlR1JOYW1reFNYWkxTVXRuUnpaMmFTdHFPRWhaTDFRMWRUbDNhV3BxZUVNNFZUWlBRMEZyYzNkblowcElUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZzZDBnM0NuaHZXRmRqUmt0cVkxQllOVTFWY0ZjM09YSjRVMGwzZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwbldVUldVakJTUVZGSUwwSkdkM2RYYjFwWllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TlhaYVIxVjJURzFrY0dSSGFERlphVGt6WWpOS2NscHRlSFprTTAxMlkyMVdjMXBYUm5wYVV6VTFXVmN4YzFGSVNteGFiazEyQ21GSFZtaGFTRTEyWWxkR2NHSnFRVFZDWjI5eVFtZEZSVUZaVHk5TlFVVkNRa04wYjJSSVVuZGplbTkyVEROU2RtRXlWblZNYlVacVpFZHNkbUp1VFhVS1dqSnNNR0ZJVm1sa1dFNXNZMjFPZG1KdVVteGlibEYxV1RJNWRFMUNXVWREYVhOSFFWRlJRbWMzT0hkQlVVbEZRMGhPYW1GSFZtdGtWM2hzVFVSWlJ3cERhWE5IUVZGUlFtYzNPSGRCVVUxRlMwUlJNRnBVYkd0T2VrSnNXa2RGZWxsVVZtaFpiVmwzVGtkUmQxcFhUbXhPYlZKb1dWUldhMXBxU21wTmFrWm9DbHBVVFhwWmVrRjNTRUZaUzB0M1dVSkNRVWRFZG5wQlFrSkJVVTlSTTBwc1dWaFNiRWxHU214aVIxWm9ZekpWZDBwQldVdExkMWxDUWtGSFJIWjZRVUlLUWxGUlYxa3lhR2hoVnpWdVpGZEdlVnBETVhCaVYwWnVXbGhOZG1KdE9XdGFWRUZrUW1kdmNrSm5SVVZCV1U4dlRVRkZSMEpCT1hsYVYxcDZUREpvYkFwWlYxSjZUREl4YUdGWE5IZG5XV3RIUTJselIwRlJVVUl4Ym10RFFrRkpSV1YzVWpWQlNHTkJaRkZFWkZCVVFuRjRjMk5TVFcxTldraG9lVnBhZW1ORENtOXJjR1YxVGpRNGNtWXJTR2x1UzBGTWVXNTFhbWRCUVVGWlVqUjZSR1JHUVVGQlJVRjNRa2ROUlZGRFNVZG5OWGhwU25SQ2VGaHRhR0o2YWl0aVZWWUtObFkyTlN0VFowcFhSVmxIYjFoUVJXeEhMME12UWs5SlFXbENLMVJKUTFJNWRsVmtlSFJtVXpGSmFFdDBhbk56VFVoeFZWcHJUM2cwV2tkUWRGUXhNZ28yU0V4UllVUkJTMEpuWjNGb2EycFBVRkZSUkVGM1RtOUJSRUpzUVdwRlFYQnFlRWxaWjJSbWVXeEdTR2xRWjJGcmRHTXllVUYxTjIxTU4wcFRSbEJLQ2xGSllVRlZXVmNyZVhkNVUxQk5TbmRDWmtjMmFFVkRiR00xUldSc1FuUlJRV3BCVTNoM2VrTkZSWE52ZUVwQ2NYQlZSVEpHYzBwMU5rWkxiU3RUTDFjS2EyMXVSV1pEUkZGcU5TdHFLM2gzYVM5eWJHdFRVMWN5ZUhaYVJXZExSbFY1WTBVOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1668473964,
          "logIndex": 7093193,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/node/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/node",
      "githubWorkflowSha": "44e9d70eda3a5abf04d0ece6daa5df2c21ae33c0",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3466493401",
      "sha": "44e9d70eda3a5abf04d0ece6daa5df2c21ae33c0"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

