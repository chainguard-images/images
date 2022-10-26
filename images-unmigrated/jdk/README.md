# jdk

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/jdk/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/jdk/actions/workflows/release.yaml)

WORK IN PROGRESS

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/jdk:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:9d254539d5b9c1d9320b6b7e7dff00473031fc80c02087d965f9649f46dfbf83`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:9d254539d5b9c1d9320b6b7e7dff00473031fc80c02087d965f9649f46dfbf83) |  |



## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/jdk:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/jdk:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/jdk"
      },
      "image": {
        "docker-manifest-digest": "sha256:9d254539d5b9c1d9320b6b7e7dff00473031fc80c02087d965f9649f46dfbf83"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "4abd98439ebe84283102049a8883a7d76602e364",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/jdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCGVhBrF6/oBmrfRbPsKXUsAw5CFSVUBwZEkVdlaTmrqQIgJW62E1dVSNde0q7v3DSZlf7Y7LWSt7q9vc/I1X5kvmg=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJmNTUyNTBlZmE5N2E0OGVmYzBkMTM0YWMzZGNmNzI4OTY5MWY0ODZhMjM5ZWQ5NzFkYzQ2NWZhODFjZThlMTU0In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJSFZJUkJBWVJ3R0piUmtPclVCT2FmbEgvK0xnR1Jpbllkckc3WXl3dDQ1Z0FpRUFsb0xQSkJ1QnBUQjI1UVA1M0NlS1RPbjZlaXBncmJINmo5Z2ZvQkRsc0NFPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndha05EUVhsMVowRjNTVUpCWjBsVlJYTkZOWEJTUjJOYWFGb3JWREYyYWxWRVNVbzVLMjUxV1RFd2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1RKTlJFbDNUV3BCTVZkb1kwNU5ha2w0VFVSSk1rMUVTWGhOYWtFeFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZVTDNWYVVVczNlakUyTjJsbloweFJZVGhKYXpaUVVuWjNSVVp0ZFdKdmRtUjJTRzhLTldGelUxbE9ZVWREVVdzcldubHNObmxsTlV0d2VYVkRWMWtyUjFaUFEwbE5TRVIxYlVKVWMzUk5jV3N2WjFOM2VHRlBRMEZyYjNkblowcEhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZrVFRkMENtbG9UVXhYVVhCaGNIUlFaRVpQWVRkTmFHb3JVRGhSZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Y0d0aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdlRrZEdhVnBFYXpST1JFMDFXbGRLYkU5RVVYbFBSRTE0VFVSSmQwNUViR2hQUkdjMFRUSkZNMXBFWXpKT2FrRjVDbHBVVFRKT1JFRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1Y1ZwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwdENaMjl5UW1kRlJVRmtXalZCWjFGRFFraDNSV1ZuUWpSQlNGbEJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUlVWbldqaHVaMEZCUWtGTlFWSjZRa1pCYVVWQmFsZ3lOalJoTVd4M1RWQlNNVGNyYW0xUU4yVUtjRVZLU1ZkWWJtNVRNa3hCYUhOV1pHRnpjakl3WmtsRFNVUklUM051ZUVoaVZsaExka1JzVWxSUVdFbFdUbXhWU0ZOYVUyNUpSSEJaZFRjeWJtZFpWZ3BSWkVweFRVRnZSME5EY1VkVFRUUTVRa0ZOUkVFeWEwRk5SMWxEVFZGRGJEQkxWbGhJYVdSQmMwRmFWWEJoWjJkeFZUWnNSVk5LWms5cE1rWlFZVzk2Q2pSc1ltb3JkRkpTSzBKbVlYVkJTMFZoYkdrMWFWQmliMDVyT1M5UVNEQkRUVkZFY201a1YwMWhLM1pYUVVNNVpFVTRXa3BvUzFGa2VEZHFXVzltYjI4S1pFUkhZekpLWTFwRFFTOWlSRFZUVFc1bGFqTkpWVmR3VTJ4SU1rVjFSbTVyY25jOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1666749726,
          "logIndex": 5874052,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/jdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/jdk",
      "githubWorkflowSha": "4abd98439ebe84283102049a8883a7d76602e364",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3325629645",
      "sha": "4abd98439ebe84283102049a8883a7d76602e364"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

