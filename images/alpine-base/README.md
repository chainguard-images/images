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
| `latest` | `sha256:4cfea3ae7a757ae2cb08a7321342c4089246bbcb386994d84857e900a2112362`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:4cfea3ae7a757ae2cb08a7321342c4089246bbcb386994d84857e900a2112362) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:4cfea3ae7a757ae2cb08a7321342c4089246bbcb386994d84857e900a2112362"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "e891c6c41e9d0c4e630105ca804786b02d92db95",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/alpine-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCIGeayyuYQ5S+bEPcjP7DxbvXhPqnnnw1nfQCcagODJgIgM+BB9uh6ToufMQjAPlUaEX08HWTCF15rGOunOUPw63I=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIzNTkyMDMzOGFkNDhiMzI4NGJkNDliNmRiMDk5ZWJkYTdhOGYyOWI5ODM1MzdkMjc0Y2ZkODg3MWJiZTVkYWY5In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURBU2pXL0pHT1lNOUREQW1UUTA2NmJLdDc3a2xOaTZQeEJ1TC9DVW5UQWN3SWhBSktmbm9jKyszUjhxaUVaOGIvZ1FOREYxZzlyYzN5RVlOTnZWODQ1akdtMSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpWRU5EUVhwbFowRjNTVUpCWjBsVlVqbHNRVVl5U1VWbFZIWm5hR0pZTVdkUE1uUlJhRFZVUjB0SmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hsTlZFMTNUVlJSZVZkb1kwNU5ha2wzVDFSSmVVMVVUWGhOVkZGNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVYyVDFBM1pWUmFjMHRJVWxaRGVXbzFhV05MWkhBdlZISkVWVFpSUTBoVGRHZEpiR1VLTWtsQ1dsZFhaMHBJYlVwWlVXUkljbTlSZUhKTWF6STNaVTg1U25adlEybEVRelJIVkUxMVRHRXhiREJFTm1SQldVdFBRMEZzV1hkblowcFRUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZMU21FMkNrcHJUbmcyUzAxbGNqUnVlV0kwTmtwRmRtdEdjWFpKZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Um5OalIyeDFXbE14YVZsWVRteE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJVMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRVkozWkZoT2J3cE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRIVlRSUFZFWnFUbTFOTUUxWFZUVmFSRUpxVGtkVk1rMTZRWGhOUkZacVdWUm5kMDVFWXpST2JVbDNDazF0VVRWTmJWSnBUMVJWZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZExkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVV1JaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWlpWM2gzWVZjMWJFeFhTbWhqTWxWM1NGRlpTMHQzV1VKQ1FVZEVkbnBCUWdwQ1oxRlFZMjFXYldONU9XOWFWMFpyWTNrNWRGbFhiSFZOU1VkTFFtZHZja0puUlVWQlpGbzFRV2RSUTBKSWQwVmxaMEkwUVVoWlFVTkhRMU00UTJoVENpOHlhRVl3WkVaeVNqUlRZMUpYWTFseVFsazVkM3BxVTJKbFlUaEpaMWt5WWpOSlFVRkJSMFJhVlc5dUszZEJRVUpCVFVGU2VrSkdRV2xGUVhJNU4wY0tPVEppZFVJMFZHdGFLMlpvTlZGdWNHUlhkRTFtY0hKelp6UkVibXBYVG5aU2NWazJTVFZ6UTBsRlJtdHRjR2d4ZW5oMFRFVnZVMjlzYTFwdmJIZDBlQXBKWkRaemJqRXJaMUJEUkRFME0ySm9lbFJVVGsxQmIwZERRM0ZIVTAwME9VSkJUVVJCTW1kQlRVZFZRMDFSUTNsS1YwTktUems0ZG1aUFZtWXdlVEJ0Q25CUlFtNDNXRTlVVWpodVNXOVhOVlJxV2xoTVkwTkplR2hqUW5sUFdVeFdiSFU0Tm5kUFpqVkZUVnBZY0daVlEwMUhkMjg1YTJoVlZsSTVkREZtY3pNS2IyWlpXRzlPVEdzMVl6WXhaMXBpYzJORVp6RkxkbWxNUjFJeVdHMHdlbFZzTld4NFVEQlBlSGxpUkRSUWFuQTRabmM5UFFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1663851727,
          "logIndex": 3745723,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/alpine-base/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3105667933",
      "sha": "e891c6c41e9d0c4e630105ca804786b02d92db95"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

