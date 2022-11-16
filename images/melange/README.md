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
| `latest` `v0.1.0` | `sha256:4c3918afce48d08d014ef1afdb306d2b4fa5399f9b67da82c90c32d4001e8d02`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:4c3918afce48d08d014ef1afdb306d2b4fa5399f9b67da82c90c32d4001e8d02) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:4c3918afce48d08d014ef1afdb306d2b4fa5399f9b67da82c90c32d4001e8d02"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "2e278957be18b337c26b86dda31b9c63c0d08104",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/melange",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIHlM50NWrnYWkm+tI+xTfqJ4AtPH1u+7riIraWsLiwWTAiEAsPMbf/mSxL46StbuUNlJBMJK4DMiaSlydMK6hKfxdtM=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI3ZTk1NmUzNzdlMTVmYzgwNzFlM2YwYWIzY2QyYjk2MWVkNzg1ZGE1MTdlNjlhMWQxYzJmMDg0YmNmMzNjMmM3In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJR1JBRlp2M0NVUWRyTVoxeDFhV1NqbUQwS1pyQUFkYWJudzh6ZmtYaWJpYUFpRUE4S0pnQU9ZU3pXSkc2amZVVGhMdTFWN2ptdGp2dzE2MFhOR2JTTUFTbUxRPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlSRU5EUVhwTFowRjNTVUpCWjBsVlEyMHpXWEpRYURJeGVHcE9XSGh2V0daSWNFbEljbUpVTDB0WmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlRKTlJFRXhUWHBCZWxkb1kwNU5ha2w0VFZSRk1rMUVSWGROZWtGNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZPYjNOWU1YYzBWVE5PY1ZvNVNFNXNRVGs1WjJVd1p6bFlhMW80VTFNdlZETTFaVmtLZVdZelJsaHhRVU5IUjNaTlJITkdZVFZvUzFoU01GcFdWRlF6TUUxbGRVOTVhVVpYVUZWcVZUVmtRbFpvWkRsSWQwdFBRMEZzUlhkblowcE9UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlY2TjAxUENtOW5VbTh2Umk5UlMzVTFORXRpVnpOdFdGb3JhbWxWZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVd4aVIwWjFXakpWZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRFU214TmFtTTBUMVJWTTFsdFZYaFBSMGw2VFhwa2FrMXFXbWxQUkZwcldrZEZlazFYU1RWWmVsbDZDbGw2UW10TlJHZDRUVVJSZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWmlWMVp6V1ZjMWJscFVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFphMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZaWGRTTlVGSVkwRmtVVVJrVUZSQ2NYaHpZMUpOYlUxYUNraG9lVnBhZW1ORGIydHdaWFZPTkRoeVppdElhVzVMUVV4NWJuVnFaMEZCUVZsU09UZE9WME5CUVVGRlFYZENSMDFGVVVOSlNERTVObFJxYkhWWlIxZ0tWRzByWTBSUk9XNVJSblJtU25scU5XdEtVazlXYlVsQ1QyWndiRkpaTW14QmFVRnlhbmdyVDNabmJtMVVja3hoZURCeWFFOU1VbHBtSzFFeVZUVjVlUXBuU3pOdlQzYzBVRm94Y0M5cFZFRkxRbWRuY1docmFrOVFVVkZFUVhkT2IwRkVRbXhCYWtKM1RVYzRVVlJLZWtaNGNpOVdjVUZUTkdOblVYaEpSelpVQ25wTmN6SkJaa1U0VWpWaGRDOW9RVXgwWjNsMFVVMUJjR3gwV1ZJeU9XSmxibmRJZWtaMlFVTk5VVVJCTWpSVE9WRnVlRk5pTDBVMFdrcDZkamxYZFVJS1dFOXpTMDRyYUdGemNGVmpSVXMyV0hwUWRtTjZNbXBuYlVaVE9YazFNbkZsZW5wdFozRXlWbFJ3WXowS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1668559992,
          "logIndex": 7168006,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/melange/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/melange",
      "githubWorkflowSha": "2e278957be18b337c26b86dda31b9c63c0d08104",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3475334059",
      "sha": "2e278957be18b337c26b86dda31b9c63c0d08104"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

