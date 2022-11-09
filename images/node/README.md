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
| `latest` | `sha256:4724b51b9c5a6266efc31f6ff36020b329c3301e2331683d8c3dd4377a1f6c5f`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:4724b51b9c5a6266efc31f6ff36020b329c3301e2331683d8c3dd4377a1f6c5f) | `amd64` |


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
        "docker-manifest-digest": "sha256:4724b51b9c5a6266efc31f6ff36020b329c3301e2331683d8c3dd4377a1f6c5f"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "e2c487aabc1f2f2c8baffe744dcd442cd8057d6b",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/node",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIADbt9jogFqFR+VOYYLLuoNvG2IPT5zNGh6+/khE3Wu6AiAStEp5jF4Bbkjv63du0+t4OHSGfIKCk3345zOXICLE1g==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJmODk4NDY1NzY5MGYxZmVmNzMyZmQxM2RkNDRkYjQ2MGFkZmYyYTUwYWUwMTgyYmQ2MjY4MDIyNjFlMjFjMjdhIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNKOC9YVyszTDErdkt3ZnZuTTY0ZW1XbElzWFFkVzYxdkYyVjlSa0VKMmp3SWdYRlVLNVhYWTBFb0dyQ1lLd0s2bVcrWjljWURVUUtBZjV3M0hzTDdoc2V3PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhWRU5EUVhrMlowRjNTVUpCWjBsVlQwRk5RaXN2UnpWbldUZGxWalJIYjNvNGJGZFdZelZUUkRacmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRWTlJFVjNUVlJSTWxkb1kwNU5ha2w0VFZSQk5VMUVSWGhOVkZFeVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVY0UjFkc2MyRTBORXBxZVRWR1RUTnRjbWRVVERFNVFrTm9XWGR0UjNKcmNuZ3dSRzhLUnk4d1VuWkNWMnRhVFRoa1p6azVSVVJWWkVwM05XSTNPWFJVZGxCb05UTkhVVk42Y2paR1dubzVLeXQ2WjJKeE9UWlBRMEZyTUhkblowcEtUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV3YTJ4cENsQXhPRGhEZFhGQ05HbzNOWGRGVEVkeGFsZDFZbGRaZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwbldVUldVakJTUVZGSUwwSkdkM2RYYjFwWllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TlhaYVIxVjJURzFrY0dSSGFERlphVGt6WWpOS2NscHRlSFprTTAxMlkyMVdjMXBYUm5wYVV6VTFXVmN4YzFGSVNteGFiazEyQ21GSFZtaGFTRTEyWWxkR2NHSnFRVFZDWjI5eVFtZEZSVUZaVHk5TlFVVkNRa04wYjJSSVVuZGplbTkyVEROU2RtRXlWblZNYlVacVpFZHNkbUp1VFhVS1dqSnNNR0ZJVm1sa1dFNXNZMjFPZG1KdVVteGlibEYxV1RJNWRFMUNXVWREYVhOSFFWRlJRbWMzT0hkQlVVbEZRMGhPYW1GSFZtdGtWM2hzVFVSWlJ3cERhWE5IUVZGUlFtYzNPSGRCVVUxRlMwZFZlVmw2VVRST01rWm9XVzFOZUZwcVNtMU5iVTAwV1cxR2JWcHRWVE5PUkZKcldUSlJNRTVFU21wYVJHZDNDazVVWkd0T2JVbDNTRUZaUzB0M1dVSkNRVWRFZG5wQlFrSkJVVTlSTTBwc1dWaFNiRWxHU214aVIxWm9ZekpWZDBwQldVdExkMWxDUWtGSFJIWjZRVUlLUWxGUlYxa3lhR2hoVnpWdVpGZEdlVnBETVhCaVYwWnVXbGhOZG1KdE9XdGFWRUZrUW1kdmNrSm5SVVZCV1U4dlRVRkZSMEpCT1hsYVYxcDZUREpvYkFwWlYxSjZUREl4YUdGWE5IZG5XWE5IUTJselIwRlJVVUl4Ym10RFFrRkpSV1pSVWpkQlNHdEJaSGRFWkZCVVFuRjRjMk5TVFcxTldraG9lVnBhZW1ORENtOXJjR1YxVGpRNGNtWXJTR2x1UzBGTWVXNTFhbWRCUVVGWlVsbzJSWEZQUVVGQlJVRjNRa2xOUlZsRFNWRkVNMUZ1VkZKR1drdFFlVEJ2U2s5SE9Vc0thbEphWWxOc1oyNU5jVXN2YzJaeFJraHFWVXRYTVRodllsRkphRUZPTVZSbEsySlZjRlprZUhSRGNUSjVhbFZyTTJjdlVFTXlTMVp4WkhOeE5IZEVSUXBFUTBKdVMzSmlWVTFCYjBkRFEzRkhVMDAwT1VKQlRVUkJNbXRCVFVkWlEwMVJRMmw0WjJwb2NHcFZWVmx1VWt4SmJWUlJlRXhtUkdabE4xWklWM0pJQ201R2NITkNhRzFNY1Zkck1Xd3ZUMnhRUVRkblZIazJOREZCTDBsT2FrUjJSRFZKUTAxUlJFSTBhbWs1Y0hwYVRWVjBUMVpEWWpGTmRsQm9MemhpUzNJS2EwdHBiRXROY21wd1VYUXJVRk13WTNWQ1QxVmhRMlpWVkRZNE9IVlBjMnRIVlZnNVZsZDNQUW90TFMwdExVVk9SQ0JEUlZKVVNVWkpRMEZVUlMwdExTMHRDZz09In19fX0=",
          "integratedTime": 1667955710,
          "logIndex": 6756567,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/node/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/node",
      "githubWorkflowSha": "e2c487aabc1f2f2c8baffe744dcd442cd8057d6b",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3424485685",
      "sha": "e2c487aabc1f2f2c8baffe744dcd442cd8057d6b"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

