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
| `latest` | `sha256:4d846b3d66ff2f2c938fc547cdebf6039d4543cc4e309d67913bb1cfe9c89ec6`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:4d846b3d66ff2f2c938fc547cdebf6039d4543cc4e309d67913bb1cfe9c89ec6) |  |



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
        "docker-manifest-digest": "sha256:4d846b3d66ff2f2c938fc547cdebf6039d4543cc4e309d67913bb1cfe9c89ec6"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "efcf6952997c422444f1eb20d9771a6a2d769217",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/jdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIHrAQUUKA8Vpi+lxxkFMjkMQ0JC3EBWriVPqUVhO+16bAiEArOC92pUujmEQqw6NwPAVLqaRGOACfKBn9zuGQTy8JaU=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI3M2EwNTY3MmVjZmI5N2MyMzEyZDU5ZDQ3ZTY0NjFmMGUzODkzY2MwYjNkNzViZDU4Njg4NjBhMmEwYjRiZTAxIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURGbStyVjcwSmZyT3Yzdm5HVElkYkhQSDhaM0REVEtXVXlYeDNZNXNiNFB3SWhBTmllZnArR3dTREFPMjQxdnBqcXJVOTV3cWFJWHdTaUI2akZZNVJralVUVCIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnZSRU5EUVhsbFowRjNTVUpCWjBsVldFSlRhbWRpVVdOMFJ6QXpTRzVOWW1WcFdYbE1jbGxyYUVGamQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hoTlJHZDZUbFJGZDFkb1kwNU5ha2wzVDFSSmVFMUVaekJPVkVWM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZKUlZBd2RqbDNiVEJEVDNvMFJtZFVZMGhoUm1OelYycEZVMVExTkd4dWJXZDBaRmtLZVhka1QzZHBUVWRDVEdVeWFuSllhQ3MxWnpjMlptcDZkV3RDWnpOWU5qaDRZa2xzYlVKemFYSjNOU3RyUVVJMldYRlBRMEZyV1hkblowcERUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ1YUV0WENsQjBjRkZvWkdJeFYxcEtkMWRaTWpGVVlsUTVZeTl6ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Y0d0aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwVm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkZZMGhXZW1GRVFUSkNaMjl5UW1kRlJRcEJXVTh2VFVGRlJFSkRhR3hhYlU1dFRtcHJNVTFxYXpWT01rMHdUV3BKTUU1RVVtMU5WMVpwVFdwQ2EwOVVZek5OVjBVeVdWUkthMDU2V1RWTmFrVXpDazFDZDBkRGFYTkhRVkZSUW1jM09IZEJVVkZGUkd0T2VWcFhSakJhVTBKVFdsZDRiRmxZVG14TlEwMUhRMmx6UjBGUlVVSm5OemgzUVZGVlJVWlhUbThLV1Zkc2RWb3pWbWhqYlZGMFlWY3hhRm95Vm5wTU1uQnJZWHBCWkVKbmIzSkNaMFZGUVZsUEwwMUJSVWRDUVRsNVdsZGFla3d5YUd4WlYxSjZUREl4YUFwaFZ6UjNaMWx2UjBOcGMwZEJVVkZDTVc1clEwSkJTVVZtUVZJMlFVaG5RV1JuUVVsWlNreDNTMFpNTDJGRldGSXdWM051YUVwNFJscDRhWE5HYWpORUNrOU9TblExY25kcFFtcGFkbU5uUVVGQldVNW1URGhxYUVGQlFVVkJkMEpJVFVWVlEwbEhkRFUzUWpZNWVETnlhMVZpY2t3MFMyTkpiMDlwUWtKVlRra0tNRmhzTUhGTVF6bHNWSG92WTNka2VrRnBSVUV6VDNkMk5HODBUV2cxVVZsS1NWWnBMMHBEUWxaWlpWUlJiVVZyYldOMlNrNWxTWHBzWkhGeU1VdGpkd3BEWjFsSlMyOWFTWHBxTUVWQmQwMUVXbmRCZDFwQlNYZG1PRWRhZEZwQ2JFVm9WbWh3UVVoVGFGVmlURTlLY2sxVFZXOW5iRzg1ZUdONFozaG1NekpsQ21STFJsVlpSWFZNVlc0dmFGRnJRWFJFVTNWWk5uRTVRa0ZxUVd0U1lUSXZTR2x3Tml0bFRtSTBNbE1yZFhRd2NtRkxhV3hYYjJKWFJtdEVNVmhwVWtvS2J5OU5OV2hoVWxKV1NHOXlWVlpNWVZwUUt6SnFja3RtYTNFMFBRb3RMUzB0TFVWT1JDQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENnPT0ifX19fQ==",
          "integratedTime": 1663749311,
          "logIndex": 3662484,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/jdk/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3096315409",
      "sha": "efcf6952997c422444f1eb20d9771a6a2d769217"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

