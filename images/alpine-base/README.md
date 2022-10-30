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
| `latest` | `sha256:4b4245eb778838257ad44d15f844d2633edbed677404033a75f78f1440446d85`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:4b4245eb778838257ad44d15f844d2633edbed677404033a75f78f1440446d85) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:4b4245eb778838257ad44d15f844d2633edbed677404033a75f78f1440446d85"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "05824ed032ab966a34e91c65f91045afff43bb88",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/alpine-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDnHusLU+elT7Fg1Kbq1/Da5+oNIlNGcbE+gvWj5E1BsgIgXtnpHKiqrtd/929gW4E1k1cTUWioWX8RTs5I9/pqNnM=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJkMGYzNWVjN2Q4ZGViMGYyZDRiZmQ2MGQwNmZjZjFkM2RkNDUwYjdmZDc1MmM0ZGZjMTYzZTAzYmM4MGU5MzY4In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJR0xvZlF5ZG84K0dsazZSUjg0VnpVd2xqZ2RLYW8xL0V2KzFINit0NElrYUFpRUFtc1orNmtCenQxbmQ2d09wOE9KT3p4dllRVWhRVUZqUCtmK2tHODdIMUNzPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBla05EUVhwNVowRjNTVUpCWjBsVlZ6SkVPWEl6UkdkdE5VMW9lR3g1YVM5UlVFSlVXRkZvVkhWUmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFVFhkTlJFVjRUbFJGZDFkb1kwNU5ha2w0VFVSTmQwMUVSWGxPVkVWM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVUwVGs5b2EyWkRiMnRhVm5GMk0yOUZOalJzTTBaclNHbFphM2h3T0dSMVozcHhlU3NLVmtKcE9VaE5hMFpvVWtOb2MxQjBUalF6UkRWNVRXRnpablJxV0ZOc1ptdEJjMDR3T0dwNlUxaDFTek5PY2s1NlRuRlBRMEZzYzNkblowcFlUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZFVm01R0NuWjRXbGsyT0c1clpERXhhV1JNYlRKRVZtRk1VR0ZCZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Um5OalIyeDFXbE14YVZsWVRteE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyZDNUbFJuZVU1SFZtdE5SRTE1V1ZkSk5VNXFXbWhOZWxKc1QxUkdhazVxVm0xUFZFVjNDazVFVm1oYWJWcHRUa1JPYVZscVp6Uk5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKR2MyTkhiSFZhVXpGcFdWaE9iRTFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWwzV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUk1UWtoelFXVlJRak5CUVdobkNtdDJRVzlWZGpsdlVtUklVbUY1WlVWdVJWWnVSMHQzVjFCalRUUXdiVE50ZGtOSlIwNXRPWGxCUVVGQ2FFTmFNQ3RKZDBGQlFWRkVRVVZuZDFKblNXZ0tRVTF4TUd4eFFXWkVlbXhWTkVObWVsZGlPVGhxYkdkTVVUSXpLekJGVlhsaksycFNha0UzYmtndlIyTkJhVVZCTkhaUVJrbFFURmhVVW00d2NXZ3dad3BOV0ZOMFlsRlZUVFZTWm5SUlEwTjJVV2RRVVhaM2NrUkJkbGwzUTJkWlNVdHZXa2w2YWpCRlFYZE5SR0ZSUVhkYVowbDRRVTVPYlhObGNIVmpXVlk0Q25CdVJHeHFVVlJ5YkZGV1FrOVhRa1U0ZUVkS1VWcGpZU3RSUzNnMGIyRkNkVFZ0Y0dGbllVVkVVRzB2ZEc4MlZHeG9ja2hzWjBsNFFVMXBhR05vZGpJS1VHeFVRalF6WmtOMVNucHZWRWwyWkhBeVEyaExNR3hWYVRJdlZVaEtNVFZYTWtSck5qQjBja3RMU1VKVk5GRXhkelZQUkcxMlRWbHpRVDA5Q2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1667092533,
          "logIndex": 6132590,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/alpine-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/alpine-base",
      "githubWorkflowSha": "05824ed032ab966a34e91c65f91045afff43bb88",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3353617990",
      "sha": "05824ed032ab966a34e91c65f91045afff43bb88"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

