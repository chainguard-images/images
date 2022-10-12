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
| `latest` | `sha256:da453661b4e204d37e290326f611b75c2ffd55920afc369f618d00458a1f8d0c`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:da453661b4e204d37e290326f611b75c2ffd55920afc369f618d00458a1f8d0c) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:da453661b4e204d37e290326f611b75c2ffd55920afc369f618d00458a1f8d0c"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "d5a084b3456100c2073713c7a58ee9698e586d83",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/alpine-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDFSh0edEhrfHrVkdorBHkZAjuMm8AI7hvXPol9VMR0AQIgL4UwrypIXn0SxVhKAYIeYq9tCYXcjzxQcm3aIpjke/w=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJkZTRkOTQzYjNhMzgzMzI1Yjg3ZmI0ODU4NWE1M2U1M2NkNDdkOGE4ZGQ4YTJlOTdhZjZhYzFlNzNlODdlYjRhIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FTUNJR0Q3S0JmbUVrd2RXSDNUaFpPNm1Ub2dlSkVFMHpPN1JJRlJPMWY2N3dtNUFoOGxkV0M5b2pHVmkwaDVKTndmejFBcUg1WXJGSHZpMkMwRVk3Qm1XYm9mIiwicHVibGljS2V5Ijp7ImNvbnRlbnQiOiJMUzB0TFMxQ1JVZEpUaUJEUlZKVVNVWkpRMEZVUlMwdExTMHRDazFKU1VSeWVrTkRRWHBoWjBGM1NVSkJaMGxWUzBndmJuRkdTV2xSYkdaT1YwVjBPRWc0VmxaUWNERlZWVE0wZDBObldVbExiMXBKZW1vd1JVRjNUWGNLVG5wRlZrMUNUVWRCTVZWRlEyaE5UV015Ykc1ak0xSjJZMjFWZFZwSFZqSk5ValIzU0VGWlJGWlJVVVJGZUZaNllWZGtlbVJIT1hsYVV6RndZbTVTYkFwamJURnNXa2RzYUdSSFZYZElhR05PVFdwSmVFMUVSWGxOVkVFeFQwUk5kMWRvWTA1TmFrbDRUVVJGZVUxVVJYZFBSRTEzVjJwQlFVMUdhM2RGZDFsSUNrdHZXa2w2YWpCRFFWRlpTVXR2V2tsNmFqQkVRVkZqUkZGblFVVktZemQxT0dJcmRIWlJlWFJxVldscldXdGllWGt5YTJSU1ZFVkhlRE00TUdGR1pGVUtka2xrZDBWdlJrWnNLMHB3TmpOWFozQlhia3BvVlhwRlQxaExRV2xoVGpaM2JGWm9jRWRHTVhveFUzSlRVV2xEZFV0UFEwRnNWWGRuWjBwU1RVRTBSd3BCTVZWa1JIZEZRaTkzVVVWQmQwbElaMFJCVkVKblRsWklVMVZGUkVSQlMwSm5aM0pDWjBWR1FsRmpSRUY2UVdSQ1owNVdTRkUwUlVablVWVlZZamxDQ2xveE5GbHZPR2hwU1dkb1UzcGpTR2wxZFZFcllYbFZkMGgzV1VSV1VqQnFRa0puZDBadlFWVXpPVkJ3ZWpGWmEwVmFZalZ4VG1wd1MwWlhhWGhwTkZrS1drUTRkMkpSV1VSV1VqQlNRVkZJTDBKSFRYZFpXVnBtWVVoU01HTklUVFpNZVRsdVlWaFNiMlJYU1hWWk1qbDBUREpPYjFsWGJIVmFNMVpvWTIxUmRBcGhWekZvV2pKV2Vrd3lSbk5qUjJ4MVdsTXhhVmxZVG14TWVUVnVZVmhTYjJSWFNYWmtNamw1WVRKYWMySXpaSHBNTTBwc1lrZFdhR015VlhWbFYwWjBDbUpGUW5sYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQwOVJXVXRMZDFsQ1FrRkhSSFo2UVVKQlVWRnlZVWhTTUdOSVRUWk1lVGt3WWpKMGJHSnBOV2dLV1ROU2NHSXlOWHBNYldSd1pFZG9NVmx1Vm5wYVdFcHFZakkxTUZwWE5UQk1iVTUyWWxSQlUwSm5iM0pDWjBWRlFWbFBMMDFCUlVOQ1FWSjNaRmhPYndwTlJGbEhRMmx6UjBGUlVVSm5OemgzUVZGTlJVdEhVVEZaVkVFMFRrZEplazVFVlRKTlZFRjNXWHBKZDA1NlRUTk5WRTVxVGpKRk1VOUhWbXhQVkZrMUNrOUhWVEZQUkZwclQwUk5kMGhCV1V0TGQxbENRa0ZIUkhaNlFVSkNRVkZQVVROS2JGbFlVbXhKUmtwc1lrZFdhR015VlhkTGQxbExTM2RaUWtKQlIwUUtkbnBCUWtKUlVXUlpNbWhvWVZjMWJtUlhSbmxhUXpGd1lsZEdibHBZVFhaWlYzaDNZVmMxYkV4WFNtaGpNbFYzU0ZGWlMwdDNXVUpDUVVkRWRucEJRZ3BDWjFGUVkyMVdiV041T1c5YVYwWnJZM2s1ZEZsWGJIVk5TVWRLUW1kdmNrSm5SVVZCWkZvMVFXZFJRMEpJYzBWbFVVSXpRVWhWUVVOSFExTTRRMmhUQ2k4eWFFWXdaRVp5U2pSVFkxSlhZMWx5UWxrNWQzcHFVMkpsWVRoSloxa3lZak5KUVVGQlIwUjVPV2xPUm5kQlFVSkJUVUZTYWtKRlFXbENZeTh4Wm5NS1VHeHlUMFkyUzJkemNtVm9RVGxzTVRneVNFbzNhVVlyUjJSdFIzcGlhMlJoY2xaQ05sRkpaMUJCVXpGU01IUmhNRmN4Umxoc0x6ZHJUV2xzUnpsdU5ncDVXazAwY0Uwd2MwRjRlazVuY1ZsRGVtb3dkME5uV1VsTGIxcEplbW93UlVGM1RVUmFkMEYzV2tGSmQxWkZOaXMxYldwTE1HcG5jVGw0UTBRMU9WTm1DbGh6TjFKeU5uQldkbmhZYkhWdmVGTlVNak5hU1RKRmN6VjNUa1p5UjFsRlYwUkRMMnRZZFU1RVZEWlBRV3BCTVU5cGNXdHZSVVJIYkRKcmIwbHFUMGtLWVdOcGN6SjJkQ3M1Y0cxVE1FY3lTMFJUZW1oSldrSTRRVmszU0dwUkwybHRTelZVVTNsNFdraDBNVUpUTURBOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1665572358,
          "logIndex": 4958521,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/alpine-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/alpine-base",
      "githubWorkflowSha": "d5a084b3456100c2073713c7a58ee9698e586d83",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3234102511",
      "sha": "d5a084b3456100c2073713c7a58ee9698e586d83"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

