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
| `latest` | `sha256:a7eafbc1d864bcadd19bdf96756ddf60cb2834a623fdd0fd20f55049ec814244`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a7eafbc1d864bcadd19bdf96756ddf60cb2834a623fdd0fd20f55049ec814244) | `amd64` |



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
        "docker-manifest-digest": "sha256:a7eafbc1d864bcadd19bdf96756ddf60cb2834a623fdd0fd20f55049ec814244"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "20f666b1311151daf822cff0b8b761edb890aa41",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/glibc-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDIsTdLtCTERnlgQSMZIdCpySb2b4wLgwc1IZWQ23PDOAIhALCqpdb/+FOUJ2XimVGDf1Um9+n7pkg0ABMkYU20gHBt",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJmNmViMzY1ZDJjNTQ0OTcwZWQyYTQzNjlhM2YwYmM1ZDQ2Yjc3MDljMjZlYTdkZWY0MTVlYWRlY2ZlMjY5ZDM2In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQTRvUkE4eHRJbHJxZDZ5UThsSGp5UllWdDdWRzZlbUhVWDBUUnNLK00rVkFpQlo0Z2VFZDUyaVM4U3BDSU10MHcxOVd1L01SekgzRUh5eC9tREdSMmpBbHc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjFWRU5EUVhvclowRjNTVUpCWjBsVlR5OU5kWGx0ZW0xNVNUaHpaQ3MxZDNvMGRsWkpUVlJTVXl0RmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1hkTlJFa3dUbXBCZUZkb1kwNU5ha2w0VFVSSmQwMUVTVEZPYWtGNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVUxVTFaNk4yVkZVRGhOTkRaaFlWWlVWa1ZzUzFNclZrbFhlQzlCVUhObUwyaGlVRW9LY1hCVE5rOVpSRzF0VXpCcWVreHNSbU5aUVUxMGIyTkRPVE5UWVZwV1dYTXlaRXNyZDFCd01sWTFaSEJYV1RnNFpuRlBRMEZzTkhkblowcGhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZXSzNkVUNpdDJSV1pRY2psaVVUazRSVlpFVFd0WFpsbHBVR0pqZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKM1dVUldVakJTUVZGSUwwSkhWWGRaTkZwb1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhOaFYwcHFURmRTTldKdFJuUmhWMDEyVEcxa2NHUkhhREZaYVRrellqTktjbHB0ZUhaa00wMTJZMjFXYzFwWFJucGFVelUxQ2xsWE1YTlJTRXBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUVRWQ1oyOXlRbWRGUlVGWlR5OU5RVVZDUWtOMGIyUklVbmRqZW05MlRETlNkbUV5Vm5VS1RHMUdhbVJIYkhaaWJrMTFXakpzTUdGSVZtbGtXRTVzWTIxT2RtSnVVbXhpYmxGMVdUSTVkRTFDV1VkRGFYTkhRVkZSUW1jM09IZEJVVWxGUTBoT2FncGhSMVpyWkZkNGJFMUVXVWREYVhOSFFWRlJRbWMzT0hkQlVVMUZTMFJKZDFwcVdUSk9iVWw0VFhwRmVFMVVWWGhhUjBadFQwUkplVmt5V20xTlIwazBDbGxxWXpKTlYxWnJXV3BuTlUxSFJtaE9SRVYzU0VGWlMwdDNXVUpDUVVkRWRucEJRa0pCVVU5Uk0wcHNXVmhTYkVsR1NteGlSMVpvWXpKVmQweFJXVXNLUzNkWlFrSkJSMFIyZWtGQ1FsRlJabGt5YUdoaFZ6VnVaRmRHZVZwRE1YQmlWMFp1V2xoTmRsb3llSEJaYlUxMFdraHNkVmxYTVhCWmVrRmtRbWR2Y2dwQ1owVkZRVmxQTDAxQlJVZENRVGw1V2xkYWVrd3lhR3haVjFKNlRESXhhR0ZYTkhkbldXOUhRMmx6UjBGUlVVSXhibXREUWtGSlJXWkJValpCU0dkQkNtUm5RVWxaU2t4M1MwWk1MMkZGV0ZJd1YzTnVhRXA0UmxwNGFYTkdhak5FVDA1S2REVnlkMmxDYWxwMlkyZEJRVUZaVUhwVFNYSkpRVUZCUlVGM1FrZ0tUVVZWUTBsUlEweExkMnhNYTNkWFFrTnRUalZwVVVoWFQzWTJTa0ZRWjBOaFprTlJlbGN3WVdGd1MzSmliMFZrU0VGSlowaGhjalZuVm05Nk5pOUhaQXBDWW1reWJpdE5LMEZPV0dwUE5YTlZVSFpSY1RSTFNHcFFSMGxXYVVwemQwTm5XVWxMYjFwSmVtb3dSVUYzVFVSaFFVRjNXbEZKZUVGUVVGVk1NbGt6Q20xaE1XeFhVaTkyUW5WTk5FVk1ZeXQxVkVWRlVsTTFObUZVZFdGbk4xZElNRVp5T1dGU1FubzJkbGxyV2xCbFQzb3lUaXQwYzNvNU9FRkpkMk5OZVVnS1NUQlRUM2RXZFVSWmVXVmlaa2R1SzFsNlVXaHVRV294TjBGdE56RXhjRUYxZGpsWmFHMDRaVlpTZDBwUWJWbzFWRGRaZVdWcU5ucExUazh5Q2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1666233964,
          "logIndex": 5470017,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/glibc-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/glibc-dynamic",
      "githubWorkflowSha": "20f666b1311151daf822cff0b8b761edb890aa41",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3286444064",
      "sha": "20f666b1311151daf822cff0b8b761edb890aa41"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

