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
| `latest` | `sha256:bad70a1a866c2f4dc04a449dbdd7002cc14182528cb7d224d0a06e43e4c8584d`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:bad70a1a866c2f4dc04a449dbdd7002cc14182528cb7d224d0a06e43e4c8584d) |  |



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
        "docker-manifest-digest": "sha256:bad70a1a866c2f4dc04a449dbdd7002cc14182528cb7d224d0a06e43e4c8584d"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "dbc41181964459c34ef78867e06e9190b180b543",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/jdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIF3t9TCvuXWoViMyioR/MlFBre2UZyKxEdaZ5CNFxBCiAiEA66sHed5ifLGWK+bL222Qr+0mc2MlBXFxcF2kisvrm50=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI0NmQ4MjQ2YzQxMjcyOGI0M2RjOGNhNmNlYjBmYWExOWJhZmNiNjA2YmRhMzBiYzUyYWNlZjkwYjdjM2IyNjdhIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUQ4a1l1WmZkcDdZNVkyejdMeTdWUVF1dElHMU4xYXJqamRFWkVaWFFBUU13SWhBT0hCNGFZME5TeVY4L1RaZUpBa0VOYlU5UmJvemZVTUcrL2VmN1ljUE5IUCIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndSRU5EUVhsMVowRjNTVUpCWjBsVlRYbFNOMWhZTm5sQldHWk9RMGhZTTBNME16UlZNMHgxUlhGdmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUVRSTlJFVXhUbFJGZUZkb1kwNU5ha2w0VFVSQk5FMUVTWGRPVkVWNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZJY1Zack5Va3JiMWx3YldwT00ydHFZV0kxVkZoa1JDdHRaR0pFTTNab05FNHpkV1lLWVhkbE5XOVdWakJHZGxWSmRHRXlWMk5RTHpaVmQyUkJaRU5NYlRORGIycExTVEZZTjFwT1NsWnNlbEpISzBaa1pqWlBRMEZyYjNkblowcEhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZwVjJZekNraFZZMWxSU0hKTmREQnNOMmhaUTNsbkswSXJWRk5CZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Y0d0aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdldrZEthazVFUlhoUFJFVTFUbXBSTUU1VWJHcE5lbEpzV21wak5FOUVXVE5hVkVFeVdsUnJlRTlVUW1sTlZHZDNDbGxxVlRCTmVrRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1Y1ZwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwdENaMjl5UW1kRlJVRmtXalZCWjFGRFFraDNSV1ZuUWpSQlNGbEJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUkhSVk1uaExRVUZCUWtGTlFWSjZRa1pCYVVGQk56WmhZa1k1YVZoQk9VbFRPV3BsUmtOdGNYY0tUemhpVWpoV04wRkVjRVp3VG5CcmF6bDRORmhpZDBsb1FVdHdjazFVWlZkVU1EZEtTazloZWtSdldqRTNMemRvZHpCUlMwcFZhVnAyUlhOWVpVb3hiQXBqTjFSYVRVRnZSME5EY1VkVFRUUTVRa0ZOUkVFeVkwRk5SMUZEVFVoc2JFdzNRaXRQY1hobVZGZEdkRzF3WVRadGFtMHJkMHROVjJoMFVrWjFWRGMzQ25sTGEwTmljWGhKYUdOVWF6YzRjRnBTVW1kTWVqRkRNMDVEUkVSQ1VVbDNTbXRyUWt4bllscFZZbXBOV0RRclVrMDVkbXBvVDFoU1NHUkVZVEpIUVdjS1NsVTBkREI2Vm5aemR6Qm9iRkFySzNOT1pYRTVOVU15YjBaNlRHTjRkV0lLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1665194112,
          "logIndex": 4666965,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/jdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/jdk",
      "githubWorkflowSha": "dbc41181964459c34ef78867e06e9190b180b543",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3208711646",
      "sha": "dbc41181964459c34ef78867e06e9190b180b543"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

