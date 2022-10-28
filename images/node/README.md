# node

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/node/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/node/actions/workflows/release.yaml)

WORK IN PROGRESS

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/node:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:831ff81a7ee01be5e479ebcceaf5cbcab2700b7bb687746e7a2150765ddd61c7`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:831ff81a7ee01be5e479ebcceaf5cbcab2700b7bb687746e7a2150765ddd61c7) | `amd64` |


## Usage

Minimal container image for running NodeJS apps


## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/node:latest | jq
```

Output:
```
Error: no matching signatures:
searching log query: [POST /api/v1/log/entries/retrieve][404] searchLogQuery default  &{Code:404 Message:no responses found}
main.go:62: error during command execution: no matching signatures:
searching log query: [POST /api/v1/log/entries/retrieve][404] searchLogQuery default  &{Code:404 Message:no responses found}
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

