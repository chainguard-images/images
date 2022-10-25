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
| `latest` | `sha256:96060c81d3125256d26f05e7793aa8a6b90b699b9c7e2af8a75ff2133d1525a6`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:96060c81d3125256d26f05e7793aa8a6b90b699b9c7e2af8a75ff2133d1525a6) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:96060c81d3125256d26f05e7793aa8a6b90b699b9c7e2af8a75ff2133d1525a6"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "ebc70992d0e94f285b94b0de576c37e8036814ea",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/alpine-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIFUURb8HXJGjiYo4ti8CYGa7lwwqnP++fStgb6YzOMMBAiBtqTAxkuBHz8SLcxREqz3pBj1TBQxN+GXY6Tz7V7o6Hg==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJiZjRmMzExODcxMmUzMThhNGJmM2ViZTgxOWMxNmM0YTg1NGM0NWFiODI2ZWQwODE0N2YyNjI3M2UyNGMzZDNmIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJSDJhUUt5RU9scVludkdkUkorcFJOb2pUbkRZQWJCVndjS0trWkwvejByMEFpQXNkdHpmcHhqZVczVDRIRFdRTm5NZnV3QmVIVTFVZTltbHlKOUV0SjU1MlE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBWRU5EUVhweFowRjNTVUpCWjBsVlJGcDNiMlIzVWs1V1ozQk5UV3RTWjNCMWFtcGpkVEpZUVZwWmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1RGTlJFVjVUV3BSTTFkb1kwNU5ha2w0VFVSSk1VMUVSWHBOYWxFelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVYyTVM5RFIwSnRiU3RzUjFFM1NETjBiVUZxVWs1V1FXUlJVbm80YVc0d01rWjVkakVLTUZsWkswcE5hbHByWkRNcldqSk1SMm94VVRKS2JGUjZSWEEyWlRSbWVXd3ZTMkY1VGsxeFVHbFpOVzgwTlVsb1JFdFBRMEZzYTNkblowcFdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlYwVEVaRkNubFllbkJxZUhoTVpuRjNTM1ZFVWpkSFRtUllkV0ozZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Um5OalIyeDFXbE14YVZsWVRteE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyaHNXVzFOTTAxRWF6Vk5iVkYzV2xSck1GcHFTVFJPVjBrMVRrZEpkMXBIVlRGT2VscHFDazE2Wkd4UFJFRjZUbXBuZUU1SFZtaE5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKR2MyTkhiSFZhVXpGcFdWaE9iRTFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxSV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUkzUWtoclFXUjNRakZCUVdobkNtdDJRVzlWZGpsdlVtUklVbUY1WlVWdVJWWnVSMHQzVjFCalRUUXdiVE50ZGtOSlIwNXRPWGxCUVVGQ2FFRjVPRXBHT0VGQlFWRkVRVVZaZDFKQlNXY0tSSEpxUm1WUWQzSTNObmR6VGxoT2JURjFTMVpGZHk5UVRVdDJWemhUWmpKQloySk9aa0kzYUZaTFNVTkpRM2hZWms5cmJXSk5SVXhPTjJwRVRHWXJMd3A0VWk5bGRWY3ZjbkZ3UjJoc1JqUm1NbTl5VVVScFJIWk5RVzlIUTBOeFIxTk5ORGxDUVUxRVFUSnJRVTFIV1VOTlVVUjZSRlpWWlVGdFFUbG9NbmxzQ2paWWNIUmhSVTlYUm5sbGJIWTJXbE5QZUVkME5XdHVWMjFpUVRscWRIUjZjbGMzWmtWUEx6azRUbHAzUVhaVlNHUlFPRU5OVVVOcVQzRm9Wa3AxZFRBS1ltMWhNbW95U0hCeWR6ZzNlVmx1UlRCM2VHRlNObVZ3VmxjcmJHbzVkR1ExTm5CNWNuRnZTVVZsTkU1cE1VWjBhV2N3WnpVNU5EMEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1666660987,
          "logIndex": 5803132,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/alpine-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/alpine-base",
      "githubWorkflowSha": "ebc70992d0e94f285b94b0de576c37e8036814ea",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3317461071",
      "sha": "ebc70992d0e94f285b94b0de576c37e8036814ea"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

