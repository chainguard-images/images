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
| `latest` | `sha256:70d8ce2dbd385b1ee0785dbc603a968fc31d8c41e3d64f8d31fc4c43c8375e8c`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:70d8ce2dbd385b1ee0785dbc603a968fc31d8c41e3d64f8d31fc4c43c8375e8c) | `amd64` |



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
        "docker-manifest-digest": "sha256:70d8ce2dbd385b1ee0785dbc603a968fc31d8c41e3d64f8d31fc4c43c8375e8c"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "fdadac80f031871243070df2fb04aa455a4147c2",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/glibc-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIG4I5y/GU1osPpx3WZavDHgtHgG4mQTZVsCobhrnTntoAiEA8VzLz982WTTKwDUwOuX6WGE2P3TXrfKNZ6CZ7lRpKnM=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI3MmY2ZDI1ZmU1MmViMmZmMGQ1YWNmZWQ4OThkYmZjNWI0OWIxZDY1OGNiM2U3YjdkOGJjZDAyM2MwMjY2OTBkIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJR0k4NlJPQzAwekczOThFR3pnMUVub0ZIamRxMkFXVDB5WitvRXdaWUt3M0FpQkViZFJRT3NiZExpUzhEK1NZUjJTSmtWcEdoTGxZVER6ZGR3M3o2eTRyaFE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjFWRU5EUVhvclowRjNTVUpCWjBsVllrMUxZbmhWSzBRMU1USnhaVUpzVERGaE5TOW9SVXh3VFdKVmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hwTlJFa3dUbnBSTlZkb1kwNU5ha2wzVDFSSmVrMUVTVEZPZWxFMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZwTVZST1VrUTBlVlZ2UkRSTVRsbDJRVFJoU21wSk1sWXliVk5oZVRsbFRsQk1heXNLYkZsMmFtTkZkVFJxT1N0S1ZYWTRZMFJPY0RGVU1GcExhRVpCTDJRNWFYcFNVM2R0YVhCTVJ5OVVhamhwYVhWNlltRlBRMEZzTkhkblowcGhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlU1YkV0QkNuWjJVak14ZVVvd2VsazBVak5hVFZOTFdXOVhXVFp2ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKM1dVUldVakJTUVZGSUwwSkhWWGRaTkZwb1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhOaFYwcHFURmRTTldKdFJuUmhWMDEyVEcxa2NHUkhhREZaYVRrellqTktjbHB0ZUhaa00wMTJZMjFXYzFwWFJucGFVelUxQ2xsWE1YTlJTRXBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUVRWQ1oyOXlRbWRGUlVGWlR5OU5RVVZDUWtOMGIyUklVbmRqZW05MlRETlNkbUV5Vm5VS1RHMUdhbVJIYkhaaWJrMTFXakpzTUdGSVZtbGtXRTVzWTIxT2RtSnVVbXhpYmxGMVdUSTVkRTFDV1VkRGFYTkhRVkZSUW1jM09IZEJVVWxGUTBoT2FncGhSMVpyWkZkNGJFMUVXVWREYVhOSFFWRlJRbWMzT0hkQlVVMUZTMGRhYTFsWFVtaFplbWQzV21wQmVrMVVaek5OVkVrd1RYcEJNMDFIVW0xTmJWcHBDazFFVW1oWlZGRXhUbGRGTUUxVVVUTlpla2wzU0VGWlMwdDNXVUpDUVVkRWRucEJRa0pCVVU5Uk0wcHNXVmhTYkVsR1NteGlSMVpvWXpKVmQweFJXVXNLUzNkWlFrSkJSMFIyZWtGQ1FsRlJabGt5YUdoaFZ6VnVaRmRHZVZwRE1YQmlWMFp1V2xoTmRsb3llSEJaYlUxMFdraHNkVmxYTVhCWmVrRmtRbWR2Y2dwQ1owVkZRVmxQTDAxQlJVZENRVGw1V2xkYWVrd3lhR3haVjFKNlRESXhhR0ZYTkhkbldXOUhRMmx6UjBGUlVVSXhibXREUWtGSlJXWkJValpCU0dkQkNtUm5RVWxaU2t4M1MwWk1MMkZGV0ZJd1YzTnVhRXA0UmxwNGFYTkdhak5FVDA1S2REVnlkMmxDYWxwMlkyZEJRVUZaVG05UWJuaFFRVUZCUlVGM1FrZ0tUVVZWUTBsREsyVldPR2hrTUd0eE5qZEliWGN4YjI5aFkyOHhOVTR5YjNWNlVXNVBURmhXVm5KNmNYaFhSRzk2UVdsRlFXcFdTVEkyVGxwYWQwWnRVZ3BKUlM4clQwMU1RbnBxVUhaTGVta3JZMlZqZUdwUWRFdHVWVTkwWmk4d2QwTm5XVWxMYjFwSmVtb3dSVUYzVFVSaFFVRjNXbEZKZUVGTGJERnNkMklyQ20xcVRHeGhPV3hzU0hWRGRtRXJiV28zTUVSaWF6VXliRFJEZW5Kc2Vsa3JNMHQ2T0dKRVkyb3ZkRGRpWkZKb1lYUXJLeTlEY2k5aWJVRkpkMGRKTW5BS2JGaEdkbkZNUVRCU2VYWmFkVzVPYmxkWmJtMDViVXhZT0hWcmFubFVRMUkwZVRoVmMxVnVTVWQzY1ZoT1VUUTJOSGhTYmxvdlprRldSSEpDQ2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1663901276,
          "logIndex": 3784284,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/glibc-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3110081319",
      "sha": "fdadac80f031871243070df2fb04aa455a4147c2"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

