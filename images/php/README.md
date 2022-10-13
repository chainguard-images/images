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
| `8` `8-bullseye` `8-cli` `8-cli-bullseye` `8.1` `8.1-bullseye` `8.1-cli` `8.1-cli-bullseye` `8.1.11` `8.1.11-bullseye` `8.1.11-cli` `8.1.11-cli-bullseye` `8.1.11-r0` `bullseye` `cli` `cli-bullseye` `latest` | `sha256:ce5bfa099387d7570cca3cab7383a4801071474d3717e7256cc9707bc22d3179`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ce5bfa099387d7570cca3cab7383a4801071474d3717e7256cc9707bc22d3179) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `8.1.10` `8.1.10-bullseye` `8.1.10-cli` `8.1.10-cli-bullseye` `8.1.10-r0` | `sha256:5e144068a1ef73b8323543fc3ca0d3d01b752637c690993ff16172f370af4bbd`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:5e144068a1ef73b8323543fc3ca0d3d01b752637c690993ff16172f370af4bbd) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:ce5bfa099387d7570cca3cab7383a4801071474d3717e7256cc9707bc22d3179"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "b3455db840de390297d70e1f8c7c14662bd573ef",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/php",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIHwkPR07AIpoQ5BJ+SMHUQeJIuviKbsSuub1tFQN0o8GAiAGotILZByxYHVrkoPTR+XMGT7KPHh0uTXB+R5mPGI50w==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJhZmU0MjgzNzU2YmU5YTExYTdmMjE0Y2JiOGNlOGNhOTEyMGI3Mjk4ZjFmOTQ2Zjc1NzI0MDZiNjI1YTZjYzI5In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQ0VnT0N2bk81YmNNZlA0dThoVnZmQWdheUQ2ZFp1bG51RnJnUk1CTmMxQ0FpQTVJMWdXTTAzVzJxRGxtTWFIRFdES0dKYmNEOXVPUE9jNVF4K0RIdk12clE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnZWRU5EUVhscFowRjNTVUpCWjBsVlpVMXlhbFUxTjFwNmJUWkZPREF6UmxBMWNqa3dlRTB4U3poTmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhwTlZHdDNUMVJOTlZkb1kwNU5ha2w0VFVSRmVrMVVhM2hQVkUwMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZKYzFoa2VGcG9kMFZxZURsbGVFVXpVbkl6ZVdZME9YcFlPRWx1Y0hKVVpHVTJaWGdLUVdKWE9GTkhLMk4yYVhJMllrMXVPRzAzTlhsRVN6TjZkWE55YVVOUlVXRnlXRzVvUnpFMlpUUktXVTk1VjA4M1dIRlBRMEZyWTNkblowcEVUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZtWjFvNENsaG5hVmROUkVGak9YRnhNVUZUTDJOblVsTlRielJqZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UW05alF6aDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwVm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkZZMGhXZW1GRVFUSkNaMjl5UW1kRlJRcEJXVTh2VFVGRlJFSkRhR2xOZWxFeFRsZFNhVTlFVVhkYVIxVjZUMVJCZVU5VVpHdE9la0pzVFZkWk5GbDZaR3BOVkZFeVRtcEthVnBFVlROTk1sWnRDazFDZDBkRGFYTkhRVkZSUW1jM09IZEJVVkZGUkd0T2VWcFhSakJhVTBKVFdsZDRiRmxZVG14TlEwMUhRMmx6UjBGUlVVSm5OemgzUVZGVlJVWlhUbThLV1Zkc2RWb3pWbWhqYlZGMFlWY3hhRm95Vm5wTU0wSnZZMFJCWkVKbmIzSkNaMFZGUVZsUEwwMUJSVWRDUVRsNVdsZGFla3d5YUd4WlYxSjZUREl4YUFwaFZ6UjNaMWx6UjBOcGMwZEJVVkZDTVc1clEwSkJTVVZtVVZJM1FVaHJRV1IzUVVsWlNreDNTMFpNTDJGRldGSXdWM051YUVwNFJscDRhWE5HYWpORUNrOU9TblExY25kcFFtcGFkbU5uUVVGQldWQlRkMHBKTWtGQlFVVkJkMEpKVFVWWlEwbFJSRU0zVFdoamVVdHBkRkpWV1hkMGQyWkxVblJTWnpnelpTOEtLMHM0WTAxRWFXRk9XRkE1YjBwemVVSlJTV2hCUzJacFZGVXhZbUp1UlRCWWFXNXRlSGt5YlRoMVdHOVJNMEpCUjJKYWFYUlFORVpJVjJsR1dsUkZUZ3BOUVc5SFEwTnhSMU5OTkRsQ1FVMUVRVEpqUVUxSFVVTk5RVFppWlZWRlMwdFRNR1JVV0hONFNreEVWV1ExWld0VVNWTjJXRzV6YjNnNFVWVndVekpPQ2xVdmVGTndTRnBQYjJoTlIydHdSelYxZEhRMksyOUlOVVZSU1hkWU1UaFpkbm9yVUM5ellrWnVZa2hyWVhOV1kyZGxVRTk1WmpOUFUxZGFOMEkyU2t3S2JIQTJOV1ZJV0VkbE1EVjJialJ3UzNrM2MwNWtiSGRKU2pWMWF3b3RMUzB0TFVWT1JDQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENnPT0ifX19fQ==",
          "integratedTime": 1665688206,
          "logIndex": 5045477,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/php/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/php",
      "githubWorkflowSha": "b3455db840de390297d70e1f8c7c14662bd573ef",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3245006003",
      "sha": "b3455db840de390297d70e1f8c7c14662bd573ef"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

