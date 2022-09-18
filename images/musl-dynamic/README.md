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
| `1.2.3-r1` `latest` | `sha256:807839d6dffa94f2818c8b70e4a0b653c153e8673d54352a48813e2b72f41202`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:807839d6dffa94f2818c8b70e4a0b653c153e8673d54352a48813e2b72f41202) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:807839d6dffa94f2818c8b70e4a0b653c153e8673d54352a48813e2b72f41202"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "63236385ef4eae68a5c8bc59bbd10bb3b3825799",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/musl-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCdx7ZYUrmMlSF4+yDBZf5jyW15nGIDR7+9nUo0KZDw2wIgISm5QFLrFkIXkQTp4Yu0WD1a7bWbUly24Jv6jUHWTH4=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJiNjhjZGE2M2UxNzBjYmQ3NmQ5ZWJjMDMwY2U3NGNmNjJjMjExZjYwZDg3Zjc0MmY0M2Q0MGI5YzhmNGQwMmY1In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQ0ovdFJSb3IzOFVjYXRUMFQ5d0puRGl1SHV4K1NJZEY1eHQxYTRWa1QrMkFpQk8reUJQOGlHME5EZEp4eDRycVpqb0J4RmpFTnVQcWMyaDIzdG5pT1o0QWc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhla05EUVhwRFowRjNTVUpCWjBsVlpFVlVRM0JqWnpSRmQwaG5TRWx6ZEROQmNFZHBaMU42ZFhSSmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRSTlJFbDZUbnBCTkZkb1kwNU5ha2wzVDFSRk5FMUVTVEJPZWtFMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZtVlZSUGNVTTBWSEZsYXpKNlJVdGhhVWRWUVdwWWFVUjRZMHBsWmxsSFVFaDFjV2tLZEdacE1YazRNRVJMSzJ3MVNtaFJObEpNYzJwRWR6aEJhVnB6WVRkcFZYaHdUa1IwTm5sbWRWRlhWR2hRYTFKTVVrdFBRMEZyT0hkblowcE1UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlU1T0ZOa0NtZEJRbU16WjI1dFozTkxZaloxWWtONllteElURmxCZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwM1dVUldVakJTUVZGSUwwSkdNSGRYTkZwYVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BpV0ZaNllrTXhhMlZYTldoaVYyeHFUSGsxYm1GWVVtOWtWMGwyWkRJNWVXRXlXbk5pTTJSNlRETktiR0pIVm1oak1sVjFaVmRHZEdKRlFubGFWMXA2Q2t3eWFHeFpWMUo2VERJeGFHRlhOSGRQVVZsTFMzZFpRa0pCUjBSMmVrRkNRVkZSY21GSVVqQmpTRTAyVEhrNU1HSXlkR3hpYVRWb1dUTlNjR0l5TlhvS1RHMWtjR1JIYURGWmJsWjZXbGhLYW1JeU5UQmFWelV3VEcxT2RtSlVRVmRDWjI5eVFtZEZSVUZaVHk5TlFVVkRRa0ZvZWxreWFHeGFTRlp6V2xSQk1ncENaMjl5UW1kRlJVRlpUeTlOUVVWRVFrTm5NazE2U1hwT2FrMDBUbGRXYlU1SFZtaGFWRmswV1ZSV2FrOUhTbXBPVkd4cFdXMVJlRTFIU21sTk1rbDZDazlFU1RGT2VtczFUVUozUjBOcGMwZEJVVkZDWnpjNGQwRlJVVVZFYTA1NVdsZEdNRnBUUWxOYVYzaHNXVmhPYkUxRFZVZERhWE5IUVZGUlFtYzNPSGNLUVZGVlJVWXlVbkJqTTFKNVlqSjRiR016VFhaaVdGWjZZa014YTJWWE5XaGlWMnhxVFVJd1IwTnBjMGRCVVZGQ1p6YzRkMEZSV1VWRU0wcHNXbTVOZGdwaFIxWm9Xa2hOZG1KWFJuQmlha05DYVhkWlMwdDNXVUpDUVVoWFpWRkpSVUZuVWpsQ1NITkJaVkZDTTBGQmFHZHJka0Z2VlhZNWIxSmtTRkpoZVdWRkNtNUZWbTVIUzNkWFVHTk5OREJ0TTIxMlEwbEhUbTA1ZVVGQlFVSm5NRFV3Tm1Vd1FVRkJVVVJCUldkM1VtZEphRUZQVURaaWJqbHJjWGxOYWtGd1RTOEtNVkJzTjJJME1qTk9OVkpsV1dFMGJuVjZUakF4WVRVelNHRjRWRUZwUlVFemVWWlRTVk5VU2tweFpIZFlNVlZLUkhkTU1VNHZSa3hOYVZGdWNVODFXQXA2YVdsWFYzaHhTbEpWUVhkRFoxbEpTMjlhU1hwcU1FVkJkMDFFWVZGQmQxcG5TWGhCVERoU01WRlFhRkF5Y1VsWVRGTjZaRzlEVEVaalRURk1UMnMzQ2xWc2FVRTNSR2w0ZFdaRlRsWmpObmMyVmxwcmRXbEJjbWx5VGxnMVEza3pTMjlEYW1SblNYaEJVSGsxYVZkTU5HSTVSbXROUVZvNGFURllaVVkyY0dFS1J6VnJWM0puT1RaVk9IRkZibkJXY0RWYVRVZEhhR05ETldwbE1XMTJkMWROTURjNVUycGxVbGhCUFQwS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1663468650,
          "logIndex": 3528013,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/musl-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3075582801",
      "sha": "63236385ef4eae68a5c8bc59bbd10bb3b3825799"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

