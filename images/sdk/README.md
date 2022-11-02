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
| `latest` | `sha256:6952f0a5e6efa9f991fa49fa200695e453045afdb864d714d34a5bddddc65f89`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:6952f0a5e6efa9f991fa49fa200695e453045afdb864d714d34a5bddddc65f89) | `amd64` `arm64` `armv7` |
| `0.0.1-r0-glibc` | `sha256:6bdc647608ab9c3f30fc26389ae34cf3683350e6efa5172391b58fcfad75595e`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:6bdc647608ab9c3f30fc26389ae34cf3683350e6efa5172391b58fcfad75595e) |  |


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
        "docker-manifest-digest": "sha256:6952f0a5e6efa9f991fa49fa200695e453045afdb864d714d34a5bddddc65f89"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "6187bfb450f4e11643c2245fbcfa22c5a899c0b5",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/sdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCbG//O6cq/GXNpzKJHEEazlbbOSWVTuLTwLG3A2J/TBQIgfK5sewlEU3+42jXfIYeXOZ999oA6q2+vroka3eSraKg=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIxZGUwNjlkNDlkNDQ4ZjBiZGY4YjlhZTc2OWJiMjBiOGYzOWMxYjg3ZTMzNzIzYjE5YTcwZThiMTdkOTJlMDgwIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURKQWp1SmxDZS9DUUx4dFVGVllZMm5mKzBoYzRPWXF1WVN5a3UrV1phYTRnSWdZZUpEblNiNDRqcGZkL01PQUVyaXc0VE5zVHhIWGtuQ2hlUmJGSmhQK25jPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndha05EUVhsNVowRjNTVUpCWjBsVlJrWkdZV2hNZUhWdFYzWXhURXQxUVZFMlZtMTFORE01Y1dvd2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVhsTlJFVjRUMFJKTlZkb1kwNU5ha2w0VFZSQmVVMUVSWGxQUkVrMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVYwZWxSWVkyWXZiRVJNU1d0Tk1qbE1lVGhOV1U1bFdqSktla2gyUkZNMWEyeDBWallLVERsTmNrMVZRVVZpYTJWcU9WTlZNWGxRVWs5cFpsRTRhbk0xZVhkdGJUaGFiM2RLTWpsWE0xcFlja2w2VTBoTlNIRlBRMEZyYzNkblowcElUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlVyVlhWdENrOVVSRTVpUkZZeU56SkxSMloyWlhGUUwzQllhWFJuZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6VG10aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdlRtcEZORTR5U20xWmFsRXhUVWRaTUZwVVJYaE9hbEY2V1hwSmVVNUVWbTFaYlU1dFdWUkplVmw2Vm1oUFJHczFDbGw2UW1sT1ZFRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1ZWxwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIweENaMjl5UW1kRlJVRmtXalZCWjFGRFFrZ3dSV1YzUWpWQlNHTkJNMVF3ZDJGellraEZWRXBxUjFJMFkyMVhZek5CY1VwTENsaHlhbVZRU3pNdmFEUndlV2RET0hBM2J6UkJRVUZIUlU1bGMxVm9VVUZCUWtGTlFWTkVRa2RCYVVWQkt6VTVRMjgwVmxkVU5IcElRV1JZZWpOTVVrb0tSRlJwTVhkck4ybFFRMlZCYTBWb01EUnliMVJFYkdkRFNWRkRkbTlQUjBNMmNHTTRURzVMWm5wRVZVbHZVbUl3U1ZKelpWRTVZVEZDVTB4cFduRTVSUXBRVjBKUE4ycEJTMEpuWjNGb2EycFBVRkZSUkVGM1RtOUJSRUpzUVdwRlFYUjNTVFl4UmxOSlUwdDJLMFZ3YTBGU05YUmFlVlJWTkVaSk5GZEpaMDFTQ2xjd2JXdzBkVlZNT0VFemNtVmxOalZwY1daMlVWTkRZaTlpUjJSRFRGbG9RV3BDYUVoMWFGVmhNMkV2VUhKU1RVUnJWVEpaWTAxdldWSlNVRXhLZDFRS1ZtRTJRbWRCWjJwdlpGWjFUbVZCZGtOR1VFaExXSE56V1VKeGVWVm1TRlJuT0hjOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1667351917,
          "logIndex": 6324679,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/sdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/sdk",
      "githubWorkflowSha": "6187bfb450f4e11643c2245fbcfa22c5a899c0b5",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3373967626",
      "sha": "6187bfb450f4e11643c2245fbcfa22c5a899c0b5"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

