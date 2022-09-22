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
| `latest` | `sha256:e62fe7ac843cfc58307c8d44ad92a8c90f37f4cc1f6d1cd257ebe496e755cbe2`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:e62fe7ac843cfc58307c8d44ad92a8c90f37f4cc1f6d1cd257ebe496e755cbe2) | `amd64` |



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
        "docker-manifest-digest": "sha256:e62fe7ac843cfc58307c8d44ad92a8c90f37f4cc1f6d1cd257ebe496e755cbe2"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "51d6db187b683d5a0e50186da795456369b3cad9",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/glibc-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIEcl8mEYh2ND1dIm2AZJ31n1VMnbo1d+/oCOWPctFkp6AiEAwKv+cEinw5Zv4+ivLv6m+13UlULIzWIcH8fIKq5kvtY=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJlZjkzMTdiM2ZjYmVlN2Q2YTUzYzRkNjYyZjYxOGVhMjg2MzQyYzIyMDc5N2Y1ZmZkYjRiODNjNTdjNzE0ZmViIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUQxaXpOSmszeE0zUUNFclNnKzhGYk9WajhIbnRteXRobW9wd1dkY3orYjVBSWhBT2dUQ3FUNXczdGJSNjZUV1JvblFVQWM4T3FmRWUrTGE2cW55K2hZcTBERCIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjFWRU5EUVRCRFowRjNTVUpCWjBsVlJGZFRSM1oxUnpkelQzRjVhVzVGU0hJNFVXWkthV2hHUmtOWmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hsTlJFbDZUMVJOZDFkb1kwNU5ha2wzVDFSSmVVMUVTVEJQVkUxM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ0U25SRFNFdERNMVExZUV0Q05UWjFiazh6ZWpkNFNUTlBaMk53T0UxdFRuVlBPVUlLV1ZGbGREUXdZMmxLTjNKSlQzUkhNbk5XZHl0T1ExZFFXSFp5TDFGTVRDdDBOM0pNYjNCblJVcHVhMmt3UmpoYWFUWlBRMEZzT0hkblowcGlUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlUzWmxKRUNuTmlZM00wY0hSeGIwSkdiV1ZhYzB4YWJqQTFOVVE0ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKM1dVUldVakJTUVZGSUwwSkhWWGRaTkZwb1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhOaFYwcHFURmRTTldKdFJuUmhWMDEyVEcxa2NHUkhhREZaYVRrellqTktjbHB0ZUhaa00wMTJZMjFXYzFwWFJucGFVelUxQ2xsWE1YTlJTRXBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUVRWQ1oyOXlRbWRGUlVGWlR5OU5RVVZDUWtOMGIyUklVbmRqZW05MlRETlNkbUV5Vm5VS1RHMUdhbVJIYkhaaWJrMTFXakpzTUdGSVZtbGtXRTVzWTIxT2RtSnVVbXhpYmxGMVdUSTVkRTFDV1VkRGFYTkhRVkZSUW1jM09IZEJVVWxGUTBoT2FncGhSMVpyWkZkNGJFMUVXVWREYVhOSFFWRlJRbWMzT0hkQlVVMUZTMFJWZUZwRVdtdFpha1UwVGpKSk1rOUVUbXRPVjBWM1dsUlZkMDFVWnpKYVIwVXpDazlVVlRCT1ZGbDZUbXBzYVUweVRtaGFSR3QzU0VGWlMwdDNXVUpDUVVkRWRucEJRa0pCVVU5Uk0wcHNXVmhTYkVsR1NteGlSMVpvWXpKVmQweFJXVXNLUzNkWlFrSkJSMFIyZWtGQ1FsRlJabGt5YUdoaFZ6VnVaRmRHZVZwRE1YQmlWMFp1V2xoTmRsb3llSEJaYlUxMFdraHNkVmxYTVhCWmVrRmtRbWR2Y2dwQ1owVkZRVmxQTDAxQlJVZENRVGw1V2xkYWVrd3lhR3haVjFKNlRESXhhR0ZYTkhkbldYTkhRMmx6UjBGUlVVSXhibXREUWtGSlJXWlJVamRCU0d0QkNtUjNRVWxaU2t4M1MwWk1MMkZGV0ZJd1YzTnVhRXA0UmxwNGFYTkdhak5FVDA1S2REVnlkMmxDYWxwMlkyZEJRVUZaVG1wRlNXRXJRVUZCUlVGM1Fra0tUVVZaUTBsUlJHMWljRWh1UWpkT05WaG5kbEZHUWs5cUwyNHJUbFkwWkVWS1ZYSmtVbHBQWWxwd2RIbHBOVkI1ZGtGSmFFRlBNMmh2T0RSdFQxWTJTUXBsUW14SWFGSlhOR1pwVlU4dmMwZFdhamw2ZVZsdmNUWkZjRkpyVFVoSVZFMUJiMGREUTNGSFUwMDBPVUpCVFVSQk1tTkJUVWRSUTAxQmFXZDZUa1V3Q2twRGExSkZOSGhGVjFaSllteFBNVEkyV0hCSlpHMU1TRk5EYUV0M055dG1Va1JNUzJ0ME9YVXJTVTFMVkdKeE4yTnFSWFYwUkN0MVZIZEpkMUJEUVVnS1NXOVZaMEpvUWtaRVdEbEhNa0pNVFZkS1owVnBOMmxNYkZoNmFYcHpSMUp2VTNKbU9FSkpNbmR1UzFKalprTkNkRkFyV2sxell6WkRjMVo2Q2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1663814374,
          "logIndex": 3716601,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/glibc-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3102492857",
      "sha": "51d6db187b683d5a0e50186da795456369b3cad9"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

