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
| `latest` | `sha256:bc425dc548807bd7a3fb43213b508906e867589563261e0696c6d85d334b9700`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:bc425dc548807bd7a3fb43213b508906e867589563261e0696c6d85d334b9700) |  |



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
        "docker-manifest-digest": "sha256:bc425dc548807bd7a3fb43213b508906e867589563261e0696c6d85d334b9700"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "cb5617756403dc8f38aa52dd241daecb0baf66b9",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/jdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIGlxiviRVCJZGYJoW6B0Ot6GxxqlhT0IDbVaspX7JmZ+AiEA4bLJJPJ+daoLx6BVLnwNdWeDXkYCWSmFiHdE+6OOr5w=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI0NzkxZWVmNDFhZDUyM2QwZWM0NGZiMmM1NTQ3ZDhkMDQ0OTdhZDRhNDU5NDA0MjUyYzNmOGU1OGFlYjM5MzllIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURCWXlyM1l6TXVsRk5uS3B6aVczSUxUQ2lHbHpHZUQ0cFJHQmNKaDkvQjV3SWdPNVB0N0FvM01pcUFGYS9ocFNibVg3YW1ZeXErZmxUa2ppWDVlUXY3bTl3PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndha05EUVhsNVowRjNTVUpCWjBsVldYVnBjVTE0VUZGRWNrNURWVUoxTVZKcFQwbzRRV0U0VTFGQmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1RSTlJFbDNUMFJGTWxkb1kwNU5ha2w0VFVSSk5FMUVTWGhQUkVVeVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVYwUWxKc1ZEY3lWbkpDV0dkT1IxZzVZMGxHUjBveFpuWTBTbmhDVVhObVNHVkNSV01LY1V0Sk5IY3lVMVUzWjBwSFFrMUJibmRYU2xSSlZETkljazB3VGxSc2EyRnhVWFZVUW1GUmJsbzVjR3RtUVVaMFdrdFBRMEZyYzNkblowcElUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZoYlVkRkNteHpWVXR6TVhCWmIyaG5PRXhYT0dsdlRXUlpOV2xaZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Y0d0aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdldUSkpNVTVxUlROT2VsVXlUa1JCZWxwSFRUUmFhazAwV1ZkRk1VMXRVbXROYWxGNFdrZEdiRmt5U1hkWmJVWnRDazVxV21sUFZFRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1Y1ZwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIweENaMjl5UW1kRlJVRmtXalZCWjFGRFFrZ3dSV1YzUWpWQlNHTkJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUlVoR2FtUnhaMEZCUWtGTlFWTkVRa2RCYVVWQmFpdFVWRTAzUlZGb1lVUTNOMmhSYkZSNFN6Y0tWVGhZVm5neVNUbEVXV2xTZWxaUFMybE5iMWRXUTBsRFNWRkRZa0p5ZUVSeFYxRjRia0ZPYVdneVNETnRZM0I1Y2tWaGVVNDRTa001YnpFck9FeFJUd3BCUWtvdlYwUkJTMEpuWjNGb2EycFBVRkZSUkVGM1RtOUJSRUpzUVdwQ1duSkZVbTB2WkVJeE5HcFBTR2RZZDIxMlNGbExaVmh3WkRFeVprSmpNMWxwQ2xoS04wMXNiMFEzZW05MFQxaFZRa1V2VTNsc09VOXFUR3RWVkdWSEx6aERUVkZFVVVWcmNsWTBhR0Z3YTBkUVZVNXZVRTV1Y2tKWFVXaEpSa2RHYlcwS2ExQjRXRE5zZDJwTFZ6WjVjbWx5Ynk5b01sQjFaRmcyVG5aMVRWTXpLMncyVXpBOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1666922899,
          "logIndex": 6016588,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/jdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/jdk",
      "githubWorkflowSha": "cb5617756403dc8f38aa52dd241daecb0baf66b9",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3342257283",
      "sha": "cb5617756403dc8f38aa52dd241daecb0baf66b9"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

