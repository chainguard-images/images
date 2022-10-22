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
| `8.1.11-r0` | `sha256:d46b713a1b507d70e7e471510e4f94013b4a8adcaa3d26f3ee5044d9aef5c9b5`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:d46b713a1b507d70e7e471510e4f94013b4a8adcaa3d26f3ee5044d9aef5c9b5) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `8` `8-bullseye` `8-cli` `8-cli-bullseye` `8.1` `8.1-bullseye` `8.1-cli` `8.1-cli-bullseye` `8.1.11` `8.1.11-bullseye` `8.1.11-cli` `8.1.11-cli-bullseye` `8.1.11-r2` `bullseye` `cli` `cli-bullseye` `latest` | `sha256:922e6aca07d92429e15aebac30ea1cec23203b5133950f82d8cd2039d8c0acef`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:922e6aca07d92429e15aebac30ea1cec23203b5133950f82d8cd2039d8c0acef) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
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
        "docker-manifest-digest": "sha256:922e6aca07d92429e15aebac30ea1cec23203b5133950f82d8cd2039d8c0acef"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "625ae57694357c36637f45eeac8d517cc437fead",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/php",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIAcLFLG98BXn90AvX7mWgwhgJSPLeens93OkWf97wPigAiBRQIpz8A3nl1Egvv5okN1sjW321OPvcShD2Cb4Va0F6w==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIwNWFmMTkzZjY0NzZlZDQ5MmYyOTU5NDA2Y2UxNDI3MWI3ZWQ4ZGUzOGYxNjBmZTg4NmE5N2M0NjZmNDVhNDRmIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQjY5V3VMMWRNU1kwT0RYSGIxald5d2ZYak1ReEhiN3pLaFdjVnREc2ZKbEFpQm0xdGFvVlZIOFAwZU5zcUJCWmJIQTY3ZERHMW14L05wbkw2blZWeU1DUHc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndSRU5EUVhseFowRjNTVUpCWjBsVlZ6WTBSVGhIZVU5NGFFODNhRFp4V0dSMVJVZEJLM3B3U0hCTmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1hsTlJFVXhUV3BKZDFkb1kwNU5ha2w0VFVSSmVVMUVTWGROYWtsM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVU1V0hwTlZ6VnphMnhXUm1NMVFYcDZUVk5zVUU5VWFESmpiRFF2TlVkVldsWmlTRW9LTTJkdVVUaFpWVGR0SzIxRWRsZHBaV2RZTW14NksyUXlaR1JQUTBWaGRVUnpTbXhWYVhsWVVEQjFTM1JSYVZGTlFYRlBRMEZyYTNkblowcEdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZvZDJ4V0NtTndXVWhOZDNCTWVVVnBRbXRPUlhWUlRVaE1lRGMwZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UW05alF6aDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdlRtcEpNVmxYVlRGT2VsazFUa1JOTVU0eVRYcE9hbGw2VGpKWk1FNVhWbXhaVjAwMFdrUlZlRTR5VG1wT1JFMHpDbHB0Vm1oYVJFRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1ZDJGSVFYZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwcENaMjl5UW1kRlJVRmtXalZCWjFGRFFraHpSV1ZSUWpOQlNGVkJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUkM5WFVXUmFVVUZCUWtGTlFWSnFRa1ZCYVVGWlpWTlVaVVl2TlZNME55OVdURUZxYVRaNWRWSUtibnBQV21OS1pYQXJZbmRxYWpoYVVUTTNjSEp0VVVsbldGUTRSWGhhZWpoeldrdEJhR0ZhUjNWblV6UkZTbUpPUWxKeVJtOU1UR1ExVWl0U1NFRkdhd3A1YUhOM1EyZFpTVXR2V2tsNmFqQkZRWGROUkdGQlFYZGFVVWw0UVV4bFZtZHhNRXR4VjFaMVN5dFJabVprTWtSbWJEaEZNVWxsVTNGeFZIa3llbUpJQ25SV1ZWcEhiR3AwUmxnemRqVjRWVkowZFU5aFRHWkNSMmRST0daQlowbDNVV0pHZFZWVGRGb3JjbmhKUlVGS1dqZHpkWFJvVWpSMmNrVlVSSGR3V0hjS1ZUa3pWMHRwUlVaUFpYQlhjRFJMZVhWS2NXVndLMjgxWlNzd1RFMXlLMDBLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1666403558,
          "logIndex": 5610941,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/php/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/php",
      "githubWorkflowSha": "625ae57694357c36637f45eeac8d517cc437fead",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3301517855",
      "sha": "625ae57694357c36637f45eeac8d517cc437fead"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

