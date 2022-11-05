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
| `latest` | `sha256:6dcb6369e961a679013ba553e25313e2efe58e394a0b414977a97748be60f4bc`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:6dcb6369e961a679013ba553e25313e2efe58e394a0b414977a97748be60f4bc) | `amd64` |


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
        "docker-manifest-digest": "sha256:6dcb6369e961a679013ba553e25313e2efe58e394a0b414977a97748be60f4bc"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "cdfff131156b60097572131cca68969f23fc320d",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/node",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIBdUcBtMyJbsp4iuSDRKwWEkcjsRtTjKVYxqeU5z2AbwAiEAjKBWq5aq96EqxI2aTvG4/ZLvNSNzktd0l+LSAMimpAs=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIyYmU5ZDM5MjAxYjZjMWNmMDkxMGFmNzA5M2ZmMmY4Y2M4ZTMyZDA1MjhhNThkNzgzMGMwMDBhM2U1NWNiYmJkIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQ3VyOTNYL2MxaHhFNUV6RHBJeWtmcEpDc3pmeXVvWXBvOWpiUzVtWE90bkFpQjMzLzNaQTNhQ01BYlRLaVBwcVV6RFJ5NXVYVGlXNmQ4Y3Y2M3E2S09pcWc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndWRU5EUVhsNVowRjNTVUpCWjBsVlpFNXNPREZ2V0ZSU1QwOVlOMHRXVDJWNGJrcFRWamd3SzBWTmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRGTlJFVjNUa1JCTkZkb1kwNU5ha2w0VFZSQk1VMUVSWGhPUkVFMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVUxUmxjNGRqSklNbXhyYkZoTVJreG9SVTlHV1VkeVdIcE5ibmhNUld3M1RIaDFhR1FLTUhwV1pGRnhTM05wV0VSR1dqVlBjVGhMZDBwcVNFRlpjR1psVjJocWJVOW9jWFZqVldoalV6QmFUVWRPY0RkSk5VdFBRMEZyYzNkblowcElUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZuTWt0VENrRk5kMFZGUmpkQlJqbHdWbkJSYmxWT1FWTjVhVkU0ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwbldVUldVakJTUVZGSUwwSkdkM2RYYjFwWllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TlhaYVIxVjJURzFrY0dSSGFERlphVGt6WWpOS2NscHRlSFprTTAxMlkyMVdjMXBYUm5wYVV6VTFXVmN4YzFGSVNteGFiazEyQ21GSFZtaGFTRTEyWWxkR2NHSnFRVFZDWjI5eVFtZEZSVUZaVHk5TlFVVkNRa04wYjJSSVVuZGplbTkyVEROU2RtRXlWblZNYlVacVpFZHNkbUp1VFhVS1dqSnNNR0ZJVm1sa1dFNXNZMjFPZG1KdVVteGlibEYxV1RJNWRFMUNXVWREYVhOSFFWRlJRbWMzT0hkQlVVbEZRMGhPYW1GSFZtdGtWM2hzVFVSWlJ3cERhWE5IUVZGUlFtYzNPSGRCVVUxRlMwZE9hMXB0V20xTlZFMTRUVlJWTWxscVdYZE5SR3N6VGxSamVVMVVUWGhaTWs1b1RtcG5OVTVxYkcxTmFrNXRDbGw2VFhsTlIxRjNTRUZaUzB0M1dVSkNRVWRFZG5wQlFrSkJVVTlSTTBwc1dWaFNiRWxHU214aVIxWm9ZekpWZDBwQldVdExkMWxDUWtGSFJIWjZRVUlLUWxGUlYxa3lhR2hoVnpWdVpGZEdlVnBETVhCaVYwWnVXbGhOZG1KdE9XdGFWRUZrUW1kdmNrSm5SVVZCV1U4dlRVRkZSMEpCT1hsYVYxcDZUREpvYkFwWlYxSjZUREl4YUdGWE5IZG5XV3RIUTJselIwRlJVVUl4Ym10RFFrRkpSV1YzVWpWQlNHTkJaRkZFWkZCVVFuRjRjMk5TVFcxTldraG9lVnBhZW1ORENtOXJjR1YxVGpRNGNtWXJTR2x1UzBGTWVXNTFhbWRCUVVGWlVrWlZVVlpwUVVGQlJVRjNRa2ROUlZGRFNVRnFOR1pMZFRsdFNXWjZNSFpTUzFoelFuUUtPVm9yVkVrd0wyVXJlV3RSUkc0dk5tMDNVWFF3VWtWSlFXbENTMjFJWTJac1JVRkRRV3A1TkVwSmNYQjBPVU50UlU5SVl6Tm1XRVEwVm5jeFdGUjBiZ3BDV1dObldtcEJTMEpuWjNGb2EycFBVRkZSUkVGM1RtNUJSRUpyUVdwQ2JVeEdVVFZxT0hGU1NETklkRmxuUTJzNWEwUmxPWEJPZUd4blpsVnhhMDlKQ2xoVFdraG9ObVJ6Uld0UFpHVlJXWFF6YVcweWFEWkNZMlZuTVM5bFpWRkRUVWhuY0UxTGExWmtXRkkyTHlzeVZEUkphbkppWWxCclV6QjNTbm9yZDJ3S05YSnBVR3M0VVc4eFVUSmhhM0IwYVdVME9FSmlLMVZrWW5JNWNHSTJRemxwZHowOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1667610254,
          "logIndex": 6529309,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/node/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/node",
      "githubWorkflowSha": "cdfff131156b60097572131cca68969f23fc320d",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3398083040",
      "sha": "cdfff131156b60097572131cca68969f23fc320d"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

