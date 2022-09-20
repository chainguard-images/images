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
| `latest` | `sha256:50eabd5552f14e2d6b35458e97608ce052c1c5b009a3073504d6c68f4a28c1c9`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:50eabd5552f14e2d6b35458e97608ce052c1c5b009a3073504d6c68f4a28c1c9) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |



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
        "docker-manifest-digest": "sha256:50eabd5552f14e2d6b35458e97608ce052c1c5b009a3073504d6c68f4a28c1c9"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "9cbf0489cba42a240ec6bd94b059b663aaae6e5e",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/jdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQC1mRqWcFL7ziqgsXfFAynvptw6FUEm7V39upy6oGDUMAIgPUALX4rNOQp5Go0/xu/MhoF5O+fi2q2CT2xA5w3ITfE=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI1OTVmYjU2MTE1ZGZjNDIyNDFhZTY0ZmI5YzIyZGExMzQyN2Q3MmViNmQwODJkYzBiMDMwNTIzZGEyODc3MzFjIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQVdSV3ZYRVk3c25YQ2FQRVhvQU5zNlA2Q0FtM0NpdDI2SnkvRkV0c2kxV0FpQkZTbUdTOVAvYkVJNXRJclJYcDJwaGtqTDcrNjNvK01ZUDhGOVNWUzJ2WVE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnZha05EUVhsbFowRjNTVUpCWjBsVlNrTlVjM0I0ZGxkMFRXSjRUR3hLUkVSbWRsWTVZbXR6VjFKWmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hkTlZHTXhUMFJGTlZkb1kwNU5ha2wzVDFSSmQwMVVaM2RQUkVVMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVYySzFOa1pDOXNkazVtVVVoMlJtRTRWM0pxVTFJM2IzVlBRa1k1ZUZRdlFXWkRVV0lLWTBGbVQybzNjSGhSVFVwUWNqVmpNVlZIV0ZKcmVWTXJZMVl6U1dONVVHdFllVGN5T1dwb1IzVmFTMlF5YVU1Wk9HRlBRMEZyV1hkblowcERUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZRUlhsR0NrdGFNekp2YVVJNFVYRTJabGN2VjNOSVMwTk1ObWQzZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Y0d0aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwVm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkZZMGhXZW1GRVFUSkNaMjl5UW1kRlJRcEJXVTh2VFVGRlJFSkRaelZaTWtwdFRVUlJORTlYVG1sWlZGRjVXVlJKTUUxSFZtcE9iVXByVDFSU2FVMUVWVFZaYWxreVRUSkdhRmxYVlRKYVZGWnNDazFDZDBkRGFYTkhRVkZSUW1jM09IZEJVVkZGUkd0T2VWcFhSakJhVTBKVFdsZDRiRmxZVG14TlEwMUhRMmx6UjBGUlVVSm5OemgzUVZGVlJVWlhUbThLV1Zkc2RWb3pWbWhqYlZGMFlWY3hhRm95Vm5wTU1uQnJZWHBCWkVKbmIzSkNaMFZGUVZsUEwwMUJSVWRDUVRsNVdsZGFla3d5YUd4WlYxSjZUREl4YUFwaFZ6UjNaMWx2UjBOcGMwZEJVVkZDTVc1clEwSkJTVVZtUVZJMlFVaG5RV1JuUVVsWlNreDNTMFpNTDJGRldGSXdWM051YUVwNFJscDRhWE5HYWpORUNrOU9TblExY25kcFFtcGFkbU5uUVVGQldVNWpSRkZCWkVGQlFVVkJkMEpJVFVWVlEwbFJRM05LZGpOdGNGSlpVRzVCSzBkdGIxY3pNMU5QV0ZVMlVXNEtTalE1Y1ZKaWNYTkxSV2M1U2xGbVIzTm5TV2RqU2xweFVHWjNTazV6WWtObWRGSkZVMVJuZUZveE5ucFlTR0prZEdsR05YY3ZlakYxTTFoT1prWmpkd3BEWjFsSlMyOWFTWHBxTUVWQmQwMUVZVkZCZDFwblNYaEJTVGh5U1VZeFZXSlNWMHAwYkU1dFFWWmpjMnBZWlROdmEwaFhaVGhRZEM5bGExQkhSRElyQ2xWcVFqaDBSVkZEU2xkbFozWlBSbEJaYVRGTE4zZGxTbkJCU1hoQlN6aDVhMWhpY0V0cGVGRkRkbTFMYlhsVmJUUllOM0pFWlhKUU5VTXlMMkVyWVVJS1VFcHZaR0ZLZFRJd2RtNTVaQzl2VFZSV05HRmhSMGd2WVhoNllXRlJQVDBLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1663696725,
          "logIndex": 3620637,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/jdk/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3092336072",
      "sha": "9cbf0489cba42a240ec6bd94b059b663aaae6e5e"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

