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
| `latest` | `sha256:9f3e331e68d47c21b3d666b2111d8d1d33bb0f62353896f0d25ef2c0b93e04f2`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:9f3e331e68d47c21b3d666b2111d8d1d33bb0f62353896f0d25ef2c0b93e04f2) | `amd64` |



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
        "docker-manifest-digest": "sha256:9f3e331e68d47c21b3d666b2111d8d1d33bb0f62353896f0d25ef2c0b93e04f2"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "d38aa4d2013ab2c0625df90bc134228ccddbf6db",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/glibc-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIHvGivty7xt7XsN2Q0BK7Qmu9kOKMcDAqmxXQy8eXdT9AiEA8y+1ZpaEshzvt3Xh8R/DsLp5Qcgt8Bu4txVT4zCgfiw=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJiY2NmOTQ3ZmRjNTBhMjMwM2VjODhlMTAzOTk0NTE0ZWE0YWM2MjI2MDYwNjRmMGVlOTIwNmQ3ZmNiNDQyNzRkIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURnSVc5NUx1cXdQR0p3NjZFQ0FtZjFONUI0V3R3MzlMRXY3bmtzQVZQbEJnSWdkaWpxUHo0UEVpSW9PbmVNOURvbHdHUmJMdEpzdklFblltamtoOEcyNkU4PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBSRU5EUVhwMVowRjNTVUpCWjBsVlpETlpaMjA1ZUd4UWIyb3lSbmRVYkVacmRrdHBZazQzU1V3NGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhwTlJHdDZUa1JSZWxkb1kwNU5ha2w0VFVSRmVrMUVhekJPUkZGNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVY0YVVrek5XbHFkVmhEVVN0emNUTlFXbWxxWlV0V1RHRjFjVzVVZDFod1ZXVjNVV2NLY1c0M2RYQlNabUZvVjJSYUsyaDBkVXhSWWs5aVUxRXhaMlpOVTNkM2N6Wm9TeXRQUlhveFJEZGtlRzlZTW0xcE1uRlBRMEZzYjNkblowcFhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlY0T0dWUENqWmhORmgyYW14YVNXTnJOR0l5T0doeGVEaDZLMVEwZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKM1dVUldVakJTUVZGSUwwSkhWWGRaTkZwb1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhOaFYwcHFURmRTTldKdFJuUmhWMDEyVEcxa2NHUkhhREZaYVRrellqTktjbHB0ZUhaa00wMTJZMjFXYzFwWFJucGFVelUxQ2xsWE1YTlJTRXBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUVRWQ1oyOXlRbWRGUlVGWlR5OU5RVVZDUWtOMGIyUklVbmRqZW05MlRETlNkbUV5Vm5VS1RHMUdhbVJIYkhaaWJrMTFXakpzTUdGSVZtbGtXRTVzWTIxT2RtSnVVbXhpYmxGMVdUSTVkRTFDU1VkRGFYTkhRVkZSUW1jM09IZEJVVWxGUWtoQ01RcGpNbWQzVG1kWlMwdDNXVUpDUVVkRWRucEJRa0YzVVc5YVJFMDBXVmRGTUZwRVNYZE5WRTVvV1dwS2FrMUVXWGxPVjFKdFQxUkNhVmw2UlhwT1JFbDVDazlIVG1wYVIxSnBXbXBhYTFscVFXTkNaMjl5UW1kRlJVRlpUeTlOUVVWRlFrRTFSR050Vm1oa1IxVm5WVzFXYzFwWFJucGFWRUYwUW1kdmNrSm5SVVVLUVZsUEwwMUJSVVpDUWpscVlVZEdjR0p0WkRGWldFcHJURmRzZEZsWFpHeGplVGx1WWtkc2FWbDVNV3RsVnpWb1lsZHNhazFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxuV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUk0UWtodlFXVkJRakpCUVdobkNtdDJRVzlWZGpsdlVtUklVbUY1WlVWdVJWWnVSMHQzVjFCalRUUXdiVE50ZGtOSlIwNXRPWGxCUVVGQ1p6bERlVTB5UVVGQlFWRkVRVVZqZDFKUlNXY0tTUzh2VWpoT09HWmhabEJ2YjBoVU1tOVNWV0ZJT0hOYVlVVkZhVEZMTW5Vd2NUWkhhRFoyVDJseU1FTkpVVU15Vkhsc1ZVaG9iSE5hVlVwdGJYbHJNQW93UmpCT01XdEhkRlEwYmpGMGRHVkVjM2R6VVZObFZ6QlBSRUZMUW1kbmNXaHJhazlRVVZGRVFYZE9ia0ZFUW10QmFrSXdja0kwVW1jNFltUnRUSFpxQ2tOdFNHdDZSRGwwYWt4WFlUZHNMelJHZGpObVZYUmtWRk4yT0VkVWNGaGlLemdyVlRCQ1pURk1hR3hOT0UxWVRTOWFPRU5OUVRreFprWlhaVE5zZDI0S05sbHlZbVpDTkZsTlJrOTBOVFpLUW5CaVNYSk1lRmhIV2xSUVUzcHZjM2c0UW5RME1qUnVlVTh6ZDFBclUyRnllV1JNWkhKblBUMEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1665653687,
          "logIndex": 5017994,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/glibc-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/glibc-dynamic",
      "githubWorkflowSha": "d38aa4d2013ab2c0625df90bc134228ccddbf6db",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3241251966",
      "sha": "d38aa4d2013ab2c0625df90bc134228ccddbf6db"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

