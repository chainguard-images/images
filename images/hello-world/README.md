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
| `latest` | `sha256:858ca73d3ab21818a94ece491843c19b2fdeb42c908912e31ea99641de30a951`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:858ca73d3ab21818a94ece491843c19b2fdeb42c908912e31ea99641de30a951) | `amd64` `arm64` `armv7` |



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
        "docker-manifest-digest": "sha256:858ca73d3ab21818a94ece491843c19b2fdeb42c908912e31ea99641de30a951"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "7aba88e2463c57571efa5944f714afb49642f3fd",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/hello-world",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQChNc3DSuanz8mpcH8MKzeHhotTqgNgXD1GhDaK396hcwIhAJjm52ZJvZn1wrU5VYUjX/kSoRvOvf9OEOKhUlPY+bZa",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJhZjczMzQ1Y2Y4NjdkODE4MmJkZDQ2MWI4YzU5M2VlMWJjZmYxYzgwOWU4MjBiNTVmZjlhMWI4ZmQ0YzcwZjViIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJR1BVSkFwemI4ckFnRzF1SCtxbWFWd21LOGhTS2s0bkFtN0Y2NmJrdWFUQ0FpQUorZUhqOHQ4ZHJIdEJzUlNBVDZNUEhMKzdQeW8ySnIrdmEvOFVXeDFtRmc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBSRU5EUVhwMVowRjNTVUpCWjBsVlVtdDZUekpTV0RCeGNra3dLek4yZEZRM2VVeElOVFpKV2xacmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hsTlJFVjRUbFJSZDFkb1kwNU5ha2wzVDFSSmVVMUVSWGxPVkZGM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZpWTNOS1JVWkJka2RRWWtWTlRVaGtOVkZXVFZSTlEyZHZUSFpKYlVoTU1VRkpRbFlLV0hsd1lVMVZLMXBMVUdoMlprMDNaemhvWkRBNUszcHBiRzVSWmtSUGQwRXhkbHB4TTNvMWVVNWhibGRWT1RST04zRlBRMEZzYjNkblowcFhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZRU1RndkNsZG9Oa1JEZGs5MmVVdFFhWGhoVm05eFIyWXpWRzB3ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5YUd4aVIzaDJURmhrZG1OdGVHdE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyY3pXVmRLYUU5RWFHeE5hbEV5VFRKTk1VNTZWVE5OVjFadFdWUlZOVTVFVW0xT2VrVXdDbGxYV21sT1JHc3lUa1JLYlUweVdtdE5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKb2JHSkhlSFpNV0dSMlkyMTRhMDFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxuV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUk0UWtodlFXVkJRakpCUVdobkNtdDJRVzlWZGpsdlVtUklVbUY1WlVWdVJWWnVSMHQzVjFCalRUUXdiVE50ZGtOSlIwNXRPWGxCUVVGQ1p6Sk1SSGhaU1VGQlFWRkVRVVZqZDFKUlNXZ0tRVWxyU3l0T2FHTllTV3RoTm1WQ1N6RXhXV3R1ZUc1V2JrZDNjWEUyVjNsTk5FUjFhMjR5YjJScWRVRkJhVUk1V2tZM1p6SjZNbkpaVkhkaGVHRmhjQXAwYWtvNVowVklSVVF3WnpsWk4wTkxjRzFKZVZrM1pIRm9ha0ZMUW1kbmNXaHJhazlRVVZGRVFYZE9ia0ZFUW10QmFrRXlZa3N3U2tORksyOXZibXd6Q2tSUll6Z3dWbXRuU2tWallYRlFSVU5VWTBWeWVuZENWekZ2ZEU5VFlWUTFPRGhHY1Vwd1VFc3hXVFJUZVdjdk0xQmFXVU5OUlhWemIzQTRZVTFoV1M4S1NsVk1URGcyZDNOSlRGVm9hSE5WTWtocWFqazVSSEYxUnpGd05GSXJUV2RuVGpWdU5HNU1OWEYxVUZWd01YTTJVa0pFT1dKUlBUMEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1663809350,
          "logIndex": 3712788,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/hello-world/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3102192992",
      "sha": "7aba88e2463c57571efa5944f714afb49642f3fd"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

