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
| `latest` | `sha256:0673ad7f69b2c4beec13c185df67dffdca2477637a367a02d91b2ae10d9c817a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:0673ad7f69b2c4beec13c185df67dffdca2477637a367a02d91b2ae10d9c817a) | `amd64` |


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
        "docker-manifest-digest": "sha256:0673ad7f69b2c4beec13c185df67dffdca2477637a367a02d91b2ae10d9c817a"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "5facff1991c41a4c0479686bb8176d4ea87dadc4",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/node",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDJgZLZJefPzjVDlFa7iHR/4cUe1G1pxomiiD9dzWXhuQIgJZkfNHKy1ZyWK6lrMEBT2n08NS8rJfeYx+AB5nFaUuQ=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI0ZDUzNGY3Nzk4OTg5ODBmYzk5NTM2Y2YxN2E2YWMwOTYzNDMyYzJhNjUyMWFhODFiZTM0YzE5MTVmNTJkMTk3In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQjZuU094THpMU1RUWENMZWtxbnhsZEh6QjYzT1RYUGpnaGU1bll4K01lZUFpQTBORzhFd2ZaNmxvMzdhUTJkRFp4Vi9adWZYYk0vdnVvSnBGdWIzaGttK2c9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhSRU5EUVhreVowRjNTVUpCWjBsVlFrMU1XamRoUm05dWNtSk9Uak5oVURGWE9ERlBVMkphY25OVmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRCTlJFVjNUbFJWZUZkb1kwNU5ha2w0VFZSQk1FMUVSWGhPVkZWNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZMVDFkWmRITllaVUpDTjNSREwzUlphV3BzV25aMFZHUlFOaTlCYW1aMWJXaG5RbVFLUld4MVpVSkJaM0ZIWXpsbE5UbGlPWGRHUlN0TmNuRktkWEZ1WW1weVlqTlhNRzQ0ZGsxc05WVk9VMnRxVEdwelVYRlBRMEZyZDNkblowcEpUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZZTmpGa0NpczNWRGRqTTBOc1RYcHRZbVJhVWtZNGVsQkhSVzVGZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwbldVUldVakJTUVZGSUwwSkdkM2RYYjFwWllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TlhaYVIxVjJURzFrY0dSSGFERlphVGt6WWpOS2NscHRlSFprTTAxMlkyMVdjMXBYUm5wYVV6VTFXVmN4YzFGSVNteGFiazEyQ21GSFZtaGFTRTEyWWxkR2NHSnFRVFZDWjI5eVFtZEZSVUZaVHk5TlFVVkNRa04wYjJSSVVuZGplbTkyVEROU2RtRXlWblZNYlVacVpFZHNkbUp1VFhVS1dqSnNNR0ZJVm1sa1dFNXNZMjFPZG1KdVVteGlibEYxV1RJNWRFMUNXVWREYVhOSFFWRlJRbWMzT0hkQlVVbEZRMGhPYW1GSFZtdGtWM2hzVFVSWlJ3cERhWE5IUVZGUlFtYzNPSGRCVVUxRlMwUldiVmxYVG0xYWFrVTFUMVJHYWs1RVJtaE9SMDEzVGtSak5VNXFaekpaYlVrMFRWUmpNbHBFVW14WlZHY3pDbHBIUm10WmVsRjNTRUZaUzB0M1dVSkNRVWRFZG5wQlFrSkJVVTlSTTBwc1dWaFNiRWxHU214aVIxWm9ZekpWZDBwQldVdExkMWxDUWtGSFJIWjZRVUlLUWxGUlYxa3lhR2hoVnpWdVpGZEdlVnBETVhCaVYwWnVXbGhOZG1KdE9XdGFWRUZrUW1kdmNrSm5SVVZCV1U4dlRVRkZSMEpCT1hsYVYxcDZUREpvYkFwWlYxSjZUREl4YUdGWE5IZG5XVzlIUTJselIwRlJVVUl4Ym10RFFrRkpSV1pCVWpaQlNHZEJaR2RFWkZCVVFuRjRjMk5TVFcxTldraG9lVnBhZW1ORENtOXJjR1YxVGpRNGNtWXJTR2x1UzBGTWVXNTFhbWRCUVVGWlVrRk1SSGx1UVVGQlJVRjNRa2hOUlZWRFNWRkRVR3RaU1V0MlEyY3ZZVmRaWVZGWFUwUUtMMmhVYW1sbFNqY3ZZMmxYTVdaYU4xZ3hLelpQY2xJcmIyZEpaMUJHZDJRdmJWRjJTM2hQVDNsak56WlJjVk4yYzJ4dVkxVkdUWGt3UlZSMFMxSjBWd3AyTTBwVU1uSm5kME5uV1VsTGIxcEplbW93UlVGM1RVUmhVVUYzV21kSmVFRk1Velo1VVc1bFNHWm5jR2w0U0RkeE1VWTJPSFpvUkU5eWVFcE5ka042Q21WRWFsaGpjRGQwUzNaNmFGbDVPRnBpYTJ0TFlsZG5abTlXUkhNMlVtZzBVVkZKZUVGTVprcFJRMk5CY1RCeFMzRkZRVTlSZFZGcWRrTnNiek1yTDNnS2FXeFpRM0JqV0RaelkwNWljazB3Y0hOT1YyaDRLMmhrYkUxQ2ExSnRORFUxUlZSS01YYzlQUW90TFMwdExVVk9SQ0JEUlZKVVNVWkpRMEZVUlMwdExTMHRDZz09In19fX0=",
          "integratedTime": 1667523957,
          "logIndex": 6458540,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/node/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/node",
      "githubWorkflowSha": "5facff1991c41a4c0479686bb8176d4ea87dadc4",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3390469246",
      "sha": "5facff1991c41a4c0479686bb8176d4ea87dadc4"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

