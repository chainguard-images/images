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
| `latest` | `sha256:9c3e0ac51c6abf38a0ae158bf6f5556e006313055734f938ad60ee04421502e4`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:9c3e0ac51c6abf38a0ae158bf6f5556e006313055734f938ad60ee04421502e4) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:9c3e0ac51c6abf38a0ae158bf6f5556e006313055734f938ad60ee04421502e4"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "b61d8b97fff63bb12ba18a00159f9d5754156bea",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/alpine-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQD1+uf3/L2lx2A1jgOrRl750aC1Rg0vWpQmGvcZWhQ80AIhAOycmmv702kXTzynYrjbzgvmBdk++9BH0eIYXPXai0Pw",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIxNjI5NGVmMWEzNzM1MWUwMDg3YTEyNTJkZTNhYzczMTgyMzNlNzNiZDA4MzQzNDcwMWZhMTEyNzAyMDBiZmMzIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUQvc0tCOEIreHRWQ0hnTnNOV3h5M2M4eHU1U3JleEYranJLbmhSZEppVlJRSWdmMk9qZ1A4T0Q1dFZmK1pvUTlCYS9mbWlQaHo3cEtTMEQzN2V5NVU4cDAwPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBha05EUVhwMVowRjNTVUpCWjBsVldWWllOelpqVWk5VlVXWjJWRkJtWkRWV1FrWnhUbWhWTTJnd2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlhsTlJFVjNUWHBSZVZkb1kwNU5ha2w0VFZSRmVVMUVSWGhOZWxGNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZRVkVRNVNuWm1lbE5GY1hsU2VFRnhkVVJCWkVJNVRISnFXbk55VVdOdFpVNW5iRGNLUjJ0MVUyVnNTSHBoYUhFemNtbHNhMUZrU2tOSWFYZFROV3h3YVhsa2VIQnhRMk5oZDNBMlVUSjJUekpTTldrNWVFdFBRMEZzYjNkblowcFhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZYY0ZadkNrbHZjMGc1T1Zab1N6TjVUeTloZFZoWVdEUTRjRlk0ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Um5OalIyeDFXbE14YVZsWVRteE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyaHBUbXBHYTA5SFNUVk9NbHB0V21wWmVsbHRTWGhOYlVwb1RWUm9hRTFFUVhoT1ZHeHRDazlYVVRGT2VsVXdUVlJWTWxsdFZtaE5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKR2MyTkhiSFZhVXpGcFdWaE9iRTFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxuV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUk0UWtodlFXVkJRakpCVGpBNUNrMUhja2Q0ZUVWNVdYaHJaVWhLYkc1T2QwdHBVMncyTkROcWVYUXZOR1ZMWTI5QmRrdGxOazlCUVVGQ2FFZHNaRWxzYjBGQlFWRkVRVVZqZDFKUlNXZ0tRVkJGU0VackwwMU9lR0V6U0hCdlRGaE1kbGhPU1VSeVdtbGxVa3htWlZJM2EzVTRZMkZhWW5wdUwxbEJhVUZtY2k5VE0xbHlibXd5S3pCR01IRmtXUXBETWxWV2JUazBVbFp3TjJwbVN5OTJhalpHTlUxQ1MwZE9WRUZMUW1kbmNXaHJhazlRVVZGRVFYZE9jRUZFUW0xQmFrVkJkamxpWVdGVGJsZG9Va3gyQ2pGaVJtMUNZbTF6T0RsTE4xQmljVUpZYWxOdVNrMUJjbFZ0V1hsRlJYZEZkbVEyTlVJdmNGRllNVFZXVEdOS1JtMVFVbk5CYWtWQmNuVXZNVFZrWjFZS2RWWk9ja2RuU1ZCdlprbFFaMDVFTnl0M2RFZHpPRlpvU2tFMFJuVm9lVE41T0hjNVozVTNVWGhEZDJabE1VazRlRW8yZUV4bVdVTUtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1668215054,
          "logIndex": 6904074,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/alpine-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/alpine-base",
      "githubWorkflowSha": "b61d8b97fff63bb12ba18a00159f9d5754156bea",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3448943043",
      "sha": "b61d8b97fff63bb12ba18a00159f9d5754156bea"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

