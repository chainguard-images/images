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
| `latest` `v0.1.0` | `sha256:cdb63d1486125812cb8e12c40c83d973d186c1042104ef921808c94b9bd1d1b2`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:cdb63d1486125812cb8e12c40c83d973d186c1042104ef921808c94b9bd1d1b2) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:cdb63d1486125812cb8e12c40c83d973d186c1042104ef921808c94b9bd1d1b2"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "8aef467c217d1c48ea11611d6aad3fb55ee0cc94",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/melange",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIFsENeq6RQ+uSO1UlwPMsDRKcOv09iSW00mOUds0O1DAAiEAk+pY+9H+lnphxDEbOOMRhR4flUOfagn1CRjw2X7bwDU=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI3YWUzNGY5M2FlZTY1ZjEyNzVmYjcwNzk0NjViMzNhNzVjMmNmODczN2VmNjhlYWY0NTQ5NTBiNDA1NGMzMzg3In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNPOTk3cytjbktNc3d3Q3prTEdub0U4aDBmNzZhZHFYV2M3NUJHNjgzZFB3SWdEcFJnSUlaWDRpTFJJbkJnTmtoZDZmWjhOcFI5Mmd1S1M1YUFnMTQxb0xzPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlla05EUVhwVFowRjNTVUpCWjBsVlYyWk1SRzlMVlVabGMxSmhhVTQ1Wmk5UVEyOXdaU3N4Y3psRmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlhoTlJFRXhUa1JWTlZkb1kwNU5ha2w0VFZSRmVFMUVSWGRPUkZVMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZrU1hGMVpHbG5la2RWYXpsallXeDRZa3RUU0hwNWNqSXZjbE5vYzJWcmJrVjVNbmNLWVZOa0swTXhORmw1TjFKck4ybEJZMHhtVEM5eFdUWXlNMFJFYkUxR1FXeGpVVVZPY1ZJd1dISTJSRUV6ZFdwaE4yRlBRMEZzVFhkblowcFFUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlY0Y25aSENuSjBiMWxVTVZSeVEzbFRiRkZ1VlRGRFNHUXhWbXhCZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVd4aVIwWjFXakpWZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRFYUdoYVYxa3dUbXBrYWsxcVJUTmFSRVpxVGtSb2JGbFVSWGhPYWtWNFdrUmFhRmxYVVhwYWJVa3hDazVYVm14TlIwNXFUMVJSZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWmlWMVp6V1ZjMWJscFVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFpjMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZabEZTTjBGSWEwRmtkMFJrVUZSQ2NYaHpZMUpOYlUxYUNraG9lVnBhZW1ORGIydHdaWFZPTkRoeVppdElhVzVMUVV4NWJuVnFaMEZCUVZsU2EweHpOWEpCUVVGRlFYZENTVTFGV1VOSlVVTkVNR2hYVFhWdGJqY0tWMjVLVjBKcVYxZG9NblEzY2pSSFMyNHhaM1YzSzJoTFVFUm5ZVk5hZW5CM1FVbG9RVXA1WlhOUk5qTm1kRlpZWjNoM1NrbGxlRnBNVWxaR2JVUlBkQXBPS3pOM2N6bFhlVEptU1dFM2N5ODBUVUZ2UjBORGNVZFRUVFE1UWtGTlJFRXlhMEZOUjFsRFRWRkRaRmhtVDNZNE5EWlNkeXNyTWpkT0sxVjZRMEZ4Q25NMFlWSlVRMFJvUVhGNFJsZERRakF3T0V4bWVFbFdXWHBQVVZkUWJVSlRPRmxLVUVwWE9GbDZRMk5EVFZGRGRFZHRXRXd4YW1VM1UwRm9TVk5VTDBNS2RtNWxTMGRWVlRSak5tY3ZZblppUjFGSU1VSllLMmxEYTNCR0swUlZjRmN4YzBKc01rUjFaV1Z4VjNNeFIyczlDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1668128109,
          "logIndex": 6848122,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/melange/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/melange",
      "githubWorkflowSha": "8aef467c217d1c48ea11611d6aad3fb55ee0cc94",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3441554688",
      "sha": "8aef467c217d1c48ea11611d6aad3fb55ee0cc94"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

