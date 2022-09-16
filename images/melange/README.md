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
| `latest` `v0.1.0` | `sha256:f62203fdc6ecff78535e88fd3f717134af8c453d269c43cf1ee09039ca3325cb`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:f62203fdc6ecff78535e88fd3f717134af8c453d269c43cf1ee09039ca3325cb) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:f62203fdc6ecff78535e88fd3f717134af8c453d269c43cf1ee09039ca3325cb"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "c7ff1dbf6fc3f587afe8e19016ce757256cd3c18",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/melange",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCfC63yh4Lw/p+lWA7fiimcUSg8y/Ro6kbMnIafen6NWQIhAOcwZ4trBnX0WcFS2G/RCF53E0WgOHH9w0I7jwfk1Bwt",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI0Mzc4MzdmMDFhYjE2ODVmZTViY2E2ZDViNDc4Yzc0MzE5MjhhZmZlNTI0MzRjZTYyZTZlZjZhYzhhM2MwOTZlIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQVRSMEF5VHdRMW5YSmVNQlNrSENRRTlsTjY4N1NDOXUvYnBTR2liYmQ3aUFpRUF3S08yYklxWVFiMDI4TXVnbGV0S2NLVjZhek5LTmVNM3F2V3NEUldvVENFPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnVla05EUVhsVFowRjNTVUpCWjBsVlFqWktXbGhWTTBVdlpGbFdObWh3V0ROTGMzZGxPRmxTTW1KSmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRKTlJFRXhUa1JCZWxkb1kwNU5ha2wzVDFSRk1rMUVSWGRPUkVGNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZrVDBWSlNXaHJVSEpRVjFwcmFFNHZhMFJGTDB4WlQyRTFSbUZRUlhoYVpHUXlNVGNLVEVKdWVsUjBNelZDUVc1UlZESk9SbWRhYjBob1drdFpMMHhTVFUwelpsUmhMMFJ2YzJRdlptSnBPR2xSV0VoUk0yRlBRMEZyVFhkblowa3ZUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlY0YzNKa0NtMW9hakpLU0RkWVpUbGpTRXhEWmpOT1NqSlVUa0kwZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFsbldVUldVakJTUVZGSUwwSkdaM2RXYjFwVllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BpVjFaeldWYzFibHBUT0hWYU1td3dZVWhXYVV3elpIWmpiWFJ0WWtjNU0yTjVPWGxhVjNoc1dWaE9iRXh1YkdoaVYzaEJZMjFXYldONU9XOWFWMFpyQ21ONU9YUlpWMngxVFVSclIwTnBjMGRCVVZGQ1p6YzRkMEZSUlVWTE1tZ3daRWhDZWs5cE9IWmtSemx5V2xjMGRWbFhUakJoVnpsMVkzazFibUZZVW04S1pGZEtNV015Vm5sWk1qbDFaRWRXZFdSRE5XcGlNakIzUm1kWlMwdDNXVUpDUVVkRWRucEJRa0ZuVVVsak1rNXZXbGRTTVdKSFZYZE9aMWxMUzNkWlFncENRVWRFZG5wQlFrRjNVVzlaZW1SdFdtcEdhMWx0V1RKYWJVMTZXbXBWTkU0eVJtMWFWR2hzVFZScmQwMVVXbXBhVkdNeFRucEpNVTV0VG10Tk1rMTRDazlFUVdOQ1oyOXlRbWRGUlVGWlR5OU5RVVZGUWtFMVJHTnRWbWhrUjFWblZXMVdjMXBYUm5wYVZFRm5RbWR2Y2tKblJVVkJXVTh2VFVGRlJrSkNTbXNLWVZoT01HTnRPWE5hV0U1NlRESXhiR0pIUm5WYU1sVjNTRkZaUzB0M1dVSkNRVWRFZG5wQlFrSm5VVkJqYlZadFkzazViMXBYUm10amVUbDBXVmRzZFFwTlNVZEtRbWR2Y2tKblJVVkJaRm8xUVdkUlEwSkljMFZsVVVJelFVaFZRVU5IUTFNNFEyaFRMekpvUmpCa1JuSktORk5qVWxkaldYSkNXVGwzZW1wVENtSmxZVGhKWjFreVlqTkpRVUZCUjBSUk9HNVVja0ZCUVVKQlRVRlNha0pGUVdsQ1JDdDRlVkkwU25jMFVIWlZlRUpSZW5kV2NHdHRSR0Y0YW5VdlRuTUtXbUUwZUhVeGNpOWhlRlI0YW5kSlowZzBaMmhxZURWc1dtUXJaVVV4V0dnNGJqWk9PR3d3ZEdacksxQmhhbUZMS3poU1RYRm1lRXRaYWpSM1EyZFpTUXBMYjFwSmVtb3dSVUYzVFVSaFVVRjNXbWRKZUVGTE1IcFNTbXBCYmpoNFZUZERUR0V4YkU5NWFVMUJVVEJWVW5KdFNHeFRkRll4ZFhFck5taFRkVkJhQ2tWeFpEVlJTMDlKUkZsTlNGTnpaV1EyUkV4bFNrRkplRUZNUzNoRWVHcGhkRTFJYWxZNGVEVjBZVWx4VVdSdmFsRXphbkJDY0ZrcllWZFZaRmx2TWlzS1pWWm5VMFpHWjFsdE9HcHRXbWsyYmxkQmRWZHhXbkZZY1VFOVBRb3RMUzB0TFVWT1JDQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENnPT0ifX19fQ==",
          "integratedTime": 1663289651,
          "logIndex": 3512092,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/melange/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3064660427",
      "sha": "c7ff1dbf6fc3f587afe8e19016ce757256cd3c18"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

