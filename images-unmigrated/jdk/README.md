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
| `latest` | `sha256:8814399332c745abf9fce455867518dad087694427e0ef0e0f414d1c35c82f65`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:8814399332c745abf9fce455867518dad087694427e0ef0e0f414d1c35c82f65) |  |



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
        "docker-manifest-digest": "sha256:8814399332c745abf9fce455867518dad087694427e0ef0e0f414d1c35c82f65"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "eb5a6f7b0dfba2cfb70e281af858982a1b38aa3b",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/jdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIF17Z4CUVUsufXcoaHBLFWpXEmnHfmWjOXuFD4mZ/v4UAiEAyc8lXFyvkrCAkkMnttvzZ/gt41+eJWKToY0tb+E9uMk=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI4MzI3NmIzNzYyNWNkMzhhYzk1YTFmNGZiMmY4ZWYzZGI5ZTFmZjMxZTk2Njk4NWRlOWUyYjdmNzE3ZTZkYWI1In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQ25GZnVJcm9venlPUGU2U21HTnJ2U0N6NkFYdmFaRFFFU1BIcmNISndkV0FpRUFxR2dxQlBNWVhKNElDOXFBQmYzNTNqa0lEcHB6bkNjVHdBZ1RITEw3ZzlBPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndSRU5EUVhsMVowRjNTVUpCWjBsVlZFVktlRkpwZEVSRWVUQkdTRlpGYm5WTlJuZFVWblZLUnl0UmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVROTlJFVXhUV3BGTWxkb1kwNU5ha2w0VFZSQk0wMUVTWGROYWtVeVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZsUWxkaU1rUnBaVE5OYnpOWGNHUjFkbEUyVEdWYVkxZDRaRWxsUTI1TVpVcHFiVGtLUVhwWFdVZFBkMUZvV0VwbllVaHViWFpGU0doWVl6Z3dVSGRUVHpWb1Z6TTRSVnA1Y1hnMlYzZ3hiRTlxYlZsMWRFdFBRMEZyYjNkblowcEhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlYyY1ZabENsVllWRWhsUWxGb1RHOTJaV2R2ZVhGMVFXcHVRamhOZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Y0d0aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdldsZEpNVmxVV20xT01rbDNXa2RhYVZsVVNtcGFiVWt6VFVkVmVVOUVSbWhhYW1jeFQwUnJORTF0UlhoWmFrMDBDbGxYUlhwWmFrRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1Y1ZwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwdENaMjl5UW1kRlJVRmtXalZCWjFGRFFraDNSV1ZuUWpSQlNGbEJNMVF3ZDJGellraEZWRXBxUjFJMFkyMVhZek5CY1VwTENsaHlhbVZRU3pNdmFEUndlV2RET0hBM2J6UkJRVUZIUlZRNGJrOUxRVUZCUWtGTlFWSjZRa1pCYVVWQk5EbDJWWFZIVTFJME1tVjNkM05GZFd0MFlUUUtibTVrTUZWUlNUQnlaRlJzVVRsdmF6WkJSek5SZEUxRFNVUTVRa2xhY21nek9HVXdObk15YzNwcmFraDBWREU1ZGt4bVZVdEdPVEV5VEhoRGVUYzFlQXBNY1Zsb1RVRnZSME5EY1VkVFRUUTVRa0ZOUkVFeVkwRk5SMUZEVFVkUmRtaEdkVWRvVTFOaFZsUmlTSEZUVm1OV1R6ZHBLM0Y2Y2tZemRWaFdNVUZTQ2xkSk1uTnllaTgwTDNCNGNVeFFibmROYXpKS2VHWlNWbWd4TWtaRmQwbDNVa0ZDUjNCeWMxWmplVEJhVVRsdmRGZExTblJ5YjB0ek9XZHdTWEJUUmk4S2JUWlNUVkZYYTNkTlRpOVlaV0ZrWW1KemRFazFRVXRRYURCUFVYTlRkVUlLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1667785937,
          "logIndex": 6652113,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/jdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/jdk",
      "githubWorkflowSha": "eb5a6f7b0dfba2cfb70e281af858982a1b38aa3b",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3406961470",
      "sha": "eb5a6f7b0dfba2cfb70e281af858982a1b38aa3b"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

