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
| `latest` `v0.1.0` | `sha256:2271fd064b7bd256777b8a83ebd3dc15001483bb8ee956b3aafb9b46b59abfdb`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:2271fd064b7bd256777b8a83ebd3dc15001483bb8ee956b3aafb9b46b59abfdb) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:2271fd064b7bd256777b8a83ebd3dc15001483bb8ee956b3aafb9b46b59abfdb"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "3e28f8e80535b4428352feaac5cebce3a436a998",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/melange",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIBPc51kxWRijCW1RIWp9GRSP/xpdNAdbK1HPjVB66mr2AiEApchzHJNsEa9Ya9HE6gCM6MvyXgYZhqa68MZQpc1QOgo=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJhNTc5MjM1MmVmMDQzYTE5ZDM4OWM1NTgzY2Q3OTM1YmQ3NjYyZjU0ZjJkYWU2ODQ4MzZjOWIwZjhlMzBiODYyIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNQcnNQdXVodGJZSkl0V0Rkaisxa3psODdET2FuamE2SW1OY1FkRmkxS0VBSWhBTDRNSy9LdVVmTzJwRTdXVkhpYjJDZXVjZTFYb1lBb3IxdnJsREFSZGhQRCIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhha05EUVhrclowRjNTVUpCWjBsVlZHbE1SM1JrT0VGSlUwNVliWE0wVFZGMWFVUnhkbWxUVGpkcmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhwTmFrRXdUWHBCTUZkb1kwNU5ha2w0VFVSRmVrMXFRVEZOZWtFd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZvYzBWMVVXcHlkMnRvUlVRNFkyaDJhMmxpU21kb1VWZGpOemRUV2tsaWMzRTBWMlVLUTNGNVNVTkpOVE5hVFU4dkx6bE5iRXRvYWt0dU4yOXhNVlZRYm5CM0wwMWpZbUpKYWs5c2JVcFJWRWRyZUVwMmMwdFBRMEZyTkhkblowcExUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV4TUVFM0NtVXdNMWM0TDJoUlVIRlpjbXhOVmpWNVNtNVJWV2hGZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVd4aVIwWjFXakpWZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWtsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVKSVFqRmpNbWQzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdlRUSlZlVTlIV1RSYVZHZDNUbFJOTVZscVVUQk5hbWQ2VGxSS2JWcFhSbWhaZWxacVdsZEthbHBVVG1oT1JFMHlDbGxVYXpWUFJFRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYmtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKc2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1ZEZwWGVHaGliV1JzVFVJd1IwTnBjMGRCVVZGQ1p6YzRkMEZSV1VWRU0wcHNXbTVOZGdwaFIxWm9Xa2hOZG1KWFJuQmlha05DYVdkWlMwdDNXVUpDUVVoWFpWRkpSVUZuVWpoQ1NHOUJaVUZDTWtGQmFHZHJka0Z2VlhZNWIxSmtTRkpoZVdWRkNtNUZWbTVIUzNkWFVHTk5OREJ0TTIxMlEwbEhUbTA1ZVVGQlFVSm5PVTFYUjNBMFFVRkJVVVJCUldOM1VsRkpaMk5TVlZSUGJFZDNiVnBrV1hKdGRuWUtOMmgwVUVGTlJHNXpkSG93WjA5eFRWcDRZMHRLTUhoMWFtWjNRMGxSUTFvMWNqVmxRbVY2Y0V4aGFqbFNlWFpXZG5WWFYwbDZOMGxQSzNkYVIyODJTUXBhUWxGYVlVbEhObXg2UVV0Q1oyZHhhR3RxVDFCUlVVUkJkMDV3UVVSQ2JVRnFSVUY1WjJjd2QzUXliakpvZW5KeEwxTjNLM0pIVG1aeGVuSXlZa1V4Q21SVlpsaGpMMlJuYm5OQk5FWkpaV0YxVjNKUWVHVTVibE15ZDJObWEwNHpTMUZzZGtGcVJVRnVhVzE2V1M4eU9XZEJiM1JpU25wRE1GazViMHRKY0V3S2Jua3JkVEJUYkZGSGNUQkVhakJNVWpaMmNITnhZMjFCVTBndlVXNWpiV0ZDZDNoMFNXNVFkUW90TFMwdExVVk9SQ0JEUlZKVVNVWkpRMEZVUlMwdExTMHRDZz09In19fX0=",
          "integratedTime": 1665693793,
          "logIndex": 5050483,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/melange/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/melange",
      "githubWorkflowSha": "3e28f8e80535b4428352feaac5cebce3a436a998",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3245458792",
      "sha": "3e28f8e80535b4428352feaac5cebce3a436a998"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

