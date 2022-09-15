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
| `1.2.3-r1` `latest` | `sha256:208b8b04670ff5e501abac7d06dbccd383a2d5f9814cffab05ca029c9b5ef80f`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:208b8b04670ff5e501abac7d06dbccd383a2d5f9814cffab05ca029c9b5ef80f) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:208b8b04670ff5e501abac7d06dbccd383a2d5f9814cffab05ca029c9b5ef80f"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "434e5e36087724863f173a8f23128dd170816340",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/musl-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDONGCl6BriV9qSA+YIBi2xqcU5g1N+OZ4GLheYI0gXwgIhAPsB7nY6tyeRix6EMscuo57y42Zq9HhjfCdIWZjVcGjG",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJiNGI3NTU4MWUzZDllOWNmNGYwOWJiMWQ0MjM2MGFmOTRmMTJjZTRiMzIyZDgyMTcwMmYyYmM2NGQwYzYzMTJmIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJRzR0RnJ5VDlIeEE2SVpZb1oyRXZWZG9BeDI1V2ZiSTQ1N2swdHJzSnkvbUFpQTZ6NkQyMW9BS1Z2Q1V6UE1mZ01CdHg3UWQyUFMxbnN4TitFa2J1ZG1IL1E9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndha05EUVhsMVowRjNTVUpCWjBsVlJUQlVhblpWU2xrMmNYVXJWbGMxZWtNeGJHczNTRVZEU0ZVNGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRGTlZGbDNUMFJSTTFkb1kwNU5ha2wzVDFSRk1VMVVXWGhQUkZFelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ6YjBaaVoyb3pZVTVZY1U4d1dEaFZMemhQVVd3M2RsRnVXV3BJZHpaT2RUbDJjRWNLUzFjclJXVmtNa3QxTDBGNFYwdDJRV2t6VEd0V1RGZzJSa2hyWm1GdGJGRk5XbUZ0YlZJclRUZFFRVTlQVWl0RGFXRlBRMEZyYjNkblowcEhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZvU21sWkNqSk1hbXQyZUcwMFJHZDVOREptZFRWTFNuVm1kM0IzZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwM1dVUldVakJTUVZGSUwwSkdNSGRYTkZwYVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BpV0ZaNllrTXhhMlZYTldoaVYyeHFUSGsxYm1GWVVtOWtWMGwyWkRJNWVXRXlXbk5pTTJSNlRETktiR0pIVm1oak1sVjFaVmRHZEdKRlFubGFWMXA2Q2t3eWFHeFpWMUo2VERJeGFHRlhOSGRQVVZsTFMzZFpRa0pCUjBSMmVrRkNRVkZSY21GSVVqQmpTRTAyVEhrNU1HSXlkR3hpYVRWb1dUTlNjR0l5TlhvS1RHMWtjR1JIYURGWmJsWjZXbGhLYW1JeU5UQmFWelV3VEcxT2RtSlVRVk5DWjI5eVFtZEZSVUZaVHk5TlFVVkRRa0ZTZDJSWVRtOU5SRmxIUTJselJ3cEJVVkZDWnpjNGQwRlJUVVZMUkZGNlRrZFZNVnBVVFRKTlJHY3pUbnBKTUU5RVdYcGFha1V6VFRKRk5GcHFTWHBOVkVrMFdrZFJlRTU2UVRSTlZGbDZDazVFUVhkSVFWbExTM2RaUWtKQlIwUjJla0ZDUWtGUlQxRXpTbXhaV0ZKc1NVWktiR0pIVm1oak1sVjNTbEZaUzB0M1dVSkNRVWRFZG5wQlFrSlJVVmdLV2tkc2VtUklTblppUjFaNlkzazVkR1JZVG5OTVYxSTFZbTFHZEdGWFRYZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwdENaMjl5UW1kRlJVRmtXalZCWjFGRFFraDNSV1ZuUWpSQlNGbEJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUkZGbGFuVkpRVUZCUWtGTlFWSjZRa1pCYVVWQk4yeGlPSEZ4SzJwVVJqbHNibWxUWTJvNWNsQUtPSEZGTldGeWRqUjJUR1ZRUzJ0SmVrNXpabWd6VkRSRFNVVjVTMkZWTW5WeUswVkpkSFpOUms1NkwyWmFXVk41WkVFdmQzUldiVXRtWTBoTlkycHpaZ281V0hSRVRVRnZSME5EY1VkVFRUUTVRa0ZOUkVFeWEwRk5SMWxEVFZGRWVITkVRWFoyZVVRME0xZGxkelp3Y1ZSSVdqRk1TVk4yTlVsTFVqVkROMHhCQ2twS1IyRmlWRVJCUlhjelYwcEJPRWxUYlZoYWJHTkJibnB0VFZZM1FrbERUVkZFVDJaa2QyWldRWEU0YzBnd05HOUViMXBVTW5rck1IQktSelV3TlRJS05sUjFiMlFyWlVocmJEUndaVWRDYTFGWVNHbE5kMHBXZFU1ak5VRk9ZVTFJVTNjOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1663258159,
          "logIndex": 3509871,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/musl-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3061974977",
      "sha": "434e5e36087724863f173a8f23128dd170816340"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

