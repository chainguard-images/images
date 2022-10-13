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
| `latest` | `sha256:c57666232325011202e76c9516a1cb859ba574d27fdd8bda032ca5178b0f14ec`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c57666232325011202e76c9516a1cb859ba574d27fdd8bda032ca5178b0f14ec) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:c57666232325011202e76c9516a1cb859ba574d27fdd8bda032ca5178b0f14ec"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "0f676587cee10929858d286bc5dda57e54d7321e",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/sdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCICsQvIwyUlVLdmGvxt+TZ2XgRNZcNxRGkTEVkAhZBEgmAiBeE3YDzT8IJT4pVOkpHG/7g6sfstUXPdpQ2H0t0wGHPw==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJmNDQwNGRkMmJiZjUxYjRmYTE0MDNmYmI4M2YyNjE1ZGJiN2MyZmVkOTBjMGQ4YmU2MTMwODdhZDJjOGEzZjJlIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJRmIyU29XVmRVc3dqV2VXQTN5TUduSzVmRE5mRk13VlNHODF5WDc4cVdHQUFpQXRyVTdhU05qZ0hvZlhMYjgyQVVldnAwZWFKNjdSWDc4L01CaWRYcHFsNEE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndWRU5EUVhseFowRjNTVUpCWjBsVlNqSmhaRkpKWVZoUVdreGpOR0ZRYjJaQ1VtOVFNRU41YVhWbmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhwTlJFVjRUMFJOZDFkb1kwNU5ha2w0VFVSRmVrMUVSWGxQUkUxM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZLYURZeFJVZzJiVU5hWkdkM2RIazNOamR4TmxwamVGTlRRazFTVEVwV1lXWjBVellLUzNRNWRuRnViRTEyTW1zNGVHZE5aMEp4YWxKbk1HNHlZMWhVVG1oVVdVMDFlV3RDZW5WTVpERmhXa1ZxVEhVNEwwdFBRMEZyYTNkblowcEdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ1Tld4S0NuYzRUMVE1VEZob1ZqaGxTekJHYUVVek1sbHNUWFZWZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6VG10aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdlRVZFpNazU2V1RGUFJHUnFXbGRWZUUxRWEzbFBWR2N4VDBkUmVVOUVXbWxaZWxacldrZEZNVTR5VlRGT1IxRXpDazE2U1hoYVZFRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1ZWxwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwcENaMjl5UW1kRlJVRmtXalZCWjFGRFFraHpSV1ZSUWpOQlNGVkJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUkhwMWRtNTVaMEZCUWtGTlFWSnFRa1ZCYVVFM1duZ3ZNbGhWVW5acWNrWTJZV296Vm1wNGNEVUtRVkZEWXpodWRqWjRjV2dyTXpsc1RUSXZSMXBoWjBsbldsbGhlbkl6T0ZkRFNFaHlSRzlQT1ZSVFdsUjFVRVU0TVdGeGVHeGhiR3hOZDNCcllsUjRXQW8yVkRoM1EyZFpTVXR2V2tsNmFqQkZRWGROUkdGUlFYZGFaMGw0UVVwdWJtMTRjVk14UVV0d2IwMURjV0o0Y0M5VVMwMXBSVlk0TUZSNlpGUjVSVGRVQ25oYVkyWlZkek5vZDJFcmJ6ZHhlRVJGZUdseFJWTXlRamh6Vmpoa1VVbDRRVXBLUlRFeFJGRjZRMnc0Ynk5RVZUY3pZVFJ5UVd4SmJHVmFXRXBQTTJ3S1JYTjZjME5PUzNwSFdVY3dkeXRNTVVkd1lsTnNXSE5KWW0weWJsaGFPVmhLZHowOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1665623920,
          "logIndex": 4996471,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/sdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/sdk",
      "githubWorkflowSha": "0f676587cee10929858d286bc5dda57e54d7321e",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3238873642",
      "sha": "0f676587cee10929858d286bc5dda57e54d7321e"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

