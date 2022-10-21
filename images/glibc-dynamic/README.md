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
| `latest` | `sha256:5afb3f2ae11dc41ef9023bdbb6347f1ffd4a8ab206f94a4044130fc321bd9c7e`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:5afb3f2ae11dc41ef9023bdbb6347f1ffd4a8ab206f94a4044130fc321bd9c7e) | `amd64` |



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
        "docker-manifest-digest": "sha256:5afb3f2ae11dc41ef9023bdbb6347f1ffd4a8ab206f94a4044130fc321bd9c7e"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "dae1f6383035263a47a9e6982a00b4c658b34ac4",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/glibc-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIH/YDTIjrVOjMzH34W2SZOmw22BjdbaA/v5mqrzU33xDAiB0m83OJ/xrM0JMbLdrcfUkXjhHaoHPsqNRyo28gcCq+Q==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJkOWYzMGY4MWI0MWNhNmY2NGI5ZDZhNzI0NWE0MGJlMjhmOGYwNjY4MzI1MzJkZGYxYmU0OTdhMzQ5N2EwM2NkIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURvd0pHaHRhT25mWG9rcGFYRFg0bXU1TFdaL1l0aDFpWFQrZGIzY2sxeHZRSWhBTDVCVmVGY1psV3ltZVl0ZXh2MUJFRVJ4aGt1b0c3a285MFdSbjIxRzUxVyIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjFWRU5EUVhvclowRjNTVUpCWjBsVllYcFFVR2w1WWk5cFFYRTNOM1JaY3l0RGFpOXJlRVJoVkU1amQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1hoTlJFbDRUbFJGTUZkb1kwNU5ha2w0VFVSSmVFMUVTWGxPVkVVd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZYYjFaaVYxbFdZMmQ0THpORmFsWmhaaTl2ZWk5M2RXUmtVVXhTUzIxcGNGaENaRXNLTTIwMmNXaEVSa1EzV1dwQlJtbFFSRWR5ZFRGcU1pdExNa05TZGtOMVVqVjRNVUp6Y3pkSldqUXdSa3hrVFZaaFlXRlBRMEZzTkhkblowcGhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZyUlRJMkNtaFRRbU4zTkVob01FWkVVV3RxVWtwWU1WSm1kRWhCZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKM1dVUldVakJTUVZGSUwwSkhWWGRaTkZwb1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhOaFYwcHFURmRTTldKdFJuUmhWMDEyVEcxa2NHUkhhREZaYVRrellqTktjbHB0ZUhaa00wMTJZMjFXYzFwWFJucGFVelUxQ2xsWE1YTlJTRXBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUVRWQ1oyOXlRbWRGUlVGWlR5OU5RVVZDUWtOMGIyUklVbmRqZW05MlRETlNkbUV5Vm5VS1RHMUdhbVJIYkhaaWJrMTFXakpzTUdGSVZtbGtXRTVzWTIxT2RtSnVVbXhpYmxGMVdUSTVkRTFDV1VkRGFYTkhRVkZSUW1jM09IZEJVVWxGUTBoT2FncGhSMVpyWkZkNGJFMUVXVWREYVhOSFFWRlJRbWMzT0hkQlVVMUZTMGRTYUZwVVJtMU9hazAwVFhwQmVrNVVTVEpOTWtVd1RqSkZOVnBVV1RWUFJFcG9DazFFUW1sT1IwMHlUbFJvYVUxNlVtaFplbEYzU0VGWlMwdDNXVUpDUVVkRWRucEJRa0pCVVU5Uk0wcHNXVmhTYkVsR1NteGlSMVpvWXpKVmQweFJXVXNLUzNkWlFrSkJSMFIyZWtGQ1FsRlJabGt5YUdoaFZ6VnVaRmRHZVZwRE1YQmlWMFp1V2xoTmRsb3llSEJaYlUxMFdraHNkVmxYTVhCWmVrRmtRbWR2Y2dwQ1owVkZRVmxQTDAxQlJVZENRVGw1V2xkYWVrd3lhR3haVjFKNlRESXhhR0ZYTkhkbldXOUhRMmx6UjBGUlVVSXhibXREUWtGSlJXWkJValpCU0dkQkNtUm5RVWxaU2t4M1MwWk1MMkZGV0ZJd1YzTnVhRXA0UmxwNGFYTkdhak5FVDA1S2REVnlkMmxDYWxwMlkyZEJRVUZaVURSVmNtMDVRVUZCUlVGM1FrZ0tUVVZWUTBsSFNuTkxTMHh3WmxGMFRERTRXamRRYm0xV2FHdDZRbkZET0hsSE9XbEJRbEJQZVVwVmRXVXZSM2sxUVdsRlFXeERTV3MwY0M5R2JUSXpLd3BhZUdSTVFVdGtNbll6ZG5Zek5EQktWRk5tTWtkSFkyUlhiVmR0WXpsQmQwTm5XVWxMYjFwSmVtb3dSVUYzVFVSaFFVRjNXbEZKZDBGTGRVNTNSblpHQ2xack9GaEVaRUU0UmpKaWJtMUxiRmhGZUZCaGVWSlpXaXRyVVZNd1JtNXViVkkwUTNGdFowdENUekJIUTBzMUwzb3hXVkIwZFdORVFXcEZRUzh3Y1ZRS05HZEdRakpTUVhGNVlrNDJVa04xWVdRclRVVnJRVTE2Y0dKemFHaEVZVVF2TkdKQlpreDJXRmxSVWpaMVUxbGtTV05xVWpkRGFpOHJORTFaQ2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1666318520,
          "logIndex": 5532950,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/glibc-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/glibc-dynamic",
      "githubWorkflowSha": "dae1f6383035263a47a9e6982a00b4c658b34ac4",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3294307655",
      "sha": "dae1f6383035263a47a9e6982a00b4c658b34ac4"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

