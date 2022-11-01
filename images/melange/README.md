# melange

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/melange/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/melange/actions/workflows/release.yaml)

Container image for running [melange](https://github.com/chainguard-dev/melange) workflows to build APK packages.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/melange:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` `v0.1.0` | `sha256:895cd2e9affab389650570c39cb429c199044408f89872a714fb878a09546884`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:895cd2e9affab389650570c39cb429c199044408f89872a714fb878a09546884) | `amd64` `arm64` `armv7` |


## Usage

To build the melange workflow in [examples](examples/gnu-hello.yaml):

```
docker run --privileged -v "$PWD":/work cgr.dev/chainguard/melange build /work/examples/gnu-hello.yaml
```

Output will be in the `packages` directory.

To build the melange package for the host architecture:

```
docker run --privileged -v "$PWD":/work cgr.dev/chainguard/melange build --empty-workspace --arch $(uname -m) /work/melange.yaml
```

To get a shell, you can change the entrypoint:

```
docker run --privileged -v "$PWD":/work -it --entrypoint /bin/sh cgr.dev/chainguard/melange

/ # melange version
...
```
Note that melange uses bubblewrap internally, which requires various Linux capabilities, hence the
use of `--privileged`. Because of this requirement, we recommend this image is used only for local
development and testing.


## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/melange:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/melange:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/melange"
      },
      "image": {
        "docker-manifest-digest": "sha256:895cd2e9affab389650570c39cb429c199044408f89872a714fb878a09546884"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "d9f68d8bcaf74885c2ee7abe7eed982218a7934b",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/melange",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCOLsl2kCIdsjtKFV1PLbMx9QaVcfgC58SlucNs7ONjyQIhAOqHrOyfkxyx3OVLQzrIBNAgnM1fXSio2jmLWJDzC48V",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJiZDkxNDRhZWJlMTA1OWJhNWRlNzYxMTNkNjdhM2U3MTFjZjZkNWM2OGNlZjdmZTNlNzdiM2QyNDc2OTZlZThlIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUM4Z0l5VkJOYkVDZFVvajBjRGladkRXWnFyVm9EUzRPRjFNb1B3eGVWYld3SWhBSms4MkozVVhOa1AxYitJQjl3c3ZyazQ3eDltVjFNd3NoWm5ob3JUR1NjZSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlWRU5EUVhwTFowRjNTVUpCWjBsVlRuRk1MMjFLU3pOTlJYVkNTR0owWlhCYU4xRmtkakpaU20xVmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVhoTlJFVjNUWHBOZVZkb1kwNU5ha2w0VFZSQmVFMUVSWGhOZWsxNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZUWVRsSlYzcFNXVkJTWWpWMFRqUldhbUUwUkhkRWFucEVkelZ5YkVadk5reDJjRXdLVkdKc2NTOVdhRUl3UkVsUk1HaEZlRTlEVUdWcFFWRkRhbkJDV1hOdVVYcE9OSEZsU1hGWGIxQlpjRnB3TTJaNVV6WlBRMEZzUlhkblowcE9UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ2UTFadENqTkthSHBZZVdWdGJUbGhaRFpSZDNaaFZGZzVUVnBCZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVd4aVIwWjFXakpWZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRIVVRWYWFsazBXa1JvYVZreVJtMU9lbEUwVDBSV2FrMXRWbXhPTWtacFdsUmtiRnBYVVRWUFJFbDVDazFVYUdoT2VtdDZUa2RKZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWmlWMVp6V1ZjMWJscFVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFphMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZaWGRTTlVGSVkwRmtVVVJrVUZSQ2NYaHpZMUpOYlUxYUNraG9lVnBhZW1ORGIydHdaWFZPTkRoeVppdElhVzVMUVV4NWJuVnFaMEZCUVZsUmQzUjNhMVJCUVVGRlFYZENSMDFGVVVOSlJuVnJOMmt2UW01clEyUUtRVVZzYm5SUVUyMVBTM05VT0dReVkxTk9PU3RPWm1VNUwzbzFWalV4UldsQmFVSkhlSFZIZUdSMGVVeEVVbGMwV2pKalR6Sk1NU3RDTWxNek5sSm1Ld3BIUkZCUlNHWlZXbVkzVmxaSlZFRkxRbWRuY1docmFrOVFVVkZFUVhkT2NFRkVRbTFCYWtWQmFETkRiVlZTVldGdEszZEdkelJRTmtkYVdtWlhTbXRhQ2pCaVZtNTZibU12UW01TE1VTm5OMlowVlVKeWVFbHBUbnBPSzNkM1FTdGhSVWREZFRVM1JYaEJha1ZCY2tGSlJrdFlLMGxyVUhRM01ISTBUVFZNT0hrS1UzRmphelpXV0RsSVVXSlZkVkY1TnpkS1pGSmtUV3hQWXl0cVRIWnNRakY2YjJKc2VWcHlkazV5YVZBS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1667264620,
          "logIndex": 6260558,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/melange/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/melange",
      "githubWorkflowSha": "d9f68d8bcaf74885c2ee7abe7eed982218a7934b",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3365872209",
      "sha": "d9f68d8bcaf74885c2ee7abe7eed982218a7934b"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

