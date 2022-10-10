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
| `latest` | `sha256:48566cd4c786d88d81b500eaa3758a71e7d97468248262e66a1ea06655bf155a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:48566cd4c786d88d81b500eaa3758a71e7d97468248262e66a1ea06655bf155a) |  |



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
        "docker-manifest-digest": "sha256:48566cd4c786d88d81b500eaa3758a71e7d97468248262e66a1ea06655bf155a"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "d2d0c52dbd9bf894441e5afa2e11e6473cf1222d",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/jdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIBAsgW3kp1lO4EoDRRFRbc2pPmncaul819yvYtHbjXtRAiEAqOcyWpvxJjDUXywaTwJAWhjvm7Wz6LkkInhxScNnARA=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI5ZDg1OGQxMWY2MjdlNjc4OWUxZjM0NDc4NDU5MmY5NDUzYmJhZDA4ZDkzMDg5MmFjNWRlZjQ4Mjg3MGUyNmM5In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNRckcrRG1LY1YzVFhSYXJsMkNIYVd6OUxQVGxiOE55Vll2d0d1MnNnSzRnSWdBOVBIckwraStkOVBTOWE4cGtleVhEeGNsRWF5cDc2YzNIcDNlUWRoQ3hnPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndWRU5EUVhsMVowRjNTVUpCWjBsVlpubFlSemhUV2tSV0sxSlhLMjlhVXpOaEsyeDZUMFY0YVZoTmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhkTlJFbDRUbFJKTWxkb1kwNU5ha2w0VFVSRmQwMUVTWGxPVkVreVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZaV0VWRWN6WnZPVUk1WmpKdmFGSnVPSGRuY25GRWVYZHNTRm8yY2tsMlZWZGxWV29LTDI0ck1teFJhR0ZJVkZSeE4xaHpVMGszUzFaME5rWnhSV294YWtRMlZuZDJNM3AyYWtKd1dscENWVnAxTVhSTlpIRlBRMEZyYjNkblowcEhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlUxZG1OSkNsVnRUV1o2WTNod2FqRkpSRk5ETTIwMmIwODRjV1ZuZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Y0d0aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdldrUkthMDFIVFRGTmJWSnBXa1JzYVZwcVp6Vk9SRkV3VFZkVk1WbFhXbWhOYlZWNFRWZFZNazVFWTNwWk1sbDRDazFxU1hsYVJFRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1Y1ZwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwdENaMjl5UW1kRlJVRmtXalZCWjFGRFFraDNSV1ZuUWpSQlNGbEJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUkhZMmVubHFaMEZCUWtGTlFWSjZRa1pCYVVWQk9FTnhhalZUVlRsbGVFZFlSMmxYT1ZreWFIb0tSVEJIWmxNM01XMXNNQzgzU25KRlZGTmthbFprZUhORFNVWnNibEpWUVZwcE1EbFJWRVJIYTFOYVRrcDFabTQ0VTA4eFVtaFpLM1JRZUhkT01qWTNXZ3BwVGxOYVRVRnZSME5EY1VkVFRUUTVRa0ZOUkVFeVowRk5SMVZEVFZGRVN6UmlXbEpVTUZSeEwzWnRXQ3M1TWpOWlVYTk9ObTAzWW1Sc2NGcGxSa3BHQ2tGeldqRjRUV2wxWTJGWE5HaEdXazk2TUZCRmFYbEZTMnhaTVhWaEx6aERUVU16YTIxUE9HRk9PVTB5VUZwbmJsZERXVFp4TmxKbk16Rm9PVEEwUzJrS05HRkdTR1pUV1hSSmMxbE5jbTlaTURWdmJGSm1UeXNyU1ZGc1pGSkRiV2hWZHowOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1665368127,
          "logIndex": 4787767,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/jdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/jdk",
      "githubWorkflowSha": "d2d0c52dbd9bf894441e5afa2e11e6473cf1222d",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3216450735",
      "sha": "d2d0c52dbd9bf894441e5afa2e11e6473cf1222d"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

