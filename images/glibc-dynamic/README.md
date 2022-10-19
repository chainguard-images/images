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
| `latest` | `sha256:c8c3bbdde6149bd65d63240602b4e29a22df3bb1cde91bf353db2e195ca8eb2d`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c8c3bbdde6149bd65d63240602b4e29a22df3bb1cde91bf353db2e195ca8eb2d) | `amd64` |



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
        "docker-manifest-digest": "sha256:c8c3bbdde6149bd65d63240602b4e29a22df3bb1cde91bf353db2e195ca8eb2d"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "fc98f443d3b6fdd132d27efa5a2c333dac6a5dec",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/glibc-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQC4gfaRQx+q8p9oTf25MF51ryvtffjXFSgXpFhisHRzTwIgb93H4VZdQCoIVU/mEeSbXgDMoloXGmjWqzTND/zyxxw=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI0YmFiY2RjZjZjYmEwMzA1MGY0ZTk2ZjllZTcxNjBhODI1MTU0NDUxZGJjY2UyMzQxZGIwMWM5ZDNjM2UxMjQ0In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJSFlZWFVlbGdBVXM2TnlmU05mTndVV3E2MDRUaXhWSzdwR0x6b3ROK1dUMkFpQVR4NjYwNnVKY2RFTEpCKy83aFpicndGZHh3SnppMVhpYllUZzNKdzdzVlE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjFha05EUVRCRFowRjNTVUpCWjBsVllrUlNWVU52VkdaU05WQnRibFZFVlVScWJtTm5RbnBtUTIxbmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRWTlJFa3dUWHBOTkZkb1kwNU5ha2w0VFVSRk5VMUVTVEZOZWswMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVV3TjA5S2VrWTFTbEJIVW5KWU4xa3JNMmswUWtGUFNqSkNWWEJoZEZoUmF6Wm5kR1VLU2poVVZIUkJZMWxzVjFWS1drTnJURTg1ZFhwNmNVeFVaQ3MyTlU0MmNHeHplalpaU0VSR04wWXhTbVJYWkcxWFQzRlBRMEZzT0hkblowcGlUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZzYjBJeUNrZHROM04wZG5SS2JtcEhOVE5OVFZSSkwyaFlNbUZWZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKM1dVUldVakJTUVZGSUwwSkhWWGRaTkZwb1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhOaFYwcHFURmRTTldKdFJuUmhWMDEyVEcxa2NHUkhhREZaYVRrellqTktjbHB0ZUhaa00wMTJZMjFXYzFwWFJucGFVelUxQ2xsWE1YTlJTRXBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUVRWQ1oyOXlRbWRGUlVGWlR5OU5RVVZDUWtOMGIyUklVbmRqZW05MlRETlNkbUV5Vm5VS1RHMUdhbVJIYkhaaWJrMTFXakpzTUdGSVZtbGtXRTVzWTIxT2RtSnVVbXhpYmxGMVdUSTVkRTFDV1VkRGFYTkhRVkZSUW1jM09IZEJVVWxGUTBoT2FncGhSMVpyWkZkNGJFMUVXVWREYVhOSFFWRlJRbWMzT0hkQlVVMUZTMGRhYWs5VWFHMU9SRkY2V2tST2FVNXRXbXRhUkVWNlRXMVJlVTR5Vm0xWlZGWm9DazF0VFhwTmVrNXJXVmROTWxsVVZtdGFWMDEzU0VGWlMwdDNXVUpDUVVkRWRucEJRa0pCVVU5Uk0wcHNXVmhTYkVsR1NteGlSMVpvWXpKVmQweFJXVXNLUzNkWlFrSkJSMFIyZWtGQ1FsRlJabGt5YUdoaFZ6VnVaRmRHZVZwRE1YQmlWMFp1V2xoTmRsb3llSEJaYlUxMFdraHNkVmxYTVhCWmVrRmtRbWR2Y2dwQ1owVkZRVmxQTDAxQlJVZENRVGw1V2xkYWVrd3lhR3haVjFKNlRESXhhR0ZYTkhkbldYTkhRMmx6UjBGUlVVSXhibXREUWtGSlJXWlJVamRCU0d0QkNtUjNRVWxaU2t4M1MwWk1MMkZGV0ZJd1YzTnVhRXA0UmxwNGFYTkdhak5FVDA1S2REVnlkMmxDYWxwMlkyZEJRVUZaVUhWSlFVcHlRVUZCUlVGM1Fra0tUVVZaUTBsUlEydHlSblpSVGpoNE5rUTJlWFFyVnpWbWJUVk5NazV3Wnpabk1GVkNZMEZwUjB4Q2VYZzFjRk0xUVdkSmFFRkpVelJtWWtreGFWTmxad3BLYTFGM1dTdHVkM2xITjFoeWFFdDJNREJ1YTFFM2VuWmpWMnczZDJ0RFVrMUJiMGREUTNGSFUwMDBPVUpCVFVSQk1tZEJUVWRWUTAxUlF5dEhkV3gzQ2xrMVRVaHJhRVFyZFhOdksyTmhTRTVTT0ZaaVNHMDVRelEwWWtSbVdtSTFVbWxOUjJGMlQxQXhlRUYxYUc5Q01HOURSbVZvUm1kaWQybEJRMDFCTVU4S1UxWllkbEJNTlVsdlZIVlpUVXhFWm1kT1oweEViMFZwUkhCbFpIWkdLelJHVW5CSFFVVmxOV1ZEY0dOVFIyaFlPRFpDVVdWbldHOW1ZVE5hTm5jOVBRb3RMUzB0TFVWT1JDQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENnPT0ifX19fQ==",
          "integratedTime": 1666147422,
          "logIndex": 5403137,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/glibc-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/glibc-dynamic",
      "githubWorkflowSha": "fc98f443d3b6fdd132d27efa5a2c333dac6a5dec",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3278420816",
      "sha": "fc98f443d3b6fdd132d27efa5a2c333dac6a5dec"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

