# apko

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/distroless/readme-generator
-->

[![CI status](https://github.com/distroless/apko/actions/workflows/release.yaml/badge.svg)](https://github.com/distroless/apko/actions/workflows/release.yaml)

Container image for running [apko](https://github.com/chainguard-dev/apko) container builds.

## Get It!

The image is available on `distroless.dev`:

```
docker pull distroless.dev/apko:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` `v0.5.0` | `sha256:89af5148b241a5dbd01366d237d7f068297f6f4b2e921f2ac39e1b9a4736aedd`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:89af5148b241a5dbd01366d237d7f068297f6f4b2e921f2ac39e1b9a4736aedd) | `amd64` `arm64` `armv7` |


## Usage

```
$ docker run -v $PWD:/work distroless.dev/apko build examples/alpine-base.yaml apko-alpine:edge apko-alpine.tar
Jul 15 10:35:45.226 [INFO] loading config file: examples/alpine-base.yaml
Jul 15 10:35:45.246 [INFO] [arch:aarch64] detected git+ssh://github.com/distroless/apko.git as VCS URL
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

All distroless images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify distroless.dev/apko:latest | jq
```

Output:
```
Verification for distroless.dev/apko:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/distroless/apko"
      },
      "image": {
        "docker-manifest-digest": "sha256:89af5148b241a5dbd01366d237d7f068297f6f4b2e921f2ac39e1b9a4736aedd"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "29234755f6e3d66a0cd396012ad01f6dd3e8ec7e",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/apko",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDNFnjUPlmJeDW+NnSPqqZZig+aOLZDfbrLJeGKl/p9OQIhAJ/6oNYyxNRzKrXa8xGSnKcJqG/MebsIJgdUHEWq63n7",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIzY2UwZDI0OTc0ZmFhY2QxNmQyOTZjMjZjNGNlNzVhYmRjNmQwOTI2YmE0MWE4NDRiY2MwMzZhMDVkZTQ4ODQ5In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQzN2NjE5ejV2clA5L1d4TkxCQ0RIbzNXb3B1R0t1S3Q0d285ZldYUjY2YUFpRUFqVkhZbW4vT0RwSDQxc2E4cGNHWjhrMTN0dnZGakJkMER2U0xKMU02TkdRPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnRha05EUVhsRFowRjNTVUpCWjBsVlQzUmljbnBPT0daSFVXTlNNMmc0YWt0WE5WZEVReTlLTlZZNGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRSTlJFVjNUbXBSZWxkb1kwNU5ha2wzVDFSRk5FMUVSWGhPYWxGNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZsVUdFM2VtMVFjWEo1UTFJMVQydGFkM2hPUXpoMlJtVk1TMUY0TTJweFNGVnVVbFlLUlcwdmVEWkVjMnhHTjFWWFVYTkxNMHBKTkdSNFltaDJkbkJhTXpaNWFrWllNV2Q1UkZwNWIyOXFSWEp4WjB0TUsyRlBRMEZxT0hkblowazNUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZrYUVOMENsTlpNWGhxVkhWRmJEbEZjRVpZTjFkMWFVeHBOVGh2ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFoM1dVUldVakJTUVZGSUwwSkdWWGRWTkZwU1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BaV0VKeVluazRkVm95YkRCaFNGWnBURE5rZG1OdGRHMWlSemt6WTNrNWVWcFhlR3haV0U1c1RHNXNhR0pYZUVGamJWWnRZM2s1YjFwWFJtdGplVGwwQ2xsWGJIVk5SR3RIUTJselIwRlJVVUpuTnpoM1FWRkZSVXN5YURCa1NFSjZUMms0ZG1SSE9YSmFWelIxV1ZkT01HRlhPWFZqZVRWdVlWaFNiMlJYU2pFS1l6SldlVmt5T1hWa1IxWjFaRU0xYW1JeU1IZEdaMWxMUzNkWlFrSkJSMFIyZWtGQ1FXZFJTV015VG05YVYxSXhZa2RWZDA1bldVdExkMWxDUWtGSFJBcDJla0ZDUVhkUmIwMXFhM2xOZWxFelRsUldiVTV0VlhwYVJGa3lXVlJDYWxwRVRUVk9ha0Y0VFcxR2EwMUVSbTFPYlZKclRUSlZORnBYVFROYVZFRmpDa0puYjNKQ1owVkZRVmxQTDAxQlJVVkNRVFZFWTIxV2FHUkhWV2RWYlZaeldsZEdlbHBVUVdSQ1oyOXlRbWRGUlVGWlR5OU5RVVZHUWtFNWEyRllUakFLWTIwNWMxcFlUbnBNTWtaM1lUSTRkMGhSV1V0TGQxbENRa0ZIUkhaNlFVSkNaMUZRWTIxV2JXTjVPVzlhVjBaclkzazVkRmxYYkhWTlNVZE1RbWR2Y2dwQ1owVkZRV1JhTlVGblVVTkNTREJGWlhkQ05VRklZMEZEUjBOVE9FTm9VeTh5YUVZd1pFWnlTalJUWTFKWFkxbHlRbGs1ZDNwcVUySmxZVGhKWjFreUNtSXpTVUZCUVVkRVZHbEphVmQzUVVGQ1FVMUJVMFJDUjBGcFJVRjVaVkV6VUdRclpYYzRZWGhYVjFsRFpVbGpNemt4S3pndk4xcDFXQ3R0VjFsdllVSUtSWFJ6Y1RRM1ZVTkpVVVExV1RSb2R6Qk5iVUpNVERRMWJXd3ZaVEpWWlRsMWVpOTNLMjVJZG1kdmJGRTFNSFJyYUdWM2VXZEVRVXRDWjJkeGFHdHFUd3BRVVZGRVFYZE9iMEZFUW14QmFrRjBNRFZhTUUwMVpHSnJRMHBYYVdSTFdHRm5Wa0ZXTW5FMWF5OXlLM2t5TUZOTlZGTlRNbWxoVEUxbVFYVjRSRmx2Q2pBdlFsWTJkMGh5WkdGbVNUaFlWVU5OVVVScFNWaEJZbGR5V0U5clFYVlpabmh5Y20xVk5XdFpMMHAyWkUxeFJUa3pibTV3WkhSek1tWjRiMnhvYWswS2QwSnlVM0JYWVdoc2VVdDRPVFlyWXpOUFJUMEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1663463211,
          "logIndex": 3527682,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/apko/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3075355588",
      "sha": "29234755f6e3d66a0cd396012ad01f6dd3e8ec7e"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

