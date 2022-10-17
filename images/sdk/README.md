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
| `latest` | `sha256:6bc9aee3dfbdc606166671d4946b1f3e60421c2d163fb4a43a2022ebf4c578f9`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:6bc9aee3dfbdc606166671d4946b1f3e60421c2d163fb4a43a2022ebf4c578f9) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:6bc9aee3dfbdc606166671d4946b1f3e60421c2d163fb4a43a2022ebf4c578f9"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "c9f75801be654303887b2a59c2fd3503d33ef44e",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/sdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCID0Y+Tf/yARzQjRrAH2YAw92YfTuyDkM5MG1IgSEZtVIAiEAsflk/0eZTRpXRASf+p+FK5Hc7bDb+yuxQ06b2RpaY7s=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIwODMyOTJiMGRlMjg0ODI5MjRjYWFiMjY5MDlhODJhYWMxZjEwZThjNzc3Mzk0NTY5N2MyMzEzMjM3NDA3YjE2In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJSE9ISDNHQ0xYZ3kwOVR2NEttb2FkZVZPSVRhR1dVQ3ZlL2Z6UmVyeWo0UUFpQWVZU3d0a1BNTWRscmJPaDN4NVhmY0NLWHJ0UktWK3ZWQVo3aFZ2Sm13K0E9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndSRU5EUVhsMVowRjNTVUpCWjBsVlpsQnpZMUJ5YWpWclJrcElTSGRHVlhGbVpHdDVjRmg2Y1ZwTmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlROTlJFVjVUbXBOTTFkb1kwNU5ha2w0VFVSRk0wMUVSWHBPYWswelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZhY25Sc2NHUjNZVEpGZVV0RmJFNWhSMnhQUTNFNE5tTnRZalZZZW5oSFQweHhVek1LV0dGRU5XRTVOV1kxTWpsNVRWaEZMMjExVldSM1pUTm1aMjh6WVRjellYRmlWbTlhYm1kUlFVNXhNbVZZZFRGWFRFdFBRMEZyYjNkblowcEhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV6T1ZwekNsVTFhRFprY2xGc05VNVVUWHBYVjB0WVUwWm1OV0UwZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6VG10aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdldYcHNiVTU2VlRSTlJFWnBXbFJaTVU1RVRYZE5lbWMwVGpKSmVWbFVWVFZaZWtwdFdrUk5NVTFFVG10TmVrNXNDbHBxVVRCYVZFRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1ZWxwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwdENaMjl5UW1kRlJVRmtXalZCWjFGRFFraDNSV1ZuUWpSQlNGbEJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUkRRMGVrZEJkMEZCUWtGTlFWSjZRa1pCYVVWQmFXUmxURTFrTldOeWEyTlRaREJaY1U5clpDc0tTa2RXWVRobFJXWXlkalJZZG1sbllrRm9TVWxGYlZWRFNVWXdZMHRoTW5sRVJFUjFRazF0VlVkbGIwZE5NR05RUkU5aVdEWkJTMUp0WVdwa2RFTXZMd3BJVmt0NlRVRnZSME5EY1VkVFRUUTVRa0ZOUkVFeVkwRk5SMUZEVFVKSVpWcG5NbnB2YzBGMFdVbEZOVWxGUmtSRGVVc3JZVGR5TUVWUU1FeG9PR2hLQ2tsVVRDdDVhMEZOTDBWQ1dFTkpiMmxPUkdoVVlsZE5TR05FYUVSUWQwbDNZMVJMUTFSblJYSlJSMHhXWWxsYVR6VnVUVUpoWVRkQ1ZXSTJWbkZLY0ZJS1MyMUlWVUZuTkhwWWFYQnRaVXN2UkVKSldHaG5SRWt4V25KRlNEVlBVbU1LTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1665970004,
          "logIndex": 5247545,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/sdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/sdk",
      "githubWorkflowSha": "c9f75801be654303887b2a59c2fd3503d33ef44e",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3261561557",
      "sha": "c9f75801be654303887b2a59c2fd3503d33ef44e"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

