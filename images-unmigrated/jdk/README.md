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
| `latest` | `sha256:25f790986fed2d6aa1316ff2038fb64151da161bc794f29d2ca5dec54215a374`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:25f790986fed2d6aa1316ff2038fb64151da161bc794f29d2ca5dec54215a374) |  |



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
        "docker-manifest-digest": "sha256:25f790986fed2d6aa1316ff2038fb64151da161bc794f29d2ca5dec54215a374"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "735428a5f03e251fdbdbd6c6ea71f38e1d741444",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/jdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCIN5Hz8r9WmKp/IAXGtVAecjFerw2bG4akdEKpbU6ASgIgOcGKPXexSP+W7oSBzumNLKxwE281JKA50tbuNlg5Mfk=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJjNjVmNWJlYTI0MjAxYjJkZDM4MTQzNjU4Yzc5YjU0NzVkZDA1YTc3Y2IxODE3NGY4ODVhZTAwNGNlYWNhMzU5In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJRW1XWHoyTXc4d2x5dVRCeGVMVDExWnNpMWo1dzNXUUp1ZTh5MnBpMmh5REFpRUF2NTlHbEFOTlluTC9WNVZwdDBvTk9ISzBaWlhab2JUTlVJNytSVzJLenlZPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndla05EUVhsNVowRjNTVUpCWjBsVlMza3dlRVkzVDJKUlRrRTVaV2hIVTFkU1luUlhZa2xQY1dZMGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1RGTlJFbDVUbnBGTkZkb1kwNU5ha2w0VFVSSk1VMUVTWHBPZWtVMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZZU21aT1JrWm1TVmxzTkVNMWJESnZVVE5ITmpZdldEUXZaVXhpVEhGYWVFMUdMMHdLUW05Wk9YWXJUbGRNVHpocFNsVkdkQzlhT0d4WlIxVTJZa1l3TXpoVFR6SnVhVW95VlZGSmFHNUthR0V6TUUxRFIzRlBRMEZyYzNkblowcElUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZNVTNwTUNtOVBUU3QyYnpkS1UwSjVZekI2Y0hWc1oxZFhOVU56ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Y0d0aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdlRucE5NVTVFU1RSWlZGWnRUVVJPYkUxcVZYaGFiVkpwV2tkS2EwNXRUVEphVjBVelRWZFplazlIVlhoYVJHTXdDazFVVVRCT1JFRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1Y1ZwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIweENaMjl5UW1kRlJVRmtXalZCWjFGRFFrZ3dSV1YzUWpWQlNHTkJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUlVSUVl6QndkMEZCUWtGTlFWTkVRa2RCYVVWQmNUTmhZMmhsTm14TlUxUmtMMklyVXl0aFNtNEtlRVZyZG5SdloyTkNhMjVPUWs1NVN6VTBMMDlST1VsRFNWRkRiVE15TUhKR2FYaFhXVkU0UjBodk1WSnlWRlpNY0VGcWNsUm5lakpqT0RrelltNUNTQXBwS3pkbmIzcEJTMEpuWjNGb2EycFBVRkZSUkVGM1RuQkJSRUp0UVdwRlFXMUhiWGRNWTNkRk1sZDRMMjFVS3pZNVZGaHFhbFpQVWxWUVFWbFFiVEJqQ21SUVNFeFZMekV6T1VVeU1XeEVRamhETkVkT01tVkRjWFF3SzNsbkwxaGlRV3BGUVRsR2JFaHNWVmwxYVdZMFJYZDRaVnBVYWpoeVJWQnZTRUZHUjJvS1FqUnlWRVp3TkhsT1ZFMXhWSEZQYURJeVpucEVTblJSZGxweFR6RTNaMjVGY1ZGekNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1666664839,
          "logIndex": 5806197,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/jdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/jdk",
      "githubWorkflowSha": "735428a5f03e251fdbdbd6c6ea71f38e1d741444",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3317706970",
      "sha": "735428a5f03e251fdbdbd6c6ea71f38e1d741444"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

