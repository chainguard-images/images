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
| `8` `8-bullseye` `8-cli` `8-cli-bullseye` `8.1` `8.1-bullseye` `8.1-cli` `8.1-cli-bullseye` `8.1.10` `8.1.10-bullseye` `8.1.10-cli` `8.1.10-cli-bullseye` `8.1.10-r0` `bullseye` `cli` `cli-bullseye` `latest` | `sha256:6e568a055c20c83d1f3a5f7db7ad2fccc93ce62fcf037f48eff70a160a5b4308`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:6e568a055c20c83d1f3a5f7db7ad2fccc93ce62fcf037f48eff70a160a5b4308) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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

All distroless images are signed using [Sigstore](https://sigstore.dev)!

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
        "docker-manifest-digest": "sha256:6e568a055c20c83d1f3a5f7db7ad2fccc93ce62fcf037f48eff70a160a5b4308"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "0508a56fa6788a04f507707cecd63f0f98f68a24",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/php",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCd2Ttcr/zi/DCNLEV/dQyoptN/8mIdP0UdAsV8ur7wrwIgPeJ+TA6vvC2rYCC2UcjiNTOW61zXgu3xu+Jkdfu98Go=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI3ZDAxZDEwYTBjY2NkYjYwMTRmMjg4OTljNzI1YjI5MmRhYjI1OWE2MjVlMWJkOTM4NGUyNWRhMjM1ZjMxNjc3In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNtQkQvR3VNM0JKSnZxOTR1MGxvaTl4TlRMYVpjMHhjaUw4eWF5OExBUHdnSWhBSk42VHQ1cTYzVVZjbkgwYmdpNlozVUl0aHk2dklrZ1FmM01LRFpydHozUiIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnJla05EUVhodFowRjNTVUpCWjBsVlNEaHViQ3R5V0RCUE9UaHVSRmNyUml0SVVtNWliMHhLUTBoSmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRWTmFrbDNUMVJCTkZkb1kwNU5ha2wzVDFSRk5VMXFTWGhQVkVFMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVY2TlVRNVNtczJVSEp5Wmpkc1VtaDRLekJYUjFSQ2RtNUZjalZaV2t3d2IySnVXRkVLU2tac09UWXhSVk5XVjNCelRTOTFPWHBFY2tSSVNVTXZVVWxXUjJRNE0wcENWVmhoTVdnNWJVWndabkZyZUZkb1ZHRlBRMEZxWjNkblowa3dUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZGWkdkdUNuUnpURVp5Um5SM2JtZ3lPVW80YVcxVk1qYzVUblJqZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFobldVUldVakJTUVZGSUwwSkdVWGRWYjFwUllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BqUjJoM1RIazFibUZZVW05a1YwbDJaREk1ZVdFeVduTmlNMlI2VEROS2JHSkhWbWhqTWxWMVpWZEdkR0pGUW5sYVYxcDZUREpvYkZsWFVucE1NakZvQ21GWE5IZFBVVmxMUzNkWlFrSkJSMFIyZWtGQ1FWRlJjbUZJVWpCalNFMDJUSGs1TUdJeWRHeGlhVFZvV1ROU2NHSXlOWHBNYldSd1pFZG9NVmx1Vm5vS1dsaEthbUl5TlRCYVZ6VXdURzFPZG1KVVFWTkNaMjl5UW1kRlJVRlpUeTlOUVVWRFFrRlNkMlJZVG05TlJGbEhRMmx6UjBGUlVVSm5OemgzUVZGTlJRcExSRUV4VFVSb2FFNVVXbTFaVkZrelQwUm9hRTFFVW0xT1ZFRXpUbnBCTTFreVZtcGFSRmw2V21wQ2JVOVVhRzFPYW1ob1RXcFJkMGhCV1V0TGQxbENDa0pCUjBSMmVrRkNRa0ZSVDFFelNteFpXRkpzU1VaS2JHSkhWbWhqTWxWM1NFRlpTMHQzV1VKQ1FVZEVkbnBCUWtKUlVVOWFSMng2WkVoS2RtSkhWbm9LWTNrNWQyRklRWGRJVVZsTFMzZFpRa0pCUjBSMmVrRkNRbWRSVUdOdFZtMWplVGx2V2xkR2EyTjVPWFJaVjJ4MVRVbEhTMEpuYjNKQ1owVkZRV1JhTlFwQloxRkRRa2gzUldWblFqUkJTRmxCUTBkRFV6aERhRk12TW1oR01HUkdja28wVTJOU1YyTlpja0paT1hkNmFsTmlaV0U0U1dkWk1tSXpTVUZCUVVkRUNsWTRlRWRsVVVGQlFrRk5RVko2UWtaQmFVRk5Va3R1VEV4dWNHeG1VRGt3YUZvd01pOTBabWtyVFcxQ1RFZ3ZVRmx5YlZKQ1dVNUZSa2RpUjAxblNXZ0tRVXBrU2pRdk5GbE1TbTlzYlRVeGQweHJPVXBVYjJWSlpIZFRUbFkzVG5GNWFYSnRiVlZaYXpab1VFaE5RVzlIUTBOeFIxTk5ORGxDUVUxRVFUSm5RUXBOUjFWRFRWRkVaMkZ4U1ZoRFVrVm9TMEpFVUVod2RWTTJjVzlQVEVWdVJreHZObUZOWms5d1JVd3lRbTE1WjNWNGFtWXlkbFpzVkVkUlZXMDJOVnBWQ2xGelZITmFabWREVFVaaE4zWk9SVlp6T0d4TVJtZFFkRXhzYVdNM1JtRXpXbVJxUW1sVlJtMDRjbVZRTW1wbldEazRkVE5XZFUxTlkzaElWMGsxYW1ZS2NFbzNWbWd6YUhOemR6MDlDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1663625368,
          "logIndex": 3564159,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/php/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3085953647",
      "sha": "0508a56fa6788a04f507707cecd63f0f98f68a24"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

