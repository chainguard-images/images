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
| `latest` | `sha256:43024e2ad749d6a3c606784509b7c8eb49a26cc3944d8e9169e90dece43f2af7`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:43024e2ad749d6a3c606784509b7c8eb49a26cc3944d8e9169e90dece43f2af7) |  |



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
        "docker-manifest-digest": "sha256:43024e2ad749d6a3c606784509b7c8eb49a26cc3944d8e9169e90dece43f2af7"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "9105de4474c39d7e51723b4460749fa0f59920fc",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/jdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCw4w6sYiE8Z2xb+AV+MIQLNKG6upNrUOyxOzlabgPTGgIhAPBesL3gwnE820RFR6a4DS0M9/rcycEz68NRvLfXVUAE",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI0NGFiZDNlMWQ1NGNlN2ViNWNjMTA3YmUxZjY0MTVlMjJhNWUwYTFkMjg1MWU3ZjBjYzVkODRiOGU3MDQ0ZjJiIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUREcEVjcGk2RG04WHNCY04ybVFUTFl1NnhzaVJIdDAvbzRjS3pmVmFlZEFRSWdXNGR0K2w1Ny9iRE1CWldPQkxaSHJ5MkRyWDFJRU5vN2RwVDdUK1lRUTdnPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnZSRU5EUVhsaFowRjNTVUpCWjBsVlJYRkZNQzltUldWWWEwWmpPREpqS3l0amRsSk1VemxLTkZoQmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhsTlZHZDVUV3BSZUZkb1kwNU5ha2w0VFVSRmVVMVVaM3BOYWxGNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZrVUZWT1FrNVNjakZxWWt0NFlXeFlNemxrVkRkbGRFNHZXbGRsYmtsVFMyOVNhRElLYW5WM2FsVnVaQ3R4UkZCNk1tbHFhMFpOZFU5Wk1FMW9WV1ZHVUV4NmJraFJlVGRqTkRseWJVNVVUekZUVERaVWF6WlBRMEZyVlhkblowcENUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlUwV21ONENsbHNlblp4UTBwb1NFUnBZVGM0ZW1KSmMwWXlPVTVCZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Y0d0aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwVm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkZZMGhXZW1GRVFUSkNaMjl5UW1kRlJRcEJXVTh2VFVGRlJFSkRaelZOVkVFeFdrZFZNRTVFWXpCWmVrMDFXa1JrYkU1VVJUTk5hazVwVGtSUk1rMUVZekJQVjFwb1RVZFpNVTlVYTNsTlIxcHFDazFDZDBkRGFYTkhRVkZSUW1jM09IZEJVVkZGUkd0T2VWcFhSakJhVTBKVFdsZDRiRmxZVG14TlEwMUhRMmx6UjBGUlVVSm5OemgzUVZGVlJVWlhUbThLV1Zkc2RWb3pWbWhqYlZGMFlWY3hhRm95Vm5wTU1uQnJZWHBCWkVKbmIzSkNaMFZGUVZsUEwwMUJSVWRDUVRsNVdsZGFla3d5YUd4WlYxSjZUREl4YUFwaFZ6UjNaMWxyUjBOcGMwZEJVVkZDTVc1clEwSkJTVVZsZDFJMVFVaGpRV1JSUVVsWlNreDNTMFpNTDJGRldGSXdWM051YUVwNFJscDRhWE5HYWpORUNrOU9TblExY25kcFFtcGFkbU5uUVVGQldWQk9ZbnBpT0VGQlFVVkJkMEpIVFVWUlEwbEVOVUYzYkRKV1lqbFZNR041YVVsbE1HRnlTbFZwWkZvNE0yZ0taRGQyUVVGeVRtVTFaVFIyUkRsck4wRnBRa2RNUm1vemVGVndRamxLWVhSc1MwOWFlbFl4S3pBckwzVjFkREJyV2tFMVRHaDRlRXA1VVdvMFNXcEJTd3BDWjJkeGFHdHFUMUJSVVVSQmQwNXZRVVJDYkVGcVJVRjRLelZYWlU1aVNraEpWVEI0YVhZNU1DdGpWbmR1Ym1sTVJFeFFLMlpPYUdRemFFSlFTV3RVQ2tKbU1ETldhakptVGtkMVVXTlJSV041UXpKYVpWZHNPVUZxUVRSc1pIcHhaRGhaVDB0UlkzZFlhMk5oT0VGd2JubHBiMFZDVUUxaVFTdFpjM05SWldFS00wUlBSMnRYTjI4eWFtODBVeTlQVFUxYU1UWTNiVnBvTmtGTlBRb3RMUzB0TFVWT1JDQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENnPT0ifX19fQ==",
          "integratedTime": 1665598963,
          "logIndex": 4978051,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/jdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/jdk",
      "githubWorkflowSha": "9105de4474c39d7e51723b4460749fa0f59920fc",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3236944465",
      "sha": "9105de4474c39d7e51723b4460749fa0f59920fc"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

