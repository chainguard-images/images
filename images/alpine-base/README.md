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
| `latest` | `sha256:ce55462b908c453d165938c872506548a6c0e354f169b177146e956b3e4ec298`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ce55462b908c453d165938c872506548a6c0e354f169b177146e956b3e4ec298) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:ce55462b908c453d165938c872506548a6c0e354f169b177146e956b3e4ec298"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "5f4f7597274c5c103bd55df51769dacd9ce7631e",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/alpine-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIG4LX+aSFw8QI5sYtA+JpO5BtrleOcrvY3tT0h0Tqfh5AiAwATwf9vzlYeR4Ivle1/KGvOmnezqHfXhAVMNvMdKqFQ==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIzMjZhMzk2NjdkODk1NjJiYzJiYTZmOWUxOTcyODhiYTJkOGVlYjlkNzkyYTVhM2NlZDlmNzZhMzMxYWMwMTM1In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUQ1bzFEbUxEOElXK2dQOExwRzNiSDk5N2xlU0pkTzJHWjdSazJPTFgvb3pRSWhBUHRFL3JWYU5Rc3JSOWVQT0RUaTg4WklBMHMvYXRZNitTV1RyZXlJTm1VMSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBWRU5EUVhwMVowRjNTVUpCWjBsVlREUkhkMnd2WjNCdFZIcFJhMmd2WW04MWExTnFUSEJqVWpNMGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1hoTlJFVjRUVlJCTlZkb1kwNU5ha2w0VFVSSmVFMUVSWGxOVkVFMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZzZFZCUVVubzJRV1JwVFhJcmREY3dLMGRTVXpFd1ZtbFhZbFJSSzNKUGNWcG1TU3NLVUZWTE9GUmxWR05IVXpCTGFHTmtkRmgzU1ZSc0wybDRjRXBOYW04clZsWkdXRFZKYW5wU1RqQlVXVmRZYUdSNFRtRlBRMEZzYjNkblowcFhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZHY1ZwRENuQmpPWHAyZVdzM1pFRnhla1IwZVVwSVdXdEtObmc0ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Um5OalIyeDFXbE14YVZsWVRteE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyY3hXbXBTYlU1NlZUVk9la2t6VGtkTk1WbDZSWGROTWtwclRsUldhMXBxVlhoT2VsazFDbHBIUm1wYVJHeHFXbFJqTWsxNlJteE5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKR2MyTkhiSFZhVXpGcFdWaE9iRTFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxuV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUk0UWtodlFXVkJRakpCUVdobkNtdDJRVzlWZGpsdlVtUklVbUY1WlVWdVJWWnVSMHQzVjFCalRUUXdiVE50ZGtOSlIwNXRPWGxCUVVGQ1p5OW5XVVI1YjBGQlFWRkVRVVZqZDFKUlNXY0tWMUI1YlV0QldYWmxhMUExYlU5WWVXSmxPRGcxV1RWNGFGVnJVazh5Y2xZeE5XTmxha1Y0YkN0ak1FTkpVVVF2UkU0eloxUkllRVpvYWxkdFEzVTBSUXB5YldRd1ZYUjZha2RZY2pWWlJXY3hVU3RFZVdGM2Iwa3Zla0ZMUW1kbmNXaHJhazlRVVZGRVFYZE9iMEZFUW14QmFrVkJNMjlzYlRSRWIxWmljSEY2Q25Rd0swVlBkMnBHZVRNMmRIVXpRMlpaUkZSWlNXWnRWVlJFZFc1TmJIZGlSblUwTldKU1luSlJhak5sYmxGbE9VVjBXbXhCYWtGemEwVlVRMHBEWlRNS00yRnNaa05NU1RSc1lVeDNOV2h5UTNGcFVrVk9ablJYZFVsR1pHY3pNM2hVYmtKa2FpOWxkRWhXVFZKTE1VaEhWekZ5UlhGNk9EMEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1666314690,
          "logIndex": 5530025,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/alpine-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/alpine-base",
      "githubWorkflowSha": "5f4f7597274c5c103bd55df51769dacd9ce7631e",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3294052926",
      "sha": "5f4f7597274c5c103bd55df51769dacd9ce7631e"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

