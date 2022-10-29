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
| `latest` | `sha256:4a4ed422fc2edefc3c7cefba7954744eb5b8194898a424aac14529b1157bf7b6`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:4a4ed422fc2edefc3c7cefba7954744eb5b8194898a424aac14529b1157bf7b6) | `amd64` |



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
        "docker-manifest-digest": "sha256:4a4ed422fc2edefc3c7cefba7954744eb5b8194898a424aac14529b1157bf7b6"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "39fb6e193f78b63f3ce285be8aadf5f22078be59",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/glibc-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCICxbBB+S7HPRhTWzhM1Ee2vbIO9gXEAHqHpZd8JnCTPuAiBMWLRwJCMsdv5UbouZjZWf1lCMmjwnUBLlBBTCP4HTaA==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJiNTIwOTcyN2EyODU5MmU4YmZkODZkNTc4OGY4NDJmZjRiMWE1Njk4MWJhNmQ5MzdmNzU5YzFkNDBlMzNhMjgyIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQXY5NHh4aHUrTjBlNDFhQTMzYjlJclU0ci90bFpHUFg3MVBkUGtCc1pLQ0FpQk1HaTZ2V1ZGUUtQM0hwOWFqczVBZExMMGNSdDJPM2k5Vk81TVdFa28yUkE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjFSRU5EUVhvclowRjNTVUpCWjBsVlRGbEJZMFZPZEd4dllWWlBPVFZKTW1Ga1RqVkVaekkyTWt0TmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1RWTlJFbDRUMFJCZVZkb1kwNU5ha2w0VFVSSk5VMUVTWGxQUkVGNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZXVFZoalZ6WlBZemxTTTA0M1RVTmtZMFphVnpkalVXbDVSek5IU0U5TFpUUlRSV2dLU2xaSk9UUnFNbXRZYVN0M1MwUlFMek50Y2pScmIwcFRVWEZzVkVjNEwyUmlZVmdyYm5kTlVFZDJjV0pTVHpnMlMwdFBRMEZzTkhkblowcGhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZsVTFKMENsbDVNbUZ0ZVZsdk9HZ3llREZoVmxkUmVraDZibkkwZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKM1dVUldVakJTUVZGSUwwSkhWWGRaTkZwb1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhOaFYwcHFURmRTTldKdFJuUmhWMDEyVEcxa2NHUkhhREZaYVRrellqTktjbHB0ZUhaa00wMTJZMjFXYzFwWFJucGFVelUxQ2xsWE1YTlJTRXBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUVRWQ1oyOXlRbWRGUlVGWlR5OU5RVVZDUWtOMGIyUklVbmRqZW05MlRETlNkbUV5Vm5VS1RHMUdhbVJIYkhaaWJrMTFXakpzTUdGSVZtbGtXRTVzWTIxT2RtSnVVbXhpYmxGMVdUSTVkRTFDV1VkRGFYTkhRVkZSUW1jM09IZEJVVWxGUTBoT2FncGhSMVpyWkZkNGJFMUVXVWREYVhOSFFWRlJRbWMzT0hkQlVVMUZTMFJOTlZwdFNUSmFWRVUxVFRKWk0wOUhTVEpOTWxsNldUSlZlVTlFVm1sYVZHaG9DbGxYVW0xT1YxbDVUV3BCTTA5SFNteE9WR3QzU0VGWlMwdDNXVUpDUVVkRWRucEJRa0pCVVU5Uk0wcHNXVmhTYkVsR1NteGlSMVpvWXpKVmQweFJXVXNLUzNkWlFrSkJSMFIyZWtGQ1FsRlJabGt5YUdoaFZ6VnVaRmRHZVZwRE1YQmlWMFp1V2xoTmRsb3llSEJaYlUxMFdraHNkVmxYTVhCWmVrRmtRbWR2Y2dwQ1owVkZRVmxQTDAxQlJVZENRVGw1V2xkYWVrd3lhR3haVjFKNlRESXhhR0ZYTkhkbldXOUhRMmx6UjBGUlVVSXhibXREUWtGSlJXWkJValpCU0dkQkNtUm5RVWxaU2t4M1MwWk1MMkZGV0ZJd1YzTnVhRXA0UmxwNGFYTkdhak5FVDA1S2REVnlkMmxDYWxwMlkyZEJRVUZaVVdocFEzRk1RVUZCUlVGM1FrZ0tUVVZWUTBsQ1R6Um9ZbTF2WjNRcmRGcHRSVmh1U0hwTlUyZFlSVGwyWWxONmNucGpXWEV4VURGTllVTmhabkZuUVdsRlFYQkVaQzg1V1VONWNsVnhTZ296TmxkV1EzWnVObGhVZFhwVmNEVktWV2hJY2tkSVQycHBXbUkyZGpaSmQwTm5XVWxMYjFwSmVtb3dSVUYzVFVSYWQwRjNXa0ZKZDFNelZsRkRTMlZIQ25keWVHTmhRM0UzUzNKSEwydExZVUkxU21ScGJETkVWSGxpWTJ0VmNWb3JNRUpoWmxKR2EzaG1hRWhTVW5oTFZ6WjBZMGgxT0hSa1FXcEJja0ZrT1RFS0wzTlFRVFZoYkdVdk5YZFVNWGhJV0VNdmNISk1NM1Z6YUhkbmFIcDRXSGRoUW1jeWJIVkhMeXMzTDNaQlZqRTNTRWgyWldWREswUXphbEU5Q2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1667009886,
          "logIndex": 6077144,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/glibc-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/glibc-dynamic",
      "githubWorkflowSha": "39fb6e193f78b63f3ce285be8aadf5f22078be59",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3349695453",
      "sha": "39fb6e193f78b63f3ce285be8aadf5f22078be59"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

