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
| `latest` | `sha256:ad544f0bb19baef68d4d05a689d1d364a7c80ee7d083363bb63eacb07609f3dd`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ad544f0bb19baef68d4d05a689d1d364a7c80ee7d083363bb63eacb07609f3dd) | `amd64` |



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
        "docker-manifest-digest": "sha256:ad544f0bb19baef68d4d05a689d1d364a7c80ee7d083363bb63eacb07609f3dd"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "1838479398d53e1b7307be219abc12d637c92eda",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/glibc-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDiX2NqJhUG+sUf/5Ktq2c+VHczqNbMmNCelDjGJxcNfQIga6RnQU9/CL2Af9m8FZXogYtspyO9c6bHwn3Me92+iJo=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJlOGEzNDYyMDZiZjdlOWRlMjA1ODUwOGUxYWY3M2JkNjY4NzBkMjY0ZTAyYmM2ZjgyOWUxYjhhMzFhNWIzN2UxIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQkMzZW14d3FNbFoybzVTVE9tQ2RFc3RpSStxMGhuYWRqSU9HN0x0UTBlU0FpRUF2UjR0dVcxMVJCWE5VRGNVYkx3RkxJZW81a3pkRVhCYmdYOGd6SFdFRHNFPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlWRU5EUVhwTFowRjNTVUpCWjBsVldUQTViazlSTjBOalRIUnROR28xVURoSlUza3JSRVZaT0RNMGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlROTlJFbDZUMFJSZDFkb1kwNU5ha2wzVDFSRk0wMUVTVEJQUkZGM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZxUTBObmNrRlFjWEJsVVZKSlJXbHFjVUZJWkhoU2NtbDJVMmhyZFc4NVRrRTBOMklLYjNGd1NHdHlUR3RKVjBGV1FtUlZjVWgxZFVWM1drWmpRbE5oWlhSelJVTk5hbVYxZFhRMVJuSnZla2wwVUVaTVowdFBRMEZzUlhkblowcE9UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZGTmk5SENrczFNMWhhUzJGdE1ERXdjWHBvTDNaYVJrNDJXVWhyZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGQldVUldVakJTUVZGSUwwSkdOSGRZU1ZwaFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BhTW5od1dXMU5kRnBJYkhWWlZ6RndXWGs0ZFZveWJEQmhTRlpwVEROa2RtTnRkRzFpUnprelkzazVlVnBYZUd4WldFNXNURzVzYUdKWGVFRmpiVlp0Q21ONU9XOWFWMFpyWTNrNWRGbFhiSFZOUkd0SFEybHpSMEZSVVVKbk56aDNRVkZGUlVzeWFEQmtTRUo2VDJrNGRtUkhPWEphVnpSMVdWZE9NR0ZYT1hVS1kzazFibUZZVW05a1Ywb3hZekpXZVZreU9YVmtSMVoxWkVNMWFtSXlNSGRHWjFsTFMzZFpRa0pCUjBSMmVrRkNRV2RSU1dNeVRtOWFWMUl4WWtkVmR3cE9aMWxMUzNkWlFrSkJSMFIyZWtGQ1FYZFJiMDFVWjNwUFJGRXpUMVJOTlU5SFVURk5NbFY0V1dwamVrMUVaR2xhVkVsNFQxZEdhVmw2UlhsYVJGbDZDazR5VFRWTmJWWnJXVlJCWTBKbmIzSkNaMFZGUVZsUEwwMUJSVVZDUVRWRVkyMVdhR1JIVldkVmJWWnpXbGRHZWxwVVFXMUNaMjl5UW1kRlJVRlpUeThLVFVGRlJrSkNhR3RoV0U0d1kyMDVjMXBZVG5wTU1tUnpZVmRLYWt4WFVqVmliVVowWVZkTmQwaFJXVXRMZDFsQ1FrRkhSSFo2UVVKQ1oxRlFZMjFXYlFwamVUbHZXbGRHYTJONU9YUlpWMngxVFVsSFRFSm5iM0pDWjBWRlFXUmFOVUZuVVVOQ1NEQkZaWGRDTlVGSVkwRkRSME5UT0VOb1V5OHlhRVl3WkVaeUNrbzBVMk5TVjJOWmNrSlpPWGQ2YWxOaVpXRTRTV2RaTW1JelNVRkJRVWRFVTFVdk1qVm5RVUZDUVUxQlUwUkNSMEZwUlVGdk5DdEpiemQwU2pKRE5XUUthVXR6Y0ZWamIzY3JZV2xpZEdKdlRGcFJiMVEwWkVWTVpFWk1abmhDVlVOSlVVUm5ORVJYWWk4clpIWm9TMDFaVUU5TlNIRjJMMXB4ZFdocFNFRXhhd3ByVFdZNVdtWnhlRU52VW1WVVJFRkxRbWRuY1docmFrOVFVVkZFUVhkT2NFRkVRbTFCYWtWQmR6QjJTVVpIVEZKMFNqbHJRMEp5ZUhoM2RqTjNOVzFUQ2xNdlIySXlRblUwUjNsUU1IWklUbTU1Wm5KeWFreE5jVmM0YVZBMVFtNDRUa2RZZFRFeEx6WkJha1ZCTTJkR1kwVklOekZOTDFCbk5VaHBWMlZLZG1NS1VsY3JTbkV2ZDFwc2J6TjFUelZPUkdWRFJFbFlaV1JqYnpkNlpVaDFXV1JVUmpKTFR6VmFZVXRzYTNFS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1663382328,
          "logIndex": 3523981,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/glibc-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3071826721",
      "sha": "1838479398d53e1b7307be219abc12d637c92eda"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

