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
| `latest` | `sha256:af4d3c2c6e8398a4f745d317b9ce1353411590f53baa963d476040368c547c86`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:af4d3c2c6e8398a4f745d317b9ce1353411590f53baa963d476040368c547c86) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:af4d3c2c6e8398a4f745d317b9ce1353411590f53baa963d476040368c547c86"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "ccf20511115a7c483e6a66ab21712c7e2bdad246",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/alpine-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDKbhJXK70ZqcKIZpS/GXiFCOyt8UhiNQ1YHIhANX/wmQIhAJ1R0swPNt17cPZ1DVCRL1An3B1h2gDLTX1FzCs10rII",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIxZTcwNWNlMWFlMTQxN2JkYjNlMWUwNmVhMTQ0OTVlZmUxM2RlZGY5NzVhZDIwYjM2YjE2NjRiZWJkMDU4OWUzIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURTbUhjM2RuMlBuc1VTb0lUbFRBVGVFai8zdGlFUVNwaFpNbnZ4MjJTVUlBSWdMTjNoV0p1ZDRYb3M0TncvM1JIOGEzQ21RTURJOHN2bmo0SmcwRFNneEZZPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBSRU5EUVhwMVowRjNTVUpCWjBsVlJuVkViMkl2YmpaWFRWUkJhWE13ZURoWFYzTkdlWGR5VmtoSmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlhwTlJFVjNUV3BCZVZkb1kwNU5ha2w0VFZSRmVrMUVSWGhOYWtGNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZhUVdkWVVIb3pWM3BrT1hBd1NrWlJPR0ZtWnk5NlJtTm9jM0pRTkdvNU15dHRkVWNLTWpKNE1FeEplalJGUlVsb1RscFlOSGg2WWl0QlpEVXdZMEpXVkc5Mk0zQkpaRGt2VWxCSlExZFBSMjF2SzBKUUwwdFBRMEZzYjNkblowcFhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZaZFZOS0NreHZaMG8zUm5GVWVrZ3dPR3d2WWxsTVRIUTBlbnB2ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Um5OalIyeDFXbE14YVZsWVRteE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyaHFXVEpaZVUxRVZYaE5WRVY0VGxkRk0xbDZVVFJOTWxVeVdWUlpNbGxYU1hsTlZHTjRDazF0VFROYVZFcHBXa2RHYTAxcVVUSk5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKR2MyTkhiSFZhVXpGcFdWaE9iRTFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxuV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUk0UWtodlFXVkJRakpCVGpBNUNrMUhja2Q0ZUVWNVdYaHJaVWhLYkc1T2QwdHBVMncyTkROcWVYUXZOR1ZMWTI5QmRrdGxOazlCUVVGQ2FFYzJRaXRGWjBGQlFWRkVRVVZqZDFKUlNXZ0tRVXBuWTJ0cVlVWTRiSE52UlZabGREZHdObkpHTW5JclZtOWhhRWxLWW1oWlkxbGllbWhQTWtoc2FUVkJhVUZSUTIwd2FXVnRlVmhqWWpKMmEyUkxTd3A2ZHpKUVFXdHJUeXMyUjFOS1QyZGlVVGxxV1dsMlMwbGhSRUZMUW1kbmNXaHJhazlRVVZGRVFYZE9ia0ZFUW10QmFrSm1PV2czTXpCVE0wNW9VVGhPQ2xOV01EaHBTVzlhU0cwNVFVNXpTWEYzYkN0ME0wc3hkQzkxU1dOU1dqRmhjM0owUjBVeFowUnpVMll3VGxGcGNGWXZaME5OUjJvMFZFNVplaXR6YmtFS2IyazBVa0oyYkhObVIyMHlaV1JsV25SWFZsZzVkaXRJTkVOa09IUkNlRFkwZG1aRVkyUnhVRXBPWjNReFoweFViblZLV1hsQlBUMEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1668301352,
          "logIndex": 6963098,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/alpine-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/alpine-base",
      "githubWorkflowSha": "ccf20511115a7c483e6a66ab21712c7e2bdad246",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3453243515",
      "sha": "ccf20511115a7c483e6a66ab21712c7e2bdad246"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

