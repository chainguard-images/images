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
| `latest` | `sha256:e833b4b56d9901373b10c0ef905f364ec8ac1b0751d0247669818b325553e732`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:e833b4b56d9901373b10c0ef905f364ec8ac1b0751d0247669818b325553e732) | `amd64` |



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
        "docker-manifest-digest": "sha256:e833b4b56d9901373b10c0ef905f364ec8ac1b0751d0247669818b325553e732"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "b5bfc654fd967760cf554325e021f86ecc35e53a",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/glibc-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIAQGO6e9SlCjT36P5y1Wqwosysy4sjmyCObdEOWeyj+VAiEAofzbQwnVn9Gb7SkN2lx9r8RpsVfS3itEIxPlAprBECE=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIxMjVhNWNkM2M4ODE1NjYxYjI0YTA1ODRmMWE4MTAzNzZkN2I0NDljNzZhYTVlZDYwMmNmYWMzNDRjMmJkYjc5In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJRnJoS2FrUWxoL1NpclVpczZJZHZQU1BmT3NPUlBNaXBwNDRxVjdWTVZmdEFpRUFpSmxSYTg1c1B5NWRIanUxZ3d2OGtWR3hhWWtjUnFxZk5VY2c3UmVOV05RPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjFWRU5EUVRCRFowRjNTVUpCWjBsVlZtbHlWbE5TUm1jck1HMUZhSFUyYTFCSllrZEVVMlJqZURsemQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlhwTlJFbDNUMFJCZDFkb1kwNU5ha2w0VFZSRmVrMUVTWGhQUkVGM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZXYzBjMlZDdE1jSFZKYUZOeUwxRnRWWHB2TVZwd2VrcEdVVmxrY2xSNmFVOUllR2NLYUhjeVpFRjZTazVZT1hCdFlUZE1TVXhWVGxGWVRUZEJNbmR1WVRjMmEzZEpORmhwVWxacGN6RnVkSEZpU0hwVVdUWlBRMEZzT0hkblowcGlUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlUwUWxrM0NsRnJWSEl4Y3paak5IRjRURzh6TkRCdVJrRXJPWFJWZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKM1dVUldVakJTUVZGSUwwSkhWWGRaTkZwb1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhOaFYwcHFURmRTTldKdFJuUmhWMDEyVEcxa2NHUkhhREZaYVRrellqTktjbHB0ZUhaa00wMTJZMjFXYzFwWFJucGFVelUxQ2xsWE1YTlJTRXBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUVRWQ1oyOXlRbWRGUlVGWlR5OU5RVVZDUWtOMGIyUklVbmRqZW05MlRETlNkbUV5Vm5VS1RHMUdhbVJIYkhaaWJrMTFXakpzTUdGSVZtbGtXRTVzWTIxT2RtSnVVbXhpYmxGMVdUSTVkRTFDV1VkRGFYTkhRVkZSUW1jM09IZEJVVWxGUTBoT2FncGhSMVpyWkZkNGJFMUVXVWREYVhOSFFWRlJRbWMzT0hkQlVVMUZTMGRKTVZsdFdtcE9hbFV3V20xUk5VNXFZek5PYWtKcVdtcFZNVTVFVFhsT1YxVjNDazFxUm0xUFJGcHNXVEpOZWs1WFZURk5Na1YzU0VGWlMwdDNXVUpDUVVkRWRucEJRa0pCVVU5Uk0wcHNXVmhTYkVsR1NteGlSMVpvWXpKVmQweFJXVXNLUzNkWlFrSkJSMFIyZWtGQ1FsRlJabGt5YUdoaFZ6VnVaRmRHZVZwRE1YQmlWMFp1V2xoTmRsb3llSEJaYlUxMFdraHNkVmxYTVhCWmVrRmtRbWR2Y2dwQ1owVkZRVmxQTDAxQlJVZENRVGw1V2xkYWVrd3lhR3haVjFKNlRESXhhR0ZYTkhkbldYTkhRMmx6UjBGUlVVSXhibXREUWtGSlJXWlJVamRCU0d0QkNtUjNSR1JRVkVKeGVITmpVazF0VFZwSWFIbGFXbnBqUTI5cmNHVjFUalE0Y21ZclNHbHVTMEZNZVc1MWFtZEJRVUZaVW5WMmJEZHNRVUZCUlVGM1Fra0tUVVZaUTBsUlEwWmFjSHBSTTNWNVdGSkphbmR6WmxkaVNYVnNVbmR6ZDJONE9FUlhTVXQwZVVSU2NGcGhkbGd6YkhkSmFFRk5RM1pSZVVVd1R5OTJjUXBpYUhCNU0wcHBNRGwyVGxwS1QzWXhaRW95ZFhReU16RXJjVnBFTDNwTE9FMUJiMGREUTNGSFUwMDBPVUpCVFVSQk1tTkJUVWRSUTAxRGRqQmlSVWRoQ2taTlQzaHlla0YyUkhoR1JrTnRPRXBSU0RGMVdIUjZiRk1yWm5VM1RYTlZTa1ZxUjBKaE9DdFhlbGt5VG5jMk1HWk9MMHd3ZWxBMFUzZEpkMlIwTWtRS1dFazNOR2xVVm14TFdUQjJZMjlyTmpCTmJHZGljVkpVYVhscVNXNVVRMEZDVUM4M1JWZHRiVFJGVmt3M1RIWlJVbVZqU0V0aWNHaFBlVU51Q2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1668305285,
          "logIndex": 6966125,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/glibc-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/glibc-dynamic",
      "githubWorkflowSha": "b5bfc654fd967760cf554325e021f86ecc35e53a",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3453440847",
      "sha": "b5bfc654fd967760cf554325e021f86ecc35e53a"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

