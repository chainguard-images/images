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
| `latest` | `sha256:bd451367e089e30e063e043eda14e434367b87150d804771a72f1420fd390337`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:bd451367e089e30e063e043eda14e434367b87150d804771a72f1420fd390337) | `amd64` `arm64` `armv7` |
| `0.0.1-r0-glibc` | `sha256:1f27374f840f7af9dfad68f25d8b0dc4f297ed6c8925a262275927a19c516f85`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:1f27374f840f7af9dfad68f25d8b0dc4f297ed6c8925a262275927a19c516f85) |  |


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
        "docker-manifest-digest": "sha256:bd451367e089e30e063e043eda14e434367b87150d804771a72f1420fd390337"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "87d8fbe57600db5f2e20ace53a3fad4072f0fd8c",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/sdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIDPzJ1P1Munw5k9ywTYJsNLuhQl2q6VJcrnfNCejcSjEAiEA2pMZz0VwHBfEwBCKbF8IQ9/OAFj+JoqEdWkuhagW8t4=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI5MTFlYWRjY2FjZmM0ZWNkZjhjMmQwMTQ1ZDczZWVhNWZiNzRkMjRiNDk5NzEwYjMxNzM5NWI3YjY2MmY0ZGJhIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUQwSytLUXY0em1pTmEyUytUMHFtdW5FSVBsSTlocHZYeFBHTlNZL2ZGRkRRSWhBTTd4ZjFUMmxIdGVrKzNYNGhJQmpJdUo0all6aHVRcys3SlZRWWwxU2FrVSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndla05EUVhsNVowRjNTVUpCWjBsVlVqRmFaVk5oY1hGa05UWk1NV3RvU3psRGIweGlVRVUyTm1samQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1hoTlJFVjRUWHBKZWxkb1kwNU5ha2w0VFVSSmVFMUVSWGxOZWtsNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVV3TlVsNFlsaDJWVkl3UWpKYWRuTXJNWFJ4ZDJsRVpIVndTbFkxZGpWYVZ6aGxWWGdLUVdOUGRteGxjREk1YVRKYVJGSjNWM2xvWmpjMlMycEZRV3A2UmtSSlVFMTFXa3cwSzI1MWNXdE1ibFUxWlhoRE1rdFBRMEZyYzNkblowcElUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZwU21aekNuVjRWa3RPVVhWYU1uRkNjVEpoY1ROcmExbFZiRE0wZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6VG10aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdlQwUmthMDlIV21sYVZGVXpUbXBCZDFwSFNURmFha3BzVFdwQ2FGa3lWVEZOTWtWNldtMUdhMDVFUVROTmJWbDNDbHB0VVRSWmVrRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1ZWxwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIweENaMjl5UW1kRlJVRmtXalZCWjFGRFFrZ3dSV1YzUWpWQlNHTkJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUkN0Q2IxaG9aMEZCUWtGTlFWTkVRa2RCYVVWQmJFNW1SMWhETkVRcmJUbDJhVTQyZDFWRFdtTUtaV2hvVGtsTFV6aExPR3hZUW5Fd1pFUXlPSEZJVjJkRFNWRkRWWEl3TjBsV00yUkljR1ZpYjJGb1VIbFdRVnBzTldsSVVsVm5TVWhuVlhNMmVVWlFUd3BMV0hKTGMycEJTMEpuWjNGb2EycFBVRkZSUkVGM1RuQkJSRUp0UVdwRlFYbElXREpJYWtWemVHVlNkVk16VGpaTU9HVnBNMk5VU1hCdVpYaFVhWGRpQ25VelpHWXJTRVpXZDJKUE9FWlJVMFYwYUVKVFR6UjBWekZZUkRoS1ZqSjVRV3BGUVM5cVJGSktiRUY0VVdGeFJXbHdjamR1V1RaNkwwVTFhVEJ1ZUVRS04yRlBlVGtyTld0MFVEVkVSVVIyVm5OU1RIVm9VVWt2WldKU0wwRk9lVlpvVUVzd0NpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1666314812,
          "logIndex": 5530127,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/sdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/sdk",
      "githubWorkflowSha": "87d8fbe57600db5f2e20ace53a3fad4072f0fd8c",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3293928402",
      "sha": "87d8fbe57600db5f2e20ace53a3fad4072f0fd8c"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

