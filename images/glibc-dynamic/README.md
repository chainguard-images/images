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
| `latest` | `sha256:a759f2e23a9dae15714289833acaaf354f28b0b66db19f30c63f069b92cdced1`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a759f2e23a9dae15714289833acaaf354f28b0b66db19f30c63f069b92cdced1) | `amd64` |



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
        "docker-manifest-digest": "sha256:a759f2e23a9dae15714289833acaaf354f28b0b66db19f30c63f069b92cdced1"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "949caa64536776cc0941392ef3e48c143edc4a1e",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/glibc-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDbrHdbr0HHLl7frmYnUvT8CF+g2PUlyXPe3CsqkCd8bgIhAIOb+jCY2dcobParpnEQvbGY7slv3CbkAgSH6t+UcX+c",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJiNWQ3YzVjZWE3NmU2NmUyMmI1NzBmYTUzYjM1NGEwMTE5ODJiNDhhYWUzMWRmMGJjNDc1YzMxMmE4NjM3Y2I2In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURtV3ppbDU2akw0NFV2NHdvR3BpY0I3Wmx1NW51TzRTcENWVGcvT3hmeXpnSWdQRmRRYzJQdXhGSFZ5TFNVdHE0VEQ1dGx6NkJ6MmNHcStYOWVSZnQ0dXE4PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjFSRU5EUVhvclowRjNTVUpCWjBsVlRDdGxWbkpSVDA5YWFIcHhNazlsVGxwdFJpdHNhVkJhZDFKSmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1RKTlJFbDVUbnBCZUZkb1kwNU5ha2w0VFVSSk1rMUVTWHBPZWtGNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVVyVVVNM0x5dG9RV3QzZDB4bmJYQjJZbFZUYm1WT056VnJjMWxJS3prck9XeFVOWEVLVW1od1JuQlFhVFV4U0RKRVdVWTJWbmtyU3k5NEswRkNaRWRwWlRkeVZFMVpiV00wUkdabWFHNDBjWGxzTm1aTWNXRlBRMEZzTkhkblowcGhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ6ZVZsa0NsVXhWMjFoZUcwd2NucHpObGxSWXpkeVoxVlBNRWxWZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKM1dVUldVakJTUVZGSUwwSkhWWGRaTkZwb1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhOaFYwcHFURmRTTldKdFJuUmhWMDEyVEcxa2NHUkhhREZaYVRrellqTktjbHB0ZUhaa00wMTJZMjFXYzFwWFJucGFVelUxQ2xsWE1YTlJTRXBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUVRWQ1oyOXlRbWRGUlVGWlR5OU5RVVZDUWtOMGIyUklVbmRqZW05MlRETlNkbUV5Vm5VS1RHMUdhbVJIYkhaaWJrMTFXakpzTUdGSVZtbGtXRTVzWTIxT2RtSnVVbXhpYmxGMVdUSTVkRTFDV1VkRGFYTkhRVkZSUW1jM09IZEJVVWxGUTBoT2FncGhSMVpyWkZkNGJFMUVXVWREYVhOSFFWRlJRbWMzT0hkQlVVMUZTMFJyTUU5WFRtaFpWRmt3VGxSTk1rNTZZekpaTWsxM1QxUlJlRTE2YTNsYVYxbDZDbHBVVVRSWmVrVXdUVEpXYTFsNlVtaE5WMVYzU0VGWlMwdDNXVUpDUVVkRWRucEJRa0pCVVU5Uk0wcHNXVmhTYkVsR1NteGlSMVpvWXpKVmQweFJXVXNLUzNkWlFrSkJSMFIyZWtGQ1FsRlJabGt5YUdoaFZ6VnVaRmRHZVZwRE1YQmlWMFp1V2xoTmRsb3llSEJaYlUxMFdraHNkVmxYTVhCWmVrRmtRbWR2Y2dwQ1owVkZRVmxQTDAxQlJVZENRVGw1V2xkYWVrd3lhR3haVjFKNlRESXhhR0ZYTkhkbldXOUhRMmx6UjBGUlVVSXhibXREUWtGSlJXWkJValpCU0dkQkNtUm5RVWxaU2t4M1MwWk1MMkZGV0ZJd1YzTnVhRXA0UmxwNGFYTkdhak5FVDA1S2REVnlkMmxDYWxwMlkyZEJRVUZaVVZOSVZURnNRVUZCUlVGM1FrZ0tUVVZWUTBsUlEzRlhSMHRMY0hKV2VscHlUbWhMTjAxcWJYTlZRWGxyV0V4dmFrNXZhVlpqZVhoaVNETnJkV3BHZEdkSlowVjNZbGhCWmtVMFR6VjBiZ3BZT0VaS05FbFBNVk5oVEdJcmRXZEhWa1JVVlc5cU9IVlpNalJZUjBGUmQwTm5XVWxMYjFwSmVtb3dSVUYzVFVSYWQwRjNXa0ZKZDBGTFRTdEVRV1JCQ204MFMzVjFVVWRJVlRsWlZHNVNkRWxRVGsxcWRVTk5kM295Y1daQ1RGSnBabWRSWWtWQ1IxaDBhV3BLY0VoRmIyUk9WbWhTUWpOQlFXcENTV05HVDNBS0swMWxabXB2SzFseE1tbGpSREZVUVVKUU0yZFNWbWNyYjBwMk5sRjFZV0Z6VlVWWU1HUkdlRkJ1VFd4WVVHMXZlbW81Ylc1UGVYWXhOMGs5Q2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1666751224,
          "logIndex": 5875305,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/glibc-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/glibc-dynamic",
      "githubWorkflowSha": "949caa64536776cc0941392ef3e48c143edc4a1e",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3325731255",
      "sha": "949caa64536776cc0941392ef3e48c143edc4a1e"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

