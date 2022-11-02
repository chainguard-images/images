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
| `latest` | `sha256:f83dc3032be7eecc948dff8d545df70f5fda8e2eb601be01ba5302a7d04fe41e`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:f83dc3032be7eecc948dff8d545df70f5fda8e2eb601be01ba5302a7d04fe41e) | `amd64` |



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
        "docker-manifest-digest": "sha256:f83dc3032be7eecc948dff8d545df70f5fda8e2eb601be01ba5302a7d04fe41e"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "882b3de227b5e74c0e8c486a5b6d94a0b00c5271",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/glibc-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIFJ6HYNVIB7ov2Hxomd5IfHxyFseKoGusjI8H2UkviJdAiBcMp9KszD64inb4H8vm62xCKJLHd0ic4GSEMG3WKnO8Q==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIyNmI3MDFhMDJiMTc4NmUzMjZlNDE0MmI5YWYxYjljMDM4ZGU5YWY5YTgxMDFjODE2YWY1ODk5MjViMmVlZjA4In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUMvMkxablZudTA1R0RaUEZtaHR4c1dtRXRrdUFMVnNVTG5TeXg3WVM1RmtRSWdSZCt5eDluMU1DODV3OG9DQXYwYVJ5UmhnZWs0S0QvcmxCdExhK2xWZUNRPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBla05EUVhvMlowRjNTVUpCWjBsVlpGUlNPSEZ4ZWpWdVdtbEZNRmd6VFhWWWRXNVNka3B4UkdkamQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVhsTlJFbDZUV3BGZUZkb1kwNU5ha2w0VFZSQmVVMUVTVEJOYWtWNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZhUVU5UFdrSkdUamg2V0RjMVVVNW9NaXRXWlVGdWJVdHBTbGxoV0hKd2RHNDRVM29LV1ZBNGR6RlRiemN6TmpsNVkzVXZUMWR3WVRVM0syeDVZekF5TmtGTlZqQndRMDVHUnk5bWRFaHBkall5TmpWVlQzRlBRMEZzTUhkblowcGFUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZoUTA1MENrOTJka1JsUWxNM1YwUXlWbVI1TlZCMFRFNTZWVXcwZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKM1dVUldVakJTUVZGSUwwSkhWWGRaTkZwb1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhOaFYwcHFURmRTTldKdFJuUmhWMDEyVEcxa2NHUkhhREZaYVRrellqTktjbHB0ZUhaa00wMTJZMjFXYzFwWFJucGFVelUxQ2xsWE1YTlJTRXBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUVRWQ1oyOXlRbWRGUlVGWlR5OU5RVVZDUWtOMGIyUklVbmRqZW05MlRETlNkbUV5Vm5VS1RHMUdhbVJIYkhaaWJrMTFXakpzTUdGSVZtbGtXRTVzWTIxT2RtSnVVbXhpYmxGMVdUSTVkRTFDV1VkRGFYTkhRVkZSUW1jM09IZEJVVWxGUTBoT2FncGhSMVpyWkZkNGJFMUVXVWREYVhOSFFWRlJRbWMzT0hkQlVVMUZTMFJuTkUxdFNYcGFSMVY1VFdwa2FVNVhWVE5PUjAxM1dsUm9hazVFWnpKWlZGWnBDazV0VVRWT1IwVjNXV3BCZDFsNlZYbE9la1YzU0VGWlMwdDNXVUpDUVVkRWRucEJRa0pCVVU5Uk0wcHNXVmhTYkVsR1NteGlSMVpvWXpKVmQweFJXVXNLUzNkWlFrSkJSMFIyZWtGQ1FsRlJabGt5YUdoaFZ6VnVaRmRHZVZwRE1YQmlWMFp1V2xoTmRsb3llSEJaYlUxMFdraHNkVmxYTVhCWmVrRmtRbWR2Y2dwQ1owVkZRVmxQTDAxQlJVZENRVGw1V2xkYWVrd3lhR3haVjFKNlRESXhhR0ZYTkhkbldXdEhRMmx6UjBGUlVVSXhibXREUWtGSlJXVjNValZCU0dOQkNtUlJSR1JRVkVKeGVITmpVazF0VFZwSWFIbGFXbnBqUTI5cmNHVjFUalE0Y21ZclNHbHVTMEZNZVc1MWFtZEJRVUZaVVRKTWJ6QTVRVUZCUlVGM1FrY0tUVVZSUTBsR1NscGFTVkJCZGpkbmVrNUpWVms0YkZsNllpOVFRWEV6UlhwT1RqaDZaM1pCYlV0dGRsbFpkMlozUVdsQ2JuTlVURVJzYWtSeFduVldhZ3B3U0hOT00xcEVNbUoxWkVJMldHVkhPRWhyVWt3NWR6aE5ZVWRUVGtSQlMwSm5aM0ZvYTJwUFVGRlJSRUYzVG01QlJFSnJRV3BCVmt0c1NGQmpWSFVyQ21ORmR6WTVOV3g1TlZFNU5tNVZhbE4xVm05aFUzTlllall6ZUVKWWJpOUpLMDB3WVU1b1VtNXdWblIyZDNOME5ETlRWSFJLUjI5RFRVSkNhakJDZEVnS1Fsa3lNVVJKZDNsbE1XdDBSMFJTUVRKelFUVnVVbWcyTDFVelkxZGxibTFDV0RGeVNXSXlhVVJPVkcxMlYxWklkM2R0VjIxbWVrVnlkejA5Q2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1667356335,
          "logIndex": 6328285,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/glibc-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/glibc-dynamic",
      "githubWorkflowSha": "882b3de227b5e74c0e8c486a5b6d94a0b00c5271",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3374403646",
      "sha": "882b3de227b5e74c0e8c486a5b6d94a0b00c5271"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

