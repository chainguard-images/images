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
| `latest` | `sha256:cf7075616562edc284e2981a5299b0e9a8b1df3382e9eca2d2c3b17133d96e03`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:cf7075616562edc284e2981a5299b0e9a8b1df3382e9eca2d2c3b17133d96e03) | `amd64` `arm64` `armv7` |
| `0.0.1-r0-glibc` | `sha256:5a786a6240390957cd63ebb97be8523536c3c6757e7a89f47a9cb84750c28370`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:5a786a6240390957cd63ebb97be8523536c3c6757e7a89f47a9cb84750c28370) |  |


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
        "docker-manifest-digest": "sha256:cf7075616562edc284e2981a5299b0e9a8b1df3382e9eca2d2c3b17133d96e03"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "242dbf7959515972d93daf03f62c459c09e637a2",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/sdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCU2OfpdaWdQlZeLqE1Zo+X9eZOE7Aq0h7JlfL/Ce1wXQIhAK2rOqkPshSzFXOLXOsGsdpwutiTbOHNT1GJUhmYLMmU",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI0ZjcxMWNlMGFiOTk3YjA4NmQxNDA2YzY4Y2NlOTZlMGY5OTYwZTg2YzU2NDg5ZjAxZjA5YjE5ZWE5ZjkzNDIxIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQWg2VXVpOWU3VVFJTVQ0OEFBSXFxRUdnd2NML1FFanRDRlBHQitTWXROWUFpRUExeWc4aEV5dTNjWndYQ2VkZmRjWmZJV0VIMjkrNmtQT2YwYi9JY21xdFFnPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndha05EUVhsNVowRjNTVUpCWjBsVldVTk9XRWhCZW5JcmRURkxSekJyYkhOTE1qSnlZV2hDVUd4TmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlRKTlJFVjNUa1JWTVZkb1kwNU5ha2w0VFZSRk1rMUVSWGhPUkZVeFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVYwYm5SSWFqSjViMUZPVEM4NGJrcDRkMDFWY1c1b1FTdFhZVzFPUWpjMFYyNHZjMW9LTUZGTE5ITmpRMGcxSzBkSVdEWm1SbGxEYlZoTFdtdzVPV2x6WWxobmRrTjFXREJwT0hkTVdURnphVkV2ZWxBeWMyRlBRMEZyYzNkblowcElUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZZT1cxM0NuTnJUMlpTVXpOWlNFaGxaR3hPYW04Mk4yVmxabTlOZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6VG10aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdlRXcFJlVnBIU20xT2Vtc3hUMVJWZUU1VWF6Tk5iVkUxVFRKU2FGcHFRWHBhYWxsNVdYcFJNVTlYVFhkUFYxVXlDazE2WkdoTmFrRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1ZWxwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIweENaMjl5UW1kRlJVRmtXalZCWjFGRFFrZ3dSV1YzUWpWQlNHTkJNMVF3ZDJGellraEZWRXBxUjFJMFkyMVhZek5CY1VwTENsaHlhbVZRU3pNdmFEUndlV2RET0hBM2J6UkJRVUZIUldabVpYWXJkMEZCUWtGTlFWTkVRa2RCYVVWQk5Vd3plbXRYVG14ck1ESTNTbUZDTmpoVGIzQUtMMmN4VWpKaGJIcENWSGt2U0hWTVNVZEJNbkJ6YkRSRFNWRkVWRUpvVDB4bWFIZDVUMDV4ZFdseU9VTm5MMGgzYWt0MU9VNWphMkV2WWxCcWFYRTFVUXBRZEdodWNFUkJTMEpuWjNGb2EycFBVRkZSUkVGM1RtOUJSRUpzUVdwQ00waExURmRJZEdodFoxZzVja0ZPWlV0bVJDdFVReXRMVDFobmF6Rk9UalpSQ21kVVQzbFRibXhDWW10U1lUUk1ZMWhvVWxoQ1lrUkdjbnBsYmpSTmMxVkRUVkZEU1VOQk4wbFVOVXhwTHpKb2JqSjZlVlYwYVdWRU5sZDZOSFZuTjA0S2FESllOeXM1VFRWUGRVVnZjalpUUkZORFJHWnJiRmQ0Y0dOWGJrNVpTRE52ZGtFOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1668560705,
          "logIndex": 7168620,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/sdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/sdk",
      "githubWorkflowSha": "242dbf7959515972d93daf03f62c459c09e637a2",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3475317258",
      "sha": "242dbf7959515972d93daf03f62c459c09e637a2"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

