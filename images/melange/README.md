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
| `latest` `v0.1.0` | `sha256:3f4bace79bf6309e470e79e65c8598f9719de2ec08123d4bea7e8539026a5f3d`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:3f4bace79bf6309e470e79e65c8598f9719de2ec08123d4bea7e8539026a5f3d) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:3f4bace79bf6309e470e79e65c8598f9719de2ec08123d4bea7e8539026a5f3d"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "6a6ca8dae5108eb30f3deddf77d4f57855d79aaf",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/melange",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQD7n+F1ieT8h81NbGMbjqk8TfRFWyAK04c64jcXftv2ygIhAPukv8fjOj5N0VDODP7DGcr5L3lf5ovXldQ3N96imvVD",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIwOGIxMzkzMWQzZmJlYjZmOThmZTgzODBjZWM4YjRhNTFjMzYxNjgwY2ZjNDY0MmRmZDEyYmQ0NDU0ZTAwMjExIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJSHlsMXhzd1ZBUWZNcDRFSGJ6TVlRSklaZlVDWi9pTWJidmhHNXFiQ09TaUFpQVJsMkRhTWMzWmRWNi83NHhwNTdnVHRmV3lnQ3kyR2xDTVJ6b2Z6U3hqY2c9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlWRU5EUVhwUFowRjNTVUpCWjBsVlZqSkZibEJhTjNGMVlsTlVhWFJ3TTFkcE5VMUhielJZVkhKVmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRCTlJFRXhUa1JCTlZkb1kwNU5ha2w0VFZSQk1FMUVSWGRPUkVFMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZvWml0QmRVcHRlVkJ2WnpkeFdXczFUM0pKUlZOdUwzUlNlRE01ZDNVclJrOWhUMjRLWVVoU1ZuYzFRazFMYWtOdGFHaDNjSGhDYTB4UVFVVlVWa1Z6V0d0MFFXVjJSVnBzUVdkWlJteE1OVWMwZEV0RFRqWlBRMEZzU1hkblowcFBUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlYyVDBKcENuWTRkelYxYmpGcE5uZGtNV2R3TjNJMlRUUnFWM2wzZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVd4aVIwWjFXakpWZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRFV21oT2JVNW9UMGRTYUZwVVZYaE5SR2hzV1dwTmQxcHFUbXRhVjFKcldtcGpNMXBFVW0xT1ZHTTBDazVVVm10T2VteG9XVmRaZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWmlWMVp6V1ZjMWJscFVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFpiMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZaa0ZTTmtGSVowRmtaMFJrVUZSQ2NYaHpZMUpOYlUxYUNraG9lVnBhZW1ORGIydHdaWFZPTkRoeVppdElhVzVMUVV4NWJuVnFaMEZCUVZsU1FVbFpVazVCUVVGRlFYZENTRTFGVlVOSlJHMTJTekJhVTNRMmFIY0tZbHBoWVdFNVRqbHlVR1ZyZG5sQ2EwUkdPVVUyVlU1V09VSndRM0V5VjNsQmFVVkJNWGR2ZERSMVlrRm1WVU5JU21KclJ6TjFUVlJEYlUxRGF6bDJWUXBIY2xadWRUQk5ZVzEwV0dZMWRXZDNRMmRaU1V0dldrbDZhakJGUVhkTlJHRkJRWGRhVVVsM1lVVXhaV1JyWkN0S0wwUTJiVlp3Y0VGQ1VuRTJPVzloQ2tKbGF6TkNhek5WTTNFMFQwOTFibWRTZGtoQ1JUWlVUMW81ZVVOaFRGTTRiVE5DVkVRM1ZDdEJha1ZCYkZscksxbGhWRVIxUjFoQ1lXTTFXSFZSTkdVS1ZXOW9lRGRQWWpWMU5HTTNjVVp1V2xsS2NGRm1Tazk1V1Rkd1JGWjNTRVZ5Ulc1Wk4zVjRVRUl6Ylc4S0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1667523257,
          "logIndex": 6457749,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/melange/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/melange",
      "githubWorkflowSha": "6a6ca8dae5108eb30f3deddf77d4f57855d79aaf",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3390370741",
      "sha": "6a6ca8dae5108eb30f3deddf77d4f57855d79aaf"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

