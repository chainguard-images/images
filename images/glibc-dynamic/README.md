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
| `latest` | `sha256:af847ba013b71bdc5dff9908b559ddfc33d317efe7a6f4d515f8d30aaa0c5195`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:af847ba013b71bdc5dff9908b559ddfc33d317efe7a6f4d515f8d30aaa0c5195) | `amd64` |



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
        "docker-manifest-digest": "sha256:af847ba013b71bdc5dff9908b559ddfc33d317efe7a6f4d515f8d30aaa0c5195"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "85a6bfe9db976fa7d4f9f48da1787faf17ea1e06",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/glibc-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIEL5BKrYqQLaIl6lB1+aRhki7dLY3xGLXV7vgxB0nRSBAiAVK4LEiyzPbZWJU9Ttr0R510wT5D9fS7w+Gv9EzauS/A==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI3NmFiN2UwYzkwZjNjNTFlMDc5Y2IzNGY3NjFjOWMxMTk4Yzk2MGE2NmVlMmNhYTQxNjIwNDM3OGQ5YjBlNjg4In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNYNXE5d3dpQ1A2WGprQVhxcm9oamtJNm9aVFlIVGlKRlpZV0U0NXNXTXZ3SWdKem5Ddmk5UlJGb2NERi9qVEFkMm1yQzNaSG5vNXBGMjBJbzQvU1MrOHc0PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjFWRU5EUVhvclowRjNTVUpCWjBsVldsZ3hibTltYVUwM1dUSnFUbGN6VUROT2FGTXJaVEZCYzNZNGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRGTlJFbDRUVlJGTkZkb1kwNU5ha2w0VFZSQk1VMUVTWGxOVkVVMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVYwUjJsd05uWm1hRGxITm5nd2FFODFOVmMwYlRKV2VrOUdNR1Y0ZWl0RFV6RmxSRVVLYVhwMk0yNVpOM2hQVW14SlEweHhZVXRaZVdNcmFqZFBibXAxVm5wM09ISTFaekJDYlVnMWN6azNkWGx5TkhBclFYRlBRMEZzTkhkblowcGhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZQVVZoSENrMXRkMGRvY1dwa1owaEpkRlZRYzFoTVVVaHlabFZaZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKM1dVUldVakJTUVZGSUwwSkhWWGRaTkZwb1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhOaFYwcHFURmRTTldKdFJuUmhWMDEyVEcxa2NHUkhhREZaYVRrellqTktjbHB0ZUhaa00wMTJZMjFXYzFwWFJucGFVelUxQ2xsWE1YTlJTRXBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUVRWQ1oyOXlRbWRGUlVGWlR5OU5RVVZDUWtOMGIyUklVbmRqZW05MlRETlNkbUV5Vm5VS1RHMUdhbVJIYkhaaWJrMTFXakpzTUdGSVZtbGtXRTVzWTIxT2RtSnVVbXhpYmxGMVdUSTVkRTFDV1VkRGFYTkhRVkZSUW1jM09IZEJVVWxGUTBoT2FncGhSMVpyWkZkNGJFMUVXVWREYVhOSFFWRlJRbWMzT0hkQlVVMUZTMFJuTVZsVVdtbGFiVlUxV2tkSk5VNTZXbTFaVkdSclRrZFpOVnBxVVRSYVIwVjRDazU2WnpOYWJVWnRUVlJrYkZsVVJteE5SRmwzU0VGWlMwdDNXVUpDUVVkRWRucEJRa0pCVVU5Uk0wcHNXVmhTYkVsR1NteGlSMVpvWXpKVmQweFJXVXNLUzNkWlFrSkJSMFIyZWtGQ1FsRlJabGt5YUdoaFZ6VnVaRmRHZVZwRE1YQmlWMFp1V2xoTmRsb3llSEJaYlUxMFdraHNkVmxYTVhCWmVrRmtRbWR2Y2dwQ1owVkZRVmxQTDAxQlJVZENRVGw1V2xkYWVrd3lhR3haVjFKNlRESXhhR0ZYTkhkbldXOUhRMmx6UjBGUlVVSXhibXREUWtGSlJXWkJValpCU0dkQkNtUm5SR1JRVkVKeGVITmpVazF0VFZwSWFIbGFXbnBqUTI5cmNHVjFUalE0Y21ZclNHbHVTMEZNZVc1MWFtZEJRVUZaVWtacWIweHJRVUZCUlVGM1FrZ0tUVVZWUTBsR2FrcDNUR0pCT0ZsblkyVlNSMWRzVm1NeWIyUkhkbEY1ZDI5SVEwTkhVSHBoWTBSNVRUWjVZVmN4UVdsRlFYUnpjbTgxUlRNM2VtbDNOd28zWVdsNWN6ZDBiMVl5WmtOMWNHMHhOa0oxZEVWRVNGbHZjazVaSzB4amQwTm5XVWxMYjFwSmVtb3dSVUYzVFVSaFFVRjNXbEZKZDJSMlJFWkRlRGh1Q25nd01VaExhV2w2WTFwUlQwczJUMUp1UTFONk5XdDVOR2t6U1RSSVowbHNNbXh6TTBSaU5ERkdXalJIU0ZoQloxbE5hV1paZERsNVFXcEZRV2d6YkRrS09IVkhVMVphVTFsV2MzSXZialIxTUhWTldHRm1XR1ZuUTNjcmVrNXNSbTh5V2taTlQzWmlibGMzZDI1VlRqWm1iMjFMVWsxUlUycDRUR3hSQ2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1667614281,
          "logIndex": 6532667,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/glibc-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/glibc-dynamic",
      "githubWorkflowSha": "85a6bfe9db976fa7d4f9f48da1787faf17ea1e06",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3398285863",
      "sha": "85a6bfe9db976fa7d4f9f48da1787faf17ea1e06"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

