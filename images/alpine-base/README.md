# alpine-base

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/alpine-base/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/alpine-base/actions/workflows/release.yaml)

Alpine base image built with [apko](https://github.com/chainguard-dev/apko). Uses packages from the [Alpine distribution](https://www.alpinelinux.org/).

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/alpine-base:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:c74b51c256efbbf7a69ec50a828af4f5be5d0d4d40c979e223f19b3c63a24a14`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c74b51c256efbbf7a69ec50a828af4f5be5d0d4d40c979e223f19b3c63a24a14) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


## Usage

```
docker run cgr.dev/chainguard/alpine-base echo "hello"
```

See the [examples/](./examples/) directory for how
to use this as a base image.


## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/alpine-base:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/alpine-base:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/alpine-base"
      },
      "image": {
        "docker-manifest-digest": "sha256:c74b51c256efbbf7a69ec50a828af4f5be5d0d4d40c979e223f19b3c63a24a14"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "fb30ec6ec57eb6a1078494fb591fbfee3e75fbfa",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/alpine-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDxSD8f5jfPF4H1asvk+aFntGE2dM17ezS2Pc5GXNvGyAIhAJ4mKe/7qwKYEXTwBOkQyuFYWx6ntSpKt7nnWYZ5cFWQ",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJkOThhZjQ5MGNiOTZmNjcwMTcyMWM5MmQ1OTMyNzAxZDYyZDlmNzc4Y2YyMDNhMWY3YjdiOWIyMTYwOThhYjEzIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQzlpNUQ1ams2S2ZDeStXMHVnRkl0SldYVGg1a1ZnZTJPWWJmREdVbW9qa0FpQkNGTFNxNVFtdWRPRmZsR1pRTVdlTDI2dmhncjdlMFp0amZpOUZCS3JTcmc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpla05EUVhweFowRjNTVUpCWjBsVlYyOTJWM05WTjJ4c01YRjJjVUo1VUdjNVpqUjZXREJVWVVJNGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhwTlJFVjRUbFJKZDFkb1kwNU5ha2w0VFVSRmVrMUVSWGxPVkVsM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ6ZDBkRFFYcEVTMDFUTkZGeGNVZHBOM0ozVmt4dmVIQk5kRzVTVFhaaWFWZGhOM1lLYkZGcFUydElhbkZFUVV0SFdUQTVZakpXUTA5WVozSm1UMUZ6V2xFd2JEbGFaVlJUZERCNFREQjVjblV2Y1RWd1J6WlBRMEZzYTNkblowcFdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZVYUdsRkNuSXpaRk4wY25Cb1JIWnRSMEozUnpSMUwwZzJNSEU0ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Um5OalIyeDFXbE14YVZsWVRteE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyaHRXV3BOZDFwWFRUSmFWMDB4VGpKV2FVNXRSWGhOUkdNMFRrUnJNRnB0U1RGUFZFWnRDbGx0V214YVZFNXNUbnBXYlZsdFdtaE5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKR2MyTkhiSFZhVXpGcFdWaE9iRTFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxSV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUkzUWtoclFXUjNRakZCUVdobkNtdDJRVzlWZGpsdlVtUklVbUY1WlVWdVJWWnVSMHQzVjFCalRUUXdiVE50ZGtOSlIwNXRPWGxCUVVGQ1p6ZzNjRUZSTUVGQlFWRkVRVVZaZDFKQlNXY0tWbUZJU2pkWldHNUdjM3BTY0hONU9HazJOVlIzVUhwUldtSkxSek5EU2pKVFJ6Vk1NbVpXUW1sdVRVTkpRV3B1VVVSYVVYZEZPR3BxVVhaaU5VMHJUd3AzVTB0dk1FMUVRVTltYzJkNk9IcHFLekZNT0U1dlNEQk5RVzlIUTBOeFIxTk5ORGxDUVUxRVFUSmpRVTFIVVVOTlIxUTNPRTFTTXpKUFowUnVibXRSQ2toa1VUWkZSakJhWmpONE1VcGFWRmx2Y2paRWNIUnVSbEUwSzBWQlNYQlNORUpDUlZaV1NrSnhNbkpFYkhaU1prUkJTWGRrU1RaME9IWTFXakJtYm5VS1lXUjBaR3czZUc0clVHVlFTM0pvTVc5dVdWSkxlVGxHY0dWRWEzZzJjV1JVUWtNNE1HTjBiSEJzTWpOV1JFSnhlRXRrTlFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1665623747,
          "logIndex": 4996318,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/alpine-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/alpine-base",
      "githubWorkflowSha": "fb30ec6ec57eb6a1078494fb591fbfee3e75fbfa",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3238998255",
      "sha": "fb30ec6ec57eb6a1078494fb591fbfee3e75fbfa"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

