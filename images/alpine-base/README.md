# alpine-base

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/alpine-base/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/alpine-base/actions/workflows/release.yaml)

Alpine base image built with [apko](https://github.com/chainguard-dev/apko). Uses packages from the [Alpine distribution](https://www.alpinelinux.org/).

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/alpine-base:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:4367e06a62d376d783f05a4357b20d91505f7c7f4ab56c977c14b1e2f1ef48a6`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:4367e06a62d376d783f05a4357b20d91505f7c7f4ab56c977c14b1e2f1ef48a6) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


## Usage

```
docker run cgr.dev/chainguard/alpine-base echo "hello"
```

See the [examples/](./examples/) directory for how
to use this as a base image.


## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/alpine-base:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/alpine-base:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/alpine-base"
      },
      "image": {
        "docker-manifest-digest": "sha256:4367e06a62d376d783f05a4357b20d91505f7c7f4ab56c977c14b1e2f1ef48a6"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "029f0739b4f6d286c21df184c34639ca9636dc38",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/alpine-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIA8gvQpsYglzGepncgqzaCVHpWuiFtnwae6qLDMtChzvAiAIFGj39Kh76qRUp5keCN+w1FsSJL2wGueP99mXJ9h29g==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI1ZmY0MThjMjkxNjRhMDhlZGVhNzc2OWIwZDAxZDZjZjk1MmM5ZDBhNTNmNmQ5MWI3ZmI4NzVhOTEyNzA1MzgzIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNzbHRVQ0o4QnVwL1BQalhEdTFiNWo1ZTJLRmVCVCtUQ0QxaTA1NVpyMUJ3SWdRZ3JReGtwTjhoeHNCaHdSM1Ara3FDcjZMNjEzQWlDSy8xVGxZMlZ5bzFZPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpWRU5EUVhwbFowRjNTVUpCWjBsVlNtSXpibkExVkVoTFpIQnpUMmxrWWxkYVRIQnVLMHc0TUU1cmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRWTmFra3hUMVJCZWxkb1kwNU5ha2w0VFVSRk5VMXFUWGRQVkVGNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVV3VjAxbFpsZ3JiSEE0UTI1a1NrVlBNSGt4TXpVNFZpc3lTR1puY2xGaWMybHlibmdLWjJGSFRqbEtUM1pVTDNSNE9HWnNkWGRQVDFSSFRtYzRhMHhhYUZBdlpITm1WamxYZVc5SU1FcDJSMGdyVW5NNWFIRlBRMEZzV1hkblowcFRUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlYyUjFkRENua3hhemx5UXpKTldrSk5TbGRYUms5MU5VaEllR1ZqZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Um5OalIyeDFXbE14YVZsWVRteE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJVMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRVkozWkZoT2J3cE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRFUVhsUFYxbDNUbnBOTlZscVVtMU9iVkY1VDBSYWFrMXFSbXRhYWtVMFRrZE5lazVFV1hwUFYwNW9DazlVV1hwT2JWSnFUWHBuZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZExkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVV1JaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWlpWM2gzWVZjMWJFeFhTbWhqTWxWM1NGRlpTMHQzV1VKQ1FVZEVkbnBCUWdwQ1oxRlFZMjFXYldONU9XOWFWMFpyWTNrNWRGbFhiSFZOU1VkTFFtZHZja0puUlVWQlpGbzFRV2RSUTBKSWQwVmxaMEkwUVVoWlFVTkhRMU00UTJoVENpOHlhRVl3WkVaeVNqUlRZMUpYWTFseVFsazVkM3BxVTJKbFlUaEpaMWt5WWpOSlFVRkJSMFE0Ym1wRFUxRkJRVUpCVFVGU2VrSkdRV2xGUVcwNVMyUUtjR2gxVURsS2NGRnpVWHBsY25oS1RUVk9SRUZUWkZsMVZuVjVla3htWkc4NFIyNXFZak5uUTBsSFNraFNOMWhLU1Vwc1ZuSmhOMGc0VlN0RlZXVmxXQXBNZFV0SlJtNUZLMlJCTTFkTllUSXJlRmN4WWsxQmIwZERRM0ZIVTAwME9VSkJUVVJCTW1kQlRVZFZRMDFDV210NGNtdEVZbTR4YjFaWVZqbEdhblZwQ25oV1NWZE5VVGN4ZWxNNU0zTjBPV1JRTldwMEt6SjJVbXB0TlROdkx6Wk5TaXRLVlc5VWJrazJTbWd3U1ZGSmVFRlBlbFo1Y201TE4wVnROSGM1Um1vS2VsUmhiV1YyTUVacFJuSnFiemhCVDNkUU1qZDRUVmt5Y21kTmRtZExOMmhqYVhaR1ZGSlhTMHhNUnpGTWFUVk1XbWM5UFFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1666220367,
          "logIndex": 5459690,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/alpine-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/alpine-base",
      "githubWorkflowSha": "029f0739b4f6d286c21df184c34639ca9636dc38",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3285558002",
      "sha": "029f0739b4f6d286c21df184c34639ca9636dc38"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

