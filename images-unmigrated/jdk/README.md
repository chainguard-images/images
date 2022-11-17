# jdk

[![CI status](https://github.com/chainguard-images/jdk/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/jdk/actions/workflows/release.yaml)

WORK IN PROGRESS.

These images are currently being migrated to a new set-up. Pulling images from
`cgr.dev/chainguard/jdk` will pull new Wolfi (glibc) based images, which do not match the images built
from `apko.yaml` in this repository. 

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/jdk:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:51d95615306e1998864aa1558a4363e1d9c74190ddfc8478b76deaceccb5b23b`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:51d95615306e1998864aa1558a4363e1d9c74190ddfc8478b76deaceccb5b23b) |  |



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
        "docker-manifest-digest": "sha256:51d95615306e1998864aa1558a4363e1d9c74190ddfc8478b76deaceccb5b23b"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "9ce0e1fe035d1587bea383548157c0962c004dfa",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/jdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCsUjAkKm+yY8YpBykYCHBju5iWzvzrUkcXA+EOCxprcQIgMKEtyB7e047eamtM5u71ayhA6lR/l9itwcmV5sTAAsA=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIxOWU0ZjkyZjY3NzFiYWUwOGU4OWY0OTIwZDBkOWJhZWU0OWQ0NDQ3NjdmNmM5N2VlMTRkMTdhYzdiNGU5MWNjIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUROMXZaTXdKMlNXa2lYUGpqTGgwUDFxZDBXQ2xZMzJlTG52YnJ3dVlWZWJnSWdLZS8vMzljaGdzdzZPRkZiVlBiUnhlNmtUNnVSekFZUGtuK1VEdFEvZ3hrPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndWRU5EUVhsNVowRjNTVUpCWjBsVlMwSkZRVGROYXpaS1NVWkRjR1J3UkRSc2NGQXlVV04wVGtJMGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhsTlJFbDZUV3BWZWxkb1kwNU5ha2w0VFVSRmVVMUVTVEJOYWxWNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZvZUhKemNHZzVUMGxNT0hrNFRHRjFaazFhUWxSUVVYaGlia2xNV0dKRlRWUTRXSElLUW5VeFNGbFlMMmhaWmpsVGJtMDRhak5ITDJWaVNUZE1TMVprTkVoemNtTjBhVWhJYjA1SWJqVXlkVW8wVWs1T2JtRlBRMEZyYzNkblowcElUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV4U25reENtWm5aVlJPUWpaUGFVMXljVlJaZUZZMWEyRmtZVXBSZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Y0d0aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdlQxZE9iRTFIVlhoYWJWVjNUWHBXYTAxVVZUUk9Na3BzV1ZSTk5FMTZWVEJQUkVVeFRqSk5kMDlVV1hsWmVrRjNDazVIVW0xWlZFRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1Y1ZwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIweENaMjl5UW1kRlJVRmtXalZCWjFGRFFrZ3dSV1YzUWpWQlNHTkJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUkhsbmJXdFpRVUZCUWtGTlFWTkVRa2RCYVVWQmRHa3dSRzl4ZG5wT1pTdFhlR1pEVms1bVdFc0tTMHhSYjNwNFVVWnhXbHBrWkhsREszbHNUbGxFWmxWRFNWRkViREJYY1dSUE1FTlhlWEJNWml0cWN6aHVSekZWTDA1VmJXRm5hSEI2VjI1aWRVSmxkZ296VEdNekwycEJTMEpuWjNGb2EycFBVRkZSUkVGM1RtNUJSRUpyUVdwQk9XaGpNek5OU0d0UFluaEtTbU16YmpoNWJpdDFibmRpTm5welUyMUtNa3RQQ25nMUwybHZVSFJoYzBaVU5VODFUVGhLYlhKNVQzWlNTa3hSYzFCc2RtdERUVUY2VjBoS016QjNWVGxCTm1SR2FuaE9VakIxYWpCak5IcGtlVGN6ZFVvS2RFbFNZMkUxTTNKS1FXeFVNa1pOWjJneWVqTlJlQ3RUVEhsMlJpOXlWR3RWZHowOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1665541974,
          "logIndex": 4934251,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/jdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/jdk",
      "githubWorkflowSha": "9ce0e1fe035d1587bea383548157c0962c004dfa",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3231580612",
      "sha": "9ce0e1fe035d1587bea383548157c0962c004dfa"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

