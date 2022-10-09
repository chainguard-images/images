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
| `latest` | `sha256:445505da25d64ae17159ce18368061f9a4a319cad5a0d059fba9c5a29a37291d`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:445505da25d64ae17159ce18368061f9a4a319cad5a0d059fba9c5a29a37291d) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:445505da25d64ae17159ce18368061f9a4a319cad5a0d059fba9c5a29a37291d"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "22f40c93343ef243b4d7123b4000f0a4cd264f05",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/alpine-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDjUJwzHyqwPekveYuxEBT9ogSdoXGq8B8YT9g9V9w60AIgbTKt7O/ry5zi+hQbHJ+mGfXEpv07Z2QgA4xgMwsN4zM=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI0ZTM2ZDFlYTNlYmQ5MGFiODUwMGFjZDgzOWRjNzU4MDkwOTdmODY0M2QwZThkMDA4MTA2YzMxMDc2M2FiNTAxIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNqRU1ZV0xtUDFHZVhWMGMzd2hyVFlLNEFkZ2U5S2Rib1E5UXJ3a1ZZcjJBSWdHUFhNRzBOQjBTWU5pOU9Tbld5S3Mza3U0N2FtTFBlTFdzOVFxeEtpdHpVPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBSRU5EUVhweFowRjNTVUpCWjBsVlIwc3pSMHBwVTNCa00zRmxVMUJJY2xaQk1qWTJWV3BaTkRNd2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUVRWTlJFVjRUV3BOTkZkb1kwNU5ha2w0VFVSQk5VMUVSWGxOYWswMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZDYkZsUk1tSjVhRkp6TVhoSk5pdEpZbEZ4ZEVOck1XRk5WeTlLWm1RMFVVVnNMMjhLVFhCeVNHcElTamxIZGt0WmIzWktPRkJ3Y0hCb1VVNDNiVXQ1UlRabk0xbHpOM2x1VFhCMk9GUk5jMjQ0UmpoME1HRlBRMEZzYTNkblowcFdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZyTXl0Q0NqZDZUVEJYVEc4M1NFRnNOMlJGVGs1T2VreE9NVkJaZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Um5OalIyeDFXbE14YVZsWVRteE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyZDVUVzFaTUUxSFRUVk5lazB3VFRKV2JVMXFVWHBaYWxKclRucEZlVTB5U1RCTlJFRjNDbHBxUW1oT1IwNXJUV3BaTUZwcVFURk5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKR2MyTkhiSFZhVXpGcFdWaE9iRTFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxSV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUkzUWtoclFXUjNRakZCUVdobkNtdDJRVzlWZGpsdlVtUklVbUY1WlVWdVJWWnVSMHQzVjFCalRUUXdiVE50ZGtOSlIwNXRPWGxCUVVGQ1p6ZHdUa2RxWTBGQlFWRkVRVVZaZDFKQlNXY0tTbmM1Ym5jdmQyMXFkRWsySzI5dWNqbHFhR3BJUTJ4ME5sQlpRV2sxY0M4MUszSk1lRzFvVlZSelFVTkpRMHBNVUVSQ1UxQTRjRW92YkROTFEzWXZhUW9yVkVaR2NHMUlRbWRvYjJSMFRVRnJSMHR4YjAwelpVTk5RVzlIUTBOeFIxTk5ORGxDUVUxRVFUSm5RVTFIVlVOTlIwcDJjRlIzVGt0bFJrSlBhekYxQ2xSbGFVNTBVVmRRWnk5UVRVSTBSME53U2l0SVVFMTBiVGRZYWtST1FVVmthREY2ZFRrMlUxa3pkbVJwU1VvMVYzcG5TWGhCU25SM1UxTXlSVXQzVjJFS05HTndWRGN5ZWxWa1NEUTVaVTFQT0VaWWNHZGpSRVZxWWxwcGVYUTFUaXRqTVdwYU5GWkJOM0pYU2pkelVrWjVTMHB2V0c5blBUMEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1665277976,
          "logIndex": 4724980,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/alpine-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/alpine-base",
      "githubWorkflowSha": "22f40c93343ef243b4d7123b4000f0a4cd264f05",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3212418713",
      "sha": "22f40c93343ef243b4d7123b4000f0a4cd264f05"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

