# melange

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/distroless/readme-generator
-->

[![CI status](https://github.com/distroless/melange/actions/workflows/release.yaml/badge.svg)](https://github.com/distroless/melange/actions/workflows/release.yaml)

Container image for running [melange](https://github.com/chainguard-dev/melange) workflows to build APK packages.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/melange:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` `v0.1.0` | `sha256:1ec9cc23444d5b32639a576360fcf44b388dafa31c0f6025a7c3c8b67f179ab0`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:1ec9cc23444d5b32639a576360fcf44b388dafa31c0f6025a7c3c8b67f179ab0) | `amd64` `arm64` `armv7` |


## Usage

To build the melange workflow in [examples](examples/gnu-hello.yaml):

```
docker run --privileged -v "$PWD":/work cgr.dev/chainguard/melange build /work/examples/gnu-hello.yaml
```

Output will be in the `packages` directory.

To build the melange package for the host architecture:

```
docker run --privileged -v "$PWD":/work cgr.dev/chainguard/melange build --empty-workspace --arch $(uname -m) /work/melange.yaml
```

To get a shell, you can change the entrypoint:

```
docker run --privileged -v "$PWD":/work -it --entrypoint /bin/sh cgr.dev/chainguard/melange

/ # melange version
...
```
Note that melange uses bubblewrap internally, which requires various Linux capabilities, hence the
use of `--privileged`. Because of this requirement, we recommend this image is used only for local
development and testing.


## Signing

All distroless images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/melange:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/melange:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/distroless/melange"
      },
      "image": {
        "docker-manifest-digest": "sha256:1ec9cc23444d5b32639a576360fcf44b388dafa31c0f6025a7c3c8b67f179ab0"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "870d763e5c37f4775b608f93014e4825f06a0300",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/melange",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIExG5pJBe5NG2nMugWTpj/2gp2yk1zgKW9aFKutnKEzVAiEAyjW50RU3OJF8mGniU7CGC/dmk88eOIPUcnzb3hi2kkU=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJiMDllMmU3NGZlYzIwMzQ2Yjc5M2UzY2JjNjFkNTg5NDViMzFiNGU2NWI2NTg2YWE0ZTRmMmFjYzFlZWQyNDdmIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNXdGw2TFp4bFAwVWJ6dDNHT3NNZ3dLam92NzNoQk9yaTNGQ01tdU9tNE5BSWdMRWVxMEY1bVdpV0dMRXltdmNqNTZxVU56Q2o0RmQ3bzdVZE03cXBkTkFnPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnZSRU5EUVhsWFowRjNTVUpCWjBsVlRqSnVNVEJsTjFsV1preE5ibmxvT0hCTVV6VjZNMDB5SzFOamQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlROTlJFRXdUMVJOZDFkb1kwNU5ha2wzVDFSRk0wMUVRVEZQVkUxM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZEVjNWWlVUWkhjR0ZEV2pBNVNHcFFZa2RMYjBjeGFXWTRTREZ5ZG5CcVIwcHFMMUVLVlhVeVNEUkdiU3R0ZEVwWGJXRnVjM1J1TDNWVGIwTjFkRkJQVmxjdloxSmtWRmhPTlRKNWVsQjZWV3M1ZWtSd0x6WlBRMEZyVVhkblowcEJUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZXVFdObUNrTkNPVTlRTmsxQ1dFZHlTV295T0VrM2VraEdjRFJuZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFsbldVUldVakJTUVZGSUwwSkdaM2RXYjFwVllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BpVjFaeldWYzFibHBUT0hWYU1td3dZVWhXYVV3elpIWmpiWFJ0WWtjNU0yTjVPWGxhVjNoc1dWaE9iRXh1YkdoaVYzaEJZMjFXYldONU9XOWFWMFpyQ21ONU9YUlpWMngxVFVSclIwTnBjMGRCVVZGQ1p6YzRkMEZSUlVWTE1tZ3daRWhDZWs5cE9IWmtSemx5V2xjMGRWbFhUakJoVnpsMVkzazFibUZZVW04S1pGZEtNV015Vm5sWk1qbDFaRWRXZFdSRE5XcGlNakIzUm1kWlMwdDNXVUpDUVVkRWRucEJRa0ZuVVVsak1rNXZXbGRTTVdKSFZYZE9aMWxMUzNkWlFncENRVWRFZG5wQlFrRjNVVzlQUkdOM1drUmpNazB5VlRGWmVrMHpXbXBSTTA1NlZtbE9ha0UwV21wcmVrMUVSVEJhVkZFMFRXcFdiVTFFV21oTlJFMTNDazFFUVdOQ1oyOXlRbWRGUlVGWlR5OU5RVVZGUWtFMVJHTnRWbWhrUjFWblZXMVdjMXBYUm5wYVZFRm5RbWR2Y2tKblJVVkJXVTh2VFVGRlJrSkNTbXNLWVZoT01HTnRPWE5hV0U1NlRESXhiR0pIUm5WYU1sVjNTRkZaUzB0M1dVSkNRVWRFZG5wQlFrSm5VVkJqYlZadFkzazViMXBYUm10amVUbDBXVmRzZFFwTlNVZExRbWR2Y2tKblJVVkJaRm8xUVdkUlEwSklkMFZsWjBJMFFVaFpRVU5IUTFNNFEyaFRMekpvUmpCa1JuSktORk5qVWxkaldYSkNXVGwzZW1wVENtSmxZVGhKWjFreVlqTkpRVUZCUjBSVFQzZEZTbmRCUVVKQlRVRlNla0pHUVdsQk1IcGhiRXB2VEZobFJ6UldWR1Z0YkdsTFZFZFNibEZYZEdSNk5FZ0tkRkpMVVdOaWJtaHNkMWxZU0hkSmFFRkpjWE53TUZSRFQwY3ZjVkZRY0VvNGNGbHpabTFLYmpsVWFucEhRM0pKV1VKc1l6SmtZbFJvTUVSRlRVRnZSd3BEUTNGSFUwMDBPVUpCVFVSQk1tdEJUVWRaUTAxUlJHRkVUbkZaS3pKQ1NWZHBiMDQwWVZsRGRpdE9VMHRIU2l0a09UVnNNbU5uWm5wd2R6SkdUMWRUQ2tseGVHOWtibFJ4WkZkS2IzSmhVWEpqWkhkWlVsSnZRMDFSUXpJNGR6ZDBRaTlWZG1SNVRVRkNUa05EYjJsVVMzSjVkRlUyYzNwTGVtaHRjakpOVG5NS01USXlVMHhFVEM5RFdHYzVlVUl4ZG1oYVpHTlNiRE14YkZKSlBRb3RMUzB0TFVWT1JDQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENnPT0ifX19fQ==",
          "integratedTime": 1663375779,
          "logIndex": 3523284,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/melange/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3071532433",
      "sha": "870d763e5c37f4775b608f93014e4825f06a0300"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

