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
| `latest` `v0.1.0` | `sha256:c1825563f12627ff5a228db542c7aae7a7a65ebe2e347f4f4d12fe68ffee63ac`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c1825563f12627ff5a228db542c7aae7a7a65ebe2e347f4f4d12fe68ffee63ac) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:c1825563f12627ff5a228db542c7aae7a7a65ebe2e347f4f4d12fe68ffee63ac"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "0e8a2b8e478215111c3db074a65310e66b114380",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/melange",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQChfduq4LcIe0zAaMuySy4MzT+IRl6bg8bjWtcl/7CoQQIhANYu1ergRqeslIVFPsLhh4DUsb3sYUoOuaef1AyA5jJN",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJlYjhhZDRlY2QwYjA0OGU0OTAyMTRlMTc3Y2ZmNDRhZWVlOGIxODYxOGY5NzFjODIzMzI2Njk5ZWEwNjA4NjhjIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQXl3RkVzWGMvNk1zTHlEMUZadUZ4RUV6dy8wN0h2ZmFwMmtwNk9TSi9mU0FpQkxMWDU0ckdZOFZkYnUrY01uSVdOZ2V4VkRYVnJCNHpDT3pEbUU5cWNRSVE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlla05EUVhwVFowRjNTVUpCWjBsVlVEWXZhMmROUzFGTFZYaFllV0ZwTnpWU2NGQTFXbkEyUjIxRmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hsTlJFRXhUV3BWTUZkb1kwNU5ha2wzVDFSSmVVMUVSWGROYWxVd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVY1VFhNMVNqQTNTbVJUVVRsMUt6Z3ZaSEp5U2xZclQxSmpkRU0zVDNoQ1VFUmFWM2dLYkVWYVMxTTBPRlZ3ZERoeFJ6Sm9ZVTV5U2trMlJYQndWMUpNTm10UVZVeExOVkYzV2tjd01uWnNWWE42TDNSNVowdFBRMEZzVFhkblowcFFUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ3Y3l0eUNtMHphMnRtUVdJMmRXNVBWMDlUVmtoNGFXVTBPWE5qZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVd4aVIwWjFXakpWZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRFUW14UFIwVjVXV3BvYkU1RVl6Uk5ha1V4VFZSRmVGbDZUbXRaYWtFelRrZEZNazVVVFhoTlIxVXlDazV0U1hoTlZGRjZUMFJCZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWmlWMVp6V1ZjMWJscFVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFpjMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZabEZTTjBGSWEwRmtkMEZKV1VwTWQwdEdUQzloUlZoU0NqQlhjMjVvU25oR1duaHBjMFpxTTBSUFRrcDBOWEozYVVKcVduWmpaMEZCUVZsT2FYSjFORzlCUVVGRlFYZENTVTFGV1VOSlVVTnZPRWw0V0ZsblZYTUtka2h3V0ZCUWRXODRaVUZpU2pKblNHeHhlblJMTmpKTldVWlhPVk5VZFdST1VVbG9RVXQyWWtaVmJsWkhZVVJZTWtwU2VHZFlkelp6T0c5SlUwTkphQXBEZWl0dmFVVjZUbGhWUWtSbGVtSmtUVUZ2UjBORGNVZFRUVFE1UWtGTlJFRXlhMEZOUjFsRFRWRkVlVVp6Y0c5T1JHeFZTak5WVjI0Mk0zZERZbm95Q21nM1oxWjNaMmcwTTB0UGEyRjJSbUUxZDNkQ09HeFpkVE5hTlhSaE0wbE5SblpJTjBKdU9XOXRWVEJEVFZGRVIzZDFabXRIVEV4R2JrOTFUVlZ1ZEVnS04zRjJkMWR2V0VKUFprRkJXa2g0V1VWeWFFOVZObU1yYlRCSlNVOVBSVmhOUjFCWFdtZEZSbGR2YnpsRVkzYzlDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1663807984,
          "logIndex": 3711733,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/melange/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3102068345",
      "sha": "0e8a2b8e478215111c3db074a65310e66b114380"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

