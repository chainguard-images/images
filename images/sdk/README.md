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
| `latest` | `sha256:7e54b34dac2322c008efa1cddc4d2d9deb028c2c06d95a68f74aea0f1b4da414`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:7e54b34dac2322c008efa1cddc4d2d9deb028c2c06d95a68f74aea0f1b4da414) | `amd64` `arm64` `armv7` |
| `0.0.1-r0-glibc` | `sha256:f0262b05ffe0d7378e53da29ee62c5bae8e34d61006b85e1717cb6451b8c98b5`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:f0262b05ffe0d7378e53da29ee62c5bae8e34d61006b85e1717cb6451b8c98b5) |  |


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
        "docker-manifest-digest": "sha256:7e54b34dac2322c008efa1cddc4d2d9deb028c2c06d95a68f74aea0f1b4da414"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "d368a0267ae65970a923bfe2f1440a4e8c05034e",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/sdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCeSZtvMoNPTNwP/sdNF58mSi9BH/rxLwZWFZJ2TEwKcwIhAKdw6p8GDSRcBS4+wLTJJJkxhUUaRdjjkVZVjE/6UT5N",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJmYzU1YmVjM2QyMDlkZTlhMmYzZGY3MWUxN2I2MmI3ZmUyZTQzMjI1NzgzYjIzYTZmMDBmODUwOWNjMGNjODdiIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNNN3AwdEJyUVpOamRTQjgwUFNQNlMzejJvWnVpazEvZXkrKzhpTHdwVC9nSWhBSTJjRk10K3FCTnpESmN6WFllWll2L3RLNW1DblpPZzd0Q2Y1L1UwT2tBSSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndha05EUVhsNVowRjNTVUpCWjBsVldGRXhXRVJ2VDFwaWQwaFdlRVY1TWxSVEwzWnJkekJTUzNadmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRWTlJFVjNUa1JKZUZkb1kwNU5ha2w0VFZSQk5VMUVSWGhPUkVsNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ5VDJsSlJuSjRUalZKVmxvMFR5dHZNSE5pUVdwTE9WQjRWSGhXV21Kc1NpOHJVRzhLTDFoak5XdFJURFV2UmxBMVkwa3dkSFo2ZERWT2RWcFFXWEV5Y0M5cWNWSnhPR2RTYkRsTE1sbGllbXh1Ym1reVZHRlBRMEZyYzNkblowcElUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ6UjNwQ0NqRlBOV1pWTlVsUlEyaHhPVWx2YVhBM2NXOTVTRGhGZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6VG10aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdldrUk5NazlIUlhkTmFsa3pXVmRWTWs1VWF6Tk5SMFUxVFdwT2FWcHRWWGxhYWtVd1RrUkNhRTVIVlRSWmVrRXhDazFFVFRCYVZFRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1ZWxwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIweENaMjl5UW1kRlJVRmtXalZCWjFGRFFrZ3dSV1YzUWpWQlNHTkJNMVF3ZDJGellraEZWRXBxUjFJMFkyMVhZek5CY1VwTENsaHlhbVZRU3pNdmFEUndlV2RET0hBM2J6UkJRVUZIUlZkbGNYQnhRVUZCUWtGTlFWTkVRa2RCYVVWQk5UWlpkM1EwTVVwSmNEYzVkRTVqTlU1UlRsY0tUelZJZVU4cmMyODNURTloYVhObll6RjJZazE1YTJ0RFNWRkViMGRzT1VSQmNUUnhXR3ROS3pseGVuQjNUVGhJUzNCYU5HRllVMmxsVlZsQlEzSklNZ3BtTDJSbVZYcEJTMEpuWjNGb2EycFBVRkZSUkVGM1RtOUJSRUpzUVdwRlFUVnVNVXBaZUd4Uk1VUTFjMWRJVlZWVFNrcHBUM05QTVdJMUx6RnlPREpwQ2pKWVprSkhTbFFyTXk5YVYwNDBLMDVhTTJ0a2MwRlllVkZWVVV0aEwyVkVRV3BCYlhGTmFUaFRNemRtUzIxaWRXZDNObE5vZW5GVU5rcFBPV1ZOVjFRS1JFWlhhWFpvWTJsWFdqUlpNRkY1Y2taaWVYYzJhWFZWZUdzd2JIQTVkVE54UTBVOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1667955872,
          "logIndex": 6756653,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/sdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/sdk",
      "githubWorkflowSha": "d368a0267ae65970a923bfe2f1440a4e8c05034e",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3424348947",
      "sha": "d368a0267ae65970a923bfe2f1440a4e8c05034e"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

