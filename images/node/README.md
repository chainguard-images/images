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
| `latest` | `sha256:92cc4daa6238a25e0a41721648e612369ca9a637f9aae0c0716aeaab0b2039de`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:92cc4daa6238a25e0a41721648e612369ca9a637f9aae0c0716aeaab0b2039de) | `amd64` |


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
        "docker-manifest-digest": "sha256:92cc4daa6238a25e0a41721648e612369ca9a637f9aae0c0716aeaab0b2039de"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "306f84a31b419188b5a332701c70dd6c58c4fbf5",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/node",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDvIBwI/u/MUAi02ziCUUHmTOprAIXmbxVMKYUicGC51QIgeAkjFsOfmV8P6OxPlN28PEv/GaKnYAESfWzDrAeKCUk=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJhZmQ2YTNhM2RjOTcwZTNiMDIzYmY1MGU0OWZhMDA1YjY3MjBlMTNmNmUyZjQzYjA3ZTU1ZWJkNzdlM2U1NzExIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQXY3bjJYYXBRczJuNnFNSnpKNjAvS2pJRzJFVG5WNUZTNlZFNkw5ZDNJekFpRUF1UWdETndGNEdpUmRjcWx4SVp0VldyRlZwaVVUMXprdC9IWFVraUdNZ3pzPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndha05EUVhreVowRjNTVUpCWjBsVlUwMVpNVmxzZDNORUwzUjFZa0p2Tlhac2VWbzRaMVJXVWtSVmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVROTlJFVjNUVVJGTWxkb1kwNU5ha2w0VFZSQk0wMUVSWGhOUkVVeVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ5U214aGMwOWFWMEpNV2sxdGFrcFRiR0pNVDFSQmN6QkNPV0VyUjNOWlRYUjFZbVFLYVdVcllXWndhRkI1WnpCQ1FUVlNWMnN5V1ZjeFYwUTRWRTV4UmpkRk9VcDVURTh6TmxwbmVraFllR3h2T0VkTlZXRlBRMEZyZDNkblowcEpUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlY1WW5jckNrRnVaa001TW1ob1p6SkhMemhDWmxJM2VtaHNlRFpWZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwbldVUldVakJTUVZGSUwwSkdkM2RYYjFwWllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TlhaYVIxVjJURzFrY0dSSGFERlphVGt6WWpOS2NscHRlSFprTTAxMlkyMVdjMXBYUm5wYVV6VTFXVmN4YzFGSVNteGFiazEyQ21GSFZtaGFTRTEyWWxkR2NHSnFRVFZDWjI5eVFtZEZSVUZaVHk5TlFVVkNRa04wYjJSSVVuZGplbTkyVEROU2RtRXlWblZNYlVacVpFZHNkbUp1VFhVS1dqSnNNR0ZJVm1sa1dFNXNZMjFPZG1KdVVteGlibEYxV1RJNWRFMUNXVWREYVhOSFFWRlJRbWMzT0hkQlVVbEZRMGhPYW1GSFZtdGtWM2hzVFVSWlJ3cERhWE5IUVZGUlFtYzNPSGRCVVUxRlMwUk5kMDV0V1RST1IwVjZUVmRKTUUxVWEzaFBSR2hwVGxkRmVrMTZTVE5OUkVacVRucENhMXBFV21wT1ZHaHFDazVIV21sYWFsVjNTRUZaUzB0M1dVSkNRVWRFZG5wQlFrSkJVVTlSTTBwc1dWaFNiRWxHU214aVIxWm9ZekpWZDBwQldVdExkMWxDUWtGSFJIWjZRVUlLUWxGUlYxa3lhR2hoVnpWdVpGZEdlVnBETVhCaVYwWnVXbGhOZG1KdE9XdGFWRUZrUW1kdmNrSm5SVVZCV1U4dlRVRkZSMEpCT1hsYVYxcDZUREpvYkFwWlYxSjZUREl4YUdGWE5IZG5XVzlIUTJselIwRlJVVUl4Ym10RFFrRkpSV1pCVWpaQlNHZEJaR2RFWkZCVVFuRjRjMk5TVFcxTldraG9lVnBhZW1ORENtOXJjR1YxVGpRNGNtWXJTR2x1UzBGTWVXNTFhbWRCUVVGWlVsQnRha1Z1UVVGQlJVRjNRa2hOUlZWRFNVZGlTakpJYW1kd0syNVRVamN3VURoTWJTOEtOa0pIVlZWaGJFZHVNVmxUVDJKdWFUaDVablYyYm1wNlFXbEZRVGRwYzIxNVdGbElSMGsxTHpKT2IwazRWM1YxV0dGSVIxaE9XRUZRYW5OelV6QjRMd3BpZGpSWmQwSjNkME5uV1VsTGIxcEplbW93UlVGM1RVUmFkMEYzV2tGSmQyWk9lRXhGY25WblNYVmtibmhQZGxkT2MzVmtVblY1VmpSYVIzRndjMUptQ2tSd2VYTndSbEpaWkdOdFFVWlZVV0ZYWkhCWGVFTmtTbTV4VEhaVE9UbHBRV3BCV1dWUWJ6TkVkV1l4TDB0SWQwTk1UVlJIUVU0MmJuY3JkbU5hWTJ3S1lUVjZObkowWm5nd2NreDNNRWt3YW1WbEwxb3ZTR3Q2WVVoSlprTklRbkJ4YldzOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1667782819,
          "logIndex": 6649824,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/node/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/node",
      "githubWorkflowSha": "306f84a31b419188b5a332701c70dd6c58c4fbf5",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3406780674",
      "sha": "306f84a31b419188b5a332701c70dd6c58c4fbf5"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

