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
| `latest` | `sha256:ad64cd3375dfb8bd5c1a67ce26e2241a71b88d0fe3d057b41e8988c99f74d637`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ad64cd3375dfb8bd5c1a67ce26e2241a71b88d0fe3d057b41e8988c99f74d637) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:ad64cd3375dfb8bd5c1a67ce26e2241a71b88d0fe3d057b41e8988c99f74d637"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "58947c0993900de3a370fa7753f0874f52c9f8f2",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/alpine-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDMBP37gtpF2V0fqjvhjGEOrb4OPzUynkj6QhUSs0ayPAIhAPWYwij+BAsY3ho3syWwK4s+IGu+1riSsHB4WShndAMq",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJjMDM5NTZmMDA2YzliNWU0YTQwMjIwY2UyMDBhNzlkZjUxYzFhMGMzMzExZGQ1YWQzODUwOTIyYzdmMjAyMTg2In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJRFYzdUxrUUdNSFF6ejVndjRVdlV0NHZhNWNqdGtrRkRyRkFHdUU1L0xwMkFpQVI4M05KSTJsNW1rYkhUUDZXRUVWQ2ZZQkR1MW0wNEdXbXRxZDNCSUltdnc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBWRU5EUVhwMVowRjNTVUpCWjBsVlRFRnFVVEJHVG5wTWFVeGtNVUlyUTJkbk9WZFBhM2RZV2s5UmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhkTlJFVjRUbnBKTlZkb1kwNU5ha2w0VFVSRmQwMUVSWGxPZWtrMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZVSzAxb1FuVnZZWE5yWVZWcU5EaHNVR0Y0TlVKNGJtcElWM0pqVEV0SFVteE9Xa2dLT0VOaVp6SkhVa3BDVmxSMVJGZDZkR2h0TW01WFFtbHhkbUYzUWxwdmRGWjRibTk0ZG1WUU0yeDVObkZPYlVoTWR6WlBRMEZzYjNkblowcFhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZpZEVzM0NrZ3JNSEp4YW5KalJqWXZhbGRDWmtoalYyMTROV04zZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Um5OalIyeDFXbE14YVZsWVRteE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyY3hUMFJyTUU0eVRYZFBWR3Q2VDFSQmQxcEhWWHBaVkUwelRVZGFhRTU2WXpGTk1sbDNDazlFWXpCYWFsVjVXWHBzYlU5SFdYbE5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKR2MyTkhiSFZhVXpGcFdWaE9iRTFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxuV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUk0UWtodlFXVkJRakpCUVdobkNtdDJRVzlWZGpsdlVtUklVbUY1WlVWdVJWWnVSMHQzVjFCalRUUXdiVE50ZGtOSlIwNXRPWGxCUVVGQ1p6YzVNelZIUVVGQlFWRkVRVVZqZDFKUlNXY0tWbUZSYUV4T1ZqSm9ibE52VERFck4wVlJiSE5HY1RsTVdVaHZkeTkyV25Ka05WZExRVUpXZG0xeWQwTkpVVU5xZG5kNlJGSjRXRTlwTUhZMk1UbHFlUXBqYm1wS01FTlVjVUo0V1V4UFFuUlZLekY1ZUhCQ1drUkVWRUZMUW1kbmNXaHJhazlRVVZGRVFYZE9iMEZFUW14QmFrSndVSEJ3YW1Ob1FTczJTMWMxQ201TE9YaFVZWGczYkdsNlRFdzBWazU2WWxGNU5qWTBiWEZZWW0xU2JERnNObFJOYjBkb1kwTmhlWEJxUldOMGVGQTFXVU5OVVVSNUsxVlhOalJ2TVRrS2IwOUZSMFV6TlRKSlNISTJZbkJNWm1aS1RFSlBRVzVCUVROM1FVVkxOelJ0Vm1ad0x5ODVhWEY0U0hKak1IQlpkR0ZsZFd0bk5EMEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1665364674,
          "logIndex": 4785268,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/alpine-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/alpine-base",
      "githubWorkflowSha": "58947c0993900de3a370fa7753f0874f52c9f8f2",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3216270002",
      "sha": "58947c0993900de3a370fa7753f0874f52c9f8f2"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

