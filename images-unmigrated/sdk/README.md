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
| `latest` | `sha256:2022b57eb583984a87d3f53e980145209862102e4bde0dab51f44da6d9725ed1`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:2022b57eb583984a87d3f53e980145209862102e4bde0dab51f44da6d9725ed1) | `amd64` `arm64` `armv7` |
| `0.0.1-r0-glibc` | `sha256:5a786a6240390957cd63ebb97be8523536c3c6757e7a89f47a9cb84750c28370`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:5a786a6240390957cd63ebb97be8523536c3c6757e7a89f47a9cb84750c28370) |  |


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
        "docker-manifest-digest": "sha256:2022b57eb583984a87d3f53e980145209862102e4bde0dab51f44da6d9725ed1"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "a4c7653af736c0867992e60f7805a907c0ccf8ef",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/sdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDEF8B6gYsZD0xoKjv+ZPXSD2PbGOAho3TBe4UcTbwzbQIhAN7ycISV3qSkRQKsVheXiJGUmcYdEnjiHjdAfuE1Bj8s",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJiYWM3NTU1ODg4YzBkYTcwNjc5N2Y3YTU1NDU2MWU1NzIyYjA2MTFjM2I4MGNmYzFjYTc0ZGY5MzkxNzQ3NTZiIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURvdWZvekxVeXhySXpPZnhrYTdPV0ZxRE1lWVlsY0tzOFk1T2psQVJOVlJnSWhBTVNaYVNMSGMwQUd2MWpyNVlyWUgzdEhkeEhZME5XbVlMbHhHTXFvRlpycyIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndha05EUVhsNVowRjNTVUpCWjBsVlQyUmlRblYzTXpWd2FqVnJjMGswZDNKTVZsbHdkbTQ1UnpoTmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlROTlJFVjRUMFJGTlZkb1kwNU5ha2w0VFZSRk0wMUVSWGxQUkVVMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZZVWxsU0swcG5SRWtyU0M5clZrbGFVbGR2TmtkQ2FTdFZTSFl3WWs0MU0wWndTRmtLWmxkT09HdFVhRFJPYTNaRGVtc3ZaemxIT0d0M1ZEaG5RMmR5TWtvclZrZFVWbVIxWmxWRVNEZEVhVGc1SzBSV1VHRlBRMEZyYzNkblowcElUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZHUzJKU0NsVXZla3h6WlZJd1RYcHlObEJhT1U0Mk1tRjNiRVpuZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6VG10aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdldWUlNhazU2V1RGTk1rWnRUbnBOTWxsNlFUUk9hbU0xVDFSS2JFNXFRbTFPZW1kM1RsZEZOVTFFWkdwTlIwNXFDbHBxYUd4YWFrRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1ZWxwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIweENaMjl5UW1kRlJVRmtXalZCWjFGRFFrZ3dSV1YzUWpWQlNHTkJNMVF3ZDJGellraEZWRXBxUjFJMFkyMVhZek5CY1VwTENsaHlhbVZRU3pNdmFEUndlV2RET0hBM2J6UkJRVUZIUldkNWNGSjBVVUZCUWtGTlFWTkVRa2RCYVVWQmNteElWRUZTVEZKMGFIbFlSRWswWjNReGRHSUtNSEF6YUZWRFRXSk9UMUZuWW5KSlJFWkhjVFo1U205RFNWRkVkV2s1WTNKeWRUbEtZMWxLVTNSUlEwRldRekpSV0hkaGNqbHRSWFJ2TWk4MVRtOVlOd28zS3pST2QycEJTMEpuWjNGb2EycFBVRkZSUkVGM1RtOUJSRUpzUVdwRlFUbDNlbUV5Wm5FeGMwbFlOUzluU1RCcE1FZHRZME15Y3pNd2VreHFkbWxXQ2pWR1lUUjZZbkZwVERCYVZGZFhUV1JKT0ZGalN6VldTV1UwTW5Wd2VrcEhRV3BCT1d4Mk9HdENMMWw2WWxsU1dUTkZTREJ0U1V0WU1FMXNaako2VlhFS1lVOVFaRXRyTkV0UmRYSm5hWFZpWkdsM1VucDRTSGh1WlVKSlVtZHdWVGhGTmtVOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1668647912,
          "logIndex": 7241386,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/sdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/sdk",
      "githubWorkflowSha": "a4c7653af736c0867992e60f7805a907c0ccf8ef",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3484284299",
      "sha": "a4c7653af736c0867992e60f7805a907c0ccf8ef"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

