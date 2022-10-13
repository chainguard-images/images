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
| `latest` | `sha256:39c80f84f80f7e3d6e5d60634eec34462bf48a4b809d1bcaf3b3f656a1af4721`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:39c80f84f80f7e3d6e5d60634eec34462bf48a4b809d1bcaf3b3f656a1af4721) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:39c80f84f80f7e3d6e5d60634eec34462bf48a4b809d1bcaf3b3f656a1af4721"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "77685f69191d63c8b5e0459500138da7677f562e",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/alpine-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDTYd55q8gOkE6U27xA7w2nPEEBqfofERWqh1o+9SB5ewIhAK8Lyf2SHX1THZmxEczlIRaPcTQ3WCrpC3SrEzB4TSrD",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIwYmQzZGMwMWEzMzdiZTlkNWNhZjg5NDNlMDJlNTc3NDA3MTY2YmQwZmU1ODQ0Mjk3YzI5YmE0OWVhNGFlM2Q0In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQ2dWZkRidE91VGZGUDJUdVZpNXJ6cWY2UTlMQTB1eHVTYkwzQ1NObTVFd0FpRUFuQWU3QlVhSDRWV3dIUTFFMkQ0NmJQNGs0eHZzdDk5MEVIN29Fc3NNeWN3PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpWRU5EUVhwbFowRjNTVUpCWjBsVlZXOVZWak0xTkhoTVVEY3dhRXByYjBsVmEzUk1hWFpUYUdwemQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhwTmFrRjVUbFJOTTFkb1kwNU5ha2w0VFVSRmVrMXFRWHBPVkUwelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZpZDBRd01XUkdOVmtySzNGU09WVlViVmRqYVhsTmJrWkZZVlJGTVV4dk5IZzBjamNLV2xaNEswSTFRMkZHUmxJeFdITkVTRlpOWVc5UGVWRm9XVUl3YmpZNVVEbFhXbUpNUTB4b1pYZ3dZbkpaVVUxd1ZVdFBRMEZzV1hkblowcFRUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZCYUhZMkNsa3JXV0ZKTUZoeVNsVnNObWhzTjBwUFQweG5OMVJyZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Um5OalIyeDFXbE14YVZsWVRteE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJVMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRVkozWkZoT2J3cE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRFWXpOT2FtY3hXbXBaTlUxVWEzaGFSRmw2V1hwb2FVNVhWWGRPUkZVMVRsUkJkMDFVVFRSYVIwVXpDazVxWXpOYWFsVXlUVzFWZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZExkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVV1JaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWlpWM2gzWVZjMWJFeFhTbWhqTWxWM1NGRlpTMHQzV1VKQ1FVZEVkbnBCUWdwQ1oxRlFZMjFXYldONU9XOWFWMFpyWTNrNWRGbFhiSFZOU1VkTFFtZHZja0puUlVWQlpGbzFRV2RSUTBKSWQwVmxaMEkwUVVoWlFVTkhRMU00UTJoVENpOHlhRVl3WkVaeVNqUlRZMUpYWTFseVFsazVkM3BxVTJKbFlUaEpaMWt5WWpOSlFVRkJSMFF3ZDFsbk9WRkJRVUpCVFVGU2VrSkdRV2xCYjNSRU1uY0tPV1Z3UzFOcFducHBaRkZTTlhZNVNDOVpSRFZrVjFsdVEwaFRiWGM1YzBWS1lVaEtXa0ZKYUVGUVdtZENVVGhvUWtrek1tSjBXVWczY0cxRU9HWjZNQXB3Y1UxamMxSnRaMHhXTTA0d1RtTlFXVlp6VGsxQmIwZERRM0ZIVTAwME9VSkJUVVJCTW1kQlRVZFZRMDFHVFRsemNtY3pkVUl4YjJKQ2FXRTFXaklyQ21vNGNXbEVUSHBEUzJwclIzcHNWVGxqY0RCT0t6QnpkM2s0U3pWWVVtcEVWRXBvZHpabU9FazJRMWxLTUhkSmVFRlBTMDFKZEdkbVRXRjBjM2R3TlZJS1VrcENPVFJHYUU5aFdHUkpObkJyTkZSalJEZFRUMnhTY0ZwRk5pdFFhREE1TDBSU1dHWXZVU3RPVkZSQmVtZFpaa0U5UFFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1665692762,
          "logIndex": 5049459,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/alpine-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/alpine-base",
      "githubWorkflowSha": "77685f69191d63c8b5e0459500138da7677f562e",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3245448361",
      "sha": "77685f69191d63c8b5e0459500138da7677f562e"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

