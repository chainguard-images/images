# musl-dynamic

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/distroless/readme-generator
-->

[![CI status](https://github.com/distroless/musl-dynamic/actions/workflows/release.yaml/badge.svg)](https://github.com/distroless/musl-dynamic/actions/workflows/release.yaml)

Base image with just enough files to run static binaries!<br/><br/>This image is meant to be used as a base image only, and is otherwise useless. It contains the `alpine-baselayout-data` package from Alpine, which is just a set of data files needed to support glibc and musl static binaries at runtime.<br/><br/>This image can be used with `ko build`, `docker`, etc, but is only suitable for running static binaries.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/musl-dynamic:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `1.2.3-r1` `latest` | `sha256:6247576b1a633d97430e0a461ecb455c9efdfb1f24d42157a287fb0cbd127f11`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:6247576b1a633d97430e0a461ecb455c9efdfb1f24d42157a287fb0cbd127f11) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


## Usage

See the [examples/](./examples/) directory for
an example C program and associated Dockerfile
that can be used with this image.


## Signing

All distroless images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/musl-dynamic:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/musl-dynamic:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/distroless/musl-dynamic"
      },
      "image": {
        "docker-manifest-digest": "sha256:6247576b1a633d97430e0a461ecb455c9efdfb1f24d42157a287fb0cbd127f11"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "ed8b8358f5b056412fe01ec3feb249effc0e430e",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/musl-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIDQ4VTGifecL/MHC4IdKeVeXo5lYmwyyV75pmAsv6KUTAiEAu6fE1hh6v3adC3Y2/+JceiMgO/g2yIGV4V/G49Ei79g=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIzYjI5NjBlMWY3N2UxZDNkMDRmZjA2NzQ4M2NiZDAyOGJiNDdlOGMxMjBjY2M2MDk1YmYyNjdjNzA1NWNiZjQ1In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJRGdWKzJyQ2UvTXhxczBvNGNmdHVUdlVqRlF5MFQvSVg0YjZYazdkaFVoWUFpQkNIOUs3UldjelZPNzFuM2dGSVJYeVdiZVIrV1J6Yk5QNDcwNUovTktzRUE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhSRU5EUVhrclowRjNTVUpCWjBsVlVETXlZME5vUVhwUlVFa3dXVlZPZEZWNE56UnlkVEZ6Vms5QmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlROTlJFbDRUbFJCZWxkb1kwNU5ha2wzVDFSRk0wMUVTWGxPVkVGNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVY1U21KM2JVOURVMVJoVWtwaGVUQjNZWGRaTkhwVldscEJOMVptTUZOTVpWRlphbG9LYVVKNE9XeG5UMHN2V1VoUGJ6bERNSFF6UjBweWJqRnhiaTh4UmtoT1lVVnhibkJuUWxwQ01URjNVWFU0VkZJcksyRlBRMEZyTkhkblowcExUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlY2YUhoV0NuRTFRa2xLUm5GSldFVlJTMlU0YzB4T2FWZFJlVk0wZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwM1dVUldVakJTUVZGSUwwSkdNSGRYTkZwYVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BpV0ZaNllrTXhhMlZYTldoaVYyeHFUSGsxYm1GWVVtOWtWMGwyWkRJNWVXRXlXbk5pTTJSNlRETktiR0pIVm1oak1sVjFaVmRHZEdKRlFubGFWMXA2Q2t3eWFHeFpWMUo2VERJeGFHRlhOSGRQVVZsTFMzZFpRa0pCUjBSMmVrRkNRVkZSY21GSVVqQmpTRTAyVEhrNU1HSXlkR3hpYVRWb1dUTlNjR0l5TlhvS1RHMWtjR1JIYURGWmJsWjZXbGhLYW1JeU5UQmFWelV3VEcxT2RtSlVRVmRDWjI5eVFtZEZSVUZaVHk5TlFVVkRRa0ZvZWxreWFHeGFTRlp6V2xSQk1ncENaMjl5UW1kRlJVRlpUeTlOUVVWRVFrTm9iRnBFYUdsUFJFMHhUMGRaTVZscVFURk9hbEY0VFcxYWJFMUVSbXhaZWs1dFdsZEplVTVFYkd4YWJWcHFDazFIVlRCTmVrSnNUVUozUjBOcGMwZEJVVkZDWnpjNGQwRlJVVVZFYTA1NVdsZEdNRnBUUWxOYVYzaHNXVmhPYkUxRFZVZERhWE5IUVZGUlFtYzNPSGNLUVZGVlJVWXlVbkJqTTFKNVlqSjRiR016VFhaaVdGWjZZa014YTJWWE5XaGlWMnhxVFVJd1IwTnBjMGRCVVZGQ1p6YzRkMEZSV1VWRU0wcHNXbTVOZGdwaFIxWm9Xa2hOZG1KWFJuQmlha05DYVdkWlMwdDNXVUpDUVVoWFpWRkpSVUZuVWpoQ1NHOUJaVUZDTWtGQmFHZHJka0Z2VlhZNWIxSmtTRkpoZVdWRkNtNUZWbTVIUzNkWFVHTk5OREJ0TTIxMlEwbEhUbTA1ZVVGQlFVSm5NR3MyVmpoelFVRkJVVVJCUldOM1VsRkphRUZQZGtOSFRVSmFiR1JVTmpsS2FUUUtSa2xMZWtoVmJFaDBORGsxUmtkSVdIUTFPVXRsV0ZSS2FUQkNNVUZwUVdVMGJEZE9ORmgzTkVOV1dIbEtiR2h1V2pKWFVEbFdUSFZEYldoSlJXMUJOQW95WVVJd2JXTkhVbXhFUVV0Q1oyZHhhR3RxVDFCUlVVUkJkMDV1UVVSQ2EwRnFRa1EzWW05RVFVVmlRVkE1WkhwdVlrMUViRFpHT0RBMFNIaHJiM2xZQ2tSUmRtNTFjWE5LU2xCcFVsUnFVRlZxUVZWcmMxVXhZeTkxTkZCdFpuWnZlbE52UTAxRWJXMVNVbVZHTDJOdlZ5dG5RVUZOYmxWTWMwczFTeXRPWkVVS09EZ3lVMDFuTkhodVRGQm9OamxxTm14T1dEQmtRekpOTDNKV1dtdDRNRUZRT0hVMlJYYzlQUW90TFMwdExVVk9SQ0JEUlZKVVNVWkpRMEZVUlMwdExTMHRDZz09In19fX0=",
          "integratedTime": 1663380943,
          "logIndex": 3523809,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/musl-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3071772759",
      "sha": "ed8b8358f5b056412fe01ec3feb249effc0e430e"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

