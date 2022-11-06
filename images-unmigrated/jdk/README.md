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
| `latest` | `sha256:694986e6a458cc63ccbbaac1ce17eb54eeeb7d206f5ab3d3358cf4af117e0426`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:694986e6a458cc63ccbbaac1ce17eb54eeeb7d206f5ab3d3358cf4af117e0426) |  |



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
        "docker-manifest-digest": "sha256:694986e6a458cc63ccbbaac1ce17eb54eeeb7d206f5ab3d3358cf4af117e0426"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "159e8c9842bfa0150cd6b78b81112a23f95f2c75",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/jdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCICqFsD9osIcjsb9zAiRv/787WQtKroyPPzvy9u4QyhKZAiEAvyxpbpRjG0rRPexgrw5GaMEtk13R4GQrXK+o6g3MGww=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI1ZjYzYjhhNjg0ZmE1N2I3ZGRiN2MxNzkzY2U4ZGZiOThiNzJiZGNjNjRhY2YwNDUyMzMyNmQ2YWViYjA4ZDg2In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJRFN2Z3NnRmFUVkRuZmxTYnUzRWVjcDhxWDhhY0dIbWk0MUdUdmc0NnQxNUFpRUE2YmRoQWRNMkczSTRlUHQvTGpKV3UreERoUzZGNHdObTQ2ais1VEZCdDlNPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndWRU5EUVhsMVowRjNTVUpCWjBsVlFpdHRjRFY0TDNwTWRWWTVibEJqVUVSWlZFUlFiRWQ0VVd0cmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRKTlJFbDNUVlJGTUZkb1kwNU5ha2w0VFZSQk1rMUVTWGhOVkVVd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVV5WVVKT1EwaDBUakJPVDBaQmNtVjZWa1ZIY0VoeFZWY3dObE5vVDNwbVpFSnlWSFlLZUhZM2FFOVZTMFV2UXpkQ2VWQm5kMVJyTm1kUE1GUjBPVUpOVkZWeFJqSTFjazFDYW1OU2QwTlJOakJRVm5sRVNIRlBRMEZyYjNkblowcEhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlU0YmpGU0NraGpWM1ZvVjA1SE1ETllkMmRUTkZnd05rWkNabFpKZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Y0d0aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdlRWUlZOVnBVYUdwUFZHY3dUVzFLYlZsVVFYaE9WRUpxV2tSYWFVNTZhR2xQUkVWNFRWUkthRTFxVG0xUFZGWnRDazF0VFROT1ZFRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1Y1ZwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwdENaMjl5UW1kRlJVRmtXalZCWjFGRFFraDNSV1ZuUWpSQlNGbEJNMVF3ZDJGellraEZWRXBxUjFJMFkyMVhZek5CY1VwTENsaHlhbVZRU3pNdmFEUndlV2RET0hBM2J6UkJRVUZIUlZOeGRXMTVaMEZCUWtGTlFWSjZRa1pCYVVGNU5XNXlPVE5RVFc1eE1YazFia0pKTnk5MU5FSUtjMGRrVm10NlRFcGxaMDgxVnpSWWJVTlFaVVUxUVVsb1FVMUNLM2QxYW5ad1drdHdLMlpvZGt3eE5HZEZSMHB0ZW5VemFsSklOM1JSTkVKeU9FOU1lZ3BsUVRoR1RVRnZSME5EY1VkVFRUUTVRa0ZOUkVFeVowRk5SMVZEVFZGRU1Xd3JaMFJrYW1OU1RtdEdkRXBxYTFaWlUwdDZkREIxVFdSWE5DOVJMMmRFQ2k4eWJIcENhSEpRTlV4WFpYTjZOR0U1VVRoRVVVMU1XR2hZYjNaWGVFbERUVUpPVTJaWVRGcFRkWFV5VmtOT0sxcHpiVUZHUW5OeGQySm1Sak15YjJJS05qaG5iM3BzUkM5MlVsUlVZbEZKUlM5b1lsbElZbGROVTJsdFJtaEZPRnBzVVQwOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1667700075,
          "logIndex": 6592573,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/jdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/jdk",
      "githubWorkflowSha": "159e8c9842bfa0150cd6b78b81112a23f95f2c75",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3402493696",
      "sha": "159e8c9842bfa0150cd6b78b81112a23f95f2c75"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

