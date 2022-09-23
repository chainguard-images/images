# melange

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/melange/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/melange/actions/workflows/release.yaml)

Container image for running [melange](https://github.com/chainguard-dev/melange) workflows to build APK packages.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/melange:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` `v0.1.0` | `sha256:01656c894f22cc70e1e19970079fc75a80a3c18faefb1d39d39c8e613b7467d2`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:01656c894f22cc70e1e19970079fc75a80a3c18faefb1d39d39c8e613b7467d2) | `amd64` `arm64` `armv7` |


## Usage

To build the melange workflow in [examples](examples/gnu-hello.yaml):

```
docker run --privileged -v "$PWD":/work cgr.dev/chainguard/melange build /work/examples/gnu-hello.yaml
```

Output will be in the `packages` directory.

To build the melange package for the host architecture:

```
docker run --privileged -v "$PWD":/work cgr.dev/chainguard/melange build --empty-workspace --arch $(uname -m) /work/melange.yaml
```

To get a shell, you can change the entrypoint:

```
docker run --privileged -v "$PWD":/work -it --entrypoint /bin/sh cgr.dev/chainguard/melange

/ # melange version
...
```
Note that melange uses bubblewrap internally, which requires various Linux capabilities, hence the
use of `--privileged`. Because of this requirement, we recommend this image is used only for local
development and testing.


## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/melange:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/melange:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/melange"
      },
      "image": {
        "docker-manifest-digest": "sha256:01656c894f22cc70e1e19970079fc75a80a3c18faefb1d39d39c8e613b7467d2"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "1038c0d22c095b2dd06e7484bec41d41daff3bce",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/melange",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCBIIlOovNgY7iauUGvCc0I5j64wNcW40GnXq+aeRn9yAIgWpEyBM3eMuig9DhuEec/LzoWgtX5Di6fokrePGQtcno=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI4NDUxZmFmNDE1YmE3YjBjY2Q0NDlmMTBlNDZjYjcxZTkyYTI2NzMyZDZhZDRlNGRlM2Y5YjY3MmNhMWIzNmMzIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQjlCZTlLN0FQczM3VlZYQ0lZRXJuY29GMno4TFV4K29KWW4zSTNtb0duTkFpRUFpcytSbDcxeWo0U1V3dk0xYVNmV2FXZ240aXVqTGJtMzduM3pFVzNVM3c4PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlWRU5EUVhwVFowRjNTVUpCWjBsVlluUnhWazVZTTA1Q05WcG1hbGgwY25CWVdUaDNWVGxsTVhZd2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hwTlJFVjNUa1JCTWxkb1kwNU5ha2wzVDFSSmVrMUVSWGhPUkVFeVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ6YlhOWFFtZHlZblZGTWtjNE9WSlJNMk13ZDFKd1dqUjBRVGxaWjNWdGVrRTNNbTRLVmpSSVVITldUbmRQZVZoT01EbENRbmd4YVZKUFlsTjVWMFZZYUd4TUwwbFpWazh2VFdkNVNWSjRUMmh6VXl0aFMzRlBRMEZzVFhkblowcFFUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ1TmpaUUNtbHFTRU51YlRrdmFGQlNaRmxqUTFGa2NuUnFURXRaZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVd4aVIwWjFXakpWZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRFUlhkTmVtaHFUVWRSZVUxdFRYZFBWRlpwVFcxU2EwMUVXbXhPZWxFMFRrZEtiRmw2VVhoYVJGRjRDbHBIUm0xYWFrNXBXVEpWZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWmlWMVp6V1ZjMWJscFVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFpjMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZabEZTTjBGSWEwRmtkMEZKV1VwTWQwdEdUQzloUlZoU0NqQlhjMjVvU25oR1duaHBjMFpxTTBSUFRrcDBOWEozYVVKcVduWmpaMEZCUVZsT2JqTTBhM0JCUVVGRlFYZENTVTFGV1VOSlVVTkdUMmt5Vlc5UFpHY0thamQwWjBneFQzcHhUVnBuUlhKblpuWmtSVlZpTkV4V2JuUmFUREppV0RkMGQwbG9RVTQwWWtGRVpuaFhNVUpIWlZKNGJtSmhjSHBvWTA5bFozbEhhZ3BpUjFKWWJXbHRTbFZpUTJacVFVUnZUVUZ2UjBORGNVZFRUVFE1UWtGTlJFRXlZMEZOUjFGRFRVZDVXVkEzTkRjMk9WSTVkMmR3UVZONE1FTlRXR1JOQ21SREt6QjJXamx3ZG5nMU9XRkVSVGxQTWxOYVFtbERUbGx6U21sSGVtUklUWEZQVkRWRWNVbDJkMGwzUkVKaE5HWjJORTVzTUhKaVowMDJOemR1Y0VNS1NFcHRUa1UzWW10SWVURk9VbGxEWTBka1V6ZEljWFZpY2xkaGR6QnRUbms1UW5oQk5WRnJUMUEyYVVvS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1663895057,
          "logIndex": 3779457,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/melange/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3109703168",
      "sha": "1038c0d22c095b2dd06e7484bec41d41daff3bce"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

