# php

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/php/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/php/actions/workflows/release.yaml)

This is a minimal PHP image based on Alpine, using PHP apks available on the Alpine Community repositories (not built from source as of now).<br/><br/>While this image is being developed, we will stick to the latest stable PHP version which at this moment is `8.1`. Supported versions in the long term are TBD.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/php:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `8` `8-bullseye` `8-cli` `8-cli-bullseye` `8.1` `8.1-bullseye` `8.1-cli` `8.1-cli-bullseye` `8.1.11` `8.1.11-bullseye` `8.1.11-cli` `8.1.11-cli-bullseye` `8.1.11-r2` `bullseye` `cli` `cli-bullseye` `latest` | `sha256:a6fba9ba6ec79dc36e4bd0222a9c49b32e6b6613d3d0e2a232760dd7837f047b`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a6fba9ba6ec79dc36e4bd0222a9c49b32e6b6613d3d0e2a232760dd7837f047b) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `8.1.10` `8.1.10-bullseye` `8.1.10-cli` `8.1.10-cli-bullseye` `8.1.10-r0` | `sha256:5e144068a1ef73b8323543fc3ca0d3d01b752637c690993ff16172f370af4bbd`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:5e144068a1ef73b8323543fc3ca0d3d01b752637c690993ff16172f370af4bbd) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `8.1.11-r0` | `sha256:d46b713a1b507d70e7e471510e4f94013b4a8adcaa3d26f3ee5044d9aef5c9b5`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:d46b713a1b507d70e7e471510e4f94013b4a8adcaa3d26f3ee5044d9aef5c9b5) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


## Usage

To try out the image, run:

```shell
docker run --rm cgr.dev/chainguard/php --version
```

```
PHP 8.1.10 (cli) (built: Sep  1 2022 16:13:09) (NTS)
Copyright (c) The PHP Group
Zend Engine v4.1.10, Copyright (c) Zend Technologies
```

## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/php:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/php:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/php"
      },
      "image": {
        "docker-manifest-digest": "sha256:a6fba9ba6ec79dc36e4bd0222a9c49b32e6b6613d3d0e2a232760dd7837f047b"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "f2c5e02218c2cec58aa2eee9d5c24b904bf04172",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/php",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIBUIUH5UZFPcZpW1etiECyeXhAnoNM0gBm+ysUDXUMlXAiEA4jkBwvRO+G218XjuFe643GmdvfZuH5hjo+CScasrcCs=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI4ODhhMTJmODhjY2Y0NWU1NmIyNmZmN2ZmNWNjZDY4NDRiNWM1ZjgzOGQ4MWY4MjY2MTIwMWJiYjVmMWQyNDE5In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURVMTNIK2VZOVgxWHlsV3BsYk1oRUZIQ01YVDk2bEVhQ1F2VkJyZTRvamFBSWhBUG4vUlRXa3I2VGtyZFYwQUVwY01QeTA1Z2RHcWVicnovNzZHMUUwSHNGcCIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndWRU5EUVhsMVowRjNTVUpCWjBsVlNUVnRWR1ZhZFZWQ1FVOHlhRkZCVFZCYWVTdHFaalZOVm1acmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1RCTlJFbDRUWHBGTWxkb1kwNU5ha2w0VFVSSk1FMUVTWGxOZWtVeVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZRTWtzclVqSjFOekF5VFc0d1VWZHpOREJ6YkVWSFdrOU5ObXBOZERkQ1ltSkhjR0VLY25Cd1NEbDNka014T1V0VksxaFhSa1ZEVVZrNFpISm5VMVpvYzB3d1ptSktNVWR2WlZZeGMwaFlNMW80VGswMVMwdFBRMEZyYjNkblowcEhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlUxWTFaMkNpdG5NbmxrU2tKb2RuRldSRE0yVFdJNVpqTkxSQzlqZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UW05alF6aDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdldtcEthazVYVlhkTmFrbDRUMGROZVZreVZtcE9WR2hvV1ZSS2JGcFhWVFZhUkZacVRXcFNhVTlVUVRCWmJWbDNDazVFUlROTmFrRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1ZDJGSVFYZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwdENaMjl5UW1kRlJVRmtXalZCWjFGRFFraDNSV1ZuUWpSQlNGbEJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUlVJNFVDdHlaMEZCUWtGTlFWSjZRa1pCYVVGRGNsWmFhMjl1Y0RkV1VYTTJVa3RsVlhVNU4xZ0tSVll5TDNCblFrOWhkVTVuYmpVMGNFNVdRMDB2ZDBsb1FVeFNWVEZWUlVkUlFrdE9iVTlrSzFsNk5XaHlPUzh4UkVFeE1FcGpVbmt3WmxSeldqTjVZZ3B4VGpaTVRVRnZSME5EY1VkVFRUUTVRa0ZOUkVFeVowRk5SMVZEVFVkVVQwWXhNSFZTYzFodk0wOHhjRlZDWnpGaWJGZHdXaXRzV2tGblYxSXdLMHA0Q21wRGRubFZXVVkxWVRaS1JHZE9lbmx2TkRoeE1IQkNZVEpzVkRBelVVbDRRVTFKTkZsVGJtOTVRMmQyVVhoWFdUSldXbTFwTnl0elZFRkVOMlZhTWtZS056QnlSbkJZWVVsT0sydDBjR05HT0M5eE5GbHVkMmN2V1hVMGJtTlNWMjE2WnowOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1666577620,
          "logIndex": 5733242,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/php/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/php",
      "githubWorkflowSha": "f2c5e02218c2cec58aa2eee9d5c24b904bf04172",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3309510352",
      "sha": "f2c5e02218c2cec58aa2eee9d5c24b904bf04172"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

