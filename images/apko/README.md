# apko

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/apko/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/apko/actions/workflows/release.yaml)

Container image for running [apko](https://github.com/chainguard-dev/apko) container builds.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/apko:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` `v0.5.0` | `sha256:0b9cd2162968f21b7a66e778831beef30af323b63432d4a779090a1fce5c64e8`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:0b9cd2162968f21b7a66e778831beef30af323b63432d4a779090a1fce5c64e8) | `amd64` `arm64` `armv7` |


## Usage

```
$ docker run -v $PWD:/work cgr.dev/chainguard/apko build examples/alpine-base.yaml apko-alpine:edge apko-alpine.tar
Jul 15 10:35:45.226 [INFO] loading config file: examples/alpine-base.yaml
Jul 15 10:35:45.246 [INFO] [arch:aarch64] detected git+ssh://github.com/chainguard-images/apko.git as VCS URL
Jul 15 10:35:45.246 [INFO] [arch:aarch64] building image 'apko-alpine:edge'
Jul 15 10:35:45.246 [INFO] [arch:aarch64] build context:
Jul 15 10:35:45.246 [INFO] [arch:aarch64]   working directory: /tmp/apko-3633559485
Jul 15 10:35:45.246 [INFO] [arch:aarch64]   tarball path:
Jul 15 10:35:45.246 [INFO] [arch:aarch64]   use proot: false
Jul 15 10:35:45.246 [INFO] [arch:aarch64]   source date: 1970-01-01 00:00:00 +0000 UTC
Jul 15 10:35:45.246 [INFO] [arch:aarch64]   Docker mediatypes: false
Jul 15 10:35:45.246 [INFO] [arch:aarch64]   SBOM output path: /work
Jul 15 10:35:45.246 [INFO] [arch:aarch64]   arch: aarch64
Jul 15 10:35:45.246 [INFO] [arch:aarch64] image configuration:
Jul 15 10:35:45.246 [INFO] [arch:aarch64]   contents:
Jul 15 10:35:45.247 [INFO] [arch:aarch64]     repositories: [https://dl-cdn.alpinelinux.org/alpine/edge/main]
Jul 15 10:35:45.247 [INFO] [arch:aarch64]     keyring:      []
Jul 15 10:35:45.247 [INFO] [arch:aarch64]     packages:     [alpine-base]
Jul 15 10:35:45.247 [INFO] [arch:aarch64]   cmd: /bin/sh -l
Jul 15 10:35:45.247 [INFO] [arch:aarch64] doing pre-flight checks
Jul 15 10:35:45.247 [INFO] [arch:aarch64] building image fileystem in /tmp/apko-3633559485
Jul 15 10:35:45.247 [INFO] [arch:aarch64] initializing apk database
Jul 15 10:35:45.247 [INFO] [arch:aarch64] [cmd:apk] [use-proot:false] [use-qemu:] running: /sbin/apk add --initdb --arch aarch64 --root /tmp/apko-3633559485
Jul 15 10:35:45.251 [INFO] [arch:aarch64] initializing apk world
Jul 15 10:35:45.251 [INFO] [arch:aarch64] initializing apk keyring
Jul 15 10:35:45.251 [INFO] [arch:aarch64] initializing apk repositories
Jul 15 10:35:45.251 [INFO] [arch:aarch64] synchronizing with desired apk world
Jul 15 10:35:45.251 [INFO] [arch:aarch64] [cmd:apk] [use-proot:false] [use-qemu:] running: /sbin/apk fix --root /tmp/apko-3633559485 --no-scripts --no-cache --update-cache --arch aarch64
Jul 15 10:35:46.360 [INFO] [arch:aarch64] [cmd:/bin/busybox] [use-proot:false] [use-qemu:] running: /usr/sbin/chroot /tmp/apko-3633559485 /bin/busybox --install -s
Jul 15 10:35:46.369 [INFO] [arch:aarch64] generating supervision tree
Jul 15 10:35:46.369 [INFO] [arch:aarch64] finished building filesystem in /tmp/apko-3633559485
Jul 15 10:35:46.430 [INFO] [arch:aarch64] built image layer tarball as /tmp/apko-temp-2617849866/apko-aarch64.tar.gz
Jul 15 10:35:46.490 [INFO] [arch:aarch64] building OCI image from layer '/tmp/apko-temp-2617849866/apko-aarch64.tar.gz'
Jul 15 10:35:46.538 [INFO] [arch:aarch64] OCI layer digest: sha256:cf1cdb16fdec0215d3c427bddc564aa441899e9b35bce6c364feea24d2bcd228
Jul 15 10:35:46.538 [INFO] [arch:aarch64] OCI layer diffID: sha256:adde6fa1261f8d45d0b32185c4ab0b1024ba611c1fbb84600f7246308cc82bab
Jul 15 10:35:46.538 [WARNING] [arch:aarch64] multiple SBOM formats requested, uploading SBOM with media type: spdx+json
Jul 15 10:35:46.750 [INFO] [arch:aarch64] output OCI image file to apko-alpine.tar
```

We can load the resultant tar file into Docker:

```
docker load < apko-alpine.tar
Loaded image: apko-alpine:edge
```


## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/apko:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/apko:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/apko"
      },
      "image": {
        "docker-manifest-digest": "sha256:0b9cd2162968f21b7a66e778831beef30af323b63432d4a779090a1fce5c64e8"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "f55fd0307788f1c8b4457c88dd593eb217454f84",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/apko",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDWNi0NqLaUF7zC2v+IXFpYKdBtmxLF9oAxK5nmkrYM/QIgEyB1W/1Fz1vOdeXO76WTME56pGeNejsucvh1s3edEQI=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI5MmRkOTUxMWQwNTkwM2M5N2FiYjM4NDc5ZDYwM2IxY2E1N2UxYzFhNzc2MzIyMDIzNzdlY2QxNGFlYzA0ODlkIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNheXdWWmkwdHRSalRQcktDU0pyOXpDd3lSRkIzMExxVWJrcE1FdzFSMkpnSWhBTzRRRUQyZnpzNmtKVGNyL0ZmN3dCdzc1SUZ2U3NrYlk1S1JlcTNCay9ZcSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhSRU5EUVhreVowRjNTVUpCWjBsVlVUWlhjREpvY1hkbFdERk9lbWxEY0hoRWFrOXhUemhSY2tsWmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRGTlJFVjRUbXBKTWxkb1kwNU5ha2w0VFVSRk1VMUVSWGxPYWtreVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZaYlZWUFFVTTRaVWhZWkN0TFptRlZSMjF6ZUhWdlNsZG5OMkptT0RZd09YRkxja1lLTVRob1ZXNXhTVkpMYmpaNFNVVXhaVUpKVURkcGN6SlBRMjVzYmpkNllVeG9aV2RMUjNWUFdFa3dXa0ZKZGpKUmJFdFBRMEZyZDNkblowcEpUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZKWjFndkNqRjBSbUlyYUhSbU1rSmFVVVJzYVhOSmJXUkdla2c0ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwbldVUldVakJTUVZGSUwwSkdkM2RYYjFwWllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Um5kaE1qaDJURzFrY0dSSGFERlphVGt6WWpOS2NscHRlSFprTTAxMlkyMVdjMXBYUm5wYVV6VTFXVmN4YzFGSVNteGFiazEyQ21GSFZtaGFTRTEyWWxkR2NHSnFRVFZDWjI5eVFtZEZSVUZaVHk5TlFVVkNRa04wYjJSSVVuZGplbTkyVEROU2RtRXlWblZNYlVacVpFZHNkbUp1VFhVS1dqSnNNR0ZJVm1sa1dFNXNZMjFPZG1KdVVteGlibEYxV1RJNWRFMUNXVWREYVhOSFFWRlJRbWMzT0hkQlVVbEZRMGhPYW1GSFZtdGtWM2hzVFVSWlJ3cERhWE5IUVZGUlFtYzNPSGRCVVUxRlMwZFpNVTVYV210TlJFMTNUbnBqTkU5SFdYaFplbWhwVGtSUk1VNHlUVFJQUjFKclRsUnJlbHBYU1hsTlZHTXdDazVVVW0xUFJGRjNTRUZaUzB0M1dVSkNRVWRFZG5wQlFrSkJVVTlSTTBwc1dWaFNiRWxHU214aVIxWm9ZekpWZDBwQldVdExkMWxDUWtGSFJIWjZRVUlLUWxGUlYxa3lhR2hoVnpWdVpGZEdlVnBETVhCaVYwWnVXbGhOZGxsWVFuSmlla0ZrUW1kdmNrSm5SVVZCV1U4dlRVRkZSMEpCT1hsYVYxcDZUREpvYkFwWlYxSjZUREl4YUdGWE5IZG5XVzlIUTJselIwRlJVVUl4Ym10RFFrRkpSV1pCVWpaQlNHZEJaR2RCU1ZsS1RIZExSa3d2WVVWWVVqQlhjMjVvU25oR0NscDRhWE5HYWpORVQwNUtkRFZ5ZDJsQ2FscDJZMmRCUVVGWlVGcE9jakJLUVVGQlJVRjNRa2hOUlZWRFNVaG5TVUkxVGpsT2FFOVFVR0UzZWxsalRHc0tObWwwWW5CcVNYWTFhbkZNV2tsSlFVcFBZM0JXZUhJM1FXbEZRWEJ2TDNoUFlVUmtVMDlKUkVoMWNtdFJaM0FyUTFSaVEzTjJOa2hSUW5CMlVFNDFhd3BtWm1kTVFsWTRkME5uV1VsTGIxcEplbW93UlVGM1RVUmhVVUYzV21kSmVFRkthMWxTWWs1TVpVRlRWbk0zWjNwMldIWnRaM0p2VjBORmNUWk1WMHBWQ205R2JrMDRPVXhHY2tOSVVqSkVLMmg2Y25SdFdESlRRV2d6UVhCc0wyeGphV2RKZUVGTVYwcDRha1p6ZDBkTGNrUmFZM2h6YURSdFdtdExkRTFOZDFVS1dTOUpaMlJPTlZGNFVHWTNUemhMV1hsc1VUTXdjMjg0V21welYwa3JiV2hyTlZvM1FXYzlQUW90TFMwdExVVk9SQ0JEUlZKVVNVWkpRMEZVUlMwdExTMHRDZz09In19fX0=",
          "integratedTime": 1665796594,
          "logIndex": 5127509,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/apko/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/apko",
      "githubWorkflowSha": "f55fd0307788f1c8b4457c88dd593eb217454f84",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3253847104",
      "sha": "f55fd0307788f1c8b4457c88dd593eb217454f84"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

