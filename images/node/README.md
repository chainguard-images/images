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
| `latest` | `sha256:233f6b478d4fcfb6ca514ce27a63bd3e3d9a497dd9a4f7244be16882a630046c`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:233f6b478d4fcfb6ca514ce27a63bd3e3d9a497dd9a4f7244be16882a630046c) | `amd64` |


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
        "docker-manifest-digest": "sha256:233f6b478d4fcfb6ca514ce27a63bd3e3d9a497dd9a4f7244be16882a630046c"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "f6761f2cdef32ebbe62ea048d193f22dd8cdd8c1",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/node",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIHap6lRAao/O9SZu1Y+qqDlt2epAON6C48acgKKLdhgwAiAQud4WAHwtv+8gH8o5nzp8tzsI5ur/HPxTkMaCEB1vcw==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJhYjQ3MjJjMzUxMThmM2QxMThiYjY4YWY5ZGRmMmM4ZmMzNjc1NDg4N2E4ZTA2YmE4Njk4YjkzZDhjYTdmMTRkIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQXlaMVk2dGZaV1hTWnUxV3hJdGVDZExyVzlCdURYY2Y1R0xFVTROT3RuakFpRUE5cXc0NzNYOFBjR0lDQ2lSVk1lT0RDT1VhKzRVU2VIeXBJR1o4RS94UzdnPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndla05EUVhrMlowRjNTVUpCWjBsVll6WXZZVkUzWTBjMlUzQm5iVWt2VUdaV1RXcDRjR3B0Y2tSM2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlhkTlJFVjNUV3BKZDFkb1kwNU5ha2w0VFZSRmQwMUVSWGhOYWtsM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZUYTBOdlJYRm5UMW80TlVSSlVFNVdjVTlIUkV0VVVqUTBTemhuSzFsQ1prTlhVbThLZVc5M05uQkRabk5QU1ZKTk1tNXFhRXh5ZWs0MGJVWlNVVlIyU2s0NVpHNVZXVlJPWkV0RVRuSm1lRzluTjBzd05EWlBRMEZyTUhkblowcEtUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZzZVRSTkNtNW1XVXRNVlZnd1YybHdOR3RxUlVoUFIxSTBWR0p6ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwbldVUldVakJTUVZGSUwwSkdkM2RYYjFwWllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TlhaYVIxVjJURzFrY0dSSGFERlphVGt6WWpOS2NscHRlSFprTTAxMlkyMVdjMXBYUm5wYVV6VTFXVmN4YzFGSVNteGFiazEyQ21GSFZtaGFTRTEyWWxkR2NHSnFRVFZDWjI5eVFtZEZSVUZaVHk5TlFVVkNRa04wYjJSSVVuZGplbTkyVEROU2RtRXlWblZNYlVacVpFZHNkbUp1VFhVS1dqSnNNR0ZJVm1sa1dFNXNZMjFPZG1KdVVteGlibEYxV1RJNWRFMUNXVWREYVhOSFFWRlJRbWMzT0hkQlVVbEZRMGhPYW1GSFZtdGtWM2hzVFVSWlJ3cERhWE5IUVZGUlFtYzNPSGRCVVUxRlMwZFpNazU2V1hoYWFrcHFXa2RXYlUxNlNteFpiVXBzVG1wS2JGbFVRVEJQUjFGNFQxUk9iVTFxU210YVJHaHFDbHBIVVRSWmVrVjNTRUZaUzB0M1dVSkNRVWRFZG5wQlFrSkJVVTlSTTBwc1dWaFNiRWxHU214aVIxWm9ZekpWZDBwQldVdExkMWxDUWtGSFJIWjZRVUlLUWxGUlYxa3lhR2hoVnpWdVpGZEdlVnBETVhCaVYwWnVXbGhOZG1KdE9XdGFWRUZrUW1kdmNrSm5SVVZCV1U4dlRVRkZSMEpCT1hsYVYxcDZUREpvYkFwWlYxSjZUREl4YUdGWE5IZG5XWE5IUTJselIwRlJVVUl4Ym10RFFrRkpSV1pSVWpkQlNHdEJaSGRFWkZCVVFuRjRjMk5TVFcxTldraG9lVnBhZW1ORENtOXJjR1YxVGpRNGNtWXJTR2x1UzBGTWVXNTFhbWRCUVVGWlVtWkVlWFpZUVVGQlJVRjNRa2xOUlZsRFNWRkVTVVZsV2t3emJqWXZOSGxXWVRKVVVtVUtlSFZSVmxsMU1qTk1kMEYyZG10bFRFWklhMDAwU0RaNlZXZEphRUZLYm00NU5uZGpaUzl1ZUZseWJWSXdjeXQwZVVwNGVESTNaMU53TVhCMFZWbDVlZ3BoZW5OS1RUUTBhVTFCYjBkRFEzRkhVMDAwT1VKQlRVUkJNbU5CVFVkUlEwMUZZbEZCZG5sbU9VZ3lSbVZxUkhCbWVFVjRiRlI2VW5Ob09TOVRTMUlyQ25SNVdrYzVNVFZ6YVc5UmVVUTVNblYyTnpaaVozVkhTRlZaZDJOb1VYTnpTSGRKZDFoT1prOHpXV3d3V0ZGWk5tNU1RamdyZWtjMlVVTk9TRzlKV0VJS1drVTRiR0pxVG1WeVdEUjJha1p0THpjNEt6a3dlalZtTDNWdFdWRkpkbWRrUjNSckNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1668042145,
          "logIndex": 6805052,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/node/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/node",
      "githubWorkflowSha": "f6761f2cdef32ebbe62ea048d193f22dd8cdd8c1",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3433114369",
      "sha": "f6761f2cdef32ebbe62ea048d193f22dd8cdd8c1"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

