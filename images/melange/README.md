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
| `latest` `v0.1.0` | `sha256:fcb3fe17055a6712b7c324cecf6993bc902fc323a328566eee2c90c70074e57a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:fcb3fe17055a6712b7c324cecf6993bc902fc323a328566eee2c90c70074e57a) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:fcb3fe17055a6712b7c324cecf6993bc902fc323a328566eee2c90c70074e57a"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "166c2914421d71f114ae450c80427f4e90488eb8",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/melange",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCICjGgUIE3XOEZXjaL9PWW010MU0Ck3t7SQ2f5BW4Sc5dAiEAyHc7DO0bko3YRPnrDsameeM4XmkSzWwLAU+pnOeIyDE=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI2NjYzN2I4MTJkOWQ2NzE3MGI1OWJiNWQ3ZmJjMWMxNjZkYTBjYWI5YzQxOWYyY2ZmNDg4OTUzYzNkZmFkNzNhIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQ2hQWG0rek1SL1NzZ0EySDlZcVJENkUxSTNrZ0xIRGwrK2djd2krTFhUYUFpRUE1cTJaSDlvOHBKaHphQjlSWlJvQ29LT1p3T2k5QTgwWFhZNGNNek1SZlRVPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnZSRU5EUVhsaFowRjNTVUpCWjBsVlZXeDFVWFJETm1kb1pXVkhMeXRETVU1c1NXVjZOVXBEVW5OcmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRSTlJFRXhUMVJOTVZkb1kwNU5ha2wzVDFSRk5FMUVSWGRQVkUweFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZzZERCQk5XRnZhV2xFYTA1NGJqTTRjRWx2VFdWUFRGSjNkRnA2TTJGcFFXNU5ja01LZDBwelZUUjVlRUpvWkZadVMxWnBXa1JFWTFGYU5Ha3lWMHRuVERGdU1XWmtVWFp6YzFOcWRVVktUVVppUm5Sd2FqWlBRMEZyVlhkblowcENUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlY1VTJGRUNtRjFaR1Z6S3pGclQzUTJiMDEzY1VkcEwwRTBWVkJqZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFsbldVUldVakJTUVZGSUwwSkdaM2RXYjFwVllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BpVjFaeldWYzFibHBUT0hWYU1td3dZVWhXYVV3elpIWmpiWFJ0WWtjNU0yTjVPWGxhVjNoc1dWaE9iRXh1YkdoaVYzaEJZMjFXYldONU9XOWFWMFpyQ21ONU9YUlpWMngxVFVSclIwTnBjMGRCVVZGQ1p6YzRkMEZSUlVWTE1tZ3daRWhDZWs5cE9IWmtSemx5V2xjMGRWbFhUakJoVnpsMVkzazFibUZZVW04S1pGZEtNV015Vm5sWk1qbDFaRWRXZFdSRE5XcGlNakIzUm1kWlMwdDNXVUpDUVVkRWRucEJRa0ZuVVVsak1rNXZXbGRTTVdKSFZYZE9aMWxMUzNkWlFncENRVWRFZG5wQlFrRjNVVzlOVkZreVdYcEpOVTFVVVRCTmFrWnJUbnBHYlUxVVJUQlpWMVV3VGxSQ2FrOUVRVEJOYW1SdFRrZFZOVTFFVVRSUFIxWnBDazlFUVdOQ1oyOXlRbWRGUlVGWlR5OU5RVVZGUWtFMVJHTnRWbWhrUjFWblZXMVdjMXBYUm5wYVZFRm5RbWR2Y2tKblJVVkJXVTh2VFVGRlJrSkNTbXNLWVZoT01HTnRPWE5hV0U1NlRESXhiR0pIUm5WYU1sVjNTRkZaUzB0M1dVSkNRVWRFZG5wQlFrSm5VVkJqYlZadFkzazViMXBYUm10amVUbDBXVmRzZFFwTlNVZE1RbWR2Y2tKblJVVkJaRm8xUVdkUlEwSklNRVZsZDBJMVFVaGpRVU5IUTFNNFEyaFRMekpvUmpCa1JuSktORk5qVWxkaldYSkNXVGwzZW1wVENtSmxZVGhKWjFreVlqTkpRVUZCUjBSVWFIVmpiMmRCUVVKQlRVRlRSRUpIUVdsRlFYWlZlV2xXTTNSekwySmlOVXBFYldaWlRWUkxaMlJaZWt3MVVIWUtWMnQ2VG05bWRERm1SelpvVFRFd1EwbFJSR2swT0U1U1JYTnpXVUp6T1hwNlRFaEpaMEpaWjFCaFdVNXJURUp5VjJOaUx6QjJObE5PTmxreE5IcEJTd3BDWjJkeGFHdHFUMUJSVVVSQmQwNXZRVVJDYkVGcVJVRjBabWM0ZGxvNWJqY3dVVkJpTDBORVUxQlNjSEpXU2xOU2MyTlhNMDAxUzNaTlNEZzROV1ZyQ25wS09YVkplWFZqUVhCbGRIazBLeXNyTW5SaFNVWlpiVUZxUWtvdlRuWlVaemxzUWpVMGVqWkZjV3hWVVZvMVpDdG9SVXRvWTAwNFZtUXJORkk0YkdzS1ExTmxWRlJOZHpjdlRFbFpaSEI2TUZoeE5qQkpOVVZ5VHpSSlBRb3RMUzB0TFVWT1JDQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENnPT0ifX19fQ==",
          "integratedTime": 1663462785,
          "logIndex": 3527648,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/melange/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3075341259",
      "sha": "166c2914421d71f114ae450c80427f4e90488eb8"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

