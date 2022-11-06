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
| `latest` | `sha256:026d9de870f0d583f61a076bc43f0190bc35700fa6e3b7531a09f3592cba6cd0`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:026d9de870f0d583f61a076bc43f0190bc35700fa6e3b7531a09f3592cba6cd0) | `amd64` |



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
        "docker-manifest-digest": "sha256:026d9de870f0d583f61a076bc43f0190bc35700fa6e3b7531a09f3592cba6cd0"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "f56ded63050dd610c63107b5a42e1e2e4ba8f210",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/glibc-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIEJ33/rH28eC6RNfvy1WhXcqWj/O5UYLX168uOwz53KIAiBkIoGKBHLYvqiQT3s4StEI0oGWEUzuwoOFXe55XWTODQ==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI4OTkzMGM3YzU0NDgwZjgwYTJhMjI2MWJkY2Q5ZjhkNzNmMTJhMDg0NDZjNGM4MWM2YjgyYjFmZDc4MTI0YzU4In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQk9OdUJ2dEowZjJmUTVMcVZYTE9EdURTN29IQlp1QkRKYWpnODh2WmpsOEFpRUFuTlFrVHkrZkd2clg1cEdOU0VoZk9BUXBBQlNkbnZNbC9VV3NPVVZDMWtJPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjFWRU5EUVhvclowRjNTVUpCWjBsVlRUUTVhMjAxVEd0M1REa3dVRzlrV0doR2QyY3lTMGxqTUdWRmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRKTlJFbDVUVVJGTVZkb1kwNU5ha2w0VFZSQk1rMUVTWHBOUkVVeFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZXYkVjeE1uRlVURFZWVnpjM01Xa3pTMFV2TW1weFZ6Wm1jVkJ3V25sU1ExQXZkbElLWVdkNVozSldSV3BQVFhac2JuVlpXaXMwYm1nM1JYcFJSSGd6VldOcGJFdGpiR3RQVFhOaVlsSlJkRGRxU0M5eFkyRlBRMEZzTkhkblowcGhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ5WWtOSENraHBNM05zYldOMFJ6ZHVXblpZWWpkbGFrTTJjbVpyZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKM1dVUldVakJTUVZGSUwwSkhWWGRaTkZwb1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhOaFYwcHFURmRTTldKdFJuUmhWMDEyVEcxa2NHUkhhREZaYVRrellqTktjbHB0ZUhaa00wMTJZMjFXYzFwWFJucGFVelUxQ2xsWE1YTlJTRXBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUVRWQ1oyOXlRbWRGUlVGWlR5OU5RVVZDUWtOMGIyUklVbmRqZW05MlRETlNkbUV5Vm5VS1RHMUdhbVJIYkhaaWJrMTFXakpzTUdGSVZtbGtXRTVzWTIxT2RtSnVVbXhpYmxGMVdUSTVkRTFDV1VkRGFYTkhRVkZSUW1jM09IZEJVVWxGUTBoT2FncGhSMVpyWkZkNGJFMUVXVWREYVhOSFFWRlJRbWMzT0hkQlVVMUZTMGRaTVU1dFVteGFSRmw2VFVSVmQxcEhVVEpOVkVKcVRtcE5lRTFFWkdsT1YwVXdDazF0VlhoYVZFcHNUa2RLYUU5SFdYbE5WRUYzU0VGWlMwdDNXVUpDUVVkRWRucEJRa0pCVVU5Uk0wcHNXVmhTYkVsR1NteGlSMVpvWXpKVmQweFJXVXNLUzNkWlFrSkJSMFIyZWtGQ1FsRlJabGt5YUdoaFZ6VnVaRmRHZVZwRE1YQmlWMFp1V2xoTmRsb3llSEJaYlUxMFdraHNkVmxYTVhCWmVrRmtRbWR2Y2dwQ1owVkZRVmxQTDAxQlJVZENRVGw1V2xkYWVrd3lhR3haVjFKNlRESXhhR0ZYTkhkbldXOUhRMmx6UjBGUlVVSXhibXREUWtGSlJXWkJValpCU0dkQkNtUm5SR1JRVkVKeGVITmpVazF0VFZwSWFIbGFXbnBqUTI5cmNHVjFUalE0Y21ZclNHbHVTMEZNZVc1MWFtZEJRVUZaVWt0MlVrRllRVUZCUlVGM1FrZ0tUVVZWUTBsSFEyaHRUVFJXVERkMVJrRlRVWFo1T1hwUlRIZzFVRVJHVEVkb2NTOWxUbEpZTm1Sa1RtUkpRVTFqUVdsRlFUWkJaV0UwUVVSWVRWUjRNZ281SzAxVVJ6bEJTRmRNVmxWcFEwaG1WekZPZEdVd09WZFpiMWx0UVRacmQwTm5XVWxMYjFwSmVtb3dSVUYzVFVSaFFVRjNXbEZKZDJSU2VsZG1NVEJMQ2pKRVV6QXJSR0Z0YmpFNVNXWlVUa1ZhVVRaek5qQjZVWGwzV0RncmEzQlVaVWROY2k5cGQxbG1Na0pKYm5wWk4zRTRjVUk1Ylhjd1FXcEZRV3RrYUhNS2NEazVPSEJIVGk5d1NHRllNa2t5TUdsS1FVRTNZakJHZURoU05rNXVNbVZvZWpOdU1YSnNlRGQwTkRaSlZqTjBTVEJDZVZaTWVtaHNOWHB5Q2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1667701219,
          "logIndex": 6593474,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/glibc-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/glibc-dynamic",
      "githubWorkflowSha": "f56ded63050dd610c63107b5a42e1e2e4ba8f210",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3402562997",
      "sha": "f56ded63050dd610c63107b5a42e1e2e4ba8f210"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

