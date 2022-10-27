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
| `latest` | `sha256:78ec48c5df81daf39c8f8e336896c6a58810da3c39bc72fc4e022cea02304f34`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:78ec48c5df81daf39c8f8e336896c6a58810da3c39bc72fc4e022cea02304f34) | `amd64` `arm64` `armv7` |
| `0.0.1-r0-glibc` | `sha256:5e2966def595a589b29a509c21070edf9106ad3c9c917c2bb46ec4873b39bfb6`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:5e2966def595a589b29a509c21070edf9106ad3c9c917c2bb46ec4873b39bfb6) |  |


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
        "docker-manifest-digest": "sha256:78ec48c5df81daf39c8f8e336896c6a58810da3c39bc72fc4e022cea02304f34"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "b36e11d77830c308db56e1e6d0db8b78adc7305f",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/sdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQChVAVdoojM7ACTdW1LSCnLnx8t+RAUqvDS2cbFfy9Z+wIgRu7G43y+lONFW0+ia0bffHeQbRYXuSTA8ayQAFCnPsM=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI1NjI1NjM2YTllOWU1MjEyNTAyOTBiOGVhYTEzY2E4ZDk5YWYzNTdjZGIxYWFhNjMzNzVkOWQxZjU5OTZjZDAxIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURmUDNwRTd4ZjdQZ0JTdXNRbWlVYWpHVk15d251RmJ0NmFQN1F5Q21qN2JRSWhBS3hFMDFTblhaemdsRDdhNmZHMW5LaG1nRGs2VWpuZ0lpWVR1ZlNkbm43bSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndWRU5EUVhsNVowRjNTVUpCWjBsVlFWbHVRbmMwTUU1VmVsVkRWR2RXZDBSTk5sbEVPRlZsT0dkTmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1ROTlJFVjRUMVJSZDFkb1kwNU5ha2w0VFVSSk0wMUVSWGxQVkZGM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVYwVEU0elJGcGhUWGhFYmtRMk1IazNkWGhhZDNCeWNWWjFNRnBKVkZsemRtaEdVWEVLUVU5dVEwMTFjSGxvVWpsbWRFWnpWR1pRY25oaWFHdGhUelUzV1ZCNGFWcFhSMlJYUTFSclozSm1hMHBYUmxKNEwzRlBRMEZyYzNkblowcElUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZqVjNwTUNtTktlVXBzTkUxUmMzSlBka05OTDJwTVdUTXlRVGhWZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6VG10aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdldXcE5NbHBVUlhoYVJHTXpUMFJOZDFsNlRYZFBSMUpwVGxSYWJFMVhWVEphUkVKcldXcG9hVTU2YUdoYVIwMHpDazE2UVRGYWFrRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1ZWxwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIweENaMjl5UW1kRlJVRmtXalZCWjFGRFFrZ3dSV1YzUWpWQlNHTkJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUlVaM1dVSllkMEZCUWtGTlFWTkVRa2RCYVVWQk9FeG5halI2ZEVjeFVGaGFZbkUwT0N0eVVuQUtka2R5YW01Vk0xTm5aM0ZpZEU5bU5GcGxhM1JITUhORFNWRkVTbVkzWVVGYWRFVTBlRWgyU21sc2FUa3ZRM056V0VFM1p6Vm9SbUZCVlUxWFNqQmFaQXBUUm14NFFXcEJTMEpuWjNGb2EycFBVRkZSUkVGM1RtNUJSRUpyUVdwQ05USmxhR0Z5VDFaQlRraERPVFpuUVhWb1VWRjRRM00yYkVKMGFHSm1ibk5HQ25SRVRYTjJLM05CV21aNGNGTnlaSEphYzI4NVF6bFBabE5WWWxaS1ExRkRUVUZ3TkhOTU5sbGhOMFZ6WlVaa1ZuaEhNM3BQWkdZNFJVWlRZMHMwWTFrS01WZFdXVEZOTlVWTU1IZDZLMVZWV0RVeldHOUlTV2hWTVV0RWIwaHZibWhDWnowOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1666833588,
          "logIndex": 5946388,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/sdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/sdk",
      "githubWorkflowSha": "b36e11d77830c308db56e1e6d0db8b78adc7305f",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3333595360",
      "sha": "b36e11d77830c308db56e1e6d0db8b78adc7305f"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

