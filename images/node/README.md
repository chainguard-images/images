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
| `latest` | `sha256:f26dc7a04165dc321730fc15b5225292711f5423c73ddd38387a7d45995cd87a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:f26dc7a04165dc321730fc15b5225292711f5423c73ddd38387a7d45995cd87a) | `amd64` |


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
        "docker-manifest-digest": "sha256:f26dc7a04165dc321730fc15b5225292711f5423c73ddd38387a7d45995cd87a"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "54b411a7d8e3e2b05ebedb3bb44a8c4f2581d1ea",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/node",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDXmsvE48+MKP1Mjz0E8mamz/dNjyv2hjUP/2Sq8Jtw1QIhAJkE/doSH9IOzy9WjuhsxwBopz/6AWGZfYPYlyhKX6Mp",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJhNWE0N2U0NzBhNzFlY2I2ODI3OTE0YTkwMTk0MjM3NDIwMGY1ZGJkY2YwMTdkZWI4Njc5ODFiMDkzYTIzMjMyIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJSHNIMWtiNjg5dk01TkdZNU5FQVBOMUQ1TUNrKzdNNU42anVmTGc2dkY1NkFpRUFoM044K0lvT24wT1kxc2QwV3VqdUhxbzBScjNVQVkrUUFYbE55M0JLbjRjPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhSRU5EUVhreVowRjNTVUpCWjBsVldYZ3dPVGxzZGpkblRYY3dVM053Um5obVUyUXhNVWhHZEcxQmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlhoTlJFVjNUa1JSTTFkb1kwNU5ha2w0VFZSRmVFMUVSWGhPUkZFelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZaVTJKRk5GZDNWRlZpY2xjM2JVY3pZM0ZXVjJSTE4xSnNhbWwzTlhGTFptdDZTQ3NLVTBGUVpHOUhNRUV6Y0M4eFRFdGljakJyTkRGdGVGbHpZWGhNY1RoSVdrRTJhVE54VnpaVmQzQnRWM2sxTDNobU5tRlBRMEZyZDNkblowcEpUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZETXk5aENrcFJkbVk0T1VFMFRGbGhZekZsVWxGbFZHbE5hamhOZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwbldVUldVakJTUVZGSUwwSkdkM2RYYjFwWllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TlhaYVIxVjJURzFrY0dSSGFERlphVGt6WWpOS2NscHRlSFprTTAxMlkyMVdjMXBYUm5wYVV6VTFXVmN4YzFGSVNteGFiazEyQ21GSFZtaGFTRTEyWWxkR2NHSnFRVFZDWjI5eVFtZEZSVUZaVHk5TlFVVkNRa04wYjJSSVVuZGplbTkyVEROU2RtRXlWblZNYlVacVpFZHNkbUp1VFhVS1dqSnNNR0ZJVm1sa1dFNXNZMjFPZG1KdVVteGlibEYxV1RJNWRFMUNXVWREYVhOSFFWRlJRbWMzT0hkQlVVbEZRMGhPYW1GSFZtdGtWM2hzVFVSWlJ3cERhWE5IUVZGUlFtYzNPSGRCVVUxRlMwUlZNRmxxVVhoTlYwVXpXa1JvYkUweVZYbFpha0V4V2xkS2JGcEhTWHBaYlVrd1RrZEZORmw2VW0xTmFsVTBDazFYVVhoYVYwVjNTRUZaUzB0M1dVSkNRVWRFZG5wQlFrSkJVVTlSTTBwc1dWaFNiRWxHU214aVIxWm9ZekpWZDBwQldVdExkMWxDUWtGSFJIWjZRVUlLUWxGUlYxa3lhR2hoVnpWdVpGZEdlVnBETVhCaVYwWnVXbGhOZG1KdE9XdGFWRUZrUW1kdmNrSm5SVVZCV1U4dlRVRkZSMEpCT1hsYVYxcDZUREpvYkFwWlYxSjZUREl4YUdGWE5IZG5XVzlIUTJselIwRlJVVUl4Ym10RFFrRkpSV1pCVWpaQlNHZEJaR2RFWkZCVVFuRjRjMk5TVFcxTldraG9lVnBhZW1ORENtOXJjR1YxVGpRNGNtWXJTR2x1UzBGTWVXNTFhbWRCUVVGWlVtdE9PRlV5UVVGQlJVRjNRa2hOUlZWRFNVVXpXSFZpYTBoa1VsRnNNRTVxZWxjME4zTUtNM2d2YnpBMFFUZFBSbWRMWjI1SEx6WnlibEZRVDJSTFFXbEZRV2wyVkdkU1kySkVRWEptVFN0VVNHVnBUV3B6Y1c5eFJtRlpjV3RQUVhJNFpuSlNPQXBOVWlzM2FXODRkME5uV1VsTGIxcEplbW93UlVGM1RVUmhVVUYzV21kSmVFRk9jelpHVEdJclJFbEpWamd2TnpZMVpVNU1VVVJZVmsxWGRrcGFZVzE2Q2xWNU9FcFBNRGRNTW5CalVFWlRVVFExYVdKWFZ6TnVSV2xIYm5ZeGJGaFlkbWRKZUVGUVRqUXJkSFpTU2pCa1FtRjNRWEUwUkRaQ1NHZGpVbTlwZEZjS1EzRTVTbHByTjFBdlFVRXJRMVYzVFVWWFFYcFlVaTltYkRkc1dYQTNWa2M0U2psblpsRTlQUW90TFMwdExVVk9SQ0JEUlZKVVNVWkpRMEZVUlMwdExTMHRDZz09In19fX0=",
          "integratedTime": 1668128690,
          "logIndex": 6848387,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/node/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/node",
      "githubWorkflowSha": "54b411a7d8e3e2b05ebedb3bb44a8c4f2581d1ea",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3441668731",
      "sha": "54b411a7d8e3e2b05ebedb3bb44a8c4f2581d1ea"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

