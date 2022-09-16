# glibc-dynamic

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/distroless/readme-generator
-->

[![CI status](https://github.com/distroless/glibc-dynamic/actions/workflows/release.yaml/badge.svg)](https://github.com/distroless/glibc-dynamic/actions/workflows/release.yaml)

Base image with just enough to run arbitrary glibc binaries.<br/><br/>This image is meant to be used as just a base image only. It does not contain any programs that can be run, other than `/sbin/ldconfig`.<br/><br/>You must bring your own artifacts to use this image, e.g. with a Docker multi-stage build. If you want locale support other than `C.UTF-8`, you must bring your own locale data as well. This may change in the future based on user feedback.<br/><br/>See also [musl-dynamic](https://github.com/distroless/musl-dynamic) which is an equivalent image for running dynamically-linked musl binaries.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/glibc-dynamic:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:b8a26b2e6fcadd7db48ab51aa26ddc95f767309b190c8f15ae2cf33604e22092`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:b8a26b2e6fcadd7db48ab51aa26ddc95f767309b190c8f15ae2cf33604e22092) | `amd64` |



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
        "docker-reference": "ghcr.io/distroless/glibc-dynamic"
      },
      "image": {
        "docker-manifest-digest": "sha256:b8a26b2e6fcadd7db48ab51aa26ddc95f767309b190c8f15ae2cf33604e22092"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "2a49f52f3b07624998dcc14c0610dc77d7b6be46",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/glibc-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQD/9i8eHn+fxI5QCYZbvLmEB/MJ2AejrWEZ+pS93nP4YwIgAIQL/zFCbx5sHp35bYwvEZDZ6n8LzVgNdtSvBRlvDA8=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJkYjEwZmVhY2NiMDI5MjM1YTA4Y2I4MGFjMTRmNTk5YjdhMTc0NDI0MTE0YmI4NGU2YmM2NGJhYmM5ZDU0MjdjIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURHSnVCQ3I5VGlMVFlkOUhwRHExOFo4SVhuVGZrVk5ESjlXMVJrU090WlJBSWhBUHpzWTNMeFB3djRtUVlEMnVYbUU1UWxwa2VPT3VqbStIVnM1cG9EdWpFWiIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndla05EUVhreVowRjNTVUpCWjBsVldVOVhZemRIUlZkR0syMHhjbTl6ZWpKVlRuRXlPRWhYT0cwd2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRKTlZGVjZUbXBKZDFkb1kwNU5ha2wzVDFSRk1rMVVWVEJPYWtsM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZsYkVzNVJVNXFLMkZLWTJKb1ZqUkJXVE51Y0hJdlpYbzBUMWRzU1dsT1pXcDJZemtLZGpWNE1sWnVVSEZFYW1sS1UyWmhRMUZHVG1kT1pVOHpjalYzVkM4eU1FWmlObTVVVG05aVZGSkthV0pSWnpCWlJVdFBRMEZyZDNkblowcEpUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZrYUVoMENraFdSak5LVEhweU4ybEZSVWQzYVhGcFVrODBOWEpKZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGQldVUldVakJTUVZGSUwwSkdOSGRZU1ZwaFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BhTW5od1dXMU5kRnBJYkhWWlZ6RndXWGs0ZFZveWJEQmhTRlpwVEROa2RtTnRkRzFpUnprelkzazVlVnBYZUd4WldFNXNURzVzYUdKWGVFRmpiVlp0Q21ONU9XOWFWMFpyWTNrNWRGbFhiSFZOUkd0SFEybHpSMEZSVVVKbk56aDNRVkZGUlVzeWFEQmtTRUo2VDJrNGRtUkhPWEphVnpSMVdWZE9NR0ZYT1hVS1kzazFibUZZVW05a1Ywb3hZekpXZVZreU9YVmtSMVoxWkVNMWFtSXlNSGRGWjFsTFMzZFpRa0pCUjBSMmVrRkNRV2RSUldOSVZucGhSRUV5UW1kdmNncENaMFZGUVZsUEwwMUJSVVJDUTJkNVdWUlJOVnBxVlhsYWFrNXBUVVJqTWsxcVVUVlBWR2hyV1RKTmVFNUhUWGRPYWtWM1drZE5NMDR5VVROWmFscHBDbHBVVVRKTlFuZEhRMmx6UjBGUlVVSm5OemgzUVZGUlJVUnJUbmxhVjBZd1dsTkNVMXBYZUd4WldFNXNUVU5aUjBOcGMwZEJVVkZDWnpjNGQwRlJWVVVLUjBkU2NHTXpVbmxpTW5oc1l6Tk5kbG95ZUhCWmJVMTBXa2hzZFZsWE1YQlpla0ZrUW1kdmNrSm5SVVZCV1U4dlRVRkZSMEpCT1hsYVYxcDZUREpvYkFwWlYxSjZUREl4YUdGWE5IZG5XVzlIUTJselIwRlJVVUl4Ym10RFFrRkpSV1pCVWpaQlNHZEJaR2RCU1ZsS1RIZExSa3d2WVVWWVVqQlhjMjVvU25oR0NscDRhWE5HYWpORVQwNUtkRFZ5ZDJsQ2FscDJZMmRCUVVGWlRrYzRXazVEUVVGQlJVRjNRa2hOUlZWRFNWRkVVazV2Y1c5M1VGaHFTQ3RxUkhCVlZqY0tOWHBMUXpRd2VHSm9NMjl6YnpSMk1HOVBiVWRXYkhWbldGRkpaMU5zYjNSbWVTdHdWVTQ1YjJwcWRuRXpLelE0T0RsV2VWWlZhMk5NZUhKU2JIUkZPQXBRT1dsWmEydE5kME5uV1VsTGIxcEplbW93UlVGM1RVUmhRVUYzV2xGSmVFRk5hMFI1U0d0RGFHWnFPWFZvYjNCWVQzbE5XWFY2YkUxa2NXMHpZVFJsQ21obWEzRXlaR1I1ZWpJeGRHeDBiV2xsVG5KQ1QySlJOMnREY21sRVRrcFdORkZKZDBsTU0yOUVUMFo2TVVJNU5Vc3dlakJVWVdrdlUySmhNemwxVW1FS01UaGpaamhZTDB0eFJqbERhVFZTVGpZclYyVmFjM3AwWlRWWFNrNVpSbk5QTHprNENpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1663342584,
          "logIndex": 3516689,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/glibc-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3069000253",
      "sha": "2a49f52f3b07624998dcc14c0610dc77d7b6be46"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

