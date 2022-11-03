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
| `latest` | `sha256:01510f62cf44bcd1fe0abaef0c7eac9a380b838116c6b06147ef7226a4e7d076`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:01510f62cf44bcd1fe0abaef0c7eac9a380b838116c6b06147ef7226a4e7d076) |  |



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
        "docker-manifest-digest": "sha256:01510f62cf44bcd1fe0abaef0c7eac9a380b838116c6b06147ef7226a4e7d076"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "cbaad77fa4b8db3c462b7ea82adad4cadf433bdd",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/jdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIB+n+KL/aChiVi0TYww4fLP3dNZU6TeAdJcS5K1NdD3RAiAQxXoZKhRarWplofOWlms1JIE9vZi29aqXLteTWitQDw==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI2OGU0MDcwMzI0ODVkYTc0YzFjNzZjNTU5ZDg2YzQzZTk0YmYxZTdhYjgyOTk2ZTBhNTQ4OGUzNjZmOTdhYmMyIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNBMG5Jc2hxUHptSGFDTm10RmQ5RTUya3cvUmdwZ1Jpclg1QVE4S0Y1Mm1nSWdEL2ZGZjgwR0xjY0V4L3ZNR3VGdkQ0WEdRdmk0MzhRaWFhdXV3WGozL3R3PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndWRU5EUVhsMVowRjNTVUpCWjBsVldWcE9TMUJKWml0RFUweHhhRnBDYm01aWNEUlBRM0ZCVFVaUmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVhwTlJFVXhUbFJKTUZkb1kwNU5ha2w0VFZSQmVrMUVTWGRPVkVrd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZhY1ZKRVQwcFhiWFZuYTFNd1kwczFaWGN3Vm1wVlYxUTRibFJJVjIxeWFYbDJObGtLVTNoMWFIbEZhWFZzYkRneVVETlFMMk41VUVKYVFucEtSR2czYlV0MFNrWnpOVWQwV1hFMlJXeFFVelJPZEdWS2QzRlBRMEZyYjNkblowcEhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV4V0RFckNqWmhheXRPYTIxWVJIcHlURTFpVTBOV1puUmtVV2s0ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Y0d0aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdldUSkthRmxYVVROT01scG9Ua2RKTkZwSFNYcFplbEV5VFcxSk0xcFhSVFJOYlVacldWZFJNRmt5Um10YWFsRjZDazB5U210YVJFRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1Y1ZwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwdENaMjl5UW1kRlJVRmtXalZCWjFGRFFraDNSV1ZuUWpSQlNGbEJNMVF3ZDJGellraEZWRXBxUjFJMFkyMVhZek5CY1VwTENsaHlhbVZRU3pNdmFEUndlV2RET0hBM2J6UkJRVUZIUlU5NlRUY3JRVUZCUWtGTlFWSjZRa1pCYVVGSFMzUnlOQ3RHTnpWblNFWm5VM1ZGVUVodUswb0thRXR4V0VSM1NYaFNUM1lyTmtSS2EyZEJXVXBDZDBsb1FVazBkME5xWTJ3dmEzUnFZazFCWmpkUU9XSnRXV3huYlVzM1UydHVia2h6VEM5eGNXaHZVQXBxWjB4bVRVRnZSME5EY1VkVFRUUTVRa0ZOUkVFeVowRk5SMVZEVFVGVGJWQkpObFpUV25aWlZYRmxaa3hLVERWM2F6TktSRTV6VGtONVVqaFZNVlZFQ25WR05uZFZTbU5wWkdadmJEQndiR2xNUlRSblVYTjBTMmxMWlc5VFVVbDRRVXh5VEZWc1ozSk1iMlJJUWxKSlptVXZRV1F2VkVSeU5rRmlkelYxVFRrS1QzTTVkM1JhWmtnMU1GWmxlRzF5YUc5VFRURm9kbEkzVkdGaU4zaE1WbFYxZHowOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1667440525,
          "logIndex": 6395074,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/jdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/jdk",
      "githubWorkflowSha": "cbaad77fa4b8db3c462b7ea82adad4cadf433bdd",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3382449244",
      "sha": "cbaad77fa4b8db3c462b7ea82adad4cadf433bdd"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

