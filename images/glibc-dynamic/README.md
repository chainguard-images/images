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
| `latest` | `sha256:e1a1b52e99c329f6b975f0c93b274cfdfc500f9511bd3cf349186b6d1a554512`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:e1a1b52e99c329f6b975f0c93b274cfdfc500f9511bd3cf349186b6d1a554512) | `amd64` |



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
        "docker-manifest-digest": "sha256:e1a1b52e99c329f6b975f0c93b274cfdfc500f9511bd3cf349186b6d1a554512"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "79ac41e76acee4a5fb43a53e0ee3369d02cfcb30",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/glibc-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCICbZekFYDLsIZUIkU96ZwPhz23gC84uLNgfT6ZbIle+7AiAJKamspjIlgaQGY9ySRFgwIPHEbpEhyrx2PcnS4BJvRQ==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI4YTFhOTI2MDEyMzI4YTZmYzQ5MTI3YWJlNzk3NDE0OTRkMzdmYWYxM2Q3Y2MyODljZWVmOGI1OTkzYzNhMzlmIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURHajA3TVF4QWxBUjBpTUs1WGJrUzVUQnV6cTFIellJbWZmZTVOQWE5VUlRSWhBUFVnZzN0NEhJZWtLNXE1aFFYcDludnVzVnIwMkF4R25pREJWVnFNL2lLYyIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjFSRU5EUVhvclowRjNTVUpCWjBsVlYyTkljMGR4UWxsMVVqWjBLMmhUT1NzcmMxaHBRa2RKTnpodmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFVFhoTlJFbDZUbXBKZWxkb1kwNU5ha2w0VFVSTmVFMUVTVEJPYWtsNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZUUVZGRmRtdEhNVEYwTnpGb2NGUlJSRmhUWVd4alJYRmxZV2x5YlVFeFV5OWtSM1lLWWpWQ1JGWnVWbVZxTjNwTVNrMXdXbVpFUjB0NVoweFJaMVY0Y0dwNVdIcGplVWxPTVhwRGNEVnllWEpDVVUxamRUWlBRMEZzTkhkblowcGhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV2UVRWNENucEJNMkpCTlZscWVrTTFZMkUyZWtWaGQzTlNZbGhCZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKM1dVUldVakJTUVZGSUwwSkhWWGRaTkZwb1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhOaFYwcHFURmRTTldKdFJuUmhWMDEyVEcxa2NHUkhhREZaYVRrellqTktjbHB0ZUhaa00wMTJZMjFXYzFwWFJucGFVelUxQ2xsWE1YTlJTRXBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUVRWQ1oyOXlRbWRGUlVGWlR5OU5RVVZDUWtOMGIyUklVbmRqZW05MlRETlNkbUV5Vm5VS1RHMUdhbVJIYkhaaWJrMTFXakpzTUdGSVZtbGtXRTVzWTIxT2RtSnVVbXhpYmxGMVdUSTVkRTFDV1VkRGFYTkhRVkZSUW1jM09IZEJVVWxGUTBoT2FncGhSMVpyWkZkNGJFMUVXVWREYVhOSFFWRlJRbWMzT0hkQlVVMUZTMFJqTlZsWFRUQk5WMVV6VG0xR2FscFhWVEJaVkZadFdXcFJlbGxVVlhwYVZFSnNDbHBVVFhwT2FteHJUVVJLYWxwdFRtbE5la0YzU0VGWlMwdDNXVUpDUVVkRWRucEJRa0pCVVU5Uk0wcHNXVmhTYkVsR1NteGlSMVpvWXpKVmQweFJXVXNLUzNkWlFrSkJSMFIyZWtGQ1FsRlJabGt5YUdoaFZ6VnVaRmRHZVZwRE1YQmlWMFp1V2xoTmRsb3llSEJaYlUxMFdraHNkVmxYTVhCWmVrRmtRbWR2Y2dwQ1owVkZRVmxQTDAxQlJVZENRVGw1V2xkYWVrd3lhR3haVjFKNlRESXhhR0ZYTkhkbldXOUhRMmx6UjBGUlVVSXhibXREUWtGSlJXWkJValpCU0dkQkNtUm5RVWxaU2t4M1MwWk1MMkZGV0ZJd1YzTnVhRXA0UmxwNGFYTkdhak5FVDA1S2REVnlkMmxDYWxwMlkyZEJRVUZaVVhJMVlUZG5RVUZCUlVGM1FrZ0tUVVZWUTBsR2QwdzVRelZwV2pNNWVYRllOWEJxWmxGSU5YaG1NV1IwUTNkRmRuWkRiVXRNUTAxV2FEaFBZMWd5UVdsRlFXMHlVVk5WZEVGWWMzTXhid3BHUjBWdVNsazVhRlkzU0U1TlpGRTJhekozVW5JM1RsaFpVM1JHTldSdmQwTm5XVWxMYjFwSmVtb3dSVUYzVFVSYWQwRjNXa0ZKZDBsTGVqVXpkVnBQQ2paRE9YTTVLMDFuVm5ReGJHMXlTRFZoY2tsc1kwNDVZbWw1WkVacGRFbDJUM3BVVkZKaloxbFVZMUVyWkZSMVluQnRSVmx1ZVd4SFFXcENkemh4TlRjS2RDOUZVMjVEU2tzMlozTldTMUZtZDBGU1FWQlZOVU0xVVhsR1RUUTFNemN6TVhCTVRWQm9SR1ZDWm1kR1ZWQnpObkZaTUdkWWFVZE1iemc5Q2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1667183787,
          "logIndex": 6194372,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/glibc-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/glibc-dynamic",
      "githubWorkflowSha": "79ac41e76acee4a5fb43a53e0ee3369d02cfcb30",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3358150683",
      "sha": "79ac41e76acee4a5fb43a53e0ee3369d02cfcb30"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

