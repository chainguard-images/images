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
| `latest` | `sha256:3582fad535141c97f44100824c8dfa5a8ad348f309ccbaebd9306fd5059aa9d5`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:3582fad535141c97f44100824c8dfa5a8ad348f309ccbaebd9306fd5059aa9d5) | `amd64` `arm64` `armv7` |
| `0.0.1-r0-glibc` | `sha256:657fbae51d6d83beb6ee26094e9b04a6df6c8bbe03566a0260dd09b6b84fac2f`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:657fbae51d6d83beb6ee26094e9b04a6df6c8bbe03566a0260dd09b6b84fac2f) |  |


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
        "docker-manifest-digest": "sha256:3582fad535141c97f44100824c8dfa5a8ad348f309ccbaebd9306fd5059aa9d5"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "93ffab577d92f41a1cccdf08353d554759e245d8",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/sdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIBwKsuNj0jmh1+VQkttJMkc06SmZH1N0GKLBBy+vQiV4AiEArstN6AEmXruPZNUOIGmvKue2SSgxHQ4uQ9+PPTG2t1k=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI1MTg1YzkxZGI2ZWQ0NzE2YzY2MjY4NjE0MTA1YzVkN2JiN2MwODFjNzNlZWI4MmYyMDQzMzY5MjI1MjEyYzVkIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURLU29nQlhJNS9FTVAweXkvMzg1dDdYSU1CVDl6RklFelhnd3hpN0NOSXJRSWhBSTRrL3h2Q3FVSm9PQU9ma284cWJOYjlQMmJtZ2FjRDE2cFRiWlQ3cVlQYiIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnZha05EUVhsbFowRjNTVUpCWjBsVlVtTkxORXRyTmxWTGF6QmpPRGxsYkZwdGVWVlZTelJNYjBORmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRSTlZHY3dUMVJOZDFkb1kwNU5ha2w0VFVSRk5FMVVaekZQVkUxM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZTTkVOYVZtODNiVU4xTUhKcFUwZEtTVTVUZVZBMFZEWTVWVFZ1Y2pCd09YRjJXRFFLUkUwM1VEUm5Ra3B4Um1zMVQyMURUWGxNU0ZCNlZrVm1ZVTVRZW5CVFdGb3hVMDlJYm1obU5qTldjbVJoTW1aR1RrdFBRMEZyV1hkblowcERUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZhWVdsbUNrRkxjWG8wWmpWRk9GVm9WVWRQVFhCdWIwMWhVeXROZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6VG10aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwVm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkZZMGhXZW1GRVFUSkNaMjl5UW1kRlJRcEJXVTh2VFVGRlJFSkRaelZOTWxwdFdWZEpNVTU2Wkd0UFZFcHRUa1JHYUUxWFRtcFpNbEp0VFVSbmVrNVVUbXRPVkZVd1RucFZOVnBVU1RCT1YxRTBDazFDZDBkRGFYTkhRVkZSUW1jM09IZEJVVkZGUkd0T2VWcFhSakJhVTBKVFdsZDRiRmxZVG14TlEwMUhRMmx6UjBGUlVVSm5OemgzUVZGVlJVWlhUbThLV1Zkc2RWb3pWbWhqYlZGMFlWY3hhRm95Vm5wTU0wNXJZWHBCWkVKbmIzSkNaMFZGUVZsUEwwMUJSVWRDUVRsNVdsZGFla3d5YUd4WlYxSjZUREl4YUFwaFZ6UjNaMWx2UjBOcGMwZEJVVkZDTVc1clEwSkJTVVZtUVZJMlFVaG5RV1JuUVVsWlNreDNTMFpNTDJGRldGSXdWM051YUVwNFJscDRhWE5HYWpORUNrOU9TblExY25kcFFtcGFkbU5uUVVGQldWQnpZbVV3VDBGQlFVVkJkMEpJVFVWVlEwbFJSRTFUY25KcmFHdGhPVkZPU1VOWlkwVmlZbGt6TVZneFRUVUtURVJqY0hreGREZDZNazAxY0dOc1RGcG5TV2RtZVZKS1Mxb3hhMHh6TUdKbU5Xc3dZbTh5ZFVWWlNFRlZNa050ZUZkUlpscDRjR0ozZUNzclQyeHZkd3BEWjFsSlMyOWFTWHBxTUVWQmQwMUVZVkZCZDFwblNYaEJUM0I0VTFkNVYyOVpkRlYxU1hKMlltNHpSbWRwZVVoM1IyVnVZMWhRVlU5eFpIcG1iakl4Q2tWV1JIZzBUbFJEVkZaS1Ftd3dPVVkxYld0cVZtOVVUV2gzU1hoQlVIZEJWRWhyWjB0TVNXZHBhMU5MVmtGeFVtWmpaQ3RqVEVaV1YydGhjamRuY1ZVS01qbDJaR04wTTAxTVRVUmhNVlJTU0hsdWJuUk9RVVZtWjJOaVdtbFJQVDBLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1666118996,
          "logIndex": 5380242,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/sdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/sdk",
      "githubWorkflowSha": "93ffab577d92f41a1cccdf08353d554759e245d8",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3275799572",
      "sha": "93ffab577d92f41a1cccdf08353d554759e245d8"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

