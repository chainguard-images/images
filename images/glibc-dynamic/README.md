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
| `latest` | `sha256:da4c677f3c68d46da3706a91a706b7fbfe550826d947cd3472b30a71cf0ac057`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:da4c677f3c68d46da3706a91a706b7fbfe550826d947cd3472b30a71cf0ac057) | `amd64` |



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
        "docker-manifest-digest": "sha256:da4c677f3c68d46da3706a91a706b7fbfe550826d947cd3472b30a71cf0ac057"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "ad73917f4690f6cec5068bc2b7ea25bdbefbc589",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/glibc-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIBY9yGoiF7vXhs+KxsuJBFMeWFNa/fIACvXyPk2GiEAGAiA5p3aO1U6l4zqEGcRFqvvrd9XVjxwiRl1szOVp4i8OSg==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJiYTQ2Y2Y2OThlMWI0Y2Q0ZDIzOTlhNTA3YjM3ZmM4NmVhOTM2MzRlNzdjZGQwMThhMzBhY2I3Mzk2MmZkNjE5In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJR0Z3dWVWaDUwWDFlNGZzeTFtSVdMTkIrVHdxY2Z2aHhIcE9tSkdkVTVmQ0FpQXlCcFdKOXJhaFlVVDRYZHU2WEIxY1BQdDFaN1FpR0I1YTRieGJHcVdKNWc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjFWRU5EUVhvclowRjNTVUpCWjBsVlNqVmlWWGd6YjFObVYyWk1VbVJOY25Zd1pGTTBWekZ1THpKemQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1RSTlJFbDZUWHBWTkZkb1kwNU5ha2w0VFVSSk5FMUVTVEJOZWxVMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZYUkdSc1p6Sm9RbklyYTFoSVlqRjNUR1ozUTJJcmVrZFZOM3B3V2poUGFTdEdLMHdLUWpsd2QzbExXa1IyYldaR1FWSmpWR0pyUjI1TGJ6ZHhXVFpXTlVaWWNXcGlRa1V5ZG1GWWJWbHdhRXhqZVhGR2VXRlBRMEZzTkhkblowcGhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV4TWxwRkNsRnVlbVk0ZUdReVluTkpVamhwTjI1Q2MyeGhhV2RCZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKM1dVUldVakJTUVZGSUwwSkhWWGRaTkZwb1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhOaFYwcHFURmRTTldKdFJuUmhWMDEyVEcxa2NHUkhhREZaYVRrellqTktjbHB0ZUhaa00wMTJZMjFXYzFwWFJucGFVelUxQ2xsWE1YTlJTRXBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUVRWQ1oyOXlRbWRGUlVGWlR5OU5RVVZDUWtOMGIyUklVbmRqZW05MlRETlNkbUV5Vm5VS1RHMUdhbVJIYkhaaWJrMTFXakpzTUdGSVZtbGtXRTVzWTIxT2RtSnVVbXhpYmxGMVdUSTVkRTFDV1VkRGFYTkhRVkZSUW1jM09IZEJVVWxGUTBoT2FncGhSMVpyWkZkNGJFMUVXVWREYVhOSFFWRlJRbWMzT0hkQlVVMUZTMGRHYTA1NlRUVk5WR1J0VGtSWk5VMUhXVEpaTWxacVRsUkJNazlIU21wTmJVa3pDbHBYUlhsT1YwcHJXVzFXYlZsdFRURlBSR3QzU0VGWlMwdDNXVUpDUVVkRWRucEJRa0pCVVU5Uk0wcHNXVmhTYkVsR1NteGlSMVpvWXpKVmQweFJXVXNLUzNkWlFrSkJSMFIyZWtGQ1FsRlJabGt5YUdoaFZ6VnVaRmRHZVZwRE1YQmlWMFp1V2xoTmRsb3llSEJaYlUxMFdraHNkVmxYTVhCWmVrRmtRbWR2Y2dwQ1owVkZRVmxQTDAxQlJVZENRVGw1V2xkYWVrd3lhR3haVjFKNlRESXhhR0ZYTkhkbldXOUhRMmx6UjBGUlVVSXhibXREUWtGSlJXWkJValpCU0dkQkNtUm5RVWxaU2t4M1MwWk1MMkZGV0ZJd1YzTnVhRXA0UmxwNGFYTkdhak5FVDA1S2REVnlkMmxDYWxwMlkyZEJRVUZaVVdOalIwNVBRVUZCUlVGM1FrZ0tUVVZWUTBsUlJIUm5RVmRoTWpNMmNsVnFVazlZSzFkbmVuZHhOV2hEVVZVdmRFeG9VemREV1VWaWF6Tk1PRWxyYUhkSloweEtTRWN4VEV0RlZsVTFWZ3BDZW5Sa1NIcG9jVzF0YUU5aFpHZGFZMjUxUlVOeldHeFBTMGh3Vld0M2QwTm5XVWxMYjFwSmVtb3dSVUYzVFVSaFFVRjNXbEZKZUVGUVkwdGxhVU5YQ2xvMlRHdzBTVlU0UmxWa1JsbFFSVGhxVHpGNGFHaHNaVVJaYzFkaFUweHRWV1pVV0hGUE1Vb3ZhbE5RVG1Zd1JqUnBZbk4xWjNjNE1HZEpkMVJtV2tvS00xVXhZeTlLYW1sRVUxVndkWEJvV25od1VVODNTbFY1UzJGV01ubHBWbVV4TjJkUlJrZEpWVkJ3S3pJd2RFRTVhVGwzVTBsVWFuRnJVQ3ROQ2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1666924441,
          "logIndex": 6017797,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/glibc-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/glibc-dynamic",
      "githubWorkflowSha": "ad73917f4690f6cec5068bc2b7ea25bdbefbc589",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3342361683",
      "sha": "ad73917f4690f6cec5068bc2b7ea25bdbefbc589"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

