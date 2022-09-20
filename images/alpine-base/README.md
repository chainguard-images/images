# alpine-base

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/alpine-base/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/alpine-base/actions/workflows/release.yaml)

Alpine base image built with [apko](https://github.com/chainguard-dev/apko).

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/alpine-base:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:6fd7c3c2dc380799295cfb44d109e964fc0750d1d6da82721576dc12ca8183c0`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:6fd7c3c2dc380799295cfb44d109e964fc0750d1d6da82721576dc12ca8183c0) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:6fd7c3c2dc380799295cfb44d109e964fc0750d1d6da82721576dc12ca8183c0"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "773d0b998e9d634fb7a747d0e81ab18855d36f47",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/alpine-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIDJuBEXTmBd6+bazrjjLx5R3vWXFH+/5pfrGh6V83+diAiEAtvD1oR0b4toJtaxMzIkpNm9hcQUuUe8RN9Nwgc6MqYM=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIxYmM3ZTMwNGI4NjdlMWU2MTRmYjMzODA4YTMzNTNmOWMyZmQyOThhODgyZDAyMzAzZjViN2FhZWE0MjM1ZTUxIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNmd0pzZjFPaWdKZjRvMHRKVXNWZGVmRGw1eis3TFZXNEJ2cEVISVQ4Y2d3SWdCNk9NZzdtZFYyWEhQQ3hQc2JmaVF4Y2NXNTV5Wjg0T3lOc0lHV1VrZHhrPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpSRU5EUVhwaFowRjNTVUpCWjBsVllVaERUV3hrWVU1VWFsQkVjM1pCWXpadVUzaEhObTE2VVVsM2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hkTlZHTXhUMFJSTlZkb1kwNU5ha2wzVDFSSmQwMVVaM2RQUkZFMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZSTW1oM2NERlJabWwyV0VwUldGTk1RMHh6WVZkVE1VMTFhbmcwWTJGTlNXeERVbU1LYlZvdmNFVXhkVEl6TVZwS1UwOXVOU3Q1TUZnMVduQXhlRVU1VG5aWGFHWmhNR2hNZDNkaVMyc3liVFZNVG1SQlZUWlBRMEZzVlhkblowcFNUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZDTm1SMUNuQXlPVU5STTJ4cWFXaGpSRlpqYmxwR2ExZHVObG93ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Um5OalIyeDFXbE14YVZsWVRteE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJVMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRVkozWkZoT2J3cE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRFWXpOTk1sRjNXV3ByTlU5SFZUVmFSRmw2VGtkYWFVNHlSVE5PUkdSclRVZFZORTFYUm1sTlZHYzBDazVVVm10TmVscHRUa1JqZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZExkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVV1JaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWlpWM2gzWVZjMWJFeFhTbWhqTWxWM1NGRlpTMHQzV1VKQ1FVZEVkbnBCUWdwQ1oxRlFZMjFXYldONU9XOWFWMFpyWTNrNWRGbFhiSFZOU1VkS1FtZHZja0puUlVWQlpGbzFRV2RSUTBKSWMwVmxVVUl6UVVoVlFVTkhRMU00UTJoVENpOHlhRVl3WkVaeVNqUlRZMUpYWTFseVFsazVkM3BxVTJKbFlUaEpaMWt5WWpOSlFVRkJSMFJZUVRFeE1uZEJRVUpCVFVGU2FrSkZRV2xCZVRSVE0yY0tVbE5oVlhOUU9GSlpXSFJFV0N0SVVHWnlUaTlGV0dzM1J5dHFObkJRZURKVGVFVktNRUZKWjFGRU16UkpUM0pGYzFjeFdGSnZWR2RtY0dSa0t6aFlWQXByU2xCUmRDdDBMME15T0VFek9FbFVVblJaZDBObldVbExiMXBKZW1vd1JVRjNUVVJoUVVGM1dsRkpkMlZzUVV4aVZrTndhbUppVTFka01uSmFiQ3N5Q25ZMldUQnRiM3B1WW5wRlduQlRVa1ZVWVZNNEwxWnNPRlJTYUd4UmVHWXlSWFZPUWxSVVJ6TllXRk5EUVdwRlFYbFdRM1ZrVVRJdmJtRlhRV3d2ZEU0S2RFSldVWEJYTkZsVU5FbFdOVlJPVEVsTFJrTjBhRUZ4ZG1SamNEUkJlalZWVmpGbmNrWkJiWFJQVDFWeVZuTXhDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1663696767,
          "logIndex": 3620705,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/alpine-base/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3092332701",
      "sha": "773d0b998e9d634fb7a747d0e81ab18855d36f47"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

