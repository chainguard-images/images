# alpine-base

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/distroless/readme-generator
-->

[![CI status](https://github.com/distroless/alpine-base/actions/workflows/release.yaml/badge.svg)](https://github.com/distroless/alpine-base/actions/workflows/release.yaml)

Alpine base image built with distroless tools.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/alpine-base:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:2953c60807d6070355f57345158f34afdf4f8d1e15d46b5997ba1325170b7b78`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:2953c60807d6070355f57345158f34afdf4f8d1e15d46b5997ba1325170b7b78) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


## Usage

```
docker run distroless.dev/alpine-base echo "hello distroless"
```

See the [examples/](./examples/) directory for how
to use this as a base image.


## Signing

All distroless images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/alpine-base:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/alpine-base:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/distroless/alpine-base"
      },
      "image": {
        "docker-manifest-digest": "sha256:2953c60807d6070355f57345158f34afdf4f8d1e15d46b5997ba1325170b7b78"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "487b8eb17c23150cf9fa421b69de9f58eb419a1d",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/alpine-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDuPC4cJMunh682fZEtQcAYJgzJv5GWf3pNvo51DPAP9gIhAPZq6YkqU1H5aXtlmU9TLCVNIiB+/JECUyMAq9Bm4xEy",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI1NTc2ZGFmMDI0NDA1ZWQ1N2VmMDgzMmNiMGNhNjJmNTVmZDlmZThkNzE0OGQ5YjBiZTg2ZDI1NGMyNGI5NzU3In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJRzNmaHl1SWorRjFWTVgrTXNuaURwd2M2dGVCcW1GRVRkWGhYYTFzdWQxOUFpRUF1T3hENkowdU9IenBMcFRtc1VLQzhIRzByaXovcUNCSExDSWlabEFEcWdZPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnZWRU5EUVhscFowRjNTVUpCWjBsVlNFcEtWamRCWVdOaVMwRk1TVmRMWTB4cFNHcFhXRWQ1UTJ4UmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRWTmFrbDNUMFJWTkZkb1kwNU5ha2wzVDFSRk5VMXFTWGhQUkZVMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ3VlVOTlRHRm5aM2hpYTBWek4yWnNiVGxZY0RBNWNHdDZNRWhCWVRreVJVMXVRbWNLY0UwemRFUjJUbkJ3TkRScFpsVXdjVzFHWW5odVFUYzNlblZFU0c5RUx6WnJkemxuWlRKblFVZGtPU3R4ZVRaaWVFdFBRMEZyWTNkblowcEVUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlYwUjA4d0NsSlhUR2gxV1ZjeU1uZGpaMjkzUjBOSVUya3pSMFUwZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwbldVUldVakJTUVZGSUwwSkdkM2RYYjFwWllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BaVjNoM1lWYzFiRXhYU21oak1sVjJURzFrY0dSSGFERlphVGt6WWpOS2NscHRlSFprTTAxMlkyMVdjMXBYUm5wYVV6VTFXVmN4YzFGSVNteGFiazEyQ21GSFZtaGFTRTEyWWxkR2NHSnFRVFZDWjI5eVFtZEZSVUZaVHk5TlFVVkNRa04wYjJSSVVuZGplbTkyVEROU2RtRXlWblZNYlVacVpFZHNkbUp1VFhVS1dqSnNNR0ZJVm1sa1dFNXNZMjFPZG1KdVVteGlibEYxV1RJNWRFMUNTVWREYVhOSFFWRlJRbWMzT0hkQlVVbEZRa2hDTVdNeVozZE9aMWxMUzNkWlFncENRVWRFZG5wQlFrRjNVVzlPUkdjeldXcG9iRmxxUlROWmVrbDZUVlJWZDFreVdUVmFiVVV3VFdwR2FVNXFiR3RhVkd4dFRsUm9iRmxxVVhoUFYwVjRDbHBFUVdOQ1oyOXlRbWRGUlVGWlR5OU5RVVZGUWtFMVJHTnRWbWhrUjFWblZXMVdjMXBYUm5wYVZFRnJRbWR2Y2tKblJVVkJXVTh2VFVGRlJrSkNXbXNLWVZoT01HTnRPWE5hV0U1NlRESkdjMk5IYkhWYVV6RnBXVmhPYkUxQ01FZERhWE5IUVZGUlFtYzNPSGRCVVZsRlJETktiRnB1VFhaaFIxWm9Xa2hOZGdwaVYwWndZbXBEUW1sUldVdExkMWxDUWtGSVYyVlJTVVZCWjFJM1FraHJRV1IzUWpGQlFXaG5hM1pCYjFWMk9XOVNaRWhTWVhsbFJXNUZWbTVIUzNkWENsQmpUVFF3YlROdGRrTkpSMDV0T1hsQlFVRkNaekZtVFVnM05FRkJRVkZFUVVWWmQxSkJTV2RMT1VSMWVXdHNUbmhqUTBKcWRrUkthV05TTXpKSU9Tc0tUekJxVnpKM1QzVmhkWFowYTJVMGVFSlhORU5KUlhsWWExWjNWSEpXVnpOcFJqYzNVRUpPVkVkRVVqZHlORUZOU2tGQmVWWnhTRlpwYVdKYVdtZHdaUXBOUVc5SFEwTnhSMU5OTkRsQ1FVMUVRVEpqUVUxSFVVTk5RV0ZyT0dOc1VGbHBjMEpqYm10blZVSkRUV3hNWmpKQ0wyczJkR2hZVm5aMEsxZ3ZRemwwQ2tKdVdGWkxXbVpzU3pGNFZuVXhSWGRPU2xGR09GRkpiRFozU1hkSFNHdFZUaXRwYlV3eWQyb3hRbFEwSzNkQlptZGFaRnAwU0d0Qk56SlVSWEUyZEhNS1prNUJRMm92VFhseVNIUm1lR2RWV0hweGNXdFpXbmhpUVdsRVJBb3RMUzB0TFVWT1JDQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENnPT0ifX19fQ==",
          "integratedTime": 1663625362,
          "logIndex": 3564147,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/alpine-base/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3085952335",
      "sha": "487b8eb17c23150cf9fa421b69de9f58eb419a1d"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

