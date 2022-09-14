# alpine-base

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/distroless/readme-generator
-->

[![CI status](https://github.com/distroless/alpine-base/actions/workflows/release.yaml/badge.svg)](https://github.com/distroless/alpine-base/actions/workflows/release.yaml)

Alpine base image built with distroless tools.

## Get It!

The image is available on `distroless.dev`:

```
docker pull distroless.dev/alpine-base:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `20220415` `20220416` | `sha256:6a0680824538b9e7d88a4d966ca028b659b5e4976eabae997edf82b3d1d9fa9e`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:6a0680824538b9e7d88a4d966ca028b659b5e4976eabae997edf82b3d1d9fa9e) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `latest` | `sha256:45d6c54b8d932f8bc85331f56e0fb4291dcd79d4b8cdcba8674160428db60dcb`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:45d6c54b8d932f8bc85331f56e0fb4291dcd79d4b8cdcba8674160428db60dcb) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
COSIGN_EXPERIMENTAL=1 cosign verify distroless.dev/alpine-base:latest | jq
```

Output:
```
Verification for distroless.dev/alpine-base:latest --
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
        "docker-manifest-digest": "sha256:45d6c54b8d932f8bc85331f56e0fb4291dcd79d4b8cdcba8674160428db60dcb"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "79acd237b4e71aea4128f73f6a770edd0e49850a",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/alpine-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCNVS3RXnkHYSHa+wU6VTxgbQqPDau9MtvHgmFe6aKn7AIgeW9szP1nMC1q8ww95aICSf7uvqvSUeJTuLFo/vW9PjY=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI0ZmUxZmI0YmQ2MTIxZDc2MGFhNmRjOWY2NzIzZDkzNTY2NGQwNjBhNjFhNjU0Y2I3NzVlNThjMjlmZDU4ZGJkIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJRno4YVNZbjVXeGJpK3d0ZlM2aFpyZjV0VVNnOXdKeTJOelFoeFYrUy9nT0FpQlUyL3dob1VWSHRIeHVsYlpwOXRFU0ZEUnFJUHlmOHhQaFpZMENmRWh2U2c9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnZha05EUVhscFowRjNTVUpCWjBsVlEzbERWblYyWWtoTWExRnBTQzh5U0ZCcE5tMXBkbGxLYjBzNGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRCTlZHTjNUMVJCTTFkb1kwNU5ha2wzVDFSRk1FMVVZM2hQVkVFelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZZUVRScloza3dkVVp1YjB3M1kyc3JWMUJ1Vlc1NFNFUllRekZEVjBkMFZuSkVNV0lLWXpjNWQwcHdOMDkyZGtNeFNGSjFlR3B6TDJnNGRWTjJXR1JEVVRSRFduVnVUV2RMWmtWUFoyOWhOekl3TjNWUWNFdFBRMEZyWTNkblowcEVUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZTWVdOdkNuWkNRVmxyWWpoemJtUlNVMEpyY0haV1Uya3dLMGd3ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwbldVUldVakJTUVZGSUwwSkdkM2RYYjFwWllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BaVjNoM1lWYzFiRXhYU21oak1sVjJURzFrY0dSSGFERlphVGt6WWpOS2NscHRlSFprTTAxMlkyMVdjMXBYUm5wYVV6VTFXVmN4YzFGSVNteGFiazEyQ21GSFZtaGFTRTEyWWxkR2NHSnFRVFZDWjI5eVFtZEZSVUZaVHk5TlFVVkNRa04wYjJSSVVuZGplbTkyVEROU2RtRXlWblZNYlVacVpFZHNkbUp1VFhVS1dqSnNNR0ZJVm1sa1dFNXNZMjFPZG1KdVVteGlibEYxV1RJNWRFMUNTVWREYVhOSFFWRlJRbWMzT0hkQlVVbEZRa2hDTVdNeVozZE9aMWxMUzNkWlFncENRVWRFZG5wQlFrRjNVVzlPZW14b1dUSlJlVTE2WkdsT1IxVXpUVmRHYkZsVVVYaE5hbWh0VG5wT2JVNXRSVE5PZWtKc1drZFJkMXBVVVRWUFJGVjNDbGxVUVdOQ1oyOXlRbWRGUlVGWlR5OU5RVVZGUWtFMVJHTnRWbWhrUjFWblZXMVdjMXBYUm5wYVZFRnJRbWR2Y2tKblJVVkJXVTh2VFVGRlJrSkNXbXNLWVZoT01HTnRPWE5hV0U1NlRESkdjMk5IYkhWYVV6RnBXVmhPYkUxQ01FZERhWE5IUVZGUlFtYzNPSGRCVVZsRlJETktiRnB1VFhaaFIxWm9Xa2hOZGdwaVYwWndZbXBEUW1sUldVdExkMWxDUWtGSVYyVlJTVVZCWjFJM1FraHJRV1IzUWpGQlFXaG5hM1pCYjFWMk9XOVNaRWhTWVhsbFJXNUZWbTVIUzNkWENsQmpUVFF3YlROdGRrTkpSMDV0T1hsQlFVRkNaM3A2Tlhwd2QwRkJRVkZFUVVWWmQxSkJTV2RJWVdJMGNXWndka3R1YVZwaE1qVnVZM0pYV0dneFEwb0tSblpRT1dWM1JVbHNhbEZtVW5SU05GQllZME5KU0RrMlFqRXlNekZpZFVwMGREZDNVVkJSVjJwWFpFdE1SRXQxY2xaaGRXVmxOMDlyVDFsWlJEbFRZZ3BOUVc5SFEwTnhSMU5OTkRsQ1FVMUVRVEpuUVUxSFZVTk5VVU42S3pselVETkpkekJ6ZHpNcllqQkRLMFY0ZDNKNmVrVkNUa3cxWldkVFpUa3ZZbWQxQ2xaMVVtczVNbVJNUmsxUlZrRmtNMlY1VVRGbWFWWlhVRmhoUlVOTlNFSmFZVGhzUjJKcllqTndZbmgxTjBKaE5WZDJkMDUzWVdsaWVrUkVUaXRCV1RZS09HTkxWVFpUTjJkcU9IWlhlbVJpT0VkNGQzZElWbTlJYlhodVkxaEJQVDBLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1663175369,
          "logIndex": 3498859,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/alpine-base/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3054681588",
      "sha": "79acd237b4e71aea4128f73f6a770edd0e49850a"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

