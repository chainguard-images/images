# glibc-dynamic

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/glibc-dynamic/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/glibc-dynamic/actions/workflows/release.yaml)

Base image with just enough to run arbitrary glibc binaries.<br/><br/>This image is meant to be used as just a base image only. It does not contain any programs that can be run, other than `/sbin/ldconfig`.<br/><br/>You must bring your own artifacts to use this image, e.g. with a Docker multi-stage build. If you want locale support other than `C.UTF-8`, you must bring your own locale data as well. This may change in the future based on user feedback.<br/><br/>See also [musl-dynamic](https://github.com/chainguard-images/musl-dynamic) which is an equivalent image for running dynamically-linked musl binaries.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/glibc-dynamic:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:fd601593d7d825eb6d28862db3f7c9a3e5cf3927f962d2c5a4e63b8c60d2b2f8`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:fd601593d7d825eb6d28862db3f7c9a3e5cf3927f962d2c5a4e63b8c60d2b2f8) | `amd64` |



## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/glibc-dynamic:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/glibc-dynamic:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/glibc-dynamic"
      },
      "image": {
        "docker-manifest-digest": "sha256:fd601593d7d825eb6d28862db3f7c9a3e5cf3927f962d2c5a4e63b8c60d2b2f8"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "bea48ce1a0913e4b1e3f86262b4448870f06d5b1",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/glibc-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQC6PxumBwZC+ht0xmVj7ESfenXhX3l0atxd2KgzfrSYrQIhAMjsGQeGa+lb84g3B7H6xHjACBSS/BXfvmq89en/GBx8",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJkY2UwZDMyZDMwNDBmZDZkZmQ2YzMyYzM4ZTAwOGVkMjExNjdmNjVjNWMwNWYxOGNkOTY2YmY1YWQ2YjIwZTljIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNLeE50ZkVFQUlGc2RkbjlmdWFtRC84MUNGKzlDaUpFZTlpWGJTUTNIZG5nSWhBSWNiNnR5UnNaYWFaSmkxOVV4TC96QUxvUGFxajVYdElzNWdkR1F4d1Y3NSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBWRU5EUVhwMVowRjNTVUpCWjBsVlFYUkZLMXBOVTJWVFZIWm5kMU42UlRGcVdYTkNLMkV2SzJOQmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hkTlZHTXhUMFJSTWxkb1kwNU5ha2wzVDFSSmQwMVVaM2RQUkZFeVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZqVm1SUmFqaHBkVXcyWjNBeE4zcHdZa295VUd3eVNIWnFhalZ4TVU5UVIzbGthVUVLUzNrdk0wcDVaalZpVVc1SmJIUkJPSFUzTVZSQmFUQnZWVzAzYkVwa1N6YzFOMGRoVTJWVVZtZ3ZRekpKYVdwcmFtRlBRMEZzYjNkblowcFhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZYVkZkQkNrOXFkV1JNZFN0WFdIZ3lNV1ptU2tveWIxSm5SVGx6ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKM1dVUldVakJTUVZGSUwwSkhWWGRaTkZwb1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhOaFYwcHFURmRTTldKdFJuUmhWMDEyVEcxa2NHUkhhREZaYVRrellqTktjbHB0ZUhaa00wMTJZMjFXYzFwWFJucGFVelUxQ2xsWE1YTlJTRXBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUVRWQ1oyOXlRbWRGUlVGWlR5OU5RVVZDUWtOMGIyUklVbmRqZW05MlRETlNkbUV5Vm5VS1RHMUdhbVJIYkhaaWJrMTFXakpzTUdGSVZtbGtXRTVzWTIxT2RtSnVVbXhpYmxGMVdUSTVkRTFDU1VkRGFYTkhRVkZSUW1jM09IZEJVVWxGUWtoQ01RcGpNbWQzVG1kWlMwdDNXVUpDUVVkRWRucEJRa0YzVVc5WmJWWm9Ua1JvYWxwVVJtaE5SR3Q0VFRKVk1GbHFSbXhOTWxrMFRtcEpNazF0U1RCT1JGRTBDazlFWTNkYWFrRXlXa1JXYVUxVVFXTkNaMjl5UW1kRlJVRlpUeTlOUVVWRlFrRTFSR050Vm1oa1IxVm5WVzFXYzFwWFJucGFWRUYwUW1kdmNrSm5SVVVLUVZsUEwwMUJSVVpDUWpscVlVZEdjR0p0WkRGWldFcHJURmRzZEZsWFpHeGplVGx1WWtkc2FWbDVNV3RsVnpWb1lsZHNhazFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxuV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUk0UWtodlFXVkJRakpCUVdobkNtdDJRVzlWZGpsdlVtUklVbUY1WlVWdVJWWnVSMHQzVjFCalRUUXdiVE50ZGtOSlIwNXRPWGxCUVVGQ1p6RjNUbUZHWTBGQlFWRkVRVVZqZDFKUlNXY0tUeXRHVUVST1VVNHJlREJtWVZreVVVMTVaM1ZNZW14NEt6aDBaR0Z2VEV4RlJqUlRjMGsyU1hoaFdVTkpVVVJwZFc5elMyUlpRbFozTVZkVEwxRjVZd3BLYVUweldpdFdWMHB5TVZOQlkyWTFlRVExVVVrMmQybzJha0ZMUW1kbmNXaHJhazlRVVZGRVFYZE9iMEZFUW14QmFrRkljWFYyYUhSS1VVRkZiVXQ2Q25KVlQzWjBTWFkzVldGdFNHTTVMMDFWYmxRd1dXSmtiM1ZrY2k5c1pqTjViamRITlRkeFpXOHZjSFpYWkU4ekszZDVaME5OVVVOQ1UwSmtPVkpLT1hNS2MxSTJTR3hHY3pOU2RGWXhla1ZIVjBKR00zazVNMEUxV0hVNU5VRmpNbG8wVEZkSlRDOUZaRU5qVDBoelRHVTVjbmxWZDFoR2F6MEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1663696736,
          "logIndex": 3620654,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/glibc-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3092337334",
      "sha": "bea48ce1a0913e4b1e3f86262b4448870f06d5b1"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

