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
| `latest` `v0.1.0` | `sha256:a29fb2cf3f4a910690ef96c1b85949a8104d9b0d10e11c8d59f7d5dfea20e357`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a29fb2cf3f4a910690ef96c1b85949a8104d9b0d10e11c8d59f7d5dfea20e357) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:a29fb2cf3f4a910690ef96c1b85949a8104d9b0d10e11c8d59f7d5dfea20e357"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "fb1c2fb900595b2605605599a2b250d1d1519453",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/melange",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCgdJ8KNUAAkQJjG1nn8bkuFOnjnS7XJEko5x4D0CtKbAIgI8qXwVW3PYm+XeQJ2lPVCNU3Kyfg8ZN0KJ75libMtA0=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI0M2ViOTJmYzY5YjQzN2U4MjljNzU4MDBiZmEzYzRmYmM1NThkN2NhNjk2MzVhOTk1OTNmYmUzYzE0YThlODViIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJR3VQUDc1ak1MSjJPdG53T05iMXhBZW8yZTNjVDc0ZVZrdytDalFEK3lZQUFpQjg1YVQvTkVMYjlrcmQxMTZuOVFrRGQ4aU1tTG9zN08vdjBTdkZmajZ2OEE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlha05EUVhwUFowRjNTVUpCWjBsVllWaFFNbkI2V1VVNVZFNTBUVkF2VEVwQkt6Tnhia2cyY2poamQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlhsTlJFRXhUMVJCTWxkb1kwNU5ha2w0VFZSRmVVMUVSWGRQVkVFeVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ4WVdsSVUyc3dSalV4YzNKT1VVczJhR3hIT0ZWRGJWcG5SbGR2WkhwTFZUTktXbG9LV2xkWlJpdEJMM1JsWVhCcFRWSlZZMkZ0TUVOdWFqaFlVbVp5YVhJdmRFOVZlR2xQYlV3MU1qaExhVmRLTkdweVlXRlBRMEZzU1hkblowcFBUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZGZUdsckNpOTJibXB0Y2xNMWNWTkJaM2h3T0dsTlVVWm5Wak5OZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVd4aVIwWjFXakpWZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRIV21sTlYwMTVXbTFKTlUxRVFURlBWRlpwVFdwWmQwNVVXWGRPVkZVMVQxZEZlVmxxU1RGTlIxRjRDbHBFUlRGTlZHc3dUbFJOZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWmlWMVp6V1ZjMWJscFVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFpiMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZaa0ZTTmtGSVowRmtaMFJrVUZSQ2NYaHpZMUpOYlUxYUNraG9lVnBhZW1ORGIydHdaWFZPTkRoeVppdElhVzVMUVV4NWJuVnFaMEZCUVZsU2NGZFBNUzlCUVVGRlFYZENTRTFGVlVOSlJIUldWUzk0U1VoWFNVOEtTQ3RrT1hnMlNtWlFXa1ZqZVRrMFdVMVpOSGxHYmxvMVZrZFFNazFKTVZGQmFVVkJkamh0WW5VM01FcEVZekpEV0hrNFdqUnJORzluVUZOaVFYVTJNQXBoUzNWU2JEaHJWWFl5V21OeVdUQjNRMmRaU1V0dldrbDZhakJGUVhkTlJHRlJRWGRhWjBsNFFVcE9jMDB2V1ZGTVYyZzFjRGRJYTNFNGFUSnNOMUpYQ25FMFdEUjVTRmQ1UW5oRVFsa3diMW8xTkhwa1YyZHJiMU5DZEhFeFJHdHBXSGhMTm5Od1lUaGpkMGw0UVUxVFpVTXdjaTlLUm01VE5WZE5ZbmRSTjFrS2FtRk1PVE5YZFhSaE9FcEVOekJRTWs1eE4zRkxXbmxSTDFoVk5VeFRlRmhpYTFoeE1YTjJWR2xVTjBSWFVUMDlDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1668214759,
          "logIndex": 6903839,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/melange/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/melange",
      "githubWorkflowSha": "fb1c2fb900595b2605605599a2b250d1d1519453",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3448857803",
      "sha": "fb1c2fb900595b2605605599a2b250d1d1519453"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

