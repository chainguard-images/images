# busybox

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/distroless/readme-generator
-->

[![CI status](https://github.com/distroless/busybox/actions/workflows/release.yaml/badge.svg)](https://github.com/distroless/busybox/actions/workflows/release.yaml)

An image that contains busybox and musl, suitable for running any binaries that only have a dependency on musl.

## Get It!

The image is available on `distroless.dev`:

```
docker pull distroless.dev/busybox:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `1.35.0-r25` `latest` | `sha256:9db19b35fef64aaf9efe99da7c3318fbe720fbcc7bc10ed74d65a7c54d8ddd0b`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:9db19b35fef64aaf9efe99da7c3318fbe720fbcc7bc10ed74d65a7c54d8ddd0b) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |



## Signing

All distroless images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify distroless.dev/busybox:latest | jq
```

Output:
```
Verification for distroless.dev/busybox:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/distroless/busybox"
      },
      "image": {
        "docker-manifest-digest": "sha256:9db19b35fef64aaf9efe99da7c3318fbe720fbcc7bc10ed74d65a7c54d8ddd0b"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "d29f7f1f216edaf6da1c7590a84befa37a496073",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/busybox",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCzWq7dq+TwI5wBhyYJjtQ1Cxv6O0dLC3ysuRr3V3QYKQIhALDXwIMeQBxzBYLd077fm54gzA/ZsL3uJ4LREEKxf9Lk",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJlZjBhZmE0ZGJjZTcxZjI4MWNmY2NlYjEwNzEzYjRiMzc5OWZjMWRiNmYxNWQ2MjA3MzNiOTRlYzI2MWU0NzhlIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJUUNmUFFSQlFzVS9XU09LRGZjckdiRjVYblJrcEtKQ285MkZCdGE4VnRramd3SWZic284YVhvU3ZwOFYwRlhnVXFFbThKOE9FeXdPYmhjdm8xQVgwc0FmWHc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnRWRU5EUVhsRFowRjNTVUpCWjBsVlQzaFdjVkJQSzBjeFVFdFdZVGR5TlVoVFFXMUtXVlJMZUVJNGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRCTlZHTjZUV3BOTWxkb1kwNU5ha2wzVDFSRk1FMVVZekJOYWsweVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZWY1c5bksybzBWSFZXTVZoYVNUVldRa1pJT0hOaVdVMWlkVEZVVjFObllWaDViR0lLTTFadmJVSnViVUZ4Wm5WWmIwcE9RV3gyVlZvdlprOWxhbXBvVDJaVE9HcEhRVEpGZGtZeGNGRlZUbWM0S3paeFNHRlBRMEZxT0hkblowazNUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZzZFRWUENuTnZlWG8zVUhCUGVGTm9iblpCYm5wbGFqWkdTbUZ2ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFsbldVUldVakJTUVZGSUwwSkdaM2RXYjFwVllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BaYmxaNlpWZEtkbVZET0hWYU1td3dZVWhXYVV3elpIWmpiWFJ0WWtjNU0yTjVPWGxhVjNoc1dWaE9iRXh1YkdoaVYzaEJZMjFXYldONU9XOWFWMFpyQ21ONU9YUlpWMngxVFVSclIwTnBjMGRCVVZGQ1p6YzRkMEZSUlVWTE1tZ3daRWhDZWs5cE9IWmtSemx5V2xjMGRWbFhUakJoVnpsMVkzazFibUZZVW04S1pGZEtNV015Vm5sWk1qbDFaRWRXZFdSRE5XcGlNakIzUldkWlMwdDNXVUpDUVVkRWRucEJRa0ZuVVVWalNGWjZZVVJCTWtKbmIzSkNaMFZGUVZsUEx3cE5RVVZFUWtOb2EwMXFiRzFPTWxsNFdtcEplRTV0Vm10WlYxa3lXa2RGZUZsNll6RlBWRUpvVDBSU2FWcFhXbWhOZW1Sb1RrUnJNazFFWTNwTlFuZEhDa05wYzBkQlVWRkNaemM0ZDBGUlVVVkVhMDU1V2xkR01GcFRRbE5hVjNoc1dWaE9iRTFEUVVkRGFYTkhRVkZSUW1jM09IZEJVVlZGUlcxU2NHTXpVbmtLWWpKNGJHTXpUWFpaYmxaNlpWZEtkbVZFUVdSQ1oyOXlRbWRGUlVGWlR5OU5RVVZIUWtFNWVWcFhXbnBNTW1oc1dWZFNla3d5TVdoaFZ6UjNaMWxyUndwRGFYTkhRVkZSUWpGdWEwTkNRVWxGWlhkU05VRklZMEZrVVVGSldVcE1kMHRHVEM5aFJWaFNNRmR6Ym1oS2VFWmFlR2x6Um1velJFOU9TblExY25kcENrSnFXblpqWjBGQlFWbE5PVVF3ZG5WQlFVRkZRWGRDUjAxRlVVTkpRMFZyTjFSa1pTOHpPRmhIYldwQ2NYRTNPVzB5YTJrdmRVMVBPRlZEZUhCamRIVUtiWGhCUmpJNVVUaEJhVUpQZDJ4U00wdEJhMXBSUm1keVlsaExLMFphVDBOU2RVaFhTVEpLT1hwcGFISk9WbkZOYUVOdFp6ZEVRVXRDWjJkeGFHdHFUd3BRVVZGRVFYZE9ia0ZFUW10QmFrSlpXU3MzUTBkVmMxZG1WMGRRYVdoSFdWRnZiVGxhUm5CTmNFaG5ZV3RPV21aVkwyeDJXa3h3TkdSS1ZuRnBjMFZUQ21ST05XUm5WbnBYZVhKMFlWWXJWVU5OUW5CamExWXJTMjVUY1d4M01raGlkRkZEU1ZOU01uVk9hME54VGtkbWJYTmhRazVCYTFsRVExZDRkWGxXTkU4S1VIUjFkMWhaV0dsd2NFbDBXVWR1V1d4M1BUMEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1663176776,
          "logIndex": 3499050,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/busybox/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3054823503",
      "sha": "d29f7f1f216edaf6da1c7590a84befa37a496073"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

