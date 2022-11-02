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
| `latest` `v0.1.0` | `sha256:07d5ddac0486708b0e853aac96d7b220b37757516e5331304c7d2cd89f602ac7`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:07d5ddac0486708b0e853aac96d7b220b37757516e5331304c7d2cd89f602ac7) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:07d5ddac0486708b0e853aac96d7b220b37757516e5331304c7d2cd89f602ac7"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "workflow_dispatch",
      "1.3.6.1.4.1.57264.1.3": "2278e70aff679cd0120418e9452042c81f5aac55",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/melange",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIA04qH0gw+PK/SQvDSzMHEU0lQ9M42vqbuQK5h8MyLAGAiEAlTvw8XwpucDg7c4PrHsMU7JZYyqcPm1EfOlHm2EfTwQ=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI4M2Q1M2Y3YmQzODQzOWU2ZGYzZjBhNDZkMjYxMTA2OWE1NGM5MTZkZjI1Zjg5ZGVhMjhiODRmMTVlMWJhYWQxIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJRHJVMmJFVFJlamtzQ08yR1ZmNGwzeXdwbzBjcTZwQnpzUXJPZkZoS2hHekFpRUFuNVZwdEx0Z3g2U0ovMHdnblNpR2pmQ3J1c3Y5elZPMEViZURmNnRtckZZPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjFSRU5EUVhveVowRjNTVUpCWjBsVlNsQTVaa2RQTTFGMllqUjJjakJISzA1VWNHc3dUMHRPZFRKTmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVhsTlZHdDVUbXBSTTFkb1kwNU5ha2w0VFZSQmVVMVVhM3BPYWxFelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVUzUm5sUE5UVnJWblZ1U25sclNUQTVlV1JqWlhCdlRVaFVaWFY0ZUhKMk5HOURUV0VLTkVoR2VtNHhjV1I2WjNSd1duQm1kbmRzWTBOWFJWUjBRM1pvZG5GdU0xUlRXVUpTYlUxMlVGZDNablF3TkM5RVdrdFBRMEZzZDNkblowcFpUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlUwYUhCUUNqUnJWSHBNWTFGMGQwcGxSaXRxY0ZKSFpVRXJVQzlOZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVd4aVIwWjFXakpWZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWpoSFEybHpSMEZSVVVKbk56aDNRVkZKUlVWWVpIWmpiWFJ0WWtjNU13cFlNbEp3WXpOQ2FHUkhUbTlOUkZsSFEybHpSMEZSVVVKbk56aDNRVkZOUlV0RVNYbE9lbWhzVG5wQ2FGcHRXVEpPZW14cVdrUkJlRTFxUVRCTlZHaHNDazlVVVRGTmFrRXdUVzFOTkUxWFdURlpWMFpxVGxSVmQwaEJXVXRMZDFsQ1FrRkhSSFo2UVVKQ1FWRlBVVE5LYkZsWVVteEpSa3BzWWtkV2FHTXlWWGNLU25kWlMwdDNXVUpDUVVkRWRucEJRa0pSVVZwWk1taG9ZVmMxYm1SWFJubGFRekZ3WWxkR2JscFlUWFppVjFaeldWYzFibHBVUVdSQ1oyOXlRbWRGUlFwQldVOHZUVUZGUjBKQk9YbGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMmRaYzBkRGFYTkhRVkZSUWpGdWEwTkNRVWxGWmxGU04wRklhMEZrZDBSa0NsQlVRbkY0YzJOU1RXMU5Xa2hvZVZwYWVtTkRiMnR3WlhWT05EaHlaaXRJYVc1TFFVeDViblZxWjBGQlFWbFJOWG96VkVwQlFVRkZRWGRDU1UxRldVTUtTVkZEWkN0Q2RVbEZjbVpqUkhOd05YUkpkSEExTlhKTFVYcDFjMDFuT0ZCdVdIQTVVRFJrUm5kTGExQjJkMGxvUVU4eFEyMTZiRkZVVjFCWVoya3Zhd3BFVGxoNE1XOWtaMWxrTmxWTGJrMURWMUp2VHpGQmJEUTJhQzluVFVGdlIwTkRjVWRUVFRRNVFrRk5SRUV5YTBGTlIxbERUVkZEWjA0MVFrYzRTeTlqQ2pOaVNFaG9ZVll2VW5OelRDOXVZVFZQY1RFNVdGRXhWV2d2U0hSVk5GUTFNbVpaZVdsdU1qQlNVbFJuVkhSeE1GcFFWMHRRUzNORFRWRkRlRmx4VlRZS1FVSm9iMmMyYW05R09FWXdPRVpqZDNwTVZGVnBMMFo1VEdwb1RXWk9TV3BvVmxRclNrVXlaRXhEWVZwVWJUTk9XSFpUYnpsaGVDOHpPV3M5Q2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1667417222,
          "logIndex": 6376242,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/melange/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/melange",
      "githubWorkflowSha": "2278e70aff679cd0120418e9452042c81f5aac55",
      "githubWorkflowTrigger": "workflow_dispatch",
      "run_attempt": "1",
      "run_id": "3380397564",
      "sha": "2278e70aff679cd0120418e9452042c81f5aac55"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

