# sdk

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/sdk/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/sdk/actions/workflows/release.yaml)

Development image for [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/sdk:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:7a23e32c665227987ca66a25f5b79bc8e9ee7c98286575fc4a40e12c2411c827`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:7a23e32c665227987ca66a25f5b79bc8e9ee7c98286575fc4a40e12c2411c827) | `amd64` `arm64` `armv7` |
| `0.0.1-r0-glibc` | `sha256:e38547891aabf2e1d99b722719c9647654f5de096a1b39fa44c227ef844eec3f`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:e38547891aabf2e1d99b722719c9647654f5de096a1b39fa44c227ef844eec3f) |  |


## Usage

### With melange

Clone down your development fork/branch:

```
git clone https://github.com/chainguard-dev/melange.git
cd melange
```

Run the image, mounting the repo workspace (`--privileged` flag required):

```
docker run --privileged --rm -it -v "${PWD}:${PWD}" -w "${PWD}" cgr.dev/chainguard/sdk
```

Upon entering the image, you should see the following welcome message:

```

Welcome to the development environment!


[sdk] ❯
```

Inside the environment, test out local changes to the melange codebase
by running the following:

```
make melange install
```

Then run melange commands as normal:

```
melange keygen

melange build \
  --arch x86_64,arm64 \
  --empty-workspace \
  --repository-append packages \
  --signing-key melange.rsa \
  examples/gnu-hello.yaml
```

### With apko

Clone down your development fork/branch:

```
git clone https://github.com/chainguard-dev/apko.git
cd apko
```

Run the image, mounting the repo workspace:

```
docker run --rm -it -v "${PWD}:${PWD}" -w "${PWD}" cgr.dev/chainguard/sdk
```

Upon entering the image, you should see the following welcome message:

```

Welcome to the development environment!


[sdk] ❯
```

Inside the environment, test out local changes to the apko codebase
by running the following:

```
make apko install
```

Then run apko commands as normal:

```
apko build --debug \
  examples/alpine-base.yaml \
  alpine-base:latest output.tar
```


## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/sdk:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/sdk:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/sdk"
      },
      "image": {
        "docker-manifest-digest": "sha256:7a23e32c665227987ca66a25f5b79bc8e9ee7c98286575fc4a40e12c2411c827"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "100752a9f1bb54360b094f48a584b4d2e86bb613",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/sdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIFWhYGOZJjSkYdPvZ+z7jc8c9cDXXI4bw87ZYTzuPLawAiB2i3ByHM8nnWimcUHZgGHVN1vzqZRZW/LgxRq8XwyzDw==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI5NTFiYjRmZmY1ZWQ1MzU4NDQ4NGY0YWQ5ZDc5ZGY4MjgxMWE4NGNjOWZjODQ0NzhkOGRhZDVkOWViZmU5YzY1In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUM3UnNOM0hDd091SllJd2E3eFU1b2VhaXRxcFZtT09DdXRJMzVhY3ZPdGdRSWhBSmsvSnBoclFSM1dJQm9LblRDNkhEUjNWenIxa0xoMS9xK0VvMlFZWEFNSCIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndWRU5EUVhsNVowRjNTVUpCWjBsVlZITlVOMGxpVTNsblZGRndkWE4xWTBKRGN6aEpXblp2YWpsVmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRKTlJFVjNUMVJOZUZkb1kwNU5ha2w0VFZSQk1rMUVSWGhQVkUxNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ6VVZWMVNYRTVPVFIzZUhJclEzVm1Zak4xZVVOTFVuWlFTak00YkV4SmQyVkNSRXdLTkdOdlpVaDRVR1E0ZUdzd2JDdFFlVXcxU25ZMlJXSjVabUY0WTA1dWVIWnBlbVJqWkRWUGVVVkhORmczV21kWU5rdFBRMEZyYzNkblowcElUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZzWVhoQ0NsTmxiREJ6V0ZWT1pFOTJWa2h2YmxGbU1XRkZiQ3RuZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6VG10aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdlRWUkJkMDU2VlhsWlZHeHRUVmRLYVU1VVVYcE9ha0pwVFVSck1GcHFVVFJaVkZVMFRrZEpNRnBFU214UFJGcHBDbGxxV1hoTmVrRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1ZWxwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIweENaMjl5UW1kRlJVRmtXalZCWjFGRFFrZ3dSV1YzUWpWQlNHTkJNMVF3ZDJGellraEZWRXBxUjFJMFkyMVhZek5CY1VwTENsaHlhbVZRU3pNdmFEUndlV2RET0hBM2J6UkJRVUZIUlZOdWVGRnhVVUZCUWtGTlFWTkVRa2RCYVVWQmFWRkhWR0p3YzFaWk1HTkhUVFZzTWpkdlNrVUthRXN4WlhacWVtTmtTVWxYVG1ob1EwUTFaV3BLUjBsRFNWRkRUazVoZUd4c2QyUnBjbTlaV1RGT1JYcGtUMDlJUmtkdlFrOVNRWHBQVDBaRVRETkJNUXBuZVc1elJtcEJTMEpuWjNGb2EycFBVRkZSUkVGM1RtNUJSRUpyUVdwQ01FOW9hMnRGY3psTU4weHZNVGwxUTJVMGFtVnRLMnhPVW1GRVprVmxRMlpsQ205UVpWbFBiRFEwZDFCYVZsSjBabkJVVVhwVGFHczNjR2x2VG5KdFYwMURUVU12WkRWb1RYSk1ObVp6UVdndmFXWjNXV0pTYURSc2R5OVZZV28yV0U0S1NHazRVMnRaT1VkcFlrVkRUbEk1ZGpSdWNHRlpNVzV6Tm5GM2FFbDZPRWQ1ZHowOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1667696979,
          "logIndex": 6590283,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/sdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/sdk",
      "githubWorkflowSha": "100752a9f1bb54360b094f48a584b4d2e86bb613",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3402271264",
      "sha": "100752a9f1bb54360b094f48a584b4d2e86bb613"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

