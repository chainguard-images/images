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
| `latest` `v0.1.0` | `sha256:bf0b6c4f943fa957a9a32071493faeed6d2704eb4d526ba22e97fc8036435dfa`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:bf0b6c4f943fa957a9a32071493faeed6d2704eb4d526ba22e97fc8036435dfa) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:bf0b6c4f943fa957a9a32071493faeed6d2704eb4d526ba22e97fc8036435dfa"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "cc1a33616806ceb1e11977c6324c704737bf758a",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/melange",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIDl9l4gdJ1QnXD6+FZezqw0Wc5sv++GvbE4k6cX/CjEZAiEA0wpWOGPm3edi4lJW8iyFfk9dZWdJdex6gXl8sV5RtZk=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJlMmRmNmEzMzY2NjE0N2Y1NjAxMmYwOTAxYjVjNDNmNmE2YWU4ODA4MzdlNDI2MThiM2QwZjY1YTM4YzIxYmU1In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQUxLd3Z2RTlzanEyOXFMaFFNRGxUVnh1dWpINXJXNWRoTnpRdHBxTzlWRUFpRUF3dm1pbEFBY0VQaGV4UUJBMFVKS0kxQjNZYnRYWmlyZmY5WlRncjIvdXJBPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlha05EUVhwVFowRjNTVUpCWjBsVlJWQTFiWE5XUzNOVGFtNXpXR2huWlZBMGExUXlORlk1TkRGbmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1hoTlJFRXhUbFJWTUZkb1kwNU5ha2w0VFVSSmVFMUVSWGRPVkZVd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZNUWxSSGJIVjZMMnhzUldONlRtUTVlWE5NUWxsdWNVNU1jamsyV25GaWFERlBibkVLTWxnclpXVTBaemhvVHpBd01IVkRORXBPYkN0WlZGWnBZbmxhT1VORFRUaEpaMDl6Y1dWdlVGSkhORmM1Wlc5VFRUWlBRMEZzVFhkblowcFFUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlUwTldkaUNpOVZNVEl3VlVaeWIxRldhVWR5UzBKSVVFTkNVMWhOZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVd4aVIwWjFXakpWZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRIVG1wTlYwVjZUWHBaZUU1cVozZE9iVTVzV1dwR2JFMVVSVFZPZW1ScVRtcE5lVTVIVFROTlJGRXpDazE2WkdsYWFtTXhUMGRGZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWmlWMVp6V1ZjMWJscFVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFpjMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZabEZTTjBGSWEwRmtkMEZKV1VwTWQwdEdUQzloUlZoU0NqQlhjMjVvU25oR1duaHBjMFpxTTBSUFRrcDBOWEozYVVKcVduWmpaMEZCUVZsUU5FTm9aamRCUVVGRlFYZENTVTFGV1VOSlVVTjBUbXBDVFdvNFRHb0tORU00UjNjd1ZHWTRjRWdyYlVocWFrVXhhblV5VXpZMWJEWTFUVUpNT0dOU2QwbG9RVkJwWVROSVlYZzRTV1owT0ZOcGEwWkRaRlZYVjNoR2FpdHlUZ3BKVUhrelExcGxkbXBxY0ZWb1V6Tk1UVUZ2UjBORGNVZFRUVFE1UWtGTlJFRXlaMEZOUjFWRFRWRkRhbEJXUms1SmMycFBNVFJrWlRBeVNGWm1XbVpNQ21od1dXb3pjVEF5VDJKNU1sTnZVRTAzTm5kclprUkRVbFEzZDFWaFdrWkVXVzFoV2pCNVZVMWFkbU5EVFVKV09YVlhkMFp2YkVoelZVMUNXVnB4VUZjS1JYWjFWbEk1TjBFeFpIVnBUMGRQTVRCdlIxVkRiVGMyUzNsUWNIWnhOVXc0Wkhvd2FrSnRlRkV6YW1wdVFUMDlDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1666313763,
          "logIndex": 5529354,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/melange/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/melange",
      "githubWorkflowSha": "cc1a33616806ceb1e11977c6324c704737bf758a",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3293942404",
      "sha": "cc1a33616806ceb1e11977c6324c704737bf758a"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

