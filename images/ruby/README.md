# ruby

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/ruby/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/ruby/actions/workflows/release.yaml)

WORK IN PROGRESS

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/ruby:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |


## Usage

WORK IN PROGRESS


## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/ruby:latest | jq
```

Output:
```
Error: GET https://cgr.dev/v2/chainguard/ruby/manifests/latest: MANIFEST_UNKNOWN: manifest unknown
main.go:62: error during command execution: GET https://cgr.dev/v2/chainguard/ruby/manifests/latest: MANIFEST_UNKNOWN: manifest unknown
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

