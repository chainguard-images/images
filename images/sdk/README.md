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
| `latest` | `sha256:ff6969814c536cd1f1688b45f69cc27f5483de16b9cd237a4325896872f589b5`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ff6969814c536cd1f1688b45f69cc27f5483de16b9cd237a4325896872f589b5) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:ff6969814c536cd1f1688b45f69cc27f5483de16b9cd237a4325896872f589b5"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "96a5329faac0ac09317fd70e39bc71f18de5eafd",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/sdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIHqM0PGXGE9CaoZKA7zKwmfu6IzolYc3zeZGp6iR4v3OAiBBLZwyf9bojlKEmHsQ5jPfJ97XHpfC+D0RcYbwKs4Jqw==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJhZDc2YTcyYTg2NGIyODA0YWMwMmRlNDA4MDhkNGY0M2YyZWM5M2Q1Njk0Y2Q5MWYzMzA0Y2Q3ODM4MjBjYjI0In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJRG42UDRWb21QQ0p4M0x3Yks4aHpNdGR0SEtCcmtWZHBMRnFTVUM0ZDlXNUFpQWhuUjdvOUwrczI3NjJwa1ZXVnFBRzFLTTBCNURkTElOMFgwd1dmZ2luZEE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndWRU5EUVhsNVowRjNTVUpCWjBsVlMwOVFZWFpUTWpKVFUwOW9TSFZTWjBwcmJsbG1ha280TUZkSmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhkTlJFVjVUbFJGTkZkb1kwNU5ha2w0VFVSRmQwMUVSWHBPVkVVMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZTV25KVFRpdFFkbVJ5ZDFjMVdrSmxVbGRGTmpGeGRsUTFZa3d2ZUVSdFRERXhlR2dLWVZGU1VVSmpMMmhyVDNaRFpUaHpZMkZ5TjNnMldtZFlRV3hJV1Rrd2VHUjNPWGRJWms5MWJXcE9MMjVyVEU5SlZ6WlBRMEZyYzNkblowcElUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZQUWpkbkNsZEtkblkwWVhRelNucHZOMFJYUTBSdlEySnlkelZWZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6VG10aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdlQxUmFhRTVVVFhsUFYxcG9XVmROZDFsWFRYZFBWRTE0VGpKYWEwNTZRbXhOZW14cFdYcGplRnBxUlRSYVIxVXhDbHBYUm0xYVJFRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1ZWxwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIweENaMjl5UW1kRlJVRmtXalZCWjFGRFFrZ3dSV1YzUWpWQlNHTkJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUkhZek9FNXhVVUZCUWtGTlFWTkVRa2RCYVVWQmFteDRLemhqWlRkcFF6VlVaRXBYVTNwalZHa0tOVmRUU1dzNWRGbzFaMmRMZVc1M1pUWk9SSGxsWjFGRFNWRkRSR1pJUm5NeVptSjNZWEkwTmxBNFRYbExMekZFZG5JeUt6UmtkM2M0ZW5SbmEwMXFWQW81V1VZeldIcEJTMEpuWjNGb2EycFBVRkZSUkVGM1RtNUJSRUpyUVdwQ2RtRTRhVk5STjJRdmJ6RkViMEZLY2tKeFJVMWpWbFYyU25Cck9FTXhOakZwQ21ONGRrcFhiV0ZGTjI1Q1ZsVnRTSG9yWm5rNWNuRTBjVlF6TlZjck1qQkRUVVZOYms5cFNVOVVUV3BCTXpCYUwwRTFabXBTZFVwR01qUndSMnBPT1RVS1drYzNVR3g2UVRZeWNrWk5WMVEzYlRkelFqRllWbWRMT1dsc1Z6VkNhM0ZDUVQwOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1665365125,
          "logIndex": 4785599,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/sdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/sdk",
      "githubWorkflowSha": "96a5329faac0ac09317fd70e39bc71f18de5eafd",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3216167897",
      "sha": "96a5329faac0ac09317fd70e39bc71f18de5eafd"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

