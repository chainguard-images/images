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
| `0.0.1-r0-glibc` | `sha256:6750ab05494e32f9e7edcbf31f9a00b3fb80c0c0a49118226a1a49c90f70170a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:6750ab05494e32f9e7edcbf31f9a00b3fb80c0c0a49118226a1a49c90f70170a) |  |
| `latest` | `sha256:111b8df8a23a3955d73f78aaf07f4f1b1893c1bbe5b20864a4dffa5891164739`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:111b8df8a23a3955d73f78aaf07f4f1b1893c1bbe5b20864a4dffa5891164739) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:111b8df8a23a3955d73f78aaf07f4f1b1893c1bbe5b20864a4dffa5891164739"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "c4d99becc784ceb80d9423006d442b5dc7a91b7c",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/sdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIDyIOqnAcVew+WQOWL9CxIpcbl0PhhJd+Ri9bpXQjqhJAiEA0M1CMCxSQY5jmsmlEM6CGOEPH3GqI+BGRQe0w9ABmUo=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJlOWI0Mzc3MGRmOTc0NmFiODEzNzhjYmUwNjI5NDkzNjdmZmJhYmZkYmE2MmI1NTY4MmQwODdkYTBiMjMxZTI2In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJRWV0SXE3WE1MRDN2Z0ZCanY2Vm12RWs5WGZtV0lKbzlVdDd3VjA4SkJMdkFpQTFSZUgwVG42MFRVd253K2RJSWVDOVNxdXh4ckgvWVhVei9NRm1uNlFzK3c9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndSRU5EUVhsMVowRjNTVUpCWjBsVlVWTXpVVXhpUlZsUFdtMTZNSGd5ZGxrM1ZIVnlSU3QwZURoUmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVROTlJFVjNUVVJGTlZkb1kwNU5ha2w0VFZSQk0wMUVSWGhOUkVVMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVUxYVRReGJGQnNXbVJwZUZSQ1lUVkxUalJCY1haR1pYWjJaM1pIV201b1duVkJaMW9LTlZORmVrWjZSbTFDZVZGSE5XTkVlbkZwTkdJNGFHcHlNbWgxTVRkSWEyWlNWR2RXV2taQmJuUkplVmM1ZHpWd1drdFBRMEZyYjNkblowcEhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZNWlUwNUNsazRXRlptV0VGVFUzVlNlbkZLWVU1VWRVMUNTRWswZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6VG10aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdldYcFNhMDlVYkdsYVYwNXFUbnBuTUZreVZtbFBSRUpyVDFSUmVVMTZRWGRPYlZFd1RrUkthVTVYVW1wT01rVTFDazFYU1ROWmVrRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1ZWxwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwdENaMjl5UW1kRlJVRmtXalZCWjFGRFFraDNSV1ZuUWpSQlNGbEJNMVF3ZDJGellraEZWRXBxUjFJMFkyMVhZek5CY1VwTENsaHlhbVZRU3pNdmFEUndlV2RET0hBM2J6UkJRVUZIUlZRMWJ5OXZRVUZCUWtGTlFWSjZRa1pCYVVWQloybFdjVk5zY1hkaVpsWkxUbkpLZEdSWFRFVUtRVWczVGxrdlRERllNM0JZTDNaelpGcEdlV0ZaZFVWRFNVaExUSFJEUm1ReWFrSlBkRTVYYUZkVVQwZzNSWHAwWVhCQ2NHNTNUR2huYkd4c1NUSjNXZ3B6VVdwUVRVRnZSME5EY1VkVFRUUTVRa0ZOUkVFeVkwRk5SMUZEVFVOUmMzTnFjRU5SY3paNlNXUTRTbWRyZEdGT2JFNDRSV1pNVFdRMFRWUkxXWFp6Q2tkNVVYaDVkMll3YkhwSVJHOVlSRGdyVTJGVmFFcGxkbUZ3UnpGS1VVbDNURmxLYjNsQ2IzaG9iVWhFZEhwcWJYbFpOVzg1WlVWdGVYTklaRWhDUmtVS0wwWmpSR1JMTmt0Nll6SkxlbmR2VURsNVowUlFibTVMUzFBd2FHaG1NR01LTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1667782828,
          "logIndex": 6649837,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/sdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/sdk",
      "githubWorkflowSha": "c4d99becc784ceb80d9423006d442b5dc7a91b7c",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3406678427",
      "sha": "c4d99becc784ceb80d9423006d442b5dc7a91b7c"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

