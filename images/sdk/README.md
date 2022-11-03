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
| `latest` | `sha256:1dff9cfc10f9ca4ace7df10d80656034631807248e87e8a92ebde0fdddaaf18d`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:1dff9cfc10f9ca4ace7df10d80656034631807248e87e8a92ebde0fdddaaf18d) | `amd64` `arm64` `armv7` |
| `0.0.1-r0-glibc` | `sha256:7373ab07030f3d66aad6c5afea22754778be12726061cc1de5b912472ab58af9`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:7373ab07030f3d66aad6c5afea22754778be12726061cc1de5b912472ab58af9) |  |


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
        "docker-manifest-digest": "sha256:1dff9cfc10f9ca4ace7df10d80656034631807248e87e8a92ebde0fdddaaf18d"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "e1c5f9547dd93fd04f5c0293ca2c61388a601641",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/sdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQD9TYmunV1BU6Sdl7YC801xtUXsw7lt82I/Rj3oSs7IxQIhAMCHO/AK4x3c9cp9n7Jja1pkQX/PdT0avXKNYaygOd4z",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI4OTg5ZTE4YjBmYjExNjU5ZmJhMDk0M2U3NDljOWMxYTJlZjcyODU4ZGQ2ZWZkMDczYTQ3NmUxOTFkZWNjYTQ1In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNSQ0hFSHI4TmZobzI2SXM3WWJFTmdyTmE4VEVZajd5aDdMYmdPQ1JKMWtnSWhBSXdpUXFmeVV6dTRYYnpBRzBwMm1tTnlTN04xc2J4UEkxbW5FTkp6QlhsVSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndSRU5EUVhsMVowRjNTVUpCWjBsVlpsZHNTV1ZqUWtaTGRFMUhiRmhEV0RVeVYwbG9jalkyVjNNNGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVhwTlJFVjNUbXBKZVZkb1kwNU5ha2w0VFZSQmVrMUVSWGhPYWtsNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVV5VEZORlJEUk9hRFpxZEVkdGRreHdlaTlqVG1RNWNGQXpUMnhvTDBkNlJFSk9VRWdLT0cxSk5ubzNXSFYyVDNscVVpOHhOVFZSVWxnd05FRTBjRVZyYlRGdmRFSkdaSE5zWVhKeVdFUXZWbUZaUjJZdll6WlBRMEZyYjNkblowcEhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ3V0RoNkNqZFFVM2c1TXpsM0wweFpVMUp2ZGtKelEwVjJSRFJKZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6VG10aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdldsUkdhazVYV1RWT1ZGRXpXa2RSTlUweVdtdE5SRkp0VGxkTmQwMXFhM3BaTWtWNVdYcFplRTE2WnpSWlZGbDNDazFVV1RCTlZFRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1ZWxwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwdENaMjl5UW1kRlJVRmtXalZCWjFGRFFraDNSV1ZuUWpSQlNGbEJNMVF3ZDJGellraEZWRXBxUjFJMFkyMVhZek5CY1VwTENsaHlhbVZRU3pNdmFEUndlV2RET0hBM2J6UkJRVUZIUlU5M1dsYzJkMEZCUWtGTlFWSjZRa1pCYVVGaU5IVm1TRFZwTW5wRk9XOHdRbEExUzFRM2QxQUtUak5hUzNkM1V5dElhbFJzVGk5d1lsaENWbmN5WjBsb1FVeEtUM0ZqTlM5blJEQlFkbEZuSzA5c2IxbEhSRFJHTjJ0aVZuaHdOMFZtVEZWMGN5OHdLd3BuT1M4eVRVRnZSME5EY1VkVFRUUTVRa0ZOUkVFeVkwRk5SMUZEVFVjMlFWY3ljMFV6UkZSSlVuVlhMM1ptTVRSamRUaGFWWGhVWVdSU05pdElTRlJ6Q2xGWGVIaHVORkJzWTJnNE5uRkxRelZRV0VzNFUxRnZVMFJEVkVVMlVVbDNVSEJUYVVkeUswYzRhV0UzVEdWTU1XeHJSREJJVlZkRlNXRXhUMkkyVFVvS01USm5UbkJHYWxkUlVEVXdaM0pEVW1SRWNUUnVOMVExYjNoM01XZzFVRTRLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1667437592,
          "logIndex": 6392820,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/sdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/sdk",
      "githubWorkflowSha": "e1c5f9547dd93fd04f5c0293ca2c61388a601641",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3382154829",
      "sha": "e1c5f9547dd93fd04f5c0293ca2c61388a601641"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

