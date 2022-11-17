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
| `latest` | `sha256:ca428856f32d0e372985a99ed0f950dce1d0b10eeedda08c8b4a3b82964125bb`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ca428856f32d0e372985a99ed0f950dce1d0b10eeedda08c8b4a3b82964125bb) | `amd64` |


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
        "docker-manifest-digest": "sha256:ca428856f32d0e372985a99ed0f950dce1d0b10eeedda08c8b4a3b82964125bb"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "d6a77cd90940804c2dc15b19aaf6ce100f6b2bbe",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/node",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIHNq1eGXrlfibZlwCQUtoiiKSvvjJ8ujJPxCLKvatM7UAiA5RAyjcmrSspU8dfYPTlD6CsK+s64x0Sxj59d/l+pCtQ==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIyZjcxMWU3ODk4MzIxMzVhMWE4OWEwY2NmMTc0MDJkNWQ0YWE5YWRiMzdhYzUzYTQ0YmE2NjA0MDU3MDg4Yzc3In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJRVRBVHNyWmI1TDdzUktUc3d6UkZVTjdnRmhWd0RvVXNvVUU3YVFDNkZ2OUFpRUE0L0k3U3BHSnhJTzMwcTAvZFgxNjdhVXJaUlZNZHdLaEg0LzhzbEcxdlNjPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhSRU5EUVhrMlowRjNTVUpCWjBsVlIwTlNiMGRPZERaVGMySjRkMHgyWkdVNVZFcDNUVmRrVWxKdmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlROTlJFRXhUMFJSTVZkb1kwNU5ha2w0VFZSRk0wMUVSWGRQUkZFeFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZNZW5wR2VUTllXVXRZV1VGSE1FeHhkVmxhVlhVdmVVdENReXRMYWtGTWREWTVRWFlLVGtkUmJHWnBhQ3RzWkZNMWJHcFJNbVZSTWxwa1QyYzRWblJTTlVwaE1HbFZjRVZPU1VwQlptWm5SMm94Y0daa01UWlBRMEZyTUhkblowcEtUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZUUVhoTENqVXhXR2hyVGtoNmJGaEJiblZJWmpNelR6RXJPVEZyZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwbldVUldVakJTUVZGSUwwSkdkM2RYYjFwWllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TlhaYVIxVjJURzFrY0dSSGFERlphVGt6WWpOS2NscHRlSFprTTAxMlkyMVdjMXBYUm5wYVV6VTFXVmN4YzFGSVNteGFiazEyQ21GSFZtaGFTRTEyWWxkR2NHSnFRVFZDWjI5eVFtZEZSVUZaVHk5TlFVVkNRa04wYjJSSVVuZGplbTkyVEROU2RtRXlWblZNYlVacVpFZHNkbUp1VFhVS1dqSnNNR0ZJVm1sa1dFNXNZMjFPZG1KdVVteGlibEYxV1RJNWRFMUNXVWREYVhOSFFWRlJRbWMzT0hkQlVVbEZRMGhPYW1GSFZtdGtWM2hzVFVSWlJ3cERhWE5IUVZGUlFtYzNPSGRCVVUxRlMwZFJNbGxVWXpOWk1sRTFUVVJyTUUxRVozZE9SMDE1V2tkTmVFNVhTWGhQVjBab1dtcGFhbHBVUlhkTlIxa3lDbGxxU21sWmJWVjNTRUZaUzB0M1dVSkNRVWRFZG5wQlFrSkJVVTlSTTBwc1dWaFNiRWxHU214aVIxWm9ZekpWZDBwQldVdExkMWxDUWtGSFJIWjZRVUlLUWxGUlYxa3lhR2hoVnpWdVpGZEdlVnBETVhCaVYwWnVXbGhOZG1KdE9XdGFWRUZrUW1kdmNrSm5SVVZCV1U4dlRVRkZSMEpCT1hsYVYxcDZUREpvYkFwWlYxSjZUREl4YUdGWE5IZG5XWE5IUTJselIwRlJVVUl4Ym10RFFrRkpSV1pSVWpkQlNHdEJaSGRFWkZCVVFuRjRjMk5TVFcxTldraG9lVnBhZW1ORENtOXJjR1YxVGpRNGNtWXJTR2x1UzBGTWVXNTFhbWRCUVVGWlUwUkhSMnhzUVVGQlJVRjNRa2xOUlZsRFNWRkVUWFkyYm10Mk1GZDZZak5JU0Rrd0wwa0tkMkoyTDNvMVExSjFPREJuY1ZCUGIwaEZSRmhKUms5MlVGRkphRUZRUTJWaVNtRlZaM1VyU1dVM1pVcFBPRGh4UTJGNmRrcDVhR3RQV1ZCWGNteHZUQXBWVVhVNWRGbDFaazFCYjBkRFEzRkhVMDAwT1VKQlRVUkJNbWRCVFVkVlEwMUJUWFJNZGxWM2RHRlhRMEphV0VwNE5FZG1NRWhSTDB4dmFFUmtUamMwQ25oVE5IbFRWME5rUVU5TVQxSnZZWGhMY1RWSlExSk9kQzlFU3pWV01qWm9PSGRKZUVGTmNXNVhTakpaZERWT05VTkVXV3czWkZCNFRGaEtkVk4yUmxJS1dXSm5NM0J3WW5JNFNYSktkR05KVlhCeFVXZzJZU3N5UmpWTVozTjNkbkI2YTA4eGRWRTlQUW90TFMwdExVVk9SQ0JEUlZKVVNVWkpRMEZVUlMwdExTMHRDZz09In19fX0=",
          "integratedTime": 1668646729,
          "logIndex": 7240363,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/node/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/node",
      "githubWorkflowSha": "d6a77cd90940804c2dc15b19aaf6ce100f6b2bbe",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3484422004",
      "sha": "d6a77cd90940804c2dc15b19aaf6ce100f6b2bbe"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

