# sdk

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/distroless/readme-generator
-->

[![CI status](https://github.com/distroless/sdk/actions/workflows/release.yaml/badge.svg)](https://github.com/distroless/sdk/actions/workflows/release.yaml)

Development image for [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/sdk:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:bd586070ce183c4a900c1fa88e82196ceab9bbf382611d00a8305b2d0fc33d50`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:bd586070ce183c4a900c1fa88e82196ceab9bbf382611d00a8305b2d0fc33d50) | `amd64` `arm64` `armv7` |


## Usage

### With melange

Clone down your development fork/branch:

```
git clone https://github.com/chainguard-dev/melange.git
cd melange
```

Run the image, mounting the repo workspace (`--privileged` flag required):

```
docker run --privileged --rm -it -v "${PWD}:${PWD}" -w "${PWD}" distroless.dev/sdk
```

Upon entering the image, you should see the following welcome message:

```

Welcome to the distroless development environment!


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
docker run --rm -it -v "${PWD}:${PWD}" -w "${PWD}" distroless.dev/sdk
```

Upon entering the image, you should see the following welcome message:

```

Welcome to the distroless development environment!


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

All distroless images are signed using [Sigstore](https://sigstore.dev)!

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
        "docker-reference": "ghcr.io/distroless/sdk"
      },
      "image": {
        "docker-manifest-digest": "sha256:bd586070ce183c4a900c1fa88e82196ceab9bbf382611d00a8305b2d0fc33d50"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "aea1f350be11ea313dcb84699ef9c4f0aae74668",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/sdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIFgXzrvPyb1YJ7BBAV868KE1AuZb7pKhLUb/XIuNv6hDAiEApjIG/pI/TVuhwDR1VzioiKg5/lb8GTnjmrNUx89Ofbg=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJkNWExYmJkNmZjNmJiNzMwZjc2NTMwNjc4ZjA4ZDRjZTZkMTY1ZjhlMTI2MjcwNzFkOTgyMjg1MTliMGM1NTA2In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNCbTJURHFlSXVvZjZYOUJGMU9GZ1FqU2hiM0xhRDUxR2NpMGhhd1JGTXJRSWdKbjVBa3Q0T21OemtEUVdGNG9MVU9XbWxNTTI2endBOXh6bmErWkswMFJzPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnJla05EUVhodFowRjNTVUpCWjBsVlN6ZHVaM0ZwUVZKaFVubEdja1ZqZVhsTGRHMTRhMlEyWmxoamQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRWTmFra3dUa1JSZDFkb1kwNU5ha2wzVDFSRk5VMXFTVEZPUkZGM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZXZDBwRmVTOVhVMUJGZWxSQmFGRlljbWgyT0RWdE1FWmtZMnRtWldSTFNHSnBhSGdLY1M5UU5rdDRaelJrWVcwMFFURnpOMHRQV2xadVkwTTBNMWRZVHpkWWJFb3dWeTh5VldSTWRVUTViRGwxTDBOc2NtRlBRMEZxWjNkblowa3dUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZVTlRKMkNtRlRkM3BoV2tkbFNrZzVWRzB2UmtsaVpqSkNRblE0ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFobldVUldVakJTUVZGSUwwSkdVWGRWYjFwUllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BqTWxKeVRIazFibUZZVW05a1YwbDJaREk1ZVdFeVduTmlNMlI2VEROS2JHSkhWbWhqTWxWMVpWZEdkR0pGUW5sYVYxcDZUREpvYkZsWFVucE1NakZvQ21GWE5IZFBVVmxMUzNkWlFrSkJSMFIyZWtGQ1FWRlJjbUZJVWpCalNFMDJUSGs1TUdJeWRHeGlhVFZvV1ROU2NHSXlOWHBNYldSd1pFZG9NVmx1Vm5vS1dsaEthbUl5TlRCYVZ6VXdURzFPZG1KVVFWTkNaMjl5UW1kRlJVRlpUeTlOUVVWRFFrRlNkMlJZVG05TlJGbEhRMmx6UjBGUlVVSm5OemgzUVZGTlJRcExSMFpzV1ZSR2JVMTZWWGRaYlZWNFRWZFdhRTE2UlhwYVIwNXBUMFJSTWs5VWJHeGFhbXhxVGtkWmQxbFhSbXhPZWxFeVRtcG5kMGhCV1V0TGQxbENDa0pCUjBSMmVrRkNRa0ZSVDFFelNteFpXRkpzU1VaS2JHSkhWbWhqTWxWM1NFRlpTMHQzV1VKQ1FVZEVkbnBCUWtKUlVVOWFSMng2WkVoS2RtSkhWbm9LWTNrNWVscEhjM2RJVVZsTFMzZFpRa0pCUjBSMmVrRkNRbWRSVUdOdFZtMWplVGx2V2xkR2EyTjVPWFJaVjJ4MVRVbEhTMEpuYjNKQ1owVkZRV1JhTlFwQloxRkRRa2gzUldWblFqUkJTRmxCUTBkRFV6aERhRk12TW1oR01HUkdja28wVTJOU1YyTlpja0paT1hkNmFsTmlaV0U0U1dkWk1tSXpTVUZCUVVkRUNsWXJlazkwUVVGQlFrRk5RVko2UWtaQmFVRnVjekk1VWxaMlRsRmtha01yWW5sa2NYUm1WVWRyUW04emRGcFNWbmwzU25GNE5tOTVjSFkxWjFOblNXZ0tRVkJyWmk5UFdVcEdVVXBuUlRsRGRUVkJkSFkwU2tGTlJ6QmxkMGxUWmxCbU1WRXhPWEJEWjNFeFVHeE5RVzlIUTBOeFIxTk5ORGxDUVUxRVFUSm5RUXBOUjFWRFRWRkRNbnBJVjNkSVMxVTFkWEowYkVONEsyOHpaVE01YlRaaFZqRlJLMk5RTkZvMVNFeFhUakJQYzBzeGFEVjRTSGMxV21SbmJIQTFjbTh2Q25GTFMyOHdWWE5EVFVJMFRtWXlRbWxsVjA5c1VVeFBObTlOVjNaTldUbHhNSFJXS3l0dmFGcFVNR3RsTm1sMFYyRmhNVk5IU2xkMFNEaEpWelZRUjBzS1oxQnZjVUZJWWk5NVFUMDlDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1663627496,
          "logIndex": 3566106,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/sdk/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3085955459",
      "sha": "aea1f350be11ea313dcb84699ef9c4f0aae74668"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

