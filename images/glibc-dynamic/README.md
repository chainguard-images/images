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
| `latest` | `sha256:4b2d93756c1f195589a797f8d73bb5a4bebf44d3ed07c63bcba2961cda706ae8`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:4b2d93756c1f195589a797f8d73bb5a4bebf44d3ed07c63bcba2961cda706ae8) | `amd64` |



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
        "docker-manifest-digest": "sha256:4b2d93756c1f195589a797f8d73bb5a4bebf44d3ed07c63bcba2961cda706ae8"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "fa9ac76cc55b02f8bd7ea5ad879b1a8696679bfa",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/glibc-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIBD0JXfstPr6AkaHzrcUYotlwvXNUBI5wzp4Kp9mOvXyAiAPYRMMK2rVRNqau3LYcA7Ewm86YnSaWT/7662TGilfXQ==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI2NDNiY2FlYzNlZTQzMmY3NGVmYTZkYjE0ZjEzOWFlZDY0NzU4NGFmODQzM2IwZDdlNDc2OTU4NGY5YWI3NzQ0In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURaL3pxK20xY3VTYXFTRHJxRmhkOVZ1TVNYclJLYk15ZlNWem5oRE1QSFVRSWhBSS9zTFd0SG4wK0lNRkhMSUVqVHQ1WTE3cW80ci90RUZTb2xSSUliOW1GRyIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjFha05EUVRCRFowRjNTVUpCWjBsVlpqUnNjMEZoZG5rdlJsUk5hREZ3TWxRNVRWVndMM2RwY0V3d2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1ROTlJFbDVUWHBKTUZkb1kwNU5ha2w0VFVSSk0wMUVTWHBOZWtrd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZzUVVWaVVuZzBSMHhZUzNOaFF6UXpOelptWWpGNFlXUXlVRE1ySzB4blIwSTBkRzBLWldaNGVXOTVUbXQ0VERGRk1qaGhXRlIwY1c5cFVVeDFTV05EV0c5TGJYWTNVbnB4UzBJd1JVVTBaalE1T1dZMVMwdFBRMEZzT0hkblowcGlUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlUwWWk5ekNrVlhNVVZSYUdnMU9XRkpSaTgzUldoUVRIaDJNa2h2ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKM1dVUldVakJTUVZGSUwwSkhWWGRaTkZwb1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhOaFYwcHFURmRTTldKdFJuUmhWMDEyVEcxa2NHUkhhREZaYVRrellqTktjbHB0ZUhaa00wMTJZMjFXYzFwWFJucGFVelUxQ2xsWE1YTlJTRXBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUVRWQ1oyOXlRbWRGUlVGWlR5OU5RVVZDUWtOMGIyUklVbmRqZW05MlRETlNkbUV5Vm5VS1RHMUdhbVJIYkhaaWJrMTFXakpzTUdGSVZtbGtXRTVzWTIxT2RtSnVVbXhpYmxGMVdUSTVkRTFDV1VkRGFYTkhRVkZSUW1jM09IZEJVVWxGUTBoT2FncGhSMVpyWkZkNGJFMUVXVWREYVhOSFFWRlJRbWMzT0hkQlVVMUZTMGRhYUU5WFJtcE9lbHBxV1hwVk1WbHFRWGxhYW1ocFdrUmtiRmxVVm1oYVJHY3pDazlYU1hoWlZHY3lUMVJaTWs1NmJHbGFiVVYzU0VGWlMwdDNXVUpDUVVkRWRucEJRa0pCVVU5Uk0wcHNXVmhTYkVsR1NteGlSMVpvWXpKVmQweFJXVXNLUzNkWlFrSkJSMFIyZWtGQ1FsRlJabGt5YUdoaFZ6VnVaRmRHZVZwRE1YQmlWMFp1V2xoTmRsb3llSEJaYlUxMFdraHNkVmxYTVhCWmVrRmtRbWR2Y2dwQ1owVkZRVmxQTDAxQlJVZENRVGw1V2xkYWVrd3lhR3haVjFKNlRESXhhR0ZYTkhkbldYTkhRMmx6UjBGUlVVSXhibXREUWtGSlJXWlJVamRCU0d0QkNtUjNRVWxaU2t4M1MwWk1MMkZGV0ZJd1YzTnVhRXA0UmxwNGFYTkdhak5FVDA1S2REVnlkMmxDYWxwMlkyZEJRVUZaVVZoUlJuaElRVUZCUlVGM1Fra0tUVVZaUTBsUlJFRmtNVGhrY25OdVl5dHljRWN5VWpSVFdYaEhURXhVYkV4S2RVMXZVRmt4U0ZoR05IZGhRV1p0Um5kSmFFRkxhbVZDUlZOTk9FVnpXZ29yYUhWRVpqRjBlbVY1WXpkT2VXdFFVV3Q0VWxkNU1uWlRNVmxTV2t0QlJFMUJiMGREUTNGSFUwMDBPVUpCVFVSQk1tZEJUVWRWUTAxQ1EybFNOVnBaQ2pRMWFtWnZjamxzVmtwa1J6aEZWRWhuUjNrd01IRnVTREJTSzBWYVRYSXhUSFIzUkhRekx6VldkVEJoYXpJMlZ6RkdOMFZVZGtFeVdrRkplRUZQYkhjS1NWTTNiUzl4TDNOWlpVWnpOMGwxZGtNellqVlRPR3hXVW1oU1JHd3ZkamxaYzFjcllrTXJibVZEYXpOclJESmlRbTFZVEhKU2REZzFLek54YWxFOVBRb3RMUzB0TFVWT1JDQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENnPT0ifX19fQ==",
          "integratedTime": 1666837407,
          "logIndex": 5949414,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/glibc-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/glibc-dynamic",
      "githubWorkflowSha": "fa9ac76cc55b02f8bd7ea5ad879b1a8696679bfa",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3334019711",
      "sha": "fa9ac76cc55b02f8bd7ea5ad879b1a8696679bfa"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

