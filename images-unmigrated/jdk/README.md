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
| `latest` | `sha256:db76a77b51e7526a19809718dda06cf35633b377a0c79e93aa0c10ef250ca14b`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:db76a77b51e7526a19809718dda06cf35633b377a0c79e93aa0c10ef250ca14b) |  |



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
        "docker-manifest-digest": "sha256:db76a77b51e7526a19809718dda06cf35633b377a0c79e93aa0c10ef250ca14b"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "0a0ec3d62bda93e0e1530f2a19820dd33b550fb0",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/jdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIG/X0rQ10arovoj/mkn1PJkyooGK+7dY35e/ZWg5a8W8AiEAuuLes1LY0L3sNRxfjyBUeP/d8LlLmy0nthxkNLoq4mM=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJmZmQ0NWQ2MzZlMjg3YTUyZGJlYzNkYTQxZTE5YWY5N2IxMTZiOWFlNWI4ODA5NWViOTk4MTdhYjE1ODU2NGI2In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNEWFhrcXI4MlBBd1dRWGxlYmg0MjgxVGZZaGE4UHFmY3RFc3hXL1ZqeWNnSWhBTk9kSGM4ZnNNWldBNi83Rko5U2FmWHhrZGp5aXhON2EwL0s5NVFlL04reiIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndWRU5EUVhsMVowRjNTVUpCWjBsVldtUmpVeTl2TWxwb2JWSkRUMWhvWkROWVRVOUVjVEJ4TWpKWmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1RWTlJFVXhUa1JGZUZkb1kwNU5ha2w0VFVSSk5VMUVTWGRPUkVWNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZDVUcwMk0wNHpNMGRoV1RZME1XbFNjWHAzYTFCTGVTdEtTVXgwYlRoNlVuVktNalFLVFZrNEswczJTbTVGVkU0cmQzWmpZblZ5VlVnMlJXOVpjbEJQZEdkTFoxUmFkSGtyVlZSU1QzUTJNM0JWUlRCMFRHRlBRMEZyYjNkblowcEhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlY2ZDIxTUNqaHZiMEphV0ZCR1FTdDBjWGt3ZG1GS2JIZ3ZPVlZOZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Y0d0aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdlRVZEZkMXBYVFhwYVJGbDVXVzFTYUU5VVRteE5SMVY0VGxSTmQxcHFTbWhOVkdzMFRXcENhMXBFVFhwWmFsVXhDazFIV21sTlJFRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1Y1ZwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwdENaMjl5UW1kRlJVRmtXalZCWjFGRFFraDNSV1ZuUWpSQlNGbEJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUlVsWVNsTlBkMEZCUWtGTlFWSjZRa1pCYVVWQmF6azFja2xaYlVoaE1WRnJjRkV3V0cxaGJqZ0tVMDFWVmtsSVdEZ3ZXbGhaYWs5WEwwTjNUVGhUU1ZWRFNVaDFLekJTVTFkNlNYQnpZWGRZUWpFdlNIZzNZVTAwZUhrMGMyTnlSMVZhVjI4eWNUVXpNd3BuVEdzMFRVRnZSME5EY1VkVFRUUTVRa0ZOUkVFeVowRk5SMVZEVFVGNFprTnlMMVZxU0dkM1dGZEZNSE16Vm5Rck4xRldTMVl2TVdacWJGbDVNREl2Q2xCTWVGWjRRMkp2V0daNVduRlpjamxZTW01dFFpdDVlbFpyWlZGM1VVbDRRVXBQZUc1UVIzbHVWekV6YlZCV1kyVjZVRU0zVkhCNE9IaEhLekZUTm1VS1VqWXJiRVZaVmxKcVUzQXJkSHB5YUdoeFNXcG1TRXR6Um5sdGFqZG9VR0pLWnowOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1667008453,
          "logIndex": 6075876,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/jdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/jdk",
      "githubWorkflowSha": "0a0ec3d62bda93e0e1530f2a19820dd33b550fb0",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3349624378",
      "sha": "0a0ec3d62bda93e0e1530f2a19820dd33b550fb0"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

