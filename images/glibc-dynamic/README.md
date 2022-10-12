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
| `latest` | `sha256:5696f0bc4032e1d1cf2e0edf15aea92db0dd9b2cb251bd2859324af57bd5670e`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:5696f0bc4032e1d1cf2e0edf15aea92db0dd9b2cb251bd2859324af57bd5670e) | `amd64` |



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
        "docker-manifest-digest": "sha256:5696f0bc4032e1d1cf2e0edf15aea92db0dd9b2cb251bd2859324af57bd5670e"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "08fbaa5fa0259d0594a61b23de3ed2235be767ed",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/glibc-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCICl6B7vA0EOsl1MmnZdO6jZ2K44d/rxT2BUZmwdf1VqfAiEA+Td9IfcQJw0xRFFPTwfk08qNnSQXn6qmEfa29TxcZrs=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI5Yjg1ZjQyYzg1YTAwY2VjNjVkNWRhNGMzNmZjNmYzZjdjYjYxNWFhMzZmMTEwZDQwNmM1YzVhZjM4OTliY2E2In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNlVTBSWm51NDU0UGlNWkpxc2g1cVk5UmhZT3d5Ni96R1FhNnVTYTBrMUJBSWhBTXpiRkpZbDJqMldMV0RRWHY1WWlmWStCdHdXZEpPNzJjdXhNSkR2WVNIVyIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBWRU5EUVhwMVowRjNTVUpCWjBsVlJVTnZNVFl6VlhwQlUyVmtiakprYWxWTmNuYzVhVFZFVldOcmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhsTlZHZDVUVVJOZDFkb1kwNU5ha2w0VFVSRmVVMVVaM3BOUkUxM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZLV0V0elVGQndSblVyWTNWMFpFRlFVMUZqWlZSbVQzaEljekJHYzBwQ1JtZ3llVXNLWnpWaVZuSjFhREl2ZUZWVU1YRktlbmQ2VlUxb1JVWkdaRzU1TDBJNWRtaE5SR2xFWlVoaFRVVTFVV3hDU1RCVFRqWlBRMEZzYjNkblowcFhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZoWVZWd0NrcE5ZMlU0ZVdSeVZVSlVNRTFpVG5wR01YSlhlazlGZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKM1dVUldVakJTUVZGSUwwSkhWWGRaTkZwb1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhOaFYwcHFURmRTTldKdFJuUmhWMDEyVEcxa2NHUkhhREZaYVRrellqTktjbHB0ZUhaa00wMTJZMjFXYzFwWFJucGFVelUxQ2xsWE1YTlJTRXBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUVRWQ1oyOXlRbWRGUlVGWlR5OU5RVVZDUWtOMGIyUklVbmRqZW05MlRETlNkbUV5Vm5VS1RHMUdhbVJIYkhaaWJrMTFXakpzTUdGSVZtbGtXRTVzWTIxT2RtSnVVbXhpYmxGMVdUSTVkRTFDU1VkRGFYTkhRVkZSUW1jM09IZEJVVWxGUWtoQ01RcGpNbWQzVG1kWlMwdDNXVUpDUVVkRWRucEJRa0YzVVc5TlJHaHRXVzFHYUU1WFdtaE5SRWt4VDFkUmQwNVVhekJaVkZsNFdXcEplbHBIVlhwYVYxRjVDazFxVFRGWmJWVXpUbXBrYkZwRVFXTkNaMjl5UW1kRlJVRlpUeTlOUVVWRlFrRTFSR050Vm1oa1IxVm5WVzFXYzFwWFJucGFWRUYwUW1kdmNrSm5SVVVLUVZsUEwwMUJSVVpDUWpscVlVZEdjR0p0WkRGWldFcHJURmRzZEZsWFpHeGplVGx1WWtkc2FWbDVNV3RsVnpWb1lsZHNhazFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxuV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUk0UWtodlFXVkJRakpCUVdobkNtdDJRVzlWZGpsdlVtUklVbUY1WlVWdVJWWnVSMHQzVjFCalRUUXdiVE50ZGtOSlIwNXRPWGxCUVVGQ1p6Z3hkRTU2YjBGQlFWRkVRVVZqZDFKUlNXY0tSR3RCYVVVMWRXdFlTVzFRV1doemFqQjZUbWRDVDJKTlNXOU9MelJVZFdWWlJuUlhaa0pEYldseWQwTkpVVVF2YlRsalpUSjFMMmsxYzFjeFVuSTBaZ3A2WVdkTlpUYzRRVzVaZDJJelpHbDBibFZLUVRZdmNuUnRSRUZMUW1kbmNXaHJhazlRVVZGRVFYZE9iMEZFUW14QmFrVkJkVFZ0ZEhNMU5HUlNSelptQ2k5dFVsQTVURTVhVm1ORE5tMXhTME16VERsQ1IxVmlkR0pUYTI1M1VFVllVVk53TmxNeFN6TnRSMUJzWWxKaVUyNVhVVEJCYWtKT1l5dGxlbUl4WTBFS1pGTnlhamhJUnpOWFpXZE1aVWhoVG1WNVVXaHFkMkp1ZW1Sb1FrRlpNR2t6Y1VGQmQwVnZjV3BNUmt4c1drZzNkRkJpTXk5M2F6MEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1665598834,
          "logIndex": 4977930,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/glibc-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/glibc-dynamic",
      "githubWorkflowSha": "08fbaa5fa0259d0594a61b23de3ed2235be767ed",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3236950816",
      "sha": "08fbaa5fa0259d0594a61b23de3ed2235be767ed"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

