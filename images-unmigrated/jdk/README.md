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
| `latest` | `sha256:31496c604116a87c1a1623930aafaea927c5e1d4fee717e6a9461517709ff43b`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:31496c604116a87c1a1623930aafaea927c5e1d4fee717e6a9461517709ff43b) |  |



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
        "docker-manifest-digest": "sha256:31496c604116a87c1a1623930aafaea927c5e1d4fee717e6a9461517709ff43b"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "591bd613bf28496aa40e99dfe16b5ee69c275a62",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/jdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIHVJ5iWb5Am97EfwwDegtC+O4fRQ/1yZ7ayrkO8o74j7AiEArCOzmhdvNdtYZhSYz7ifgSdKv6pS56sC1gZbmV36Sok=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJiMjVhOGJjYTlmZjM4YTYyMTA2OGYzZWEyODEyYzk2YjU4YjQ1OTZiZDlkYTMwNDZkNDFlM2Y0NDRiNWQ5YzQ2In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURldm5UV05vVExabDdZcWRoTDBiRStDZHg5UDdXekNFTE9PYklhYzFXZUZBSWdVZmFENUpCc2pRejkwWDYwUTYrcURJd0wxSGJaM2xIVlk2SklsbEZGbzk0PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndSRU5EUVhsMVowRjNTVUpCWjBsVlZqWjZVVU5QVFhCM2FHSTBUazh6TUZSYVpXNWlObFUwV1dwQmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1hkTlJFbDVUVVJGTUZkb1kwNU5ha2w0VFVSSmQwMUVTWHBOUkVVd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZOYlhFMFVrc3hlbWRqYVZjNU5sVlFaRFkwSzFOT1N6bHJhRW80U2xwMFpGaE5jVk1LZGt0S1ZXUlVPWE5MVFZGNVdHVnlSMWxPYTBaa2FFMUJOR1pzZVhOd2RHTTJibkpZYUhsa2NuUm9Wa1kxY2pRMFpVdFBRMEZyYjNkblowcEhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZMZHk5WUNrVjVaVE5OVkRoRWVYZDRjMjVLTVVoV1JqSm1SV1Z2ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Y0d0aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdlRsUnJlRmx0VVRKTlZFNXBXbXBKTkU1RWF6SlpWMFV3VFVkVk5VOVhVbTFhVkVVeVdXcFdiRnBVV1RWWmVra3pDazVYUlRKTmFrRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1Y1ZwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwdENaMjl5UW1kRlJVRmtXalZCWjFGRFFraDNSV1ZuUWpSQlNGbEJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUkRoNlJIbFBaMEZCUWtGTlFWSjZRa1pCYVVWQk5HNURlVmRKV0hoUWF5OXJiRUpGTkd0UmNWQUtNVE5KTWtobmFGQlZTRE5VTjJweFFpc3pWRFV5VjJ0RFNVaExRbmMzYmtaV2N6QXZjSEZNZFZReGJFRjZWMmhGUzJKNFJISnNaMng1TjJsR05WcExjZ293YkhjdlRVRnZSME5EY1VkVFRUUTVRa0ZOUkVFeVkwRk5SMUZEVFVKdmVVOHpSRkpPUmtoU1UzUlBUQ3Q0V2k5a1ozVmFjalZOYW5KNGJDdFBXRU5JQ2t0Q1JEaFZORkJQVld4dFJXZEdjVXhEUW0xQ05HVktNRlF6VDB3MFVVbDNTMU5NSzJVMVRWSjNaM1prV2xGTU4yVmlNMDFIT0ZNMksxRmxka3B3ZEdnS2FqTlRlblpqUldGWVJrSjJLMU4zVkd4c2QxSk5NVkl5WkhOaFZUbElXRGtLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1666232415,
          "logIndex": 5468811,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/jdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/jdk",
      "githubWorkflowSha": "591bd613bf28496aa40e99dfe16b5ee69c275a62",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3286338148",
      "sha": "591bd613bf28496aa40e99dfe16b5ee69c275a62"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

