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
| `latest` | `sha256:3f93b440f991068dbf9b843d3ff46f3afa6910d73ad203986750fbea65306eb3`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:3f93b440f991068dbf9b843d3ff46f3afa6910d73ad203986750fbea65306eb3) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:3f93b440f991068dbf9b843d3ff46f3afa6910d73ad203986750fbea65306eb3"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "d4601fab8715425e64ddad5802fe2ada22871483",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/alpine-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCsdlBIe2p+J170opSWU0TQCNM+eZWAV86fI+CB4oudWwIhAJyPsL1YXVmn2Uh1ZrWQzqAwJyWJLDQ1fuBGDL3ymf7Z",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIxMjRkZmJhNzE3NjM4ZGRhZmIxYmI5YzIzM2Y3OTkxZTc4MTU2NTExMTU3NWQwNGJiODY4NjkzNWEzNjU1ZWZiIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUROTkZPOFlHdWF0MUlYRW00L2VZZXJFeFBQYjlKNHR3R3pXUFhHcXU3RkF3SWdTZnFYazFJNjhtcFFVVVhtb1VObHpNMVlTaEhEbFdidzlzT1dxbDkzc1ZnPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBWRU5EUVhweFowRjNTVUpCWjBsVlJFMTZSREJoYUVNeVZUTldVRzQ0VlZjM1VFSndTVWRDUzFwRmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhsTlJFVjVUa1JWTUZkb1kwNU5ha2w0VFVSRmVVMUVSWHBPUkZVd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVYxYm1JM1F6TlhSa2xYY0hsSUwxVlNjbTFOVGs4emRHbExTMHhNVlhaT2JYcEdZbXNLU2xKSlpVaExVbGh4T0U4M1JUUTFWSHBGT0Zoc05VUkNNR0ZuWkdwMGN6ZDBMMkZ5SzBkSWRucHNRVFpFTWxSbWFYRlBRMEZzYTNkblowcFdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV2Y0RSakNtSXpLemx0UWs1aU9WZzViSGRwZVdOVE1XRlVVRVIzZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Um5OalIyeDFXbE14YVZsWVRteE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyaHJUa1JaZDAxWFdtaFphbWN6VFZSVk1FMXFWbXhPYWxKcldrZEdhMDVVWjNkTmJWcHNDazF0Um10WlZFbDVUMFJqZUU1RVozcE5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKR2MyTkhiSFZhVXpGcFdWaE9iRTFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxSV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUkzUWtoclFXUjNRakZCUVdobkNtdDJRVzlWZGpsdlVtUklVbUY1WlVWdVJWWnVSMHQzVjFCalRUUXdiVE50ZGtOSlIwNXRPWGxCUVVGQ1p6aHVURnB4U1VGQlFWRkVRVVZaZDFKQlNXY0tUall5UVd4emRUZzBSamRRTTFaTmMxVkVRa05JYVhCMFZXZDJVbHBEVkdocE1IcEhOV1FyU0RsMGIwTkpSbTg0Ums0eVNHcFZVMFYwUzBsT1N6bGxOd3BHYkZGUUswMXJPSFpSVkVKaWNYQTJkMkl5VTJNeWNYVk5RVzlIUTBOeFIxTk5ORGxDUVUxRVFUSnJRVTFIV1VOTlVVTnVPRU5vWkRWaVdVVjJNalZQQ25ncmJqRjZSMDlNTm05aFlXUXpTSEpEVlRWYVVsQTBiVVIwVUZsaUsyTkxUWEEzYzBaRWJITXJXRk5RVEdkTVVIQmxXVU5OVVVSbFZVOHJVMDlTY21nS2JtOVJPRzQ0VERWMmVEUjVjRGh6WmxFeVNrVXZNRW8zU1RsSlJqWTRNVEJpZDNacmNtOTNMMmd5ZEhGaE1rOXJOREo0ZGtJdlZUMEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1665537913,
          "logIndex": 4931073,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/alpine-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/alpine-base",
      "githubWorkflowSha": "d4601fab8715425e64ddad5802fe2ada22871483",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3231366973",
      "sha": "d4601fab8715425e64ddad5802fe2ada22871483"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

