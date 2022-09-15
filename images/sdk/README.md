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
| `latest` | `sha256:fe9bc10df64017f60ed15331390cdbbc057e8efca0a9da45f03efc491e0d3286`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:fe9bc10df64017f60ed15331390cdbbc057e8efca0a9da45f03efc491e0d3286) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:fe9bc10df64017f60ed15331390cdbbc057e8efca0a9da45f03efc491e0d3286"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "53d027af514987c607668f9b122bcb296029f7bf",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/sdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCICy26ibg/yozszx48BjWwYv0MuORkY6MRf/NXJD5IRRGAiEAzIeQJGLOhCGOW2pRtLCGy07VjT9GxiwvBYT+swEt8t8=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIwMTM0ODNiNzhjMmI1MDk2ZTIxZTY2YTA3NjJjMThiYTY0MWU2MGZhZDFkMDExMThhMzc5NjQ2ZDA1YTgyZGU2In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUMwUnBGdFNBYVduWktYZ3FSYUNFeWZXbWhWcGp4Z2pHQnJ4V0VNZjJHRUN3SWhBUHQrelFtV01meU1IbTV1WnZPengxQ0MvRm1ZZ0xweHR3ZmxlTVhMcjUwaiIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnNSRU5EUVhoeFowRjNTVUpCWjBsVlRXMHZUVWxYTkVoRVJsVm5TR1ZhZEdOUWNUWXhNVVpPYkV0SmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRGTmFra3hUVVJGTVZkb1kwNU5ha2wzVDFSRk1VMXFUWGROUkVVeFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZzY0RkTU0wRkdiMFEzWlhaQ2FEWnJUMFZITUdZek1VUmxURWN5VHpNMk5XRTJZVk1LVUdKSE5WZENSSHBPWjJoTkt6SmtXbTlrU0dRd1RVMVJaRXQxZEhFM2NIVXZPRFJMV0c5WWQwTnFWaXR4YVdONGRYRlBRMEZxYTNkblowa3hUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ2TTA1b0NsSnNRbmhRYUVkWlMwUlpiR2xzVWl0YVpYQnBUbmxCZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFobldVUldVakJTUVZGSUwwSkdVWGRWYjFwUllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BqTWxKeVRIazFibUZZVW05a1YwbDJaREk1ZVdFeVduTmlNMlI2VEROS2JHSkhWbWhqTWxWMVpWZEdkR0pGUW5sYVYxcDZUREpvYkZsWFVucE1NakZvQ21GWE5IZFBVVmxMUzNkWlFrSkJSMFIyZWtGQ1FWRlJjbUZJVWpCalNFMDJUSGs1TUdJeWRHeGlhVFZvV1ROU2NHSXlOWHBNYldSd1pFZG9NVmx1Vm5vS1dsaEthbUl5TlRCYVZ6VXdURzFPZG1KVVFWTkNaMjl5UW1kRlJVRlpUeTlOUVVWRFFrRlNkMlJZVG05TlJGbEhRMmx6UjBGUlVVSm5OemgzUVZGTlJRcExSRlY2V2tSQmVVNHlSbTFPVkVVd1QxUm5NMWw2V1hkT2Vsa3lUMGRaTlZscVJYbE5iVXBxV1dwSk5VNXFRWGxQVjFreldXMVpkMGhCV1V0TGQxbENDa0pCUjBSMmVrRkNRa0ZSVDFFelNteFpXRkpzU1VaS2JHSkhWbWhqTWxWM1NFRlpTMHQzV1VKQ1FVZEVkbnBCUWtKUlVVOWFSMng2WkVoS2RtSkhWbm9LWTNrNWVscEhjM2RJVVZsTFMzZFpRa0pCUjBSMmVrRkNRbWRSVUdOdFZtMWplVGx2V2xkR2EyTjVPWFJaVjJ4MVRVbEhURUpuYjNKQ1owVkZRV1JhTlFwQloxRkRRa2d3UldWM1FqVkJTR05CUTBkRFV6aERhRk12TW1oR01HUkdja28wVTJOU1YyTlpja0paT1hkNmFsTmlaV0U0U1dkWk1tSXpTVUZCUVVkRUNsRXhhRFZuUVVGQlFrRk5RVk5FUWtkQmFVVkJOMGRpUlVZclJEY3ZVV2xET1V0S1VYTnNURnBRYlV0VlpXUmlkbGhKUVdNcldEZzBRVVpvVG1oNFZVTUtTVkZFTWl0WlEwWXJiV3BvWVZsNFNYbFhlV0ZVZUZwb1dteFhUbEZVU0ZZeGMwZE9URXMwUzAxNFIxZFJWRUZMUW1kbmNXaHJhazlRVVZGRVFYZE9id3BCUkVKc1FXcEJkMDVrTTJFd2JGQnVUSHBuZUZwSVEzVkVXVVpKZW1OTk9IWmpiMlJyVGtSMmQyaDRZbEZSTVd0QllWRmxibWx2TkRBMUsydzVkMko2Q2pKWGVHTnJUVUZEVFZGRFVXaFFkRlpIY1c1eU5ISmxXRzVPT1ZndlVsaEpRVlZGUjJoSlJWZHBaVlpXTVZFMVFWaG5MMkZ2UTB3eFMxSkpNbHB6Y200S01IRkJMM05ITjJ3M2RVRTlDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1663282223,
          "logIndex": 3511485,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/sdk/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3064092491",
      "sha": "53d027af514987c607668f9b122bcb296029f7bf"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

