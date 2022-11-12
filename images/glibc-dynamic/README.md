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
| `latest` | `sha256:3d2ea788b87938ea440f6255664112786dc509cd3ae0a2ad1d5a87d3c94b8083`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:3d2ea788b87938ea440f6255664112786dc509cd3ae0a2ad1d5a87d3c94b8083) | `amd64` |



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
        "docker-manifest-digest": "sha256:3d2ea788b87938ea440f6255664112786dc509cd3ae0a2ad1d5a87d3c94b8083"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "26fa5882ef741f10a7553b0d58a646238927a2ea",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/glibc-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCID7PNutZptUsCNJ9j0K8DQEtobcj2ZSJKjDTkZx1D9eyAiBrI5IkNusSbDkAW0zSFQlSpgppTs88srEcrNJFpvuovA==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJjOTFkMGYyZjM1YzhmMjRkMTY2Y2UyYzgxMDE5ZTcwMzc4NTVhZmViMmZkZjBlOWRmYjdkOWE3MDdmYTRiNzkxIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJR1daWDR5ZkoyYjk1WG1kMFNybUY5aElsY1BhdkhsQ1c2OXpzbDZvaWZuaUFpQmZiMk00S00wOVdsWlJ6aXhKWVIyTFdIUW9vR3FjNlFYd0xKa21HV1k0emc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjFWRU5EUVRCRFowRjNTVUpCWjBsVllWWmFkVkZyZG5wQmMweERkMjlXVUhSRVR5OHhRak5WUjNsUmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlhsTlJFbDNUbnBGZUZkb1kwNU5ha2w0VFZSRmVVMUVTWGhPZWtWNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZZWlU0MVFVMVZWVk42T0RKTmNUSjJPVlJ6YTJwU1RqRmxiMVZaZG1OTlVFWllVamdLYWt4Sk9HVkhLMDFyVGxoSVlqQktlV1VyYVVsdk9IZHpWVWhYYTBkeUsyMXZZaTg1Y1V4Q1dXeE1RMHB6TTJSNmVFdFBRMEZzT0hkblowcGlUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZvWVdoNENqWndUVmxYVVdoV1MzTlRja28xTml0MGNFTldRMlJWZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKM1dVUldVakJTUVZGSUwwSkhWWGRaTkZwb1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhOaFYwcHFURmRTTldKdFJuUmhWMDEyVEcxa2NHUkhhREZaYVRrellqTktjbHB0ZUhaa00wMTJZMjFXYzFwWFJucGFVelUxQ2xsWE1YTlJTRXBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUVRWQ1oyOXlRbWRGUlVGWlR5OU5RVVZDUWtOMGIyUklVbmRqZW05MlRETlNkbUV5Vm5VS1RHMUdhbVJIYkhaaWJrMTFXakpzTUdGSVZtbGtXRTVzWTIxT2RtSnVVbXhpYmxGMVdUSTVkRTFDV1VkRGFYTkhRVkZSUW1jM09IZEJVVWxGUTBoT2FncGhSMVpyWkZkNGJFMUVXVWREYVhOSFFWRlJRbWMzT0hkQlVVMUZTMFJKTWxwdFJURlBSR2Q1V2xkWk0wNUVSbTFOVkVKb1RucFZNVTB5U1hkYVJGVTBDbGxVV1RCT2FrbDZUMFJyZVU0eVJYbGFWMFYzU0VGWlMwdDNXVUpDUVVkRWRucEJRa0pCVVU5Uk0wcHNXVmhTYkVsR1NteGlSMVpvWXpKVmQweFJXVXNLUzNkWlFrSkJSMFIyZWtGQ1FsRlJabGt5YUdoaFZ6VnVaRmRHZVZwRE1YQmlWMFp1V2xoTmRsb3llSEJaYlUxMFdraHNkVmxYTVhCWmVrRmtRbWR2Y2dwQ1owVkZRVmxQTDAxQlJVZENRVGw1V2xkYWVrd3lhR3haVjFKNlRESXhhR0ZYTkhkbldYTkhRMmx6UjBGUlVVSXhibXREUWtGSlJXWlJVamRCU0d0QkNtUjNSR1JRVkVKeGVITmpVazF0VFZwSWFIbGFXbnBqUTI5cmNHVjFUalE0Y21ZclNHbHVTMEZNZVc1MWFtZEJRVUZaVW5Cc01GQm9RVUZCUlVGM1Fra0tUVVZaUTBsUlEybzBibnBOS3pGR1R6aHRWblZOUWprNFVsUjRiMUpNVkcxMlFWWkpibTFNY0RsNk5uSnlja3N6VVhkSmFFRkpUSFk0SzFONlpuQkNNZ3BKV25Bek1WRlJhM1ZRVnl0NVoxUkNiVmgyTlc5U2JrUldTbXdyV1d0eE9VMUJiMGREUTNGSFUwMDBPVUpCVFVSQk1tTkJUVWRSUTAxRlIxWnFjM0JoQ21OMlV6QkxURU5QVW1KMU9WbDNZVkprYmt0UmIyZGtPVmRhTUhaRldVbExOa2t5ZVV4V1pVSnViMjlvTURKWVpIWk1RbGxYVmtkd2FVRkpkMHd3VjFrS1JUZFpiRE5MZDFWc1Zta3piRU5QT1dwdVFXNXBXV2haVTBGNlZHSlhZalZMZGt0NFpuRk1ZVzVwU25rdlMxZG9TVVZMVXpCamFuQkNNR05GQ2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1668218837,
          "logIndex": 6907109,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/glibc-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/glibc-dynamic",
      "githubWorkflowSha": "26fa5882ef741f10a7553b0d58a646238927a2ea",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3449143884",
      "sha": "26fa5882ef741f10a7553b0d58a646238927a2ea"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

