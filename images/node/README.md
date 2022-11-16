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
| `latest` | `sha256:455b2f16e5330ce6a6a0a2d646642ad4296b7f8cc3421c0b8616592396b637f9`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:455b2f16e5330ce6a6a0a2d646642ad4296b7f8cc3421c0b8616592396b637f9) | `amd64` |


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
        "docker-manifest-digest": "sha256:455b2f16e5330ce6a6a0a2d646642ad4296b7f8cc3421c0b8616592396b637f9"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "fac9df54df85f4a28d65ff096bc91a008a7b41fe",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/node",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCICOC1N91Y6efbYaAX2J5XvuQ7rcI9OFXr/yOY3C3DhPWAiEA3/u4pUSlnn4FSCnVOgYzEc7d7vNTktAXLjSx+9poxFY=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJlYmU4ODBmY2YzNDM0M2YyMjAzNGI3YTYzNGM1OTc5NDk0MjAxNWJhMDMwZDZhYTQ3OWUwY2YyMGQyZDY0YjM4In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNMR3RKUnI2cU1INkpGbEgvd3BkV2N0eVhIS3VuS3JRZ0pPell1THRxaDVRSWdaUEUvVkFpeUVzMHdUUkNqdWcyakY5T3NUTmE5WXlVa0pHdEY2cXFGQWM0PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhSRU5EUVhreVowRjNTVUpCWjBsVlEyRjFhM051YW5OTFUwMVRUM2hhZDNCQ1dEWTJWbTlxUVROTmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlRKTlJFVjNUVVJGZDFkb1kwNU5ha2w0VFZSRk1rMUVSWGhOUkVWM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ3VW5kNE5uWmxkbWRqUkVwWFZEZERVa2MyVDJKRWRYY3lRVkp0Tnpsa2NXVlVNREFLWVROdWJraE9ibE5HWWsxemF6RkhWVmh6WTNSSWVqazNVMkZhUkVGdlpETlFjSGxJYW5CWVdrUlpSRUZpVkUxMFVIRlBRMEZyZDNkblowcEpUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZwYlcxaUNrWnJOM0ZvUzI1dFFUbEVabkZFYlZObFJuZHljRTFqZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwbldVUldVakJTUVZGSUwwSkdkM2RYYjFwWllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TlhaYVIxVjJURzFrY0dSSGFERlphVGt6WWpOS2NscHRlSFprTTAxMlkyMVdjMXBYUm5wYVV6VTFXVmN4YzFGSVNteGFiazEyQ21GSFZtaGFTRTEyWWxkR2NHSnFRVFZDWjI5eVFtZEZSVUZaVHk5TlFVVkNRa04wYjJSSVVuZGplbTkyVEROU2RtRXlWblZNYlVacVpFZHNkbUp1VFhVS1dqSnNNR0ZJVm1sa1dFNXNZMjFPZG1KdVVteGlibEYxV1RJNWRFMUNXVWREYVhOSFFWRlJRbWMzT0hkQlVVbEZRMGhPYW1GSFZtdGtWM2hzVFVSWlJ3cERhWE5IUVZGUlFtYzNPSGRCVVUxRlMwZGFhRmw2Ykd0YWFsVXdXa2RaTkU1WFdUQlpWRWswV2tSWk1WcHRXWGRQVkZwcFdYcHJlRmxVUVhkUFIwVXpDbGxxVVhoYWJWVjNTRUZaUzB0M1dVSkNRVWRFZG5wQlFrSkJVVTlSTTBwc1dWaFNiRWxHU214aVIxWm9ZekpWZDBwQldVdExkMWxDUWtGSFJIWjZRVUlLUWxGUlYxa3lhR2hoVnpWdVpGZEdlVnBETVhCaVYwWnVXbGhOZG1KdE9XdGFWRUZrUW1kdmNrSm5SVVZCV1U4dlRVRkZSMEpCT1hsYVYxcDZUREpvYkFwWlYxSjZUREl4YUdGWE5IZG5XVzlIUTJselIwRlJVVUl4Ym10RFFrRkpSV1pCVWpaQlNHZEJaR2RFWkZCVVFuRjRjMk5TVFcxTldraG9lVnBhZW1ORENtOXJjR1YxVGpRNGNtWXJTR2x1UzBGTWVXNTFhbWRCUVVGWlVqazRNV2cyUVVGQlJVRjNRa2hOUlZWRFNWRkVXV3BxZEZCWFlYQkJTVGhYU2xkRFIzY0tXRUp4UVhoR1lqRndOV3BCY0RWMU1UZDJSWFZxUlhaRFQyZEpaMlo2YUZoVldFeDRaalkwTUROVlRVOTBVWFowTVhONVJVdFlPRGwzTjJKNlpGaHpNQXBCVTA5VWRHRkpkME5uV1VsTGIxcEplbW93UlVGM1RVUmhVVUYzV21kSmVFRktXa3Q2U1VkU1pUbGtNRUoyZDBabk5IcE1iR1YxTW5SSFVGb3dURXczQ25SMVdsaDNRMjlYV0c0MlpFOVdSRkZKTldKbFdGTjBaSFp4VjJOUWQweEpTRUZKZUVGT2RtOUplVWxRUlU1VFRtVk5ibUpyYW1NNVVpdFRaVFF4YzBjS1IxUnBWSFZvVTFBMlVEWkVkRXAxY1VGYU4yNXljelpMUnpSa1l6bFpOMVZTWlVOdFVXYzlQUW90TFMwdExVVk9SQ0JEUlZKVVNVWkpRMEZVUlMwdExTMHRDZz09In19fX0=",
          "integratedTime": 1668560414,
          "logIndex": 7168361,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/node/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/node",
      "githubWorkflowSha": "fac9df54df85f4a28d65ff096bc91a008a7b41fe",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3475459684",
      "sha": "fac9df54df85f4a28d65ff096bc91a008a7b41fe"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

