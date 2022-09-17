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
| `latest` `v0.5.0` | `sha256:6559ce9c9f8b0dbb256fa5dd26af2a7f298168050d340a8d32d56bcbbfed5f90`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:6559ce9c9f8b0dbb256fa5dd26af2a7f298168050d340a8d32d56bcbbfed5f90) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:6559ce9c9f8b0dbb256fa5dd26af2a7f298168050d340a8d32d56bcbbfed5f90"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "6e87ebc743315e56ec86dc68cfaa54ce0a44d772",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/apko",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIBjEFzD129Hjv+aLucq7HKf7zUZ2N1wetFQgxIZ5d5J1AiEA5PkzvMUGiaIAOtnj5IeLw58O471wjvJePqYFaD0Ni8o=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI4MDQyNzcyNmNjODUzZGMyNTQxN2FiMzNlZTY2ODZjZmFiYWQzZWQ3YzhkOWNmODQzMDRjYjY1MjU4NzY1MGIwIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJRzU3emhleUFWWWE2bVNUTkd2QkZUbkFJd1ozRDk4bnVnaHpxSXpTd3lkaEFpRUErZlpoMVpuY2Nxa0N5OWp0cCtidk53YU05ek1DTDJEd1hURFlMY2tJV2RjPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnNla05EUVhnMlowRjNTVUpCWjBsVlpFa3ZOR1ZMYVdkQmEyZEtMemh4TDNOUWFUaEpTWGQ2V1Vnd2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlROTlJFVjNUVVJKZUZkb1kwNU5ha2wzVDFSRk0wMUVSWGhOUkVsNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ6U0d4cFJsTTRhelpLZUZSVGFVUnFWMXBxZEROSVlsUlNWMFVyUzFveE9ESjFTbVVLWkhsM1FsWkxOM1p0VW1Wb1NWVXlaMVpQTjIwek0xTkJTMmRYY0RObVpVZ3hXbmRTZGtrMFMzQjZNMnhXY0VJeWFUWlBRMEZxTUhkblowazFUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZUZVVOekNpczBjVVJYTjBKTFFrVnhUa2hMWms4eGIxZ3hZVzlOZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFoM1dVUldVakJTUVZGSUwwSkdWWGRWTkZwU1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BaV0VKeVluazRkVm95YkRCaFNGWnBURE5rZG1OdGRHMWlSemt6WTNrNWVWcFhlR3haV0U1c1RHNXNhR0pYZUVGamJWWnRZM2s1YjFwWFJtdGplVGwwQ2xsWGJIVk5SR3RIUTJselIwRlJVVUpuTnpoM1FWRkZSVXN5YURCa1NFSjZUMms0ZG1SSE9YSmFWelIxV1ZkT01HRlhPWFZqZVRWdVlWaFNiMlJYU2pFS1l6SldlVmt5T1hWa1IxWjFaRU0xYW1JeU1IZEdaMWxMUzNkWlFrSkJSMFIyZWtGQ1FXZFJTV015VG05YVYxSXhZa2RWZDA1bldVdExkMWxDUWtGSFJBcDJla0ZDUVhkUmIwNXRWVFJPTWxacFdYcGpNRTE2VFhoT1YxVXhUbTFXYWs5RVdtdFplbGswV1RKYWFGbFVWVEJaTWxWM1dWUlJNRnBFWXpOTmFrRmpDa0puYjNKQ1owVkZRVmxQTDAxQlJVVkNRVFZFWTIxV2FHUkhWV2RWYlZaeldsZEdlbHBVUVdSQ1oyOXlRbWRGUlVGWlR5OU5RVVZHUWtFNWEyRllUakFLWTIwNWMxcFlUbnBNTWtaM1lUSTRkMGhSV1V0TGQxbENRa0ZIUkhaNlFVSkNaMUZRWTIxV2JXTjVPVzlhVjBaclkzazVkRmxYYkhWTlNVZEtRbWR2Y2dwQ1owVkZRV1JhTlVGblVVTkNTSE5GWlZGQ00wRklWVUZEUjBOVE9FTm9VeTh5YUVZd1pFWnlTalJUWTFKWFkxbHlRbGs1ZDNwcVUySmxZVGhKWjFreUNtSXpTVUZCUVVkRVUxQlllRXRuUVVGQ1FVMUJVbXBDUlVGcFFVOTBNMU5MU2xOMlVGaFBiMFk1UVRoVU5WbFJOMDFNYjBGRVdXSkNOMkZCWmtSV05Hd0tTRzlsVEZSM1NXZE1jREExV2tVeFJURk9WMkZ6UzBaM2VIQjVOVGRKYWl0clFqRTVaVEZpU25wd2FEVk1ja1JUTWpaQmQwTm5XVWxMYjFwSmVtb3dSUXBCZDAxRVduZEJkMXBCU1hka01rTTJNamRHZVRGdWJWQm5RMDlzUldJM2FqSlJVRnB0Wm1WT1dFVnFOamg1Tm5CSFNITXhNbmQyUlZsTFZtVkdLM1pqQ2xKbGMweHhiRmxqTlhZNFpFRnFRVzlsVG1jNE0wNDNjWGxUV0dVNEt6aE5VbWQ2VWtSMVRucHdSelkzWVRoTlRXSjVhVWRrVERoSWVYVjFUbGM1UmxZS2NFUmFUekZIWTJZNGFWaEJVakIzUFFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1663376428,
          "logIndex": 3523333,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/apko/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3071547923",
      "sha": "6e87ebc743315e56ec86dc68cfaa54ce0a44d772"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

