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
| `latest` | `sha256:22470340bb4475ade687a22c2c09b51624c13fdf91c2fa246a968194ac8ab44f`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:22470340bb4475ade687a22c2c09b51624c13fdf91c2fa246a968194ac8ab44f) | `amd64` |



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
        "docker-manifest-digest": "sha256:22470340bb4475ade687a22c2c09b51624c13fdf91c2fa246a968194ac8ab44f"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "ededd617a0e40017c2f5bf82478f10a604ea5077",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/glibc-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCID+HOCnWe1W5gtUMvqvs7AXHS9V20dz/x8Yg6p3sksC4AiEAyhaw6BxVljxPgq7TQgL0ehOLNmOtUZTRUIrLAyBxlQw=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI3MGI2NjQwZThlOTlhYjNiYmVkZTNkOWU5YzVhMWM3OGQ5NGMxMGJmMjhjZTk5YjAyMjMzOTkxNDBhYmIxYjM4In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJRFo0TVdkMDlBV1hvakdyNE9GWEdQZERVYmFMeDh1aS81U1FjOGx3OTAyeUFpRUFvTG92UWVTRk45UzFqVmlCbitkSE40K3U0SEwxbGF1MUZTNTl2amFRSFdVPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjFla05EUVRCRFowRjNTVUpCWjBsVldsaG9RbTVsYVhsbVJrdERUbU5MUmpkSGNXOXZWMGxCUXpOM2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUVRWTlJFa3dUV3BWZWxkb1kwNU5ha2w0VFVSQk5VMUVTVEZOYWxWNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZDVEdoeVMyOXVZbFJGT1c4eGQyUmliR2hpVEdWM2NVWnNTVnBqY0RsSGVHbDNUVllLVVcxWFpXVjFOMEp5V0ZKMmIyMW5Sa1V3TkVKUE4wZHNjbmhWWWtoTVl6Wk1iVXd3Y21abVYxWXhRbE51ZDNsNFQzRlBRMEZzT0hkblowcGlUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZyUXpKeENrUlNNVFZ1Tnl0SldrbzNka1ppV25oNGFGUnVjelV3ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKM1dVUldVakJTUVZGSUwwSkhWWGRaTkZwb1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhOaFYwcHFURmRTTldKdFJuUmhWMDEyVEcxa2NHUkhhREZaYVRrellqTktjbHB0ZUhaa00wMTJZMjFXYzFwWFJucGFVelUxQ2xsWE1YTlJTRXBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUVRWQ1oyOXlRbWRGUlVGWlR5OU5RVVZDUWtOMGIyUklVbmRqZW05MlRETlNkbUV5Vm5VS1RHMUdhbVJIYkhaaWJrMTFXakpzTUdGSVZtbGtXRTVzWTIxT2RtSnVVbXhpYmxGMVdUSTVkRTFDV1VkRGFYTkhRVkZSUW1jM09IZEJVVWxGUTBoT2FncGhSMVpyWkZkNGJFMUVXVWREYVhOSFFWRlJRbWMzT0hkQlVVMUZTMGRXYTFwWFVtdE9ha1V6V1ZSQ2JFNUVRWGROVkdScVRXMVpNVmx0V1RSTmFsRXpDazlIV1hoTlIwVXlUVVJTYkZsVVZYZE9lbU4zU0VGWlMwdDNXVUpDUVVkRWRucEJRa0pCVVU5Uk0wcHNXVmhTYkVsR1NteGlSMVpvWXpKVmQweFJXVXNLUzNkWlFrSkJSMFIyZWtGQ1FsRlJabGt5YUdoaFZ6VnVaRmRHZVZwRE1YQmlWMFp1V2xoTmRsb3llSEJaYlUxMFdraHNkVmxYTVhCWmVrRmtRbWR2Y2dwQ1owVkZRVmxQTDAxQlJVZENRVGw1V2xkYWVrd3lhR3haVjFKNlRESXhhR0ZYTkhkbldYTkhRMmx6UjBGUlVVSXhibXREUWtGSlJXWlJVamRCU0d0QkNtUjNRVWxaU2t4M1MwWk1MMkZGV0ZJd1YzTnVhRXA0UmxwNGFYTkdhak5FVDA1S2REVnlkMmxDYWxwMlkyZEJRVUZaVHpadU4yNXBRVUZCUlVGM1Fra0tUVVZaUTBsUlEwSmhMMmhXT1dweFVrcHlWVFphWkdoeGFtZG9MMEpGZG1aNGVFcFRhWGR2TVVSTk4waFdOVk4yYW1kSmFFRk5iWFp4YVRncllUQmFXUXBSVkZCbU1sSnRiMDVaV21GQldWRXJPRW8yUWxWNVNEY3dOMlV5V2tSMk4wMUJiMGREUTNGSFUwMDBPVUpCVFVSQk1tdEJUVWRaUTAxUlEyVnZTek5FQ2tocFpqWjJjMFZCVUhwelJqSjBOek5HTkVsUmVrMHdaSEJaTWxNdlJHUXhSWFkxTVRGeVYxQjNZMmxrYUVrNFVsSktVRVJRZGpsUWJURkpRMDFSUkdnS1Nsa3ZUa3RrUTJOb1pqUm9TbTUyU1VOaWJ6WnRiMDVtTjBoWGRrMTZaa2hVVkdRMVNGbG9UQ3RPTUZOa2MyRlZTamRwTTFoS1puRlZNRFZuV1ZkclBRb3RMUzB0TFVWT1JDQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENnPT0ifX19fQ==",
          "integratedTime": 1665283376,
          "logIndex": 4728901,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/glibc-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/glibc-dynamic",
      "githubWorkflowSha": "ededd617a0e40017c2f5bf82478f10a604ea5077",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3212627476",
      "sha": "ededd617a0e40017c2f5bf82478f10a604ea5077"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

