# sdk

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/distroless/readme-generator
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
| `latest` | `sha256:2db24ff499e9cc449e1c3f6f96a36fd595a5d9b9766b5912e692f65e264eebd3`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:2db24ff499e9cc449e1c3f6f96a36fd595a5d9b9766b5912e692f65e264eebd3) | `amd64` `arm64` `armv7` |


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
        "docker-reference": "ghcr.io/chainguard-images/sdk"
      },
      "image": {
        "docker-manifest-digest": "sha256:2db24ff499e9cc449e1c3f6f96a36fd595a5d9b9766b5912e692f65e264eebd3"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "workflow_dispatch",
      "1.3.6.1.4.1.57264.1.3": "8517bf999a3728fd330c04f0be899c543b34eab1",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/sdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIDKuutukdigAU4qvW10LTk1T9BZRDledEcctBAFMLR3AAiB/4LiJddByWDfQEIE+JrcEJJiEoT/ORz7fBAbQA68wcQ==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJjYmU0M2UyOTZlZDIxMjEwMjgyNThiM2NkZjA2NmEzZDA4OWM2NWVjN2JlYzdiMGM4YmFiMTZmNzUwNGUyYWQ4In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJRjlZVFlXVWwxVU5iRStlNUkzL2Exbkt6anNMdnp6U2xIa0k4YmpjMDlvbEFpRUFpTFdpdE91YXhHWmVkWXlPQWxQL0tjRmVMVVlFeklvV3dWWnNrVWhGZzdjPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlha05EUVhwVFowRjNTVUpCWjBsVlFrOXphUzlQT0VFNGJWUkRSRlk0VVd0eE1VSjVMMUJOWlVSTmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hkTlZGbDZUbXBGTTFkb1kwNU5ha2wzVDFSSmQwMVVXVEJPYWtVelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZaY1U5ek1YTm1SVlpoWjBvclZIYzVjbGxoWVdScFkyRkNjRFZNV2xOVFlrbzRWalVLZUd0WGMxbFFWemxaUVROTlpuVlJRV3RNUkVoeGQwNU9ZMWRyVjFKR09GSkxiRTlyUkhaYVdXTkxXRzByY25nMVNuRlBRMEZzVFhkblowcFFUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlUwYWpSekNsRnZlblEzVURoNmRUUnFhR0paTkZSQlYxcERUV1JOZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6VG10aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwaDNXVXRMZDFsQ1FrRkhSSFo2UVVKQloxRlNaREk1ZVdFeVduTmlNMlJtV2tkc2VncGpSMFl3V1RKbmQwNW5XVXRMZDFsQ1FrRkhSSFo2UVVKQmQxRnZUMFJWZUU0eVNtMVBWR3MxV1ZSTk0wMXFhRzFhUkUxNlRVZE5kMDVIV1hkWmJWVTBDazlVYkdwT1ZGRjZXV3BOTUZwWFJtbE5WRUZqUW1kdmNrSm5SVVZCV1U4dlRVRkZSVUpCTlVSamJWWm9aRWRWWjFWdFZuTmFWMFo2V2xSQmFrSm5iM0lLUW1kRlJVRlpUeTlOUVVWR1FrSldhbUZIUm5CaWJXUXhXVmhLYTB4WGJIUlpWMlJzWTNrNWVscEhjM2RJVVZsTFMzZFpRa0pCUjBSMmVrRkNRbWRSVUFwamJWWnRZM2s1YjFwWFJtdGplVGwwV1Zkc2RVMUpSMHRDWjI5eVFtZEZSVUZrV2pWQloxRkRRa2gzUldWblFqUkJTRmxCUTBkRFV6aERhRk12TW1oR0NqQmtSbkpLTkZOalVsZGpXWEpDV1RsM2VtcFRZbVZoT0VsbldUSmlNMGxCUVVGSFJGYzRTRzFDZDBGQlFrRk5RVko2UWtaQmFVVkJjbkIxWWpGTFV5OEtSbVEwUnpGd05VRlVMekZUUnk5NlZ6Sk1hWG9yUVdaWlVVUlhNRWhGZFVSaFMxVkRTVUV4UTNKTk5rdGtXV1I0Y0VsSFF6Qk1OVWxwVTJOaGQyTldhZ3BWUkRWU2RGZHBkVVZSV1UxdE1FaDZUVUZ2UjBORGNVZFRUVFE1UWtGTlJFRXlaMEZOUjFWRFRWRkRObTVuZVhBMGRWaG5LMDlRWVZKNVQxUkNSekkyQ2s5UE9XSlBXVkZGYUdKVVVGVlZVbXAzTTNoalZHZGlRMmxzTjBGellXeEtWa1p2UVZGSU1GUnhTRGhEVFVWemMwbHdTSGgwVlhkeVpXeHNlWEp1V1ZNS09DOWxObkp2YVdKdVUySnNSMm94YzJwaVdrZHlWV3BHVWxGbU1WUkpkWFozZUhSVVREVnNkbWRuVUZCS1VUMDlDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1663691787,
          "logIndex": 3616627,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/sdk/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3091676946",
      "sha": "8517bf999a3728fd330c04f0be899c543b34eab1"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

