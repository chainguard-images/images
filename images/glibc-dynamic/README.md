# glibc-dynamic

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/glibc-dynamic/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/glibc-dynamic/actions/workflows/release.yaml)

Base image with just enough to run arbitrary glibc binaries.<br/><br/>This image is meant to be used as just a base image only. It does not contain any programs that can be run, other than `/sbin/ldconfig`.<br/><br/>You must bring your own artifacts to use this image, e.g. with a Docker multi-stage build. If you want locale support other than `C.UTF-8`, you must bring your own locale data as well. This may change in the future based on user feedback.<br/><br/>See also [musl-dynamic](https://github.com/chainguard-images/musl-dynamic) which is an equivalent image for running dynamically-linked musl binaries.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/glibc-dynamic:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:3a26acfa942556b6ad963597156ec28b08f7c3aedc90160e4834dd78613b8ce5`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:3a26acfa942556b6ad963597156ec28b08f7c3aedc90160e4834dd78613b8ce5) | `amd64` |



## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/glibc-dynamic:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/glibc-dynamic:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/glibc-dynamic"
      },
      "image": {
        "docker-manifest-digest": "sha256:3a26acfa942556b6ad963597156ec28b08f7c3aedc90160e4834dd78613b8ce5"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "cfccf66ed0affdaf19d8f7ea263785c2755e0d91",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/glibc-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCtxhDmiasAu8vxwJzqD6jbWplZaiQP9V31dvys4uS9UwIhAM7YHaLL2rBUtkvGw2K63WC6sugq1hzi97T/UzW57QZs",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIzZTBlNGRjMTRiZmQ4NWFmMmYzNDJlMmZhNDc2ZjUxOWZlNDA3OWNkN2VjMGYxNWYyMzIzM2I5Y2RlM2M0MWIzIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURFNFJVTms4Tk5EaytwbE8vTUwwRE9RN05oTUIyMktIRmEvWmlONExjcFRRSWhBTVFxNXFUNjdxWnFNTk1VQlI3ejJodXZwY01xd2syQlJQQlZMTWZHc2dUdiIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjFha05EUVRCRFowRjNTVUpCWjBsVlUweHlUSGRXZHpWRlVGbFNiV2R3YWxWdWFqVlhkMkkxUW1GamQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVhoTlJFa3dUWHBGTUZkb1kwNU5ha2w0VFZSQmVFMUVTVEZOZWtVd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVYwVkVscVUzVmpWRXB5TWxGdGExVmtXbUkwU0dOQ2FFcEROSEkxZVRONWMydHJRbElLVkcxclNuUk5LelUwVFhaeWNIWnJlVTVyUXpOTU5Tc3dlRkYwT0ZwYU16Tm5iVVpZUnpoM1YydEJNVms1VTNFd1RHRlBRMEZzT0hkblowcGlUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV6Y2tKNENrbEJNMnRzVFZWWldEaHdNa2RCUkZwcmMyaExSRFJOZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKM1dVUldVakJTUVZGSUwwSkhWWGRaTkZwb1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhOaFYwcHFURmRTTldKdFJuUmhWMDEyVEcxa2NHUkhhREZaYVRrellqTktjbHB0ZUhaa00wMTJZMjFXYzFwWFJucGFVelUxQ2xsWE1YTlJTRXBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUVRWQ1oyOXlRbWRGUlVGWlR5OU5RVVZDUWtOMGIyUklVbmRqZW05MlRETlNkbUV5Vm5VS1RHMUdhbVJIYkhaaWJrMTFXakpzTUdGSVZtbGtXRTVzWTIxT2RtSnVVbXhpYmxGMVdUSTVkRTFDV1VkRGFYTkhRVkZSUW1jM09IZEJVVWxGUTBoT2FncGhSMVpyWkZkNGJFMUVXVWREYVhOSFFWRlJRbWMzT0hkQlVVMUZTMGRPYlZreVRtMU9hbHBzV2tSQ2FGcHRXbXRaVjFsNFQxZFJORnBxWkd4WlZFa3lDazE2WXpST1YwMTVUbnBWTVZwVVFtdFBWRVYzU0VGWlMwdDNXVUpDUVVkRWRucEJRa0pCVVU5Uk0wcHNXVmhTYkVsR1NteGlSMVpvWXpKVmQweFJXVXNLUzNkWlFrSkJSMFIyZWtGQ1FsRlJabGt5YUdoaFZ6VnVaRmRHZVZwRE1YQmlWMFp1V2xoTmRsb3llSEJaYlUxMFdraHNkVmxYTVhCWmVrRmtRbWR2Y2dwQ1owVkZRVmxQTDAxQlJVZENRVGw1V2xkYWVrd3lhR3haVjFKNlRESXhhR0ZYTkhkbldYTkhRMmx6UjBGUlVVSXhibXREUWtGSlJXWlJVamRCU0d0QkNtUjNSR1JRVkVKeGVITmpVazF0VFZwSWFIbGFXbnBqUTI5cmNHVjFUalE0Y21ZclNHbHVTMEZNZVc1MWFtZEJRVUZaVVhoRmJFaERRVUZCUlVGM1Fra0tUVVZaUTBsUlJIZDJiSEF5VjBWMmFVOUlRbk0wYm1GaWRXSnhNek41V0V0MFRuZFhRalZhYjFscGVpdERTV3h1VUVGSmFFRlFRVkp6Y0N0VWVsSmFhd3BFY3l0Uk0yTllkRVpwY1RaaGNHeFdiazVpZGtNckwyaE9LMHAxUkROblprMUJiMGREUTNGSFUwMDBPVUpCVFVSQk1tZEJUVWRWUTAxR2NIZDJaM2hsQ21aTFRFUlZXa1JaTUhKdGRWaFljSGhZTW5aWGNrbHVRa3hNWjBwTk9VRjVjVXQ1WlhKRWJGWXdja1p1ZUVjMllUUk9ialJNV0ZwSWQxRkplRUZRVm5BS1VIZGhOVmc1WlZwakswYzFWell2Y0RKTGNITnZLMU5EWjNka1pFWm9jMnBEZUZrek0xcEJVMDVMWjAxVFdVcEtZazFyY2lzNGEyY3JNVk55Y0djOVBRb3RMUzB0TFVWT1JDQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENnPT0ifX19fQ==",
          "integratedTime": 1667270598,
          "logIndex": 6265026,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/glibc-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/glibc-dynamic",
      "githubWorkflowSha": "cfccf66ed0affdaf19d8f7ea263785c2755e0d91",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3366388010",
      "sha": "cfccf66ed0affdaf19d8f7ea263785c2755e0d91"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

