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
| `latest` | `sha256:538e2ec1eeb3de1524f0032f38c7c55effbc37c7bc3c1c2fbe0b00e3cdc1bb2c`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:538e2ec1eeb3de1524f0032f38c7c55effbc37c7bc3c1c2fbe0b00e3cdc1bb2c) | `amd64` |


## Usage

Minimal container image for running NodeJS apps


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
        "docker-manifest-digest": "sha256:538e2ec1eeb3de1524f0032f38c7c55effbc37c7bc3c1c2fbe0b00e3cdc1bb2c"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "workflow_dispatch",
      "1.3.6.1.4.1.57264.1.3": "90ebed8cc0c9d7319dadb81ebcde5f8c9387d332",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/node",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIDHIJe+S15W2li8B2iWYRytn5XXHtp/CqeaKXadnjp3FAiEAzviOyaiopY/xU9fXWleNfT+SIDsJ3yddFfXwsTboEts=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI3YjY2ZjgwMTI1YmJlMjkxZmQzZmY2NGFkY2M0MTZmZDZiYjM5NmQ1YjRmNWJhNDdlZmZmNGY4M2ExOTMzYTZkIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQ1h6Z2hwZTJwTXI0b1d1MHUyTmxzWExzbUdWUk9pWDF2UFNJSDNKajkvckFpRUE4dTF2UjlYemhUWkRLSkNPUUc5dUxBM1lqVGJlR01FZzUxclB1Y1ZkMHZjPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlla05EUVhwWFowRjNTVUpCWjBsVldtVlliRTR3YTFWTmJsWjVjMk5hVUdKMVoyTnJjMHd5VVc1M2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVhoTlZHZDVUMVJWZWxkb1kwNU5ha2w0VFZSQmVFMVVaM3BQVkZWNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ5TDBWamQySlVPR3RGTkRjclpteHZSRVkzVkVGa1ZGVmFkRm9yZUVOSVNERnRkelFLY1RWTlkyTnJiMHQxV1RoM09HdFFUWFV6VVdsaVlWcHNSMWhwU2l0cmMxaDVhME5KUTNGT1pXeFdNak4yYTB0Vk5uRlBRMEZzVVhkblowcFJUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZLY1VGcUNscDZZa1ZtVVd4c2RqVnFhM0ZWU1hscVNrZGhaRkpGZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwbldVUldVakJTUVZGSUwwSkdkM2RYYjFwWllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TlhaYVIxVjJURzFrY0dSSGFERlphVGt6WWpOS2NscHRlSFprTTAxMlkyMVdjMXBYUm5wYVV6VTFXVmN4YzFGSVNteGFiazEyQ21GSFZtaGFTRTEyWWxkR2NHSnFRVFZDWjI5eVFtZEZSVUZaVHk5TlFVVkNRa04wYjJSSVVuZGplbTkyVEROU2RtRXlWblZNYlVacVpFZHNkbUp1VFhVS1dqSnNNR0ZJVm1sa1dFNXNZMjFPZG1KdVVteGlibEYxV1RJNWRFMUNPRWREYVhOSFFWRlJRbWMzT0hkQlVVbEZSVmhrZG1OdGRHMWlSemt6V0RKU2NBcGpNMEpvWkVkT2IwMUVXVWREYVhOSFFWRlJRbWMzT0hkQlVVMUZTMFJyZDFwWFNteGFSR2hxV1hwQ2FrOVhVVE5OZWtVMVdrZEdhMWxxWjNoYVYwcHFDbHBIVlRGYWFtaHFUMVJOTkU0eVVYcE5la2wzU0VGWlMwdDNXVUpDUVVkRWRucEJRa0pCVVU5Uk0wcHNXVmhTYkVsR1NteGlSMVpvWXpKVmQwcEJXVXNLUzNkWlFrSkJSMFIyZWtGQ1FsRlJWMWt5YUdoaFZ6VnVaRmRHZVZwRE1YQmlWMFp1V2xoTmRtSnRPV3RhVkVGa1FtZHZja0puUlVWQldVOHZUVUZGUndwQ1FUbDVXbGRhZWt3eWFHeFpWMUo2VERJeGFHRlhOSGRuV1d0SFEybHpSMEZSVVVJeGJtdERRa0ZKUldWM1VqVkJTR05CWkZGRVpGQlVRbkY0YzJOU0NrMXRUVnBJYUhsYVducGpRMjlyY0dWMVRqUTRjbVlyU0dsdVMwRk1lVzUxYW1kQlFVRlpVVEJrVURCc1FVRkJSVUYzUWtkTlJWRkRTVWhNVDIxYWRqTUthM2t2WkVkSFpFaDRVMEpSZURCQk5HSmpRbVJvTlhoV2VrMU9Wek5MYUcwMUsyWXpRV2xDZUhobk4yaHdkbFJvYjNOSk9UQnROVkp1ZGxCVVVsRnRhd3B5YW01R2NXbFFVR050Y0ZWQ2VYcFBUSHBCUzBKblozRm9hMnBQVUZGUlJFRjNUbTlCUkVKc1FXcEZRVE50ZVRoU1RHSkJTelpsZUU5NVFtVmxkRTV0Q2pFMFdUQnhiMU13YmxsMGFFdFVkR1J5VlZWR1NrWXpRWHBTWmt4UVIyNUlhM2hKV0ZCTk1VWjBXV1JzUVdwQlZFRnZaVXhWZUVSaFoyOWhNRTVLWTB3S1UwYzNlSFJNVFhCaWVtNXZhVVJPTlhWWlpGaFNVekpoZVVObFdtZHdTVEZtYjFwdWNuTmllRnBEZG1GRVdqUTlDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1667327396,
          "logIndex": 6305867,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/node/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/node",
      "githubWorkflowSha": "90ebed8cc0c9d7319dadb81ebcde5f8c9387d332",
      "githubWorkflowTrigger": "workflow_dispatch",
      "run_attempt": "1",
      "run_id": "3371877422",
      "sha": "90ebed8cc0c9d7319dadb81ebcde5f8c9387d332"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

