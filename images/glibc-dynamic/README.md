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
| `latest` | `sha256:b25ae020b12b9410ea7c6ec496490ef86f20b66075e03d2302c76ad03909633a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:b25ae020b12b9410ea7c6ec496490ef86f20b66075e03d2302c76ad03909633a) | `amd64` |



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
        "docker-manifest-digest": "sha256:b25ae020b12b9410ea7c6ec496490ef86f20b66075e03d2302c76ad03909633a"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "463dbed801b1c07209a786dff7e9bbfbd16dee08",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/glibc-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDI6eEIShN56ZxDdPalqKP2KBA+hiDHNXzfcYwpR4MeOwIhAMMOfiKEe5FOM8iGgWRwe2OS4gI/b26EYWgMGJuLnb9S",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI0OTgxZmM4Y2Y0NGYyN2RiZjc0ZTcyYzM2ZTU3M2FhNWM5OTljNzZmNWExZDFjODk1OWYwNzZkYzIwYWRmMTFhIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJSGpoNFlXdlhtNWEzeXdHZVZocG1VR2syb2RDNU14eXFhS1BVR09TT0NtMEFpQitwOE9TRkZZcHRoSGQ0T3Ayb2V6dUVBVDl1dVJGazlMREVlZzhWbEdFa0E9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjFWRU5EUVhvclowRjNTVUpCWjBsVlptb3dSR1V6V2k5MVExTlFWV2h6UlU0NWIwdzFNa1pLVkZsUmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhoTlJFbDZUMFJSZDFkb1kwNU5ha2w0VFVSRmVFMUVTVEJQUkZGM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZWVVc0eVZYTk5XVEZDVlZwWmEya3JZWFpPVm1SUFdrUjJURWRWVlZsS1lsVXpPRUlLWjNCVVNVNVJaVzVMY0VWbVpWSkZkV0pFVG5wTVpIVm5lblEyUzFwWE1rOXBZMm8xUmtWV1dYSlVSamM1TDJ4RmFIRlBRMEZzTkhkblowcGhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZxV0hsRUNsVTBiVW92SzI5dlVEWTJWSE1yTnpOTE5EQmFkbGhKZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKM1dVUldVakJTUVZGSUwwSkhWWGRaTkZwb1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhOaFYwcHFURmRTTldKdFJuUmhWMDEyVEcxa2NHUkhhREZaYVRrellqTktjbHB0ZUhaa00wMTJZMjFXYzFwWFJucGFVelUxQ2xsWE1YTlJTRXBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUVRWQ1oyOXlRbWRGUlVGWlR5OU5RVVZDUWtOMGIyUklVbmRqZW05MlRETlNkbUV5Vm5VS1RHMUdhbVJIYkhaaWJrMTFXakpzTUdGSVZtbGtXRTVzWTIxT2RtSnVVbXhpYmxGMVdUSTVkRTFDV1VkRGFYTkhRVkZSUW1jM09IZEJVVWxGUTBoT2FncGhSMVpyWkZkNGJFMUVXVWREYVhOSFFWRlJRbWMzT0hkQlVVMUZTMFJSTWsweVVtbGFWMUUwVFVSR2FVMVhUWGRPZWtsM1QxZEZNMDlFV210YWJWa3pDbHBVYkdsWmJWcHBXa1JGTWxwSFZteE5SR2QzU0VGWlMwdDNXVUpDUVVkRWRucEJRa0pCVVU5Uk0wcHNXVmhTYkVsR1NteGlSMVpvWXpKVmQweFJXVXNLUzNkWlFrSkJSMFIyZWtGQ1FsRlJabGt5YUdoaFZ6VnVaRmRHZVZwRE1YQmlWMFp1V2xoTmRsb3llSEJaYlUxMFdraHNkVmxYTVhCWmVrRmtRbWR2Y2dwQ1owVkZRVmxQTDAxQlJVZENRVGw1V2xkYWVrd3lhR3haVjFKNlRESXhhR0ZYTkhkbldXOUhRMmx6UjBGUlVVSXhibXREUWtGSlJXWkJValpCU0dkQkNtUm5RVWxaU2t4M1MwWk1MMkZGV0ZJd1YzTnVhRXA0UmxwNGFYTkdhak5FVDA1S2REVnlkMmxDYWxwMlkyZEJRVUZaVUVVMlNsVlpRVUZCUlVGM1FrZ0tUVVZWUTBsSWRqTkxNbUl6ZERWa05HY3daV01yTnpGbmVYWnNWMlp2ZGtGQ1QwRldWa2xwY2pKRmREVTJjakJSUVdsRlFUVjBjR1ZHVDJwMVNXeGxad3BtVjFaT2MwY3hhR05PV1V0T09ITlFZMnBaVlhaNGJIQkhhWGx1ZEZWcmQwTm5XVWxMYjFwSmVtb3dSVUYzVFVSaFFVRjNXbEZKZDFCRWRrMXNUa1VyQ21WRldqUkdTa3RxU1RCb05GWkpVMnhpUWxNNGVscDJaVWRKWlhFd1JWcFRRemxvTkRGc2NuSk1WR2h4Tm5kV1FWQTJOMlpUV0ZWelFXcEZRUzlzUjJzS2JVcHFaMmcwUVRVeVZEWjZaRTAzVEc1ek9HWklNMUJRWms1SVVVcEZNMFp1WW1SWFJXTjBOMHczWlVsekwxRTJhbnAzVUdWRVNrWlRkbWN5Q2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1665455927,
          "logIndex": 4862357,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/glibc-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/glibc-dynamic",
      "githubWorkflowSha": "463dbed801b1c07209a786dff7e9bbfbd16dee08",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3223736711",
      "sha": "463dbed801b1c07209a786dff7e9bbfbd16dee08"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

