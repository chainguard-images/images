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
| `latest` | `sha256:27669455acb18f713cb509ccd51c0b3c7faed0bb11a8adc8d26dd4b6cc694831`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:27669455acb18f713cb509ccd51c0b3c7faed0bb11a8adc8d26dd4b6cc694831) | `amd64` |



## Signing

All distroless images are signed using [Sigstore](https://sigstore.dev)!

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
        "docker-manifest-digest": "sha256:27669455acb18f713cb509ccd51c0b3c7faed0bb11a8adc8d26dd4b6cc694831"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "04daa45dbad34721c14a952f8e2aa6d6beb9def9",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/glibc-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIFKL2ddHs30dPHXSpgKwCdVV9ZLqNmJ1foSjhOn5lgvmAiEAiayo391nUtP7RKDIAhBlH1s++Ux154xMQiBerwIRJSA=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIzYWJiZWMyOTY2YzNiZGQ2ZDNjMGEzNzM0MTBjYjRiMTUxNGVlNWMyYjg0YjBjZGExZmQzMjI1MjA3NTViMDJlIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJSDRtR09paWNOanJaY21WMktvQUVJRVF6T0pGOVo3VzErcGcxa3R2V09hQUFpRUFuNThYRlNwMVRGTkNLSWdUY1RsQVdhZlM2N0RoTUFOa2RUUnRWcC9SWXdZPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndla05EUVhrMlowRjNTVUpCWjBsVll6Qm5WWEpQUW1GT1NVcHRSVkJSTUdFMmNUZHVaME5EUnpoM2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRWTmFrbDRUbFJOTlZkb1kwNU5ha2wzVDFSRk5VMXFTWGxPVkUwMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZqZEVNcmNuVXZUbmhCYjFSbmMwazJjRFI1Y3k5bVRrWkNTMnQ2Vkhrdk4wWXdZMDRLUVVwME9YTnRaVFYyYkhOc1lVZERUR1p4VUc4elpXTm1lVk5EZDI5d2NHNXNVRFl3VG5ZNVFraDBTMXBDZG14S2RHRlBRMEZyTUhkblowcEtUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlY1Y1U1WENrNUVNRXhCZUdsSWRUWk9jRW92VlhKdGVYRjNVbTgwZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGQldVUldVakJTUVZGSUwwSkdOSGRZU1ZwaFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BhTW5od1dXMU5kRnBJYkhWWlZ6RndXWGs0ZFZveWJEQmhTRlpwVEROa2RtTnRkRzFpUnprelkzazVlVnBYZUd4WldFNXNURzVzYUdKWGVFRmpiVlp0Q21ONU9XOWFWMFpyWTNrNWRGbFhiSFZOUkd0SFEybHpSMEZSVVVKbk56aDNRVkZGUlVzeWFEQmtTRUo2VDJrNGRtUkhPWEphVnpSMVdWZE9NR0ZYT1hVS1kzazFibUZZVW05a1Ywb3hZekpXZVZreU9YVmtSMVoxWkVNMWFtSXlNSGRGWjFsTFMzZFpRa0pCUjBSMmVrRkNRV2RSUldOSVZucGhSRUV5UW1kdmNncENaMFZGUVZsUEwwMUJSVVJDUTJkM1RrZFNhRmxVVVRGYVIwcG9Xa1JOTUU1NlNYaFpla1V3V1ZSck1VMXRXVFJhVkVwb1dWUmFhMDV0U214WmFteHJDbHBYV1RWTlFuZEhRMmx6UjBGUlVVSm5OemgzUVZGUlJVUnJUbmxhVjBZd1dsTkNVMXBYZUd4WldFNXNUVU5aUjBOcGMwZEJVVkZDWnpjNGQwRlJWVVVLUjBkU2NHTXpVbmxpTW5oc1l6Tk5kbG95ZUhCWmJVMTBXa2hzZFZsWE1YQlpla0ZrUW1kdmNrSm5SVVZCV1U4dlRVRkZSMEpCT1hsYVYxcDZUREpvYkFwWlYxSjZUREl4YUdGWE5IZG5XWE5IUTJselIwRlJVVUl4Ym10RFFrRkpSV1pSVWpkQlNHdEJaSGRCU1ZsS1RIZExSa3d2WVVWWVVqQlhjMjVvU25oR0NscDRhWE5HYWpORVQwNUtkRFZ5ZDJsQ2FscDJZMmRCUVVGWlRsZ3dhalZpUVVGQlJVRjNRa2xOUlZsRFNWRkVOa2x3WWpoMGJXeHZWMnhzVDBoSWFFTUtaRTB3WTFnMVpVcDFibVF6U0doSFMwcDJSRzVTVTBaS2IzZEphRUZLZW5oUk5VOTVMM2RUY21waFNtSmhRVVIyU1dObVEyWndObEZ0VlhVM2RsWmhRUW9yTkVsdFQwZEJjRTFCYjBkRFEzRkhVMDAwT1VKQlRVUkJNbU5CVFVkUlEwMURVa1ZyYlZnelZIaE5jbk5NVTA1MU5tUkpjMjV2TTBSWFRGVkRUREkwQ25wUFdtZEpaekl5VGtvNFdXRnZiRTUzT1dOVFlWWTNXbnB5TkM5UFluVmplSGRKZDFCSVQzaHFRakZtT0ZoTk5UQllabTFOTDJabWMyaDFXVkUxVDBZS2VqUnlWekI1Umpkb1kzVjZkazFtYXpsRlQzZGtRV2RYUmt0QlpYVTVORVJ5ZG1WVENpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1663625743,
          "logIndex": 3564604,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/glibc-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3085988671",
      "sha": "04daa45dbad34721c14a952f8e2aa6d6beb9def9"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

