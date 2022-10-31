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
| `1.35.0-r25` | `sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r2-glibc` | `sha256:a76760a49c6966fa0516404736d7949299433d959ab9910d841e2e3a0f301d48`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a76760a49c6966fa0516404736d7949299433d959ab9910d841e2e3a0f301d48) | `amd64` |
| `1.35.0-r3-glibc` | `sha256:b6dc23ec122ab527d0e11ac0504e03649592157fa6627fd908f7625afddaedee`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:b6dc23ec122ab527d0e11ac0504e03649592157fa6627fd908f7625afddaedee) | `amd64` |
| `1.35.0-r27` `latest` | `sha256:9a45b9d9b751ef6b6efaf036b5e2fdcf7bb1a3e1af3a9e2e109453df056096fd`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:9a45b9d9b751ef6b6efaf036b5e2fdcf7bb1a3e1af3a9e2e109453df056096fd) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |



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
        "docker-manifest-digest": "sha256:9a45b9d9b751ef6b6efaf036b5e2fdcf7bb1a3e1af3a9e2e109453df056096fd"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "b95108dfe759c5c239cd42e3dc477cb2740bc1db",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/busybox",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCPXysFZWkI9JwHBnfFo0FyBHUDGQ9pw4wTNgOW8rLR8wIgDcpNVOEGrhYdOTuQNjH9Rnd3i1ejStIBNppgKNkDKt8=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJkZDY2M2VjZTYyNDE5MmM0NDFiMzQ0ZGIxZmY4NmYzYzk5MjY2NjcwZjIyMjU1N2JiNTRiZTRmY2ExOTJmNTBhIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURXT24xRVNMSEw3QWd4b05PN3RtdWFCK3RuZUZielpFb0pwZkFsMWZENlZRSWhBTnh6eGM5eWp0Q3dRTndRTmQ2SkxjK1RnSWZNOGRSSU5uN2pmOXFtMnYraiIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlla05EUVhwVFowRjNTVUpCWjBsVlVWVkVORUZqTUdaQlZHeHVjVzlKZFdFeWEyNXZaa05TV1dFMGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFVFhoTlJFRXdUbnBWZDFkb1kwNU5ha2w0VFVSTmVFMUVRVEZPZWxWM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZGUm14bVZuaGFka3NyZUhabGNsWnhOME5ZYW5keWRTdGtjVXhXYWtocFQwcG1aSFFLYWpSSVUxbHRiVTB5YkRWdU1XTlBZamRTWTBOSWNteFVPRGxoVnpaYVFpOUthaXRvVWxGb0x6RmhhSE56TURWdE5FdFBRMEZzVFhkblowcFFUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ0VjBONENuWkVNemR6UTJoNmFraHdlRmRzS3k4Mk9HOVFLMFJOZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5U2pGak0yeHBZak5uZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRIU1RWT1ZFVjNUMGRTYlZwVVl6RlBWMDB4V1hwSmVrOVhUbXRPUkVwc1RUSlNhazVFWXpOWk1rbDVDazU2VVhkWmJVMTRXa2RKZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWlpibFo2WlZkS2RtVkVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFpjMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZabEZTTjBGSWEwRmtkMEZKV1VwTWQwdEdUQzloUlZoU0NqQlhjMjVvU25oR1duaHBjMFpxTTBSUFRrcDBOWEozYVVKcVduWmpaMEZCUVZsUmNtZHJkMFZCUVVGRlFYZENTVTFGV1VOSlVVTlFWWE5RT1VReWNYY0tiemxLWVV4TFZWUkdVbFpIZVhCREwySnNNV1ZvZVZoaFNGTlZVbEV5UVZWb1owbG9RVXA1YUhVMldUZEpOemhWY2s5c1JrcE5ka2hyTkRWeFRqWnJlZ3B1YTNSTmRUa3ZaMFU1WjI1U1duZzVUVUZ2UjBORGNVZFRUVFE1UWtGTlJFRXlhMEZOUjFsRFRWRkRTVmhoY2xSTFVsTllSV05tYURaaVNsbDFkREp0Q2xOT1pXVkZiSGQ2YVRSUGVUQnZiR0ZaVVVsSmNFcFJSbFpJTVRsTGIzRjVNMU5sTVRoUVJ6ZHhPRmxEVFZGRVdXWjJXVFJ2UkhoaFIzbHlNRms1WmpnS1pGRXdUMDVPTUd0WUsxbEpXVXM1VWxCM05tRk5ORmcxY25JMGR6a3JZbHB5YVdwVVJpOHJXblpKWTJJemR6QTlDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1667177288,
          "logIndex": 6189638,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/busybox/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/busybox",
      "githubWorkflowSha": "b95108dfe759c5c239cd42e3dc477cb2740bc1db",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3357761547",
      "sha": "b95108dfe759c5c239cd42e3dc477cb2740bc1db"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

