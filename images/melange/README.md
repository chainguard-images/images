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
| `latest` `v0.1.0` | `sha256:34de962701880e06e59b2f0ee4362c9aadb856fec49b2142058a7116ba4d1afa`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:34de962701880e06e59b2f0ee4362c9aadb856fec49b2142058a7116ba4d1afa) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:34de962701880e06e59b2f0ee4362c9aadb856fec49b2142058a7116ba4d1afa"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "33aef6d08b8b5f316de7daa85ecefe9760a60746",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/melange",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDldyue72jU39MfU0ka82XcL11KDMyLvB7eHYHJ4m4ZCwIhANneATgNbwdwA22wWQWEfQwdEWopw4X0M9u77/OpIg4w",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI0ODk0YmY4ZWY4MGFhNDZhYjYwMDU0MTg3ZGYwZDk0ZjFjMTQyNmI1NTQxM2FkOGIyNmNhNWZhMjFhNDcwZTY4In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQ2pzM0t2bk1ZUG1FdHZldlhaMk16Sk9HaG1CMVg3dFZDNWs0RzBrdjUyakFpQjFSQS9NR0tiOXFJYkFBK1UyTmMyQzZnRFB4L1BQTTk2aVdCR1AzTGhNb3c9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlWRU5EUVhwUFowRjNTVUpCWjBsVlppOW1Oa1Z5U21sUFlVWmtPRWxXSzIwMmFuWm5XRVZxV0RGUmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRWTlJFRXhUbXBKZWxkb1kwNU5ha2w0VFZSQk5VMUVSWGRPYWtsNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVY2VjJWU1dXRnBTWFpPVURselpWcGtSWFpYVkVKVlJWQXZka1E1YkdOVlVGaG1jRlVLTW1sV0szcEdhbVVyZDJ0Q1QwMUNTR015ZGtOWU1IbENUMWt6Umt4VmJIQlVZVXBOU21GUmRTOU5WVlp5WjBsYU5uRlBRMEZzU1hkblowcFBUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZtU1VzM0NtZHRkMU15WlhWbFUyNXVlV0oxUkdac00zcG1jemRaZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVd4aVIwWjFXakpWZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRFVFhwWlYxWnRUbTFSZDA5SFNUUlphbFp0VFhwRk1scEhWVE5hUjBab1QwUldiRmt5Vm0xYVZHc3pDazVxUW1oT2FrRXpUa1JaZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWmlWMVp6V1ZjMWJscFVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFpiMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZaa0ZTTmtGSVowRmtaMFJrVUZSQ2NYaHpZMUpOYlUxYUNraG9lVnBhZW1ORGIydHdaWFZPTkRoeVppdElhVzVMUVV4NWJuVnFaMEZCUVZsU1dqUXhka2xCUVVGRlFYZENTRTFGVlVOSlVVUmtjWE55VmtVMU1TOEtVMUJVYWpoaFluaDBMekp2VFRaV2JVcExkMmxIVGtaWlpHNTFiSFkxYldVNWQwbG5TSFpPYzFNd1JtNXhWa3BEVkdGeVMxTmFkMjg0TlVSbU1YcENkZ3BaTWtWQ05ERjFiSGx3VUhsUlUwVjNRMmRaU1V0dldrbDZhakJGUVhkTlJHRkJRWGRhVVVsM1YwcFVjRTgxZUc0cmQyRk1WR0Z6Um1sWVlUWnNjRWRSQ2pKTVptTk9Na3g2SzBSalRUSTNSR2N3YkRVMlltOVFaV2d5WkRkd2MzSXZiRUptZEhCSVRWaEJha1ZCTjNveUsyUlNTVEp3TVZVMllpdDJhM1JKYlVnS2JFZHZiM1pZWVdJMWVrWkliMXBtYlV4VlRUUnNORzU2YTJOWVdUVXJhekIyVlVSc1NFZHJUV2RFYWxJS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1667955397,
          "logIndex": 6756373,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/melange/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/melange",
      "githubWorkflowSha": "33aef6d08b8b5f316de7daa85ecefe9760a60746",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3424368801",
      "sha": "33aef6d08b8b5f316de7daa85ecefe9760a60746"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

