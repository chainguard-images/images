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
| `0.0.1-r0-glibc` | `sha256:f0262b05ffe0d7378e53da29ee62c5bae8e34d61006b85e1717cb6451b8c98b5`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:f0262b05ffe0d7378e53da29ee62c5bae8e34d61006b85e1717cb6451b8c98b5) |  |
| `latest` | `sha256:9480522dabc997d0f54999abcc04f4b37b4b55dce250160aa14b516691766661`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:9480522dabc997d0f54999abcc04f4b37b4b55dce250160aa14b516691766661) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:9480522dabc997d0f54999abcc04f4b37b4b55dce250160aa14b516691766661"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "workflow_dispatch",
      "1.3.6.1.4.1.57264.1.3": "ecf2493ce5a6c896c54e945105c05b5017a557eb",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/sdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIBd+dQOAR/IfDm0eQgaosk8G1do2Ixn2xDLZwW8LiEpkAiBo+EMwQSpMfSl4KXjQ4VjL8oHycS1Wa+AbKbZsOp0ctQ==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI1ODk5Njk1MzVjMjJiMDkxNmYyODNjYmMxNDZhOGY5NjVhZTU4NDc0YzY2NTAwNzIxNzFjODQ3MmRmMjJjNDA3In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQXdLNld2MnpOSVdvdEhCYWQxK2ZiYm13bExUNUc0am1zOUE0TjBXbXc0cEFpQTB3Y1NhaWdXT1ZvZ2NUQTBFRGpVTm1qZ1d1Ky8welh4cHZMR3ZuTWJISEE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpSRU5EUVhwWFowRjNTVUpCWjBsVlRUVmlhRGh1UmxSVFRHZFVWVVV4ZHpGV2JTOHdTRVpGWnpSTmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRSTlZFbDNUbnBCTkZkb1kwNU5ha2w0VFZSQk5FMVVTWGhPZWtFMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZJV1ZsbFdFWkdOVGxRWVV4emJFUjJObXhCVWtoRVkyNWFXV2w0VlhGa1lsTlZOSGNLYm01WFZqTjFVWEp6ZEdab2NVTlRTM0pPUVVoaE0xZGpiWGhHVWtaS2FXczFaVXMyYm1Gd2NXNWFjRTlsU2pkcU1VdFBRMEZzVVhkblowcFJUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZsUkRJMUNqZExjV2MxWnpKblVuWnlTMUJMZW5GQ01HUndjWGhCZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6VG10aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwaDNXVXRMZDFsQ1FrRkhSSFo2UVVKQloxRlNaREk1ZVdFeVduTmlNMlJtV2tkc2VncGpSMFl3V1RKbmQwNW5XVXRMZDFsQ1FrRkhSSFo2UVVKQmQxRnZXbGRPYlUxcVVUVk5NazVzVGxkRk1sbDZaelZPYlUweFRrZFZOVTVFVlhoTlJGWnFDazFFVm1sT1ZFRjRUakpGTVU1VVpHeFpha0ZqUW1kdmNrSm5SVVZCV1U4dlRVRkZSVUpCTlVSamJWWm9aRWRWWjFWdFZuTmFWMFo2V2xSQmFrSm5iM0lLUW1kRlJVRlpUeTlOUVVWR1FrSldhbUZIUm5CaWJXUXhXVmhLYTB4WGJIUlpWMlJzWTNrNWVscEhjM2RJVVZsTFMzZFpRa0pCUjBSMmVrRkNRbWRSVUFwamJWWnRZM2s1YjFwWFJtdGplVGwwV1Zkc2RVMUpSMHhDWjI5eVFtZEZSVUZrV2pWQloxRkRRa2d3UldWM1FqVkJTR05CTTFRd2QyRnpZa2hGVkVwcUNrZFNOR050VjJNelFYRktTMWh5YW1WUVN6TXZhRFJ3ZVdkRE9IQTNielJCUVVGSFJWWjVUVmR1ZDBGQlFrRk5RVk5FUWtkQmFVVkJiVFU1YkhCWVUySUtTbWd3VjJaM00zVnpWbkpQV25oeU0zbERaek53UVVkNmVGVkZkVUptZWpRMVFrVkRTVkZETkhWV1VHTTJhVVppZG1WV1IzRXhVR3RuYldKTEwyaFJhZ3BCWkVSeVpHSlNXbXBXYTNoUE1sQnlha1JCUzBKblozRm9hMnBQVUZGUlJFRjNUbkJCUkVKdFFXcEZRVGQ0UnpOVFIxRTFWMDR6ZUU4eE9XTXhOa2N5Q25oSWRXNTNkR3hLZUhWRFNFZHlXR1I1ZW1KcGJHdHJUM1pGY1RsT09FNVFiek0wVUc5aUswUXJjRkZVUVdwRlFYaDVZamhDYzBkT1YwSkxabWQzWm1FS2RqSkdSVEZCWVZsV1VXaERNa1V6VVZweVN6VkNhbWhFUTFoRlZGaFVaeXQzZG5Zek5HMUJjbFp2TTFaemREVjRDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1667909243,
          "logIndex": 6724793,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/sdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/sdk",
      "githubWorkflowSha": "ecf2493ce5a6c896c54e945105c05b5017a557eb",
      "githubWorkflowTrigger": "workflow_dispatch",
      "run_attempt": "1",
      "run_id": "3418970199",
      "sha": "ecf2493ce5a6c896c54e945105c05b5017a557eb"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

