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
| `latest` `v0.1.0` | `sha256:ce26bf25dcd3251cf6a40eaa7d5596419accf0e44beeb451769b1aa73c5623b4`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ce26bf25dcd3251cf6a40eaa7d5596419accf0e44beeb451769b1aa73c5623b4) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:ce26bf25dcd3251cf6a40eaa7d5596419accf0e44beeb451769b1aa73c5623b4"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "af6e95b9093d6e79139e1c4399a9a48cec8815af",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/melange",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIBS1DMx6ig+5Qr0/GiPTEPycvQUioFZBNzxcbC4fJcjpAiB8J5Pfv3UhxnqDDERVF/coqVinuIaOJbcKHJguC2OgOw==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI3ODFmOGUwNzhlNDU0YmQyZGMxMTUzNDJiNTU0YzE4YjA3NGNmZDg4MTIyOGRmNmVjOTI4ZTZjODlmZGM1YmE0In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURDNFF1OW1paXdZbGFXV2pNdlBoT29oc00wc0h4dDIwalp2SjRuSTZtYnNBSWhBTEZYMlIzck54RDlqWStpaWo2K0xjMXpXa2w5YmxOaWNQMERUS1UwSi8vZiIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhWRU5EUVhrclowRjNTVUpCWjBsVlRXNVlOV1ZvYUhSUVdtSnNVekIwVWpaeU9VRk9ZM1o1ZVhCUmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlROTlZHTjNUa1JCZUZkb1kwNU5ha2w0VFVSRk0wMVVZM2hPUkVGNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ5U0ZWdGJuTnlUMHBHY0M5WVFWQk1ZblpHVVhwdWJWUkxNMUZDV0dwcGJ5OXNVRWdLUmtSclVsQlRiWE5UUzJkbWQyTnVha2Q1UTJWMWJHWXpURGw0VEVGRE5sbG5WR3BGYVhGU1JHMXdhR1psTXpCRWRUWlBRMEZyTkhkblowcExUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlYwTWxsd0NqbGhOMk5UYkRKeVJVaGpLMjUwUXk5MmJsUlNSVGhKZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVd4aVIwWjFXakpWZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWtsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVKSVFqRmpNbWQzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdldWZFpNbHBVYXpGWmFtdDNUMVJPYTA1dFZUTlBWRVY2VDFkVmVGbDZVWHBQVkd4b1QxZEZNRTlIVG14WmVtYzBDazFVVm1oYWFrRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYmtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKc2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1ZEZwWGVHaGliV1JzVFVJd1IwTnBjMGRCVVZGQ1p6YzRkMEZSV1VWRU0wcHNXbTVOZGdwaFIxWm9Xa2hOZG1KWFJuQmlha05DYVdkWlMwdDNXVUpDUVVoWFpWRkpSVUZuVWpoQ1NHOUJaVUZDTWtGQmFHZHJka0Z2VlhZNWIxSmtTRkpoZVdWRkNtNUZWbTVIUzNkWFVHTk5OREJ0TTIxMlEwbEhUbTA1ZVVGQlFVSm5LMkp0TDB3d1FVRkJVVVJCUldOM1VsRkphRUZLWW1GUlQxbG5RM2xZU21GM2NuY0tkMDlFYkVaV1RYSndLMGRNVGxGb2IzaFdOM0ZWZW5WamEyMVVhVUZwUW5weFVESlljMW94WlVOblMyUTBaR3hLTUZReVZuZE9WbEp1VlhoU2VIRk1jZ3BoZDBodmF5dFhaVzVVUVV0Q1oyZHhhR3RxVDFCUlVVUkJkMDV2UVVSQ2JFRnFSVUZvY2pSSVRtRlJaa3BuV25GaGVWVkdNbkZHVkhrMVdGWXpTblJ3Q2tzcmJHTmpOMVl4TVRGeWNYQXJOSGRMVmpCUGVYRkVTa015Y2tGUFVWUnFVRVF4UjBGcVFuRmlOR3hpUkZKaU5sbFpVbnBKYUZGVWQzaHZjMGhQTURjS1VqWXJUVzkxVkdSelZuSkxjekYzWWpGVk4yNVNSbEJvT1U5eVJIRXpkRUkyU21kaVNrRjNQUW90TFMwdExVVk9SQ0JEUlZKVVNVWkpRMEZVUlMwdExTMHRDZz09In19fX0=",
          "integratedTime": 1666026250,
          "logIndex": 5291606,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/melange/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/melange",
      "githubWorkflowSha": "af6e95b9093d6e79139e1c4399a9a48cec8815af",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3266997657",
      "sha": "af6e95b9093d6e79139e1c4399a9a48cec8815af"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

