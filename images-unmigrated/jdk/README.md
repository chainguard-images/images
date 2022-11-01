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
| `latest` | `sha256:4bd8e41260dbe0610af99eb49fad81841edaac0bbf541125e4581d03d6b5bccc`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:4bd8e41260dbe0610af99eb49fad81841edaac0bbf541125e4581d03d6b5bccc) |  |



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
        "docker-manifest-digest": "sha256:4bd8e41260dbe0610af99eb49fad81841edaac0bbf541125e4581d03d6b5bccc"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "b4330cc75c7a89776902f0852aa486c60e0ad5fb",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/jdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIARgACZcB9PcPbcFvuF6MJdcsEks99n7noufy9ZeT5a2AiEA5BXz/9NZquyANvJq90xwyc2fHNZhDVg3yaxN1lJkqJI=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI1NWFmODRmM2NiYzNjNTNmMTcyMjFhYzdjYTg2N2E1NzM5OTFmMGM2Njk1NTVlOTE1YjA3ZGY3MWZkOTMyZjQzIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUMzOWJ4VUx2UFo0LyttRng0MVlMUWxxMTBuS0piNkxLM0g5SWs3SEJ6bm93SWdiVjFyejZIT2hLeFZTSFpjMEx4anlqNTRiVzhjR1FIZ25INDdvRW82OWNrPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnZla05EUVhseFowRjNTVUpCWjBsVlFtMDJWR3hVTm5oME9HeDVXWHBsWkV0REsyWllSRVZZWmxSVmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVhoTlJFbDVUVlJKTlZkb1kwNU5ha2w0VFZSQmVFMUVTWHBOVkVrMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVUyZWpSdU1rRTBOU3RSZVhaQmQwTTVNRTFaYkdGbFJHUlBNMjFrYldNeE4wVmFTRThLY0M5VFJIY3hZM0JuVDBGNVVrWXJTVXBDSzI1VE5UVjFaM0ZyZEVOamVDOXFNRVZxYm5SalMyTmplR1ZQU2toUVRuRlBRMEZyYTNkblowcEdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZaVUdOVENuWnZXbm94ZDNKd1RHcFVNbm81V0VOSGFVaHBiWGh6ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Y0d0aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdldXcFJlazE2UW1wWmVtTXhXWHBrYUU5RWF6Tk9lbGsxVFVSS2JVMUVaekZOYlVab1RrUm5NbGw2V1hkYVZFSm9DbHBFVm0xWmFrRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1Y1ZwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwcENaMjl5UW1kRlJVRmtXalZCWjFGRFFraHpSV1ZSUWpOQlNGVkJNMVF3ZDJGellraEZWRXBxUjFJMFkyMVhZek5CY1VwTENsaHlhbVZRU3pNdmFEUndlV2RET0hBM2J6UkJRVUZIUlUxUU5XMXhVVUZCUWtGTlFWSnFRa1ZCYVVGVlIyc3ZTMWR2Tms5dE9HMUhTelowYkhGVWJtVUtjMnRNTWtsVlNuSTJiRTV1VlU1TGJqbHVRMnhZWjBsbll5OUdSRWhVTHpGd2NFOURjVlJITUVsSkwxVlJZekpSTW5saFkzRnJVM1pDV2taVlVTczRiZ3BuVVVWM1EyZFpTVXR2V2tsNmFqQkZRWGROUkZwM1FYZGFRVWwzWTJwdVRVSk5NVkJ4YjJORVltVnphR05ZTlZoS2NHeHVPVmczVUROR09UUXdhblJDQ2pabWRtZFBVRVZ2SzFaNFMwaE1OMGs1VEZBdldUUndNRFJQYzFWQmFrSmlOVGhUZFRkTFlURjZNRVExV1RaNE1EZFhRM2RKZUdNNVl6RnllbWxqVTNBS1QyMHdWSEJXYlRNMFFYZFZWRWxET0VadmJGcDFabWxDVVdGeFduaDFaejBLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1667269290,
          "logIndex": 6264005,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/jdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/jdk",
      "githubWorkflowSha": "b4330cc75c7a89776902f0852aa486c60e0ad5fb",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3366281944",
      "sha": "b4330cc75c7a89776902f0852aa486c60e0ad5fb"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

