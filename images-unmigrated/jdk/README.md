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
| `latest` | `sha256:70186ac1280fda9e3ea01dfcc492213a977de402278fd6d36754b93b2ae425af`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:70186ac1280fda9e3ea01dfcc492213a977de402278fd6d36754b93b2ae425af) |  |



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
        "docker-manifest-digest": "sha256:70186ac1280fda9e3ea01dfcc492213a977de402278fd6d36754b93b2ae425af"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "ebd2695192fa9da791b697b7785c3acb81db82a8",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/jdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQD0j3vBpgz5JYeW/Iu+W1qjZAPrEycPOvdEDOJCz1HhpgIgHa4R36ZLi2rArQiuYUaSAlZ1LJ2tXZIGbAN/7t0qyQs=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJkMzU0ZmI3ZGE2Y2NmMDc4ZjVjMGU0NTFlZDJjYzkzMjA1NDg1YmJhZGEwZWI4OWMwMzE1OGI4N2NhMWZhM2UxIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJRFkyNmgyZm9XOWliUnBXaTBIeEFsSmdaMHRHWlJsMmR3KzNSZHdvekhDN0FpRUFrMUp5WlAwSEY4Z0FydElMbUF5K3RyOVVJbVN0cGJiUzc4cnhkK2I0Ni93PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndWRU5EUVhsMVowRjNTVUpCWjBsVlVXeG5NMnh4ZHpoRGRqZFdjbVZZZEc1MVJUUjNlRVJNUzJ0VmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhwTlJFbDRUa1JCTVZkb1kwNU5ha2w0VFVSRmVrMUVTWGxPUkVFeFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ0Y0VOb1NIRjNZV1pIVjFkUllYVnVka1o0VGsxV0wzRmFZMVp1ZFZGMlRFRmFhRUlLZDNoWmRrWkVkRXh4TDJadVZqZFhZakZ1Wlhad2VrZFZkbXhQVVVKRmRrcDZiakpQVERWSGNWZGlNbGxhUm1oTVNFdFBRMEZyYjNkblowcEhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV2WjFKaUNsUTVUVzlSTkVjM1NFRlZWVGRGZFUxNFVtMHpNVmROZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Y0d0aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdldsZEthMDFxV1RWT1ZFVTFUVzFhYUU5WFVtaE9lbXQ0V1dwWk5VNHlTVE5PZW1jeFdYcE9hRmt5U1RSTlYxSnBDazlFU21oUFJFRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1Y1ZwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwdENaMjl5UW1kRlJVRmtXalZCWjFGRFFraDNSV1ZuUWpSQlNGbEJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUkhwNE4wNVNVVUZCUWtGTlFWSjZRa1pCYVVWQlozSXJVMjltZG1wNVNGRjRhRlJGUW1kalp6WUtiMmRhY1dOdVUyRjNTa2h3U0c1SFlYQjZkekZvZFVGRFNVRjRlVTltYzNWSGJIRkdaVFpsVG1wUmVXOUVTbVptTUZCT1pGaHBhekJ2ZFhRNWMzUTBTd3BMVUhRMVRVRnZSME5EY1VkVFRUUTVRa0ZOUkVFeVowRk5SMVZEVFZGRFRXOVdOMFpoYUVaeE1HWkJVMUpCT0RoTlpXSnFOVlpRTTFWa1JrZEJkRVZOQ21wdVFrb3ZaWGxxTVZKTldYSTNaRXRKY1dGNmQxcHRSbGRPV214MVZtZERUVUZXTldKbWNtaEthek5wT1RsMFVXaERhREprYkU5UVZHdHpPVXRJTWpNS1IwRllkVloyUlhwWllsTkJXRWhFTldaWVpITXlSamhPY0VsclNEbHBiMGd6WnowOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1665627246,
          "logIndex": 4998971,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/jdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/jdk",
      "githubWorkflowSha": "ebd2695192fa9da791b697b7785c3acb81db82a8",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3239199229",
      "sha": "ebd2695192fa9da791b697b7785c3acb81db82a8"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

