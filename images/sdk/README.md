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
| `latest` | `sha256:a97d9ab2af0289c27f204deab76ee42b0ed35b121af973ea2328c7574559a93d`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a97d9ab2af0289c27f204deab76ee42b0ed35b121af973ea2328c7574559a93d) | `amd64` `arm64` `armv7` |


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
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys

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
        "docker-manifest-digest": "sha256:a97d9ab2af0289c27f204deab76ee42b0ed35b121af973ea2328c7574559a93d"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "e40dee15ffd55995633f3dc4b29cccafb43219a4",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/sdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCB2aMTPVz3A+yZLPSTxjVr4Tp1fXp4s4v/iHjYMwpzAAIhAPjwMBHFJW2Fyphd7oPsahlEzfI8AFbRPyHmgWRb9RGE",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI2ZjkxMTk1Zjg5NzkwZTRlODg0NzFiNTM5MjQ2YjMwOTdiZjFmNDVlYWEyMmE5YjkzODc1NzgxYjNmMjY2YzFiIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQWI4b29zUldnR2tJQW9seGFlYUpxMWVxcEtPWHNyemhlSUdOUmNWN1NrZEFpQkJ5eEZXd2tJVGNLTjdGWFNneVMvNnZWd0k5RWc4UHlRNjJ3d3d5K0RnT2c9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndla05EUVhsNVowRjNTVUpCWjBsVlYwSm9laXRhU1VKUVZXTkpjMjB2UjNGa1FYRXdSRVJNVUVWVmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUVROTlJFVjVUMVJOTWxkb1kwNU5ha2w0VFVSQk0wMUVSWHBQVkUweVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ3Vkc5MVNFUjNXalZ5VURncmVVZzVVR1J2V0ZKS2RURXZhRUZHUm04NFkySmtSa1FLTjFONldFbGxkellyWTBaVFlXbFlTRFZhVUU1U1pVMWhRbEpaZWpCUmR6RjRaMmt4TDFNeVpuTkxXbEJJVGpkQ2F6WlBRMEZyYzNkblowcElUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZSSzBWYUNpdDJTVWhKTVU1bWFWaE5OalJvYmtReVNrNDVjRU5KZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6VG10aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdldsUlJkMXBIVm14TlZGWnRXbTFSTVU1VWF6Vk9WRmw2VFRKWmVscEhUVEJaYWtrMVdUSk9hbGxYV21sT1JFMTVDazFVYkdoT1JFRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1ZWxwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIweENaMjl5UW1kRlJVRmtXalZCWjFGRFFrZ3dSV1YzUWpWQlNHTkJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUkhOQkwyOWpRVUZCUWtGTlFWTkVRa2RCYVVWQmFUZHNTek5xYjI5TFRsSk1Wa3B3TDBWNVdVNEtaRU00V1dKU1F6VkdVbXBIUWpKSmIxSlhXRzB4Y2tsRFNWRkRiWEZpTjI1SldEVkthVkZ1TW5WSFFXOHZhVzlpYUUwM1VqZDRkbVIyYlRKM2EwUlpMd3AzVDNvMU5ucEJTMEpuWjNGb2EycFBVRkZSUkVGM1RuQkJSRUp0UVdwRlFXaFdSVk52SzFadllrc3ZjMGhITW1ScGVYbFRUVzF4UWxCU1VXeG9jMUo2Q2tSQmRHZE9ZWEp0VFZOak5IUmlaSFkwYTBNcmRFZ3JOSEpaU25jNFZYQkhRV3BGUVhKS0sxZEhlWFI1Um10MFp5dHhhVzVUWjJKNGFUWnlhbE5wYmpBS1NpODFNa1Z1ZVZsa1pVUmtZekpIY1VkUmVrOXdkVEZOY0RoWk1rNHZkMU4xWmtoWENpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1665106185,
          "logIndex": 4597548,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/sdk/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3201470885",
      "sha": "e40dee15ffd55995633f3dc4b29cccafb43219a4"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

