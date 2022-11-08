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
| `latest` | `sha256:a992a0d285bfc5c1e8d0d8da547ec7fe5db34f304969b823bd07bf0dad599caa`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a992a0d285bfc5c1e8d0d8da547ec7fe5db34f304969b823bd07bf0dad599caa) | `amd64` |



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
        "docker-manifest-digest": "sha256:a992a0d285bfc5c1e8d0d8da547ec7fe5db34f304969b823bd07bf0dad599caa"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "ae48c6891783f42c9982e36b8ef8857258d916d2",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/glibc-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQC8fjKUKV7CkPxE4Lxtc5p+Qo3wMbVShQrLwcpz9mX+AwIgJNblj7/EDjA2HaDE7AsGl0R3oC4QvWV8cNprqOhn6n8=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI4MGZkZTM1M2RlYzYyYWJkMzQ1MWRjMDY2NDY5ODBiZWEzM2NkYTIwZGYwYzVkNGM0MjUzYjdlODcyMTVlZTRmIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJRVhMYXNNM2Z3Q2djQXNoUnN0aTl2bHFNS1dFYVc1aWhsL3ZYT3lBNVFFbkFpQW1zQjJENE1IMmY1bERXYUp5a2Y3U2JCSmx4OE5kYldZRGFwRTlrMEMwOGc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjFWRU5EUVhvclowRjNTVUpCWjBsVlZ6ZExPVTAzTVV0MlQyWXZVRXhQYlZCUldIUlZRa0prZUdsbmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRSTlJFbDNUMVJGTkZkb1kwNU5ha2w0VFZSQk5FMUVTWGhQVkVVMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZIV0ZvNE4yUktTVEp5WVdKQlMyaE1aRlJ0YjJOeWRVWlVLMVY0YUVkTU9GQnZlakVLZWpWNmRrUkJjbGcwZW5WQmEySmhWMFJyVUhobGVteFNVakIwWTBoUFNWVlVjWHB2ZFV4VmFXUlNXVVZzWkZWUE1rdFBRMEZzTkhkblowcGhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZET1dNNUNrUTRSR3hJV2xaTFYycHhaVGhUY3pWaFdrRTRUVU5uZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKM1dVUldVakJTUVZGSUwwSkhWWGRaTkZwb1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhOaFYwcHFURmRTTldKdFJuUmhWMDEyVEcxa2NHUkhhREZaYVRrellqTktjbHB0ZUhaa00wMTJZMjFXYzFwWFJucGFVelUxQ2xsWE1YTlJTRXBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUVRWQ1oyOXlRbWRGUlVGWlR5OU5RVVZDUWtOMGIyUklVbmRqZW05MlRETlNkbUV5Vm5VS1RHMUdhbVJIYkhaaWJrMTFXakpzTUdGSVZtbGtXRTVzWTIxT2RtSnVVbXhpYmxGMVdUSTVkRTFDV1VkRGFYTkhRVkZSUW1jM09IZEJVVWxGUTBoT2FncGhSMVpyWkZkNGJFMUVXVWREYVhOSFFWRlJRbWMzT0hkQlVVMUZTMGRHYkU1RWFHcE9hbWMxVFZSak5FMHlXVEJOYlUwMVQxUm5lVnBVVFRKWmFtaHNDbHBxWnpST1ZHTjVUbFJvYTA5VVJUSmFSRWwzU0VGWlMwdDNXVUpDUVVkRWRucEJRa0pCVVU5Uk0wcHNXVmhTYkVsR1NteGlSMVpvWXpKVmQweFJXVXNLUzNkWlFrSkJSMFIyZWtGQ1FsRlJabGt5YUdoaFZ6VnVaRmRHZVZwRE1YQmlWMFp1V2xoTmRsb3llSEJaYlUxMFdraHNkVmxYTVhCWmVrRmtRbWR2Y2dwQ1owVkZRVmxQTDAxQlJVZENRVGw1V2xkYWVrd3lhR3haVjFKNlRESXhhR0ZYTkhkbldXOUhRMmx6UjBGUlVVSXhibXREUWtGSlJXWkJValpCU0dkQkNtUm5SR1JRVkVKeGVITmpVazF0VFZwSWFIbGFXbnBqUTI5cmNHVjFUalE0Y21ZclNHbHVTMEZNZVc1MWFtZEJRVUZaVWxVdk9FUm5RVUZCUlVGM1FrZ0tUVVZWUTBsSGNtaHdSblZoU21kdmFISmFZbXBwUjJsMGNtWlFXbXBtVWxndlMzVldSeXRRZDAweVNrZHpOM1J0UVdsRlFXZG1XaXRtUWl0YVRtMXlMd3BMZERSTlUxQm5OVkpTTlUwMVdFZFlOVlk0VkhvMFpFbFFjVVJqVXpSVmQwTm5XVWxMYjFwSmVtb3dSVUYzVFVSaFFVRjNXbEZKZDBRMkszTmxOMUZ3Q25GdlMzcGhSa05aVFVoeU1WaDJUaXRUYzJoMmQwSkJUbU5aWjJsdVZrbE9aSFY2ZVhCYU5HZDFSR2RHY1RsaldVRXhZbTVJZFZBdlFXcEZRWFpVY2tJS2JsazNhelZUTkcxWVRuZHZNRTgzVGtSUGRWRm5lRXRvVmt4T01HVTBVRVpHTDJ4TFFUSkNWMEZJVTFaVWFGbERXU3R3VDBrNGNYZHBRa2MzQ2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1667873362,
          "logIndex": 6705561,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/glibc-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/glibc-dynamic",
      "githubWorkflowSha": "ae48c6891783f42c9982e36b8ef8857258d916d2",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3415763821",
      "sha": "ae48c6891783f42c9982e36b8ef8857258d916d2"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

