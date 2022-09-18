# busybox

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/distroless/readme-generator
-->

[![CI status](https://github.com/distroless/busybox/actions/workflows/release.yaml/badge.svg)](https://github.com/distroless/busybox/actions/workflows/release.yaml)

An image that contains busybox and musl, suitable for running any binaries that only have a dependency on musl.

## Get It!

The image is available on `distroless.dev`:

```
docker pull distroless.dev/busybox:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `1.35.0-r25` `latest` | `sha256:60d60b9d5d68547772208f71f44c442ea435e017a78d927ecaf0e7d7c16a3cf2`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:60d60b9d5d68547772208f71f44c442ea435e017a78d927ecaf0e7d7c16a3cf2) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |



## Signing

All distroless images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify distroless.dev/busybox:latest | jq
```

Output:
```
Verification for distroless.dev/busybox:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/distroless/busybox"
      },
      "image": {
        "docker-manifest-digest": "sha256:60d60b9d5d68547772208f71f44c442ea435e017a78d927ecaf0e7d7c16a3cf2"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "4f7a33fb172f85f633091a499554c80d70bbd483",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/busybox",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCC4z4jZCnIygwZGCBPPBRSHa9MMsTejNkj7zUOqIV5fAIgFOcQlWZRZ/jLP5EW3UuPQZ+5k6gd0EdKc+Vk0uXEHyk=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIyOGU2Zjg0NDg1YzViMzc0NGE3ZjJhNmIxODQ0Yzg4ZTRkMTZmMDgxMTQ3MzA4YjFkNzE3MjBkYTJlNzVkZDEwIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNvcDFhZU0zVmVqc0JVeThLNG5CZ1BkK2ROdmtNSW9mcms0bFRMQ05aa1BnSWhBT1pZTFdneTNMT2RidHlSSzFCSjBuWWphQkRXTTh1S3JZL3J4TWpKZnhkQiIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnVha05EUVhsVFowRjNTVUpCWjBsVlVrMU1PVXRXUTA5MmNXOVNabXhhWjI5M0x6bGFSVzFOUmxOWmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRSTlJFRXdUa1JCTWxkb1kwNU5ha2wzVDFSRk5FMUVRVEZPUkVFeVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZHTVZseEsxZzVUVkpuVW5GM05ESXdlRVZVZWpreWVXeDRPRlExUlZCcmRXNUthRlVLV2xod2FrNTFTVXBCZDBvM1RYSXlRMkpEYUVsUFlXSkVRWGhrU1RKVkswNDJTVTgzUlN0VVNEQXJiRXRWWTBwSlpUWlBRMEZyVFhkblowa3ZUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV6U2tkSUNucFFha3c0UjJJelVrTk1kUzlXVG5Ka2NsZ3lSVzA0ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFsbldVUldVakJTUVZGSUwwSkdaM2RXYjFwVllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BaYmxaNlpWZEtkbVZET0hWYU1td3dZVWhXYVV3elpIWmpiWFJ0WWtjNU0yTjVPWGxhVjNoc1dWaE9iRXh1YkdoaVYzaEJZMjFXYldONU9XOWFWMFpyQ21ONU9YUlpWMngxVFVSclIwTnBjMGRCVVZGQ1p6YzRkMEZSUlVWTE1tZ3daRWhDZWs5cE9IWmtSemx5V2xjMGRWbFhUakJoVnpsMVkzazFibUZZVW04S1pGZEtNV015Vm5sWk1qbDFaRWRXZFdSRE5XcGlNakIzUm1kWlMwdDNXVUpDUVVkRWRucEJRa0ZuVVVsak1rNXZXbGRTTVdKSFZYZE9aMWxMUzNkWlFncENRVWRFZG5wQlFrRjNVVzlPUjFreldWUk5lbHB0U1hoT2VrcHRUMFJXYlU1cVRYcE5SR3Q0V1ZSUk5VOVVWVEZPUjAwMFRVZFJNMDFIU21sYVJGRTBDazE2UVdOQ1oyOXlRbWRGUlVGWlR5OU5RVVZGUWtFMVJHTnRWbWhrUjFWblZXMVdjMXBYUm5wYVZFRm5RbWR2Y2tKblJVVkJXVTh2VFVGRlJrSkNTbXNLWVZoT01HTnRPWE5hV0U1NlRESktNV016YkdsaU0yZDNTRkZaUzB0M1dVSkNRVWRFZG5wQlFrSm5VVkJqYlZadFkzazViMXBYUm10amVUbDBXVmRzZFFwTlNVZEtRbWR2Y2tKblJVVkJaRm8xUVdkUlEwSkljMFZsVVVJelFVaFZRVU5IUTFNNFEyaFRMekpvUmpCa1JuSktORk5qVWxkaldYSkNXVGwzZW1wVENtSmxZVGhKWjFreVlqTkpRVUZCUjBSVVp6RjBiMEZCUVVKQlRVRlNha0pGUVdsQmJFSjRlVzE2ZUdrNFpUWk5iVUZ3Tlhwa1NWcE5kREEwU1c5aGJtUUtlRUp5Tkc1MkswSlBjbEZFVjBGSlowVjFTbEpMUlRabU5rNDJRVEJMUzFwSU0yeDNkbEp6TVhWeUswSnROMkpTWTJOa1luTTBURkpUY0ZsM1EyZFpTUXBMYjFwSmVtb3dSVUYzVFVSaFFVRjNXbEZKZUVGUGNscHFkemhoY1M5b1lsaHFaSFpUYkRCVFYxSnRZWFF3V1ZaWGREZGxaRmhITkRWdU5rVkhSR0ZXQ25GSlREUnZkalpEWjA0NFdVaFhRMUUzZGxGQ2QwRkpkMUpFUW1kbVRXbHBVWFZTVDNBeFVtUjRWVGhZY3pZM1IzZGxjMU16Um5Ob1dGTmlZbUZ1VVc0S1pqRnVSSGsxTjB0aWMxWlZWM2QzUTFKbWVEQTRkbEZxQ2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1663461863,
          "logIndex": 3527487,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/busybox/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3075349058",
      "sha": "4f7a33fb172f85f633091a499554c80d70bbd483"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

