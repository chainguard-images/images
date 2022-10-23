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
| `latest` | `sha256:6ac4ee8c5b823b52f75718d7f132fec7f90209b4810b03d64cb23672fbacb122`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:6ac4ee8c5b823b52f75718d7f132fec7f90209b4810b03d64cb23672fbacb122) |  |



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
        "docker-manifest-digest": "sha256:6ac4ee8c5b823b52f75718d7f132fec7f90209b4810b03d64cb23672fbacb122"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "e9206b1067efd4c1a21ad8a5a64837c958221a7e",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/jdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDvl3/9UPiCuIDgsfDLgKvAYH8XsEPtmmW+sdW333cUVgIhAK7+0KC+sYyXDoKiYyUyqShf5qB9MUbXvdBP28I/b6sy",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI3MmJhZWI0MWYxYjRmMDA4MzAwOWMzZWFkMTlkZjFlYjI3ZmU2MjA5ZmJlNmQ1ZDU4YTE5ZTcxNGRlNDRhZjRmIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUQzOUh2Nm83bkswMUtieTVZeXowSlpOVTQ0c21jRFBhT0dIMGMzVUhnZFBRSWhBSUxpSlh5cUZyVXUvRkl5bGEvY0RGS25LTnR2T2N0L3VXNlVXcC9pWmdpUyIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndha05EUVhsNVowRjNTVUpCWjBsVlZrbEdaMk5vUVdJNVZHODRUVkJJUzFwa0t6ZE5ZbWhVTmtScmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1hwTlJFbDRUbFJSZUZkb1kwNU5ha2w0VFVSSmVrMUVTWGxPVkZGNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZETldKNWVHTmxjakpWVEhKUWNHUklUMFpMWkdkak56WlpValZQTkhkWWVFNWllV29LVUdKYVVVVjFRVWg2YXl0cFlsZFljalZDVlhWaVJsWnZNRU5CTVdSTmF5OW5kRmxGTmxCMVFsTXlZV3BwYldOR1ozRlBRMEZyYzNkblowcElUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlVyYTBkT0NqSXpSMWhYWjBGT1VtWjJiV3h6Wm5BMVNuRXhlRmcwZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Y0d0aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdldsUnJlVTFFV21sTlZFRXlUakpXYlZwRVVtcE5WMFY1VFZkR2EwOUhSVEZaVkZrd1QwUk5NMWw2YXpGUFJFbDVDazFYUlROYVZFRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1Y1ZwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIweENaMjl5UW1kRlJVRmtXalZCWjFGRFFrZ3dSV1YzUWpWQlNHTkJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUlVGd0wySkpRVUZCUWtGTlFWTkVRa2RCYVVWQmNWVmlTa2RCY0VZclpucDNaR2t5WWpOR2JWSUtUeTh6ZUZGdWF6QXpTVFJXVmpWUFMzVktRbU5HTld0RFNWRkVWMnRsU2pWUlZYaFBMMmRtVTJaSkszbFFNMnRJZVhWUFFWZDRaR2wyVDJ4YU5rSnJOQW8zVHpsVmRsUkJTMEpuWjNGb2EycFBVRkZSUkVGM1RtOUJSRUpzUVdwQ1R5OU5ObmhSU1RGTlEySmtURlkxUlVReFJuZDVOVE52U0c1SmNtMXFiWGgwQ2poSWJubHNSVVZxUlU0d2QzUm1TRUp1T1RjcmRrRjJkWHBCY214ck9GRkRUVkZEVTNwd1Z5dDFjRXgxZWtGcVRrWnBOV1UwTWxaYU5FTm1Na05vT1hVS2NXOTRkR2xEZUZaS0wwa3hRV1ZoYkRkWE9WSmxkR1l5U1Rka2FISldSemgzTDI4OUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1666491343,
          "logIndex": 5673272,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/jdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/jdk",
      "githubWorkflowSha": "e9206b1067efd4c1a21ad8a5a64837c958221a7e",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3305481867",
      "sha": "e9206b1067efd4c1a21ad8a5a64837c958221a7e"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

