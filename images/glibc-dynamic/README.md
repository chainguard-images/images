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
| `latest` | `sha256:d1e51030b0cab36f290ed7ccbecfeff722c1db64c0ff1bca8afe6ff8b49e164d`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:d1e51030b0cab36f290ed7ccbecfeff722c1db64c0ff1bca8afe6ff8b49e164d) | `amd64` |



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
        "docker-manifest-digest": "sha256:d1e51030b0cab36f290ed7ccbecfeff722c1db64c0ff1bca8afe6ff8b49e164d"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "024f5eea30fbffe17021c045a4c545a7f1ece097",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/glibc-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQC2pjDShcytdenZ62Xpr8QPJaE1PjNEbVgyxdNH+kly+wIhAJcFQejrABWqf8ocJQ1V/qstcu2t5foxySYY+uC+zxqU",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI5ZGU3MTIzODM1ZmE5NGYxMmEwNTliZDI1MTk4NjQwNzgwZjQ4YWRjNmI2ZGQ5MDVhZTg5MmQ3ZTAxYTBjNTgwIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUQ4YUJFRGJveFBLQ2NhRll1alFFajBBQllhOFFlWUVlckpHbVc4Y3pxN2RRSWdOOTFDeDVUQ0R6anNtY0ZxWlN0d0tLeGJ3SEt5dGJBVUpDS2FWRFdYSU1rPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjFla05EUVRCRFowRjNTVUpCWjBsVlJ5OHJTVmM0TjI0emNXSlZLMk5tSzB4bFpFdFlXV2xPVjBwcmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVROTlJFbDNUMVJOTUZkb1kwNU5ha2w0VFZSQk0wMUVTWGhQVkUwd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVUzTkZoMWR6QkhLMFpMY2t3MFp6SlJTelExWjBab1MyNUVkVEZLTmxkRGREUnFabllLT0hocFVrSjVURVV2U0RFMmJUVkJhRkJHVmxCdldVdG1kelZEUWpkdk5uazNhbkZwYlRaQldXaERjMlIwSzBSaFJHRlBRMEZzT0hkblowcGlUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZXTVN0UUNrNXhVR1FyYXpsVVQzSmtXRkJ6VVRJclJ6ZFlkMlF3ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKM1dVUldVakJTUVZGSUwwSkhWWGRaTkZwb1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhOaFYwcHFURmRTTldKdFJuUmhWMDEyVEcxa2NHUkhhREZaYVRrellqTktjbHB0ZUhaa00wMTJZMjFXYzFwWFJucGFVelUxQ2xsWE1YTlJTRXBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUVRWQ1oyOXlRbWRGUlVGWlR5OU5RVVZDUWtOMGIyUklVbmRqZW05MlRETlNkbUV5Vm5VS1RHMUdhbVJIYkhaaWJrMTFXakpzTUdGSVZtbGtXRTVzWTIxT2RtSnVVbXhpYmxGMVdUSTVkRTFDV1VkRGFYTkhRVkZSUW1jM09IZEJVVWxGUTBoT2FncGhSMVpyWkZkNGJFMUVXVWREYVhOSFFWRlJRbWMzT0hkQlVVMUZTMFJCZVU1SFdURmFWMVpvVFhwQ2JWbHRXbTFhVkVVelRVUkplRmw2UVRCT1YwVXdDbGw2VlRCT1YwVXpXbXBHYkZreVZYZFBWR04zU0VGWlMwdDNXVUpDUVVkRWRucEJRa0pCVVU5Uk0wcHNXVmhTYkVsR1NteGlSMVpvWXpKVmQweFJXVXNLUzNkWlFrSkJSMFIyZWtGQ1FsRlJabGt5YUdoaFZ6VnVaRmRHZVZwRE1YQmlWMFp1V2xoTmRsb3llSEJaYlUxMFdraHNkVmxYTVhCWmVrRmtRbWR2Y2dwQ1owVkZRVmxQTDAxQlJVZENRVGw1V2xkYWVrd3lhR3haVjFKNlRESXhhR0ZYTkhkbldYTkhRMmx6UjBGUlVVSXhibXREUWtGSlJXWlJVamRCU0d0QkNtUjNSR1JRVkVKeGVITmpVazF0VFZwSWFIbGFXbnBqUTI5cmNHVjFUalE0Y21ZclNHbHVTMEZNZVc1MWFtZEJRVUZaVWxBeVlWSTFRVUZCUlVGM1Fra0tUVVZaUTBsUlJGUldXbU5RVTBSSFVXNUdLMkZxVG5KaVRXcDZibFJXWmpWRFVGUTNPVU5uVTFGQlNFTm1iVEoyUVZGSmFFRk5lbGg2U2pOT09GZHZVUXBqTkhZMVlqQjZZWGh5YVVKamJVeEVSUzlwWTFKaFkzaFdOVU5DT1hKaUswMUJiMGREUTNGSFUwMDBPVUpCVFVSQk1tdEJUVWRaUTAxUlExVjVNVFJZQ2tWa2VVeFpSVmN5YTBkMlJrVmhkSE0wT1d4b1JuY3JiRVpSZDJrclUza3ZjMmhNTWpBeFMwcHVSbFJWUVhwd2QydERabkpLYUZsWmRIZ3dRMDFSUTJNS2JVTnRZbXhLYlZVdlZFdHJiVGROY21NM1dXVllka1JxTHpoWVRGSldWWGhIZVVRemNreG1ka2RCTlhOc00zUkNUMUl5VDBkaGFrZHZVSFUyTDJOclBRb3RMUzB0TFVWT1JDQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENnPT0ifX19fQ==",
          "integratedTime": 1667786978,
          "logIndex": 6652958,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/glibc-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/glibc-dynamic",
      "githubWorkflowSha": "024f5eea30fbffe17021c045a4c545a7f1ece097",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3407040624",
      "sha": "024f5eea30fbffe17021c045a4c545a7f1ece097"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

