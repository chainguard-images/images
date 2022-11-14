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
| `latest` `v0.1.0` | `sha256:c20477d8e0741e8bb42fea540aedf3c5a15b994c6b87003aeda48373d3d983e2`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c20477d8e0741e8bb42fea540aedf3c5a15b994c6b87003aeda48373d3d983e2) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:c20477d8e0741e8bb42fea540aedf3c5a15b994c6b87003aeda48373d3d983e2"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "5c7b036772cb014b19212684702411d754b8c30b",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/melange",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIGr1e4xVhu+xm7SCh9TE/AVWtblOZg5QH23X4NWtGU3DAiEA0JL8aMq7zgBrK1i4Rs7KXfykJWs7/4KQGM9L8vkK5jg=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJjZGYwMjIzOGYwMTU2OGY5NTQ0ZjRhYTRhYTE0ZDVlOTBmMjliZjIyMzU1YWMzMTI0ZDFmZDk4NGFhMTUxNjAyIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJRVBlQ0RoZURPSnhNQ0QwY3BaM25FOG5xSnl3V2RkSC96TVdyR1JkK3NBbkFpRUE2TitpQStMSitMcHhyT1NYWHZFVllkc3dSaTEvNU1PN0tZVmpjQjIvd3NNPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhla05EUVhwTFowRjNTVUpCWjBsVlRreDRaV1pTZVVSMk1WUjNNa2xvVXpKNmRtNTJjbmxMSzBScmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlRCTlJFRXdUbnBWTlZkb1kwNU5ha2w0VFZSRk1FMUVRVEZPZWxVMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVYxV2k5cVkybGliR1JXUWxJcmVWTk1Ta05MY25ORFJqWlNkRkZOV0dWWlQwZGFORllLTjNoRFFWWmpZV0pLT0ZkTlEyTm9SRzVwTjB4dVZVaDBhbW9yV1VKMFduSkJSRTlET1hKdVlqUmlSQ3R1YW5GR1JEWlBRMEZzUlhkblowcE9UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZpY2pSNENrZFZRbVJNYUZkSVptNXBSMnhZSzJ4SFQyUXZhV2wzZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVd4aVIwWjFXakpWZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRFVm1wT01rbDNUWHBaTTA1NlNtcFpha0Y0VGtkSmVFOVVTWGhOYWxrMFRrUmpkMDFxVVhoTlYxRXpDazVVVW1sUFIwMTZUVWRKZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWmlWMVp6V1ZjMWJscFVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFphMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZaWGRTTlVGSVkwRmtVVVJrVUZSQ2NYaHpZMUpOYlUxYUNraG9lVnBhZW1ORGIydHdaWFZPTkRoeVppdElhVzVMUVV4NWJuVnFaMEZCUVZsU2VtMHpiVXRCUVVGRlFYZENSMDFGVVVOSlJUQlZObWNyUm5obVFtVUthRFUwZEcwd01pOVVPRzFXYkdVd1oxbFNLM1kxVDFodWJYVnJXVGs0UkUxQmFVRldSUzlEYmxrdlYzbFpNMEpTZGl0cVRVUklPVGR0WTNkbFFrSlZkQXB5VlhaVU9XbDZXbWN5WWl0NWFrRkxRbWRuY1docmFrOVFVVkZFUVhkT2JrRkVRbXRCYWtKdU5rUlZSa3N5WkZwS1JVY3hSSFp0VTFGYVdVbEpaVmxaQ2paQkszQnRlamhUVkV0MmVHUnNiUzgzUzBwaFFXRklTalZaU1hWMFMxRTJiMEZaTmtOUU5FTk5SemRVTnpsWFpFZFhlbXRwUkd0ME0wNU5lWEJhY1VzS2FHWjVWVmxEWkdkU2JITjFaekJrWkZwa1RGTmFXbUYwWW5WcFIwOWpVekJtTmxkeWNFbzFaRTlCUFQwS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1668386888,
          "logIndex": 7021471,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/melange/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/melange",
      "githubWorkflowSha": "5c7b036772cb014b19212684702411d754b8c30b",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3457625724",
      "sha": "5c7b036772cb014b19212684702411d754b8c30b"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

