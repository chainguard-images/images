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
| `latest` | `sha256:79e5e24be3f0066542831e34cc781525bf4c25d7d26ff77a29e311f03ac51d61`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:79e5e24be3f0066542831e34cc781525bf4c25d7d26ff77a29e311f03ac51d61) |  |



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
        "docker-manifest-digest": "sha256:79e5e24be3f0066542831e34cc781525bf4c25d7d26ff77a29e311f03ac51d61"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "4169f5e2e08d62d09ed16a541c8cb530c901a247",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/jdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDx2vWgAQzzxs+g2exinpulPypiz+hzw/vdBvrF12vq+QIgE3SmFXc+X3Gy6MxmpEPpys0RYnUhby6kPTfaAnAGNnI=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJjNzA1MTJmNTE5MzU2OTM3NzAzZWEzZjJmM2VhOTk1OWJkMDYwYTZiMTJiNDNkMzJkMzc3ZDZhNzJiOWExYzdhIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURIZk54WnBqN2ZHMXVoQ0FzVmVGMEU2Q1lDUlJqSzhubWxybUhyU0JFVUtRSWdjZWFLVW9NQ0VINHRKQXQra0g1RDRYb0FxUnQwRGdmV0pRY0Z1NmlpclI0PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndSRU5EUVhsMVowRjNTVUpCWjBsVlUzVTJhVGxHVnpJclN6ZHZjWGRDU2tOSVFrZHBXbk5VWW5KSmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhoTlJFbDRUVVJKTWxkb1kwNU5ha2w0VFVSRmVFMUVTWGxOUkVreVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZtUjFSeWJrZzJWRk4zZW5GR1NFODNZbEpZVkV3eWNuWkxTSHBoZGxRMVlsaFZUWGdLU21oT1pIZDBNRmhHUkRFcmNuQmtTa2R4WjNCU2FXeHBaMkpRU2s1WWN6TkhMMWxCWmxScVMzTnZZbk5JU0ZaUU0yRlBRMEZyYjNkblowcEhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV5U1RGUUNtdDFZMmx2TDNJemVFaFFTVTFxYlZjeWJEWkVOMnRuZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Y0d0aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdlRrUkZNazlYV1RGYVZFcHNUVVJvYTA1cVNtdE5SR3hzV2tSRk1sbFVWVEJOVjAwMFdUSkpNVTE2UW1wUFZFRjRDbGxVU1RCT2VrRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1Y1ZwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwdENaMjl5UW1kRlJVRmtXalZCWjFGRFFraDNSV1ZuUWpSQlNGbEJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUkhoTk5pdElVVUZCUWtGTlFWSjZRa1pCYVVGMmRFUjBhV2t6TUNzM1NWRkhkMFJYWkVKdWVUVUtlVXhHTW5kMlFVbDFRWGRuZGxCd09VcE1ZVWRHVVVsb1FVMVlhVmhhTjJ0eE16TnpXbkZDY0VWaVQxcEdSWEJHZEdSQlZVUktXbE4yU20xcFlUVjFNZ3BFWTNSbFRVRnZSME5EY1VkVFRUUTVRa0ZOUkVFeVkwRk5SMUZEVFVjMlMzQnhSRVpDTVZOMFQxTkhjbEJCYXlzNVJUQXZVMEpGU2s4M2FtVnJRMGxMQ25acVRVMU5VbUptVkdGS1MwOVdibmRKVFVOR1IxWnVkVGRHWVhaUVowbDNRVFpVVVZFNWNsSnpZaXRsWm5WYU5VZDVOV2RUWld4dVZHOW5jakZIV1ZNS01UVmxXbXR5V2k5dmVsTldaWEl6WnpSdGVIVXZURU5NUTBFd1pIQktUbllLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1665454228,
          "logIndex": 4861052,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/jdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/jdk",
      "githubWorkflowSha": "4169f5e2e08d62d09ed16a541c8cb530c901a247",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3223626541",
      "sha": "4169f5e2e08d62d09ed16a541c8cb530c901a247"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

