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
| `latest` `v0.1.0` | `sha256:081183882a6aff8263bd069f1494bef168720928a47ff4203ed2197cfb3eca86`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:081183882a6aff8263bd069f1494bef168720928a47ff4203ed2197cfb3eca86) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:081183882a6aff8263bd069f1494bef168720928a47ff4203ed2197cfb3eca86"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "3e8082b58e1b222b9fae8b85ca53d675b465fa43",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/melange",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIFwdl1iHD25BFYQkRJwbKz9YHGXnxpNWuJE5rG+eaY+AAiBryIOZadx3kVKFevhcDWCK+ZCfJIi+zCNxPbdvUo4yUA==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI2MDlhYzk5ODc1MGYzNTM1ODk5YmVmM2UyOWIxNzQ5MjljYmZkMDMxOTdlYmE2MzM0MmQyMjBkZjNmNjZhNTBiIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURzV3VCYjY5SDBYeWw3RUV5M0RRM0l0YmFwekdXR3duREpVT3VMbHBwcUJ3SWdhYUs5S2tjdGFML1ZEV2lyd1dFREhmbGNMa0ZDQmJUdFBsRS8xVVU2TnU0PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlha05EUVhwUFowRjNTVUpCWjBsVldFbGtjWEJKTDJoWWFsVlhXWGhIWkdaM2EwOUdaR1ZhZG1SVmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlhkTlJFRXhUVlJWTkZkb1kwNU5ha2w0VFZSRmQwMUVSWGROVkZVMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZHZUdwMVkyOVRXV1pZT0VOS09HUmtUR2REY21SRlNVbHdlbXhJVm1jeVoxQmxLMElLWjNsd1V6WnZPVkJEVmtSQldGTnhVR1ZzWjBwR2Nta3ZURkZ5Y1hoclJETlJabXBWTmtneldrOXJSR1JwY1ZsSlZYRlBRMEZzU1hkblowcFBUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZuZVhkcENtaHhZbGxaY21OcFpIbGhibFZDZWtjck5GaDJkREJOZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVd4aVIwWjFXakpWZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRFVG14UFJFRTBUVzFKTVU5SFZYaFpha2w1VFcxSk5WcHRSbXhQUjBrMFRsZE9hRTVVVG10T2FtTXhDbGxxVVRKT1YxcG9Ua1JOZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWmlWMVp6V1ZjMWJscFVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFpiMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZaa0ZTTmtGSVowRmtaMFJrVUZSQ2NYaHpZMUpOYlUxYUNraG9lVnBhZW1ORGIydHdaWFZPTkRoeVppdElhVzVMUVV4NWJuVnFaMEZCUVZsU1prSmhPSGRCUVVGRlFYZENTRTFGVlVOSlVVTklia0ZVWXpkdVMyUUtPVW94WW1SWmJHdEZNeXRRTlZkb0x5dEhkR2R2ZUdGbmIyeFdWRGsyVlhsNlowbG5USEV3VWtaNVZqSlpabXhpTjI5TmJsVlBTelowV1ZoVkt6VmhUQW80TmxGYVRuWnFZMkkxT0VsYVlWbDNRMmRaU1V0dldrbDZhakJGUVhkTlJHRlJRWGRhWjBsNFFVeDBiSFJpU0ZodVZqTnBXazFqTjA1aVZVSm1WSGQ1Q25wR1QwZDRRM2hpYWpaMlV6QlNabVJqYzBoMU9IbHJSemxtZGt4WmNDdDJia2QwT0ZZM05tRnhRVWw0UVV4QmJYZFBjVmhWYVVwcVFXTjROQzlDZEhBS01GRXpNMlZoVEhRckwyUk1SVnB2WmpaT05qUmFOMjV1WTB4dFNrNXdkWGMzWVZOelZ6VjZhbWhVYzFSRVp6MDlDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1668041530,
          "logIndex": 6804751,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/melange/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/melange",
      "githubWorkflowSha": "3e8082b58e1b222b9fae8b85ca53d675b465fa43",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3432993901",
      "sha": "3e8082b58e1b222b9fae8b85ca53d675b465fa43"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

