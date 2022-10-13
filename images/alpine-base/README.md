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
| `latest` | `sha256:5d93af353cd3d257c2a62c217c3da080fec97a4898432bc91f95d4c3f1626e59`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:5d93af353cd3d257c2a62c217c3da080fec97a4898432bc91f95d4c3f1626e59) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:5d93af353cd3d257c2a62c217c3da080fec97a4898432bc91f95d4c3f1626e59"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "992df6cf5f4d9bb65a3fc8dac59332779708af23",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/alpine-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDzgir6LziwAvO/bU+QS5V3BlRigt5qvN8fcb60qKwWvgIhAKWB+tULOzh3plzJdie8ttQzx6CUIU3X2ei/saqwPhvJ",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJlZDI4NzU4MTQzZWU5YTcxZDhmZGQzN2M2ZWRkZDkxZDUyMTFmMmFmMjI3MmY5NjNhNDdkZTBmZDdiZDUwYzk3In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUN3NHdnajRDalVRdytJakZrbUpzbm5JRmRkOEtkc01ta1R4OTg0NkpPc3NnSWhBS1NjcERBbjBKbzNzbHNyOG5DQWlqZUdYWncyd3ZoZSsyY3htSlhhdmF0NyIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpWRU5EUVhwcFowRjNTVUpCWjBsVlQwVm1XV2wxZW0xTU1rUXdNVVF5YUV0UWRHWm1UV2dyUTJaM2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhwTlJHdDRUbFJOZVZkb1kwNU5ha2w0VFVSRmVrMUVhM2xPVkUxNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZxVVd4NWNXRjJiRVZ5ZUVZck1HdEJRak16ZHpNeVNWbDFUVk5VZVhGbVRXOW1VRklLVERkVVFYWkNhRmhPVFZkbmIzcG5jVEY2TjJwUWVWVnpMekV5T1dvclNXcFNjazlWWjJOTWNtSkZaMVoxVWxOQk5rdFBRMEZzWTNkblowcFVUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlY1T0hGWkNpOXZWRkpYVW5CYVdHSkthazExWkhsdmJYVkJOblV3ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Um5OalIyeDFXbE14YVZsWVRteE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJVMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRVkozWkZoT2J3cE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRFYXpWTmJWSnRUbTFPYlU1WFdUQmFSR3hwV1dwWk1WbFVUbTFaZW1ocldWZE5NVTlVVFhwTmFtTXpDazlVWTNkUFIwWnRUV3BOZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZExkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVV1JaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWlpWM2gzWVZjMWJFeFhTbWhqTWxWM1NGRlpTMHQzV1VKQ1FVZEVkbnBCUWdwQ1oxRlFZMjFXYldONU9XOWFWMFpyWTNrNWRGbFhiSFZOU1VkTVFtZHZja0puUlVWQlpGbzFRV2RSUTBKSU1FVmxkMEkxUVVoalFVTkhRMU00UTJoVENpOHlhRVl3WkVaeVNqUlRZMUpYWTFseVFsazVkM3BxVTJKbFlUaEpaMWt5WWpOSlFVRkJSMFF3UzBOcWFGRkJRVUpCVFVGVFJFSkhRV2xGUVdsRFdGa0tlbTB2V0ZGclIySTBMM0Z6Wm5CdWRGTmlhbEJqTkN0c1oxTllhRmxTVjAxbFpWazNSR0Z6UTBsUlF6aEdOamN4Y3poWVMzbDJkREp0YjB3dmJpdExaZ3BrVW1KWlpXazNNR3hrZEdGa1JuZEpUelpGY0RscVFVdENaMmR4YUd0cVQxQlJVVVJCZDA1dVFVUkNhMEZxUVZkT1psTkpVbGd2YjJaUmJtSmhTRU5MQ2pWSmIxRm9SVmhvWXpoUGJXdGlkbEJJZUVoUWNUZFhaMDhyUnk5UlpHSk5TR0pzWVVoSE1qWjJVemR4VG1nMFEwMUdOVmhZV1hVNU9VcHpVQ3RPSzBvS05ubE1abkZXWjJZeU5VaHZNazV4VG1SRFdqRnJPV1p4SzBGQ2RVTnpjVzkyU1U5NWFVOHlOREpPTDBoNWFpdHNXbWM5UFFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1665652567,
          "logIndex": 5017046,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/alpine-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/alpine-base",
      "githubWorkflowSha": "992df6cf5f4d9bb65a3fc8dac59332779708af23",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3241124474",
      "sha": "992df6cf5f4d9bb65a3fc8dac59332779708af23"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

