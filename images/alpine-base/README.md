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
| `latest` | `sha256:a18fa9705203b2623082947200ef313f4cd2269007d22c64b2abd6a1846b6451`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a18fa9705203b2623082947200ef313f4cd2269007d22c64b2abd6a1846b6451) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:a18fa9705203b2623082947200ef313f4cd2269007d22c64b2abd6a1846b6451"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "da5480d953920df5832baf4732d5b65d23500f96",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/alpine-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCGBkHlDv8hr4PGikkqDK4c1UU4qP/wss+AU+/ruMdIIQIhAMIcM5bZ5CpkQDdSVrfPcnxSS8yFZSaQPGIipVQAsOOS",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJhMjBmOTVlOWNiODY3NDA0MzgwYmYwMjU2ZDE4YTVmMjEyODE2MjA5YTg4ZTA5YzRiOGRjY2RlMjc4YjFlOGFjIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUN0M0p1TmlPcGI5MzNZRmFlTjBTUWNwTW1lYWo2Q29laWxYSVg1SUQySGJnSWhBTm55RnlkQWdXMERsd1l0TUtaSjRTd1FPalhKWG1vWHl1eFd1MUVJYXNFWiIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBWRU5EUVhwNVowRjNTVUpCWjBsVlZ6WmtkRUpIUkd0T1dYZGxSelphVFRjMWFUYzBSbHBQYUVSVmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlRKTlJFVjNUVlJOZUZkb1kwNU5ha2w0VFZSRk1rMUVSWGhOVkUxNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVV2TDNoQk1VVTBiSFZqVUc1NldVbzBXRU5FTVVaT1IwaFJWbW93TVZGdWJVMVdNMFVLUnpGQlpXNXROVVF3Ynk4clFWZzNWMjRyY1hGc1lVVTJSVGRuZEV0dldVeE9lRUVyYzBwWVRtcE5ja3hZUW5OSlZtRlBRMEZzYzNkblowcFlUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlYwSzB4RENucHFkWFZvVm5NdlMyUlViV05UZUhOb2NrRXhiVTB3ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Um5OalIyeDFXbE14YVZsWVRteE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyaHJXVlJWTUU5RVFtdFBWRlY2VDFSSmQxcEhXVEZQUkUxNVdXMUdiVTVFWTNwTmJWRXhDbGxxV1RGYVJFbDZUbFJCZDFwcWF6Sk5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKR2MyTkhiSFZhVXpGcFdWaE9iRTFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWwzV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUk1UWtoelFXVlJRak5CVGpBNUNrMUhja2Q0ZUVWNVdYaHJaVWhLYkc1T2QwdHBVMncyTkROcWVYUXZOR1ZMWTI5QmRrdGxOazlCUVVGQ2FFZ3pNR3hUVlVGQlFWRkVRVVZuZDFKblNXZ0tRVXREU21sREwxcGpSMFU0TkU1Tk9FMVZSbmMxYW1WbVIyVlVkeXRZZFc5UWNHUmhZMkYxY1ZjMVpGcEJhVVZCYjA4eVVteHZTelkzVkZKa1pEbDVjUXBTVWt0a1JWcHhhMnRtVFVaNVR6WjNhWGhUZEc5QmFscE9WRmwzUTJkWlNVdHZXa2w2YWpCRlFYZE5SRnAzUVhkYVFVbDNTM2haVVU5RlRETk9MelJqQ2pOdE4yRlpXRVpVVFRJeE5ISjRTVEIwVVhjNGJreHVXblJqV21jNFppdDJXVlp0Y2tNMlFsUklZVkpQTjFsTmIyOTZaRmRCYWtKclUxazJjaThyZVRBS2FsaHBhMlZzY0dVeGVsbE1la1ZaZDJSQmVqVlplamhPZDNVeGRtSjFOMUpYYjJGYU1sRlNRMXAzY1ZoNFJqaGxTalpKZG5BMWF6MEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1668560514,
          "logIndex": 7168442,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/alpine-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/alpine-base",
      "githubWorkflowSha": "da5480d953920df5832baf4732d5b65d23500f96",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3475465226",
      "sha": "da5480d953920df5832baf4732d5b65d23500f96"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

