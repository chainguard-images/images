# busybox

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/busybox/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/busybox/actions/workflows/release.yaml)

Container image with only busybox and libc (available in both musl and glibc variants). Suitable for running any binaries that only have a dependency on glibc/musl.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/busybox:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `1.35.0-r27` `latest` | `sha256:b243d3dceab4e6c32c3a5e42d2e90aeec3704c0a0e58d86d9b75cf21c010b8fd`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:b243d3dceab4e6c32c3a5e42d2e90aeec3704c0a0e58d86d9b75cf21c010b8fd) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r25` | `sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r2-glibc` | `sha256:d0e77db8dc1ebc7bb19af38065bc3b5239b9a921d55a4098b091cdc45d2b5b1c`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:d0e77db8dc1ebc7bb19af38065bc3b5239b9a921d55a4098b091cdc45d2b5b1c) | `amd64` |
| `1.35.0-r3-glibc` | `sha256:5b9d10dbd14feb9c3af67d9ec21cc6e83595a66b4758bc325203520bcf71945a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:5b9d10dbd14feb9c3af67d9ec21cc6e83595a66b4758bc325203520bcf71945a) | `amd64` |



## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/busybox:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/busybox:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/busybox"
      },
      "image": {
        "docker-manifest-digest": "sha256:b243d3dceab4e6c32c3a5e42d2e90aeec3704c0a0e58d86d9b75cf21c010b8fd"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "0c4e61e44750f3915ae1083144b468bc6f7689b8",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/busybox",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCeMDf3YHQ7e+fVGVegUouzKcxzs51GFpHARP2URAx0yQIhAL9qPuKU2sqnydwpNf+x6zEJhhV6nTphhbY+erb07rN/",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJkOTA4N2ZjMmU1ODAwMDE4ZjVlMTc5Njg2N2E4Y2QxZjgwY2E0NzE2N2RiNDY2ZDJkZmQ5NmM5NTJkOWU0YzRjIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNkVjNKcTQvZ2RVL0F6TDNPWVNuaEVCLy9LYm42emJETG9DcjJLUmdieEtnSWdiRWd1bkYyRU5GbmRwZVprM3c4alhpWHRTMTJFbnBSdm83dm9mY0wrQ1N3PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhSRU5EUVhrMlowRjNTVUpCWjBsVlRURm5lVzlOYW1KM1JYbDJiM1pNUjNSeGFscHJTMGhJUWtKemQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhwTmFrRjRUMVJWZDFkb1kwNU5ha2w0VFVSRmVrMXFRWGxQVkZWM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZKUTNaUVRuQkpjV0pTWlhFMVRWUlBZVTlwYlVGVlVtZDZkazFuYUhGR05qYzJhbUlLWlZKYVQyTTFRVEJEYzIxaVdubDNTekpHTlU1cFVYSm1NV0pUWWpnelVrZHNVWHBDYWtSc0wwOVZNR3N5YVhrdlZYRlBRMEZyTUhkblowcEtUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZqT1ZocENuazFiVkJLZUZGc2Frb3hWSEJ1WW1KRVptNDVlVGhuZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5U2pGak0yeHBZak5uZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWtsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVKSVFqRmpNbWQzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdlRVZE5NRnBVV1hoYVZGRXdUbnBWZDFwcVRUVk5WRlpvV2xSRmQwOUVUWGhPUkZKcFRrUlpORmx0VFRKYWFtTXlDazlFYkdsUFJFRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYmtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKc2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1YVdSWVRqVlpiVGswVFVJd1IwTnBjMGRCVVZGQ1p6YzRkMEZSV1VWRU0wcHNXbTVOZGdwaFIxWm9Xa2hOZG1KWFJuQmlha05DYVZGWlMwdDNXVUpDUVVoWFpWRkpSVUZuVWpkQ1NHdEJaSGRDTVVGQmFHZHJka0Z2VlhZNWIxSmtTRkpoZVdWRkNtNUZWbTVIUzNkWFVHTk5OREJ0TTIxMlEwbEhUbTA1ZVVGQlFVSm5PVTFCTURFNFFVRkJVVVJCUlZsM1VrRkpaMVF6VlhaaWNYTldlamxqTDNGbGNrZ0tZUzlSYjIxWlRWcG9PQ3RJTDJVMGVFcEZTWFJQYjFkeVEwTkJRMGxCZW1SSkszSjNVbUozYlVoc1JsTmtWVmR1VVVnNGRqbFdOM2h3VG5NM2JuTTBad3AxUkVNM2VGY3JPVTFCYjBkRFEzRkhVMDAwT1VKQlRVUkJNbWRCVFVkVlEwMVJSR2R2TkZOVldtSnBRM0o1VVRkWFFrTm5UWG94U0RnNVJFZG1kbkF4Q2xRNWVFb3hSRVEyWlVoUVl5dG9hbVJIY0d0cU5rZHBWWFZOTTNKNVkyTTRUbTgwUTAxSFZrNTRkSHBoV1dSMldYbDRUbUZ6VmtSMWFHbENMMlZOV0ZNS1pWVmtTM3BQUjJweFZVYzFUSFZzVTBwa1JFbGljRTgwYzJkblZuVTNZMmczV0VKR01XYzlQUW90TFMwdExVVk9SQ0JEUlZKVVNVWkpRMEZVUlMwdExTMHRDZz09In19fX0=",
          "integratedTime": 1665692410,
          "logIndex": 5049086,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/busybox/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/busybox",
      "githubWorkflowSha": "0c4e61e44750f3915ae1083144b468bc6f7689b8",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3245414910",
      "sha": "0c4e61e44750f3915ae1083144b468bc6f7689b8"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

