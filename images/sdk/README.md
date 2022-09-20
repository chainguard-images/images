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
| `latest` | `sha256:9d1fc70815f6308a1d8c83f44d80ec0ac40aaf17fc5417d8659add370aacab98`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:9d1fc70815f6308a1d8c83f44d80ec0ac40aaf17fc5417d8659add370aacab98) | `amd64` `arm64` `armv7` |


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
  --keyring-append melange.rsa \
  examples/gnu-hello.yaml

(cd packages && for d in `find . -type d -mindepth 1`; do \
  ( \
    cd $d && \
    apk index -o APKINDEX.tar.gz *.apk && \
    melange sign-index --signing-key=../../melange.rsa APKINDEX.tar.gz\
  ) \
done)
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
        "docker-manifest-digest": "sha256:9d1fc70815f6308a1d8c83f44d80ec0ac40aaf17fc5417d8659add370aacab98"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "234dd44ca8b611444d09a374ebe1eea32fc5e1be",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/sdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIAqiEBM2nXjiqT31dFXPKIbgwqV2pFzXD+OGzZNWLQ2CAiA4GReD2oAh2t/oL5X8MJN6kvnRTU4z39Hlsn/oPMznDg==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJlYjY2Zjc3M2RmMGQwY2MyYTY4NTNlMTM1ZmQyYTUzNDRiMzljMmYwY2FiYjI1NGQzY2FkNTQ1ZDg2Yzk1ZGE0In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJRGNRTlgrQ2FEZXJtdCs4blRpUTAvTXBvelZ2R2R3Q0Z5QXl1ZzlOeEg3eEFpQnpJQUluTC93ekVULzBIMU14bElLbjQzUnI2eWpDZUtvakltTTB4YXJhaWc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnZla05EUVhscFowRjNTVUpCWjBsVldVSk1lVkJpUmtjdk4yVlpObTFJS3pGblN6VnBWRzlQZEUwMGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hkTlZHZDVUMFJOTTFkb1kwNU5ha2wzVDFSSmQwMVVaM3BQUkUwelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVY1VFdkRVNHNVhURkJqZEhWckwzQkllazFsYmpOblMyNXRSMEo2VGlzeFpUUlhVSGdLYm5KSGFFUTNkMlozYm5CblZITlBhVTlxWmt4S1psUnhhbU5YUTI1YVowZ3llRXA1VXpsM1lVSkdaSFJYWW5ONFF6WlBRMEZyWTNkblowcEVUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZzUlVwQ0NtWkRTMmcxVUhSaGVqTnpNa2xwVkU4M09XcENkalJOZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6VG10aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwVm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkZZMGhXZW1GRVFUSkNaMjl5UW1kRlJRcEJXVTh2VFVGRlJFSkRaM2xOZWxKcldrUlJNRmt5UlRSWmFsbDRUVlJSTUU1SFVYZFBWMFY2VG5wU2JGbHRWWGhhVjFab1RYcEtiVmw2Vm14TlYwcHNDazFDZDBkRGFYTkhRVkZSUW1jM09IZEJVVkZGUkd0T2VWcFhSakJhVTBKVFdsZDRiRmxZVG14TlEwMUhRMmx6UjBGUlVVSm5OemgzUVZGVlJVWlhUbThLV1Zkc2RWb3pWbWhqYlZGMFlWY3hhRm95Vm5wTU0wNXJZWHBCWkVKbmIzSkNaMFZGUVZsUEwwMUJSVWRDUVRsNVdsZGFla3d5YUd4WlYxSjZUREl4YUFwaFZ6UjNaMWx6UjBOcGMwZEJVVkZDTVc1clEwSkJTVVZtVVZJM1FVaHJRV1IzUVVsWlNreDNTMFpNTDJGRldGSXdWM051YUVwNFJscDRhWE5HYWpORUNrOU9TblExY25kcFFtcGFkbU5uUVVGQldVNWpTMHg0WjBGQlFVVkJkMEpKVFVWWlEwbFJRMHg0VmtWTWNITXdTbVZ4YVdJdmMzRkVZMGh3TVM5cGFIRUtXVFpKTURSeldEQldWSFZVTTJZd01VeEJTV2hCVFhKQlREQk1TalZHTTI1T05YcG5jMnd6ZVhoUmR6ZHJUSE5rTkRSSU9YcG9TMGxLVjJKb1ZWZFJSd3BOUVc5SFEwTnhSMU5OTkRsQ1FVMUVRVEpyUVUxSFdVTk5VVU54UkZsYVYyUnpkVWRxTWxST2VWUlFNMVJvWVhkMVQxZEdWa3RXVTA5dGEzaE1NVTlwQ25kUlJpdHVlRE50TUhobVRrdFdjR292SzBSTGJEWkRabVJvYzBOTlVVTnhRamxwTUVJdlRWSm9VRkk0VVZOS1NsWlZiVlJpWjFaRmNuQlZORzlEYkZnS2RVaEZSbEZLTVVoeU9XcFNMMU51UVVSSGJVOUliR1ZYVERNelExbDFhejBLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1663698527,
          "logIndex": 3622355,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/sdk/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3092349608",
      "sha": "234dd44ca8b611444d09a374ebe1eea32fc5e1be"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

