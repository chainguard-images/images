# hello-world

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/hello-world/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/hello-world/actions/workflows/release.yaml)

Hello, world!

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/hello-world:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:e07235c23cfe09208f5d7074fb50d0c74a7991c37136f531b501961f4cff3245`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:e07235c23cfe09208f5d7074fb50d0c74a7991c37136f531b501961f4cff3245) | `amd64` `arm64` `armv7` |



## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/hello-world:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/hello-world:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/hello-world"
      },
      "image": {
        "docker-manifest-digest": "sha256:e07235c23cfe09208f5d7074fb50d0c74a7991c37136f531b501961f4cff3245"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "75940290b8db5b7dd960166979573c920807196c",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/hello-world",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIBaOmR73mTruzT6Ty4Yeq8kdqgLAn8gtlUsTmzggYdw4AiEAmmAPOyyadf153opWCGuzB2FRhKeYZN6MnEl0FhTqFZo=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIxMWE5NTE5ZTkwMWQyNjkzOTAzNGY1NTg1YjliNWMzMGEwYWIxOTUwODRkMGY2MTZhYTYxYjE1OTdiNzBjMjYyIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJRytJTjhWT0x5NmZRME0wSzVidWs1ZHgxeHRCZUZRSFFEUldQUWpYVnZRWEFpRUF4bU5pbVV5WnNuZ0FlQUhLZG8yT2ZrVGRQdlVhdXRaS0RtdW5uZk9mQ1FFPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpha05EUVhwbFowRjNTVUpCWjBsVlFrWkZjMGhsV0ZOYWNDOVhUV2s1VlV4MlNFWmhTR1ZMTTFKM2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hkTlZHZDNUVVJCTWxkb1kwNU5ha2wzVDFSSmQwMVVaM2hOUkVFeVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ3T0RjeWVraHZWMVpDUnpWRVlYZHVRMWd5ZW1Wb2JVaDJkMU5GYVZGVU9ITlJaR0lLY0hKRFV6WjNUSFZUVkRkb1JYcE1hbU5VTDBrcllUYzRPR1JYY0hWb1oxRjFTV2t4WjJKMloxbFBXbGRaWkU5amEyRlBRMEZzV1hkblowcFRUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZPWnpWU0NqVkhiR1E1UjFOMlRsbGhSamMzVmpSR1JXMUxiMEZSZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5YUd4aVIzaDJURmhrZG1OdGVHdE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJVMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRVkozWkZoT2J3cE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRFWXpGUFZGRjNUV3ByZDFscWFHdFphbFpwVGpKU2EwOVVXWGROVkZreVQxUmpOVTVVWTNwWmVtdDVDazFFWjNkT2VrVTFUbTFOZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZExkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVV1JaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWmhSMVp6WWtjNGRHUXlPWGxpUjFGM1NGRlpTMHQzV1VKQ1FVZEVkbnBCUWdwQ1oxRlFZMjFXYldONU9XOWFWMFpyWTNrNWRGbFhiSFZOU1VkTFFtZHZja0puUlVWQlpGbzFRV2RSUTBKSWQwVmxaMEkwUVVoWlFVTkhRMU00UTJoVENpOHlhRVl3WkVaeVNqUlRZMUpYWTFseVFsazVkM3BxVTJKbFlUaEpaMWt5WWpOSlFVRkJSMFJZUVRacVMzZEJRVUpCVFVGU2VrSkdRV2xGUVdkMlZVRUtaM0prVnpaQlMxbGxiMDR3V205MmNHaDRiaTlyVlc4cldFdzViVW92WlhveU9TOXhaRGcwUTBsRlduSkhiRmRpYlZKVFVrVTFXSHBMVDBoWk1FeEJNd3BTYkZWNFpHdE9aMVp1Wm10Q0sxbzVjV1ptYmsxQmIwZERRM0ZIVTAwME9VSkJUVVJCTW10QlRVZFpRMDFSUTNjclFsWnVRVGRRWWxKcVFqaGFhamx5Q2xKSVpGZHdVMEkxYkZKU2FGbHRWMDR4Y1VOSGRuUjRabkJ2TTJaYVUyRmhPV1Z3UkZGM1F6aEVSVlFyVEdGdlEwMVJRMUphU2xocWRWRjJOV016VjBvS2EyMUpkVlJRY25KSGJ6VjNkSFpRWTFCelNHNU1WVTh5VkZKU1ZsZE9VMG95U0RWaGFUVklkVGxVZG1kak1WcFJSRWR6UFFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1663696831,
          "logIndex": 3620797,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/hello-world/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3092327137",
      "sha": "75940290b8db5b7dd960166979573c920807196c"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

