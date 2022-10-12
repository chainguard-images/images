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
| `latest` | `sha256:a557691d7ef9090f4579a73f764d1744c6ded637d5b88e935426bae00a9620f1`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a557691d7ef9090f4579a73f764d1744c6ded637d5b88e935426bae00a9620f1) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:a557691d7ef9090f4579a73f764d1744c6ded637d5b88e935426bae00a9620f1"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "c50842ed3561484a5b5071f405d3bbbe831902f1",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/alpine-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIGhyYpookYyeGERjYcqCGi4GpdYqSINej+NMQstdJP4EAiB00UNtdUGD2ZZYUAJugDUQwIyghu+vzjmyeblJ/lWqCQ==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJhYzA5ZWI4NDUyNTIzYmJjNGE5NjBiZDczNTBiMDcyOTBjNzMwNTMzNGQ5ZDI2NmU4OTE5ZjllZDI4YmZkMmQzIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJRWVuZCtNaVdhYkZKcWI3eUR3aGtHWGU5dlJRQWRyOWw2K0NuL2JMVUlFMkFpQitTSHJxMDBFdmVoM2t1OXB6MmRXdVV3bzZPQ3h4YW9ZY1prOFR4ekhiSWc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpha05EUVhwcFowRjNTVUpCWjBsVlptZGpVVTVDTWpOb1dDdEljMDVKVDJSRmMyNXNWSEJsVW1sUmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhsTlZFRXdUa1JCTTFkb1kwNU5ha2w0VFVSRmVVMVVRVEZPUkVFelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVUyV1hoTlNHUkRObHBGY0ZrMk16WmhRM2hpVFRRNVZXRm5TVEZITTBnclNXUXpOMlFLTkVadU5GSjFZMEZsV1N0Q2QzRmFVR3BKWmtNM0t5OVZXR3hTUkc5SVdFTlNReTlNUTBKcGNqbGlLMk1yTXpaYWIyRlBRMEZzWTNkblowcFVUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZpTm1FeENtTkhURVJ4VDBaNFpVY3paSGR0WWxwU1owMVNjM1JCZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Um5OalIyeDFXbE14YVZsWVRteE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJVMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRVkozWkZoT2J3cE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRIVFRGTlJHY3dUVzFXYTAxNlZUSk5WRkUwVGtkRk1WbHFWWGRPZWtadFRrUkJNVnBFVG1sWmJVcHNDazlFVFhoUFZFRjVXbXBGZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZExkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVV1JaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWlpWM2gzWVZjMWJFeFhTbWhqTWxWM1NGRlpTMHQzV1VKQ1FVZEVkbnBCUWdwQ1oxRlFZMjFXYldONU9XOWFWMFpyWTNrNWRGbFhiSFZOU1VkTVFtZHZja0puUlVWQlpGbzFRV2RSUTBKSU1FVmxkMEkxUVVoalFVTkhRMU00UTJoVENpOHlhRVl3WkVaeVNqUlRZMUpYWTFseVFsazVkM3BxVTJKbFlUaEpaMWt5WWpOSlFVRkJSMFI1T0hScU9XZEJRVUpCVFVGVFJFSkhRV2xGUVRKeFRHVUtaa2xHYkhOT1VrdEVVekZRUjFOTk5UbENjRzB4Tnl0UFVWVkJUU3RZV2pOQ2FXWk9kR0ZCUTBsUlJIbHBibWMxWm5OcU0wMTFSMlJKUTIxWFJ6SXhPUXBEYTJWd2IwTXlOelpNY0hGSE1tMVpkM0UwUm1ONlFVdENaMmR4YUd0cVQxQlJVVVJCZDA1dlFVUkNiRUZxUW14aGMzWlNjbHBOUVc5bGJHWnpVMUYyQ2taMmNVcEZLMjEzWmpkek0yRkJVREJXYURsc1UzWlJSMUpzV2xsSU4waFplR3BHTW5WS2NWQmxURkZRUkVWRlEwMVJRemRGWmxCNGVWSXZRelp2UVRnS1JHVk5kV1paVkZodU1YYzFiekpaVVhOd2NFWlZja0ZaUlhKalJrbE5UMHA2ZHpGNU4xcE9hRTlEZGtWSldXVnNlR1pWUFFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1665571486,
          "logIndex": 4957656,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/alpine-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/alpine-base",
      "githubWorkflowSha": "c50842ed3561484a5b5071f405d3bbbe831902f1",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3234019178",
      "sha": "c50842ed3561484a5b5071f405d3bbbe831902f1"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

