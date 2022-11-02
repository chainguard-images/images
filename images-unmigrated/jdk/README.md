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
| `latest` | `sha256:623c822d8f6964501481751db954294b7f3b54f51f1245f62fa8535327163455`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:623c822d8f6964501481751db954294b7f3b54f51f1245f62fa8535327163455) |  |



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
        "docker-manifest-digest": "sha256:623c822d8f6964501481751db954294b7f3b54f51f1245f62fa8535327163455"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "72899a709c3c95cb37979e90be23446a5f06b4ce",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/jdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIEIgw6GnHMnDRV07ihmtkeV48sKDtGEFkJCe6zxqVPWCAiAr1nfoQVF4AtzSObW3W+qDb5gvOrWwYLCk71EMi0LvBQ==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIxYjE1YjZjZGQ2YjZlNDQ2N2FlOTI4YzQ5YmExMGU5MmQ5ZGRmOTEzMzQ4Y2E2NmY4MjNkMjQwMWIxY2M3OTQ4In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNWWmNuRmRDYVRteE1hdVc2ZXluaGhSblRsUWZUMVFGRUFnZ3lOc0NHUkxnSWhBT09lMU9vR3Bxai85RXRneGgzRkMzSmw3ZUJ4bGtvdkNqYVVxRmVFUWhXSSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndWRU5EUVhseFowRjNTVUpCWjBsVlpXVlRhemhoU0ZwNFIybFBRbEZMVjFsWkwzUkRhRFJZZUZsM2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVhsTlJFbDNUMVJGZVZkb1kwNU5ha2w0VFZSQmVVMUVTWGhQVkVWNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZvTDBOeE9HSmFjazFNWTBaamVsSkhSVGw1UzJsellUVlBZVTVLT1RaNVptSklVV0VLUlZCUVowdG9LekJCY2xKQmRHMXFRM05GZFdWMVdrWlphVVpzTVdWdFYwTllUVUZ6UmpNek4yUklLMFk1TW00ekszRlBRMEZyYTNkblowcEdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlYwTDFCa0NuWjVOblZFUnpoQ2JGbERNMWwyWjFkb2FsWkxTV0YzZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Y0d0aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdlRucEpORTlVYkdoT2VrRTFXWHBPYWs5VVZtcFphazB6VDFSak5WcFVhM2RaYlZWNVRYcFJNRTV0UlRGYWFrRXlDbGxxVW1wYVZFRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1Y1ZwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwcENaMjl5UW1kRlJVRmtXalZCWjFGRFFraHpSV1ZSUWpOQlNGVkJNMVF3ZDJGellraEZWRXBxUjFJMFkyMVhZek5CY1VwTENsaHlhbVZRU3pNdmFEUndlV2RET0hBM2J6UkJRVUZIUlU1b2JVVjNkMEZCUWtGTlFWSnFRa1ZCYVVKdmNDdEZUblpoUVhwbFoxVjRZbFZOZFVSSldURUtURXdyZG0xSldVZHlXR3BuV201UmNXd3lVamhoVVVsblVWQkNUakIzWVc1M2RVVnZOVGxOTjNSdFVVbEhhMFpXWm1WbmJYRndPVXh0Y0VGTE9FOTBSUW8xUjAxM1EyZFpTVXR2V2tsNmFqQkZRWGROUkdGUlFYZGFaMGw0UVV0SE1GaEJVblU0YVhvd01Va3pMMWRQWlVOSmVHOVVlRVJUZEdGNVlWaG1NREJsQ21VdlpqVTVhR1IyYzBkTWFIWlNXVWxMZFdoVWVrdHhSV3hWTHpGeVFVbDRRVWwwY1hSRlFYaHlhemxxTjNKeVNFdG5Xa3A2YUdvNGRrdzRaRlpqZUVrS2QxQjJNMFkwV2pscmFXbDNTRFZhUmpnM2FrdEZaWEZOVVhsSFZVaHlURTVhVVQwOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1667354953,
          "logIndex": 6327055,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/jdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/jdk",
      "githubWorkflowSha": "72899a709c3c95cb37979e90be23446a5f06b4ce",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3374309633",
      "sha": "72899a709c3c95cb37979e90be23446a5f06b4ce"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

