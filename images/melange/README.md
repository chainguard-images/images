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
| `latest` `v0.1.0` | `sha256:dcb3fce4d164feee33366382e9c197417880201c4e5b07f6679ccc7c334c5833`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:dcb3fce4d164feee33366382e9c197417880201c4e5b07f6679ccc7c334c5833) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:dcb3fce4d164feee33366382e9c197417880201c4e5b07f6679ccc7c334c5833"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "bf6a0cfb219a9ae2299e6216fe92acbbf7fb44c4",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/melange",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIC8GuQU/lIe1S+tsWTklEC6P1E0ieUzy+5piC+cGeJYWAiADbbRhXAEfc6r1hRCP4Tf8mMim/9zKUk9s93qYvpS9cA==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIzNjYwZDEyM2NlNThiMGJhNTZjMTBmM2Y1YjI2N2JjZDJhMGMxYTI4OGUyOGE3MjZiMzBiMzcwODY1NWI4OWZhIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNiTkprdWN5UlA2eDFyY0Mzdlg2NlorM0JqZ3dIY3Q4VnJoMkJYRUREaUFnSWdGSWxXanpBclk3bFYwb2dXM1VMMkJRY2tvZVlvOGFHenJPUU5ZL2tQRUhBPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlSRU5EUVhwUFowRjNTVUpCWjBsVlMxY3laSE5oYWpoeU9HTkJkMW80UVVaNGNFVlNhbWhKTDI1UmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlRGTlJFRXdUMVJGZVZkb1kwNU5ha2w0VFZSRk1VMUVRVEZQVkVWNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVUyVDA5WVptbGhRazF3TjB0Vk1rZFdWakpTTldOUGNVUkNPR016Vm5SWU9VSnFaSFlLT1RCdVNGVTVZa3N6YTNoR2FYYzJORWR4ZW5aSFVYRnJkRVp0ZW5obFVYSlFRVWRXY0RKalRrcE1ZbUp4Y21kU2VYRlBRMEZzU1hkblowcFBUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZtUWtrMkNqaHZWRGhyYXpabWNXdHJMM2gwT1c5amVWRXJkMWxSZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVd4aVIwWjFXakpWZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRIU20xT2JVVjNXVEphYVUxcVJUVlpWR3hvV2xSSmVVOVViR3hPYWtsNFRtMWFiRTlVU21oWk1rcHBDbHBxWkcxWmFsRXdXWHBSZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWmlWMVp6V1ZjMWJscFVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFpiMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZaa0ZTTmtGSVowRmtaMFJrVUZSQ2NYaHpZMUpOYlUxYUNraG9lVnBhZW1ORGIydHdaWFZPTkRoeVppdElhVzVMUVV4NWJuVnFaMEZCUVZsU05IZDJRamhCUVVGRlFYZENTRTFGVlVOSlVVUjJlV1ZCYVVzeE4wd0tUalJVWVdac05YSjBSQzgxTjBKV1MzazVXa1owV2twRFpsUm9ja3RPWVhrdlowbG5UWFpTUjJKclUxRlZhVTE2VFN0c1dGWTJXVlp6UjBOT05XaE1SQW8zT1RSMlJXcEVUazgyUm5FME5EaDNRMmRaU1V0dldrbDZhakJGUVhkTlJGcDNRWGRhUVVsM1IwTjVTRzVaVlhkMlZVcDJUVzF6UjNBNFdHUXljRlJZQ2pFd2FVeExMM05oTkhwUVVXeDZjRmR1UVRkallqbFdNV1JJUzBabmNHTTFMMFZFTWtwTU1FSkJha0kzVmxObFZrTTNWSEIyZGtoNVRqSXhhbWMwYUZjS1kzRk5hMGh6VkVOV00xSllabXRsZGtnclYwSXZVVlZpUkRRM05WVlhXakF6YjBOTU1XdzJjemROYXowS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1668473360,
          "logIndex": 7092712,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/melange/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/melange",
      "githubWorkflowSha": "bf6a0cfb219a9ae2299e6216fe92acbbf7fb44c4",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3466376274",
      "sha": "bf6a0cfb219a9ae2299e6216fe92acbbf7fb44c4"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

