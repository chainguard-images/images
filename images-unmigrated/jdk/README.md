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
| `latest` | `sha256:c7d1f0cb265e128d09b7423ed548eb3f6b404321d5d0b27615eb3d145a0e2817`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c7d1f0cb265e128d09b7423ed548eb3f6b404321d5d0b27615eb3d145a0e2817) |  |



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
        "docker-manifest-digest": "sha256:c7d1f0cb265e128d09b7423ed548eb3f6b404321d5d0b27615eb3d145a0e2817"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "21db27e027f7c672964f807027443e08ea271bcc",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/jdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIFe3rQz72wkN2vJUKdtLAslxk8cQlE2MM3YaQ7Rb3Wz2AiEAqLiVjZzSRYsB04rqMwapMpPgmww+J/AF2jo1ZX7igCM=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJmY2RhZmVhYmI5MDQwZWFiZDBkNzA1MGNlNWI5YjBlMzk0MDdhZmQyZjdjMGM3ZWExZDgxZjdhODNiZjMwNmRjIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJR21RQ0xtUmZ3SXFaZkh5dlE2Qm5UczVFUWxidVoyakVMSXprV0EzWkg2TEFpRUEzRDNQamlOR1l1TW1hZ1FzRXFFVG9QSS90ZnkzTmVkclUycXpMYkZLQ3JBPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndha05EUVhsMVowRjNTVUpCWjBsVllXRndNblJJVkZkWlIycEdWMjAwTTNBMFNHMHJia0pWZG1oemQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRSTlJFVXhUVlJKTkZkb1kwNU5ha2w0VFZSQk5FMUVTWGROVkVrMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZVTW5SdE0ybHROakZWZVhCcU1HZE5TeTlXVldsNVNVZHlVbXRYUkZKWGRFNVVjVVFLU0Uxc01IRkxSMk01ZWtoUGFrdERTalppTjB4UE1raDVOMHRqV0V4M1FYUjJNa1UzU1RreFUwMWtaVWw0YkVVMlNEWlBRMEZyYjNkblowcEhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV3VTBGbENqZzNUa3h1SzIxYVREZEtjRU16T1dkT1pXNXVhRW80ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Y0d0aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdlRXcEdhMWxxU1ROYVZFRjVUakpaTTFsNldUTk5hbXN5VGtkWk5FMUVZM2ROYW1Nd1RrUk9iRTFFYUd4WlZFa3pDazFYU21wWmVrRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1Y1ZwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwdENaMjl5UW1kRlJVRmtXalZCWjFGRFFraDNSV1ZuUWpSQlNGbEJNMVF3ZDJGellraEZWRXBxUjFJMFkyMVhZek5CY1VwTENsaHlhbVZRU3pNdmFEUndlV2RET0hBM2J6UkJRVUZIUlZaUE9YVlJkMEZCUWtGTlFWSjZRa1pCYVVGS2IyTTJSMUpzUzAxelozcDBOVUpsZEdnelJsa0tielp2Y3pkdmRGcFRkRGM1VVdKc2RVVTVkM2dyUVVsb1FWQnJRMjlQZFVoMFNrTXlObmxLZW1GS2VtdHdWMjExTW5OUVRsVXlOa1Z0YmtGeFl5OVVkUW96YWl0V1RVRnZSME5EY1VkVFRUUTVRa0ZOUkVFeWEwRk5SMWxEVFZGRFV6WTVjMDVyU0V4Q1FpdGtUVXRQY21jemNuUTNPWEpCTVhwWmVXODFjV0ZvQ25ZclVXdExXVVpOTWtGSlIwRlNWSGhKVFN0alRTdERTVk5zYjNVdk1XTkRUVkZFUVdOd1NVWldja3BFZG1FMmJ6aFhkSFZIUlRJM1VUa3hSbUpSVDNrS01HOXBNRlZSWWt4S2VFOUJWMGt3VFdOeGFpdEplbGhaYjB0R1FYcElhak53WjJjOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1667872289,
          "logIndex": 6704991,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/jdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/jdk",
      "githubWorkflowSha": "21db27e027f7c672964f807027443e08ea271bcc",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3415672297",
      "sha": "21db27e027f7c672964f807027443e08ea271bcc"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

