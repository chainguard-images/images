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
| `latest` `v0.1.0` | `sha256:b4cb9ffc49672adf278fef432218113120988c660be775299f097bb3c0155047`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:b4cb9ffc49672adf278fef432218113120988c660be775299f097bb3c0155047) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:b4cb9ffc49672adf278fef432218113120988c660be775299f097bb3c0155047"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "78ea51d18b8fb0e01382f7ee200f2599182198c7",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/melange",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDyXmpHX2avg83owz8rFS4eYwXg3a1s1NJk6VBOJ6sK+QIgN6o8SPatCiBnSmXy/h47DmofEqwTwXLCQPFCs9irHe0=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI2ODY3ZDRjYjQ5Yzk0NTljNTFlOGJiNDNlM2Y1MTkxYjVjZDg0YmMxMmQ0MDMxMjFiMGFlYTFkY2RhYjMzMzQ1In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQnU2YlJHWFVndTFpcmtyc0hRdDVMVDlZeHQxQU82MllWOFhqRUdQeTBwSEFpRUF4ZFVOdlUzeFZiV1JVckJDNHowR2hFOGZ1elBMWDRYTVBWRUlOR1BBalNRPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnVha05EUVhsVFowRjNTVUpCWjBsVlJFaG5ZVGQyZDJ4eVl6WXJVWE5LWkVSWWFtaGFkV1JoZDFoUmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRWTlJFRXhUWHBGZWxkb1kwNU5ha2wzVDFSRk5VMUVSWGROZWtWNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZoUkdOdmJVaExSSEYxYkhOalpVOWlPVGw1YVhOaWEzQlpVa3RMZUZwNmJUbG1jSEFLZW1velVqRlVTRmhyZG5oMk1Hd3phQzlGTW0xSVJHMUtPV2hSVW5kdVdXMUVOekZQZUZoVldrUkNSbVpRVFZscmRYRlBRMEZyVFhkblowa3ZUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlUxSzJKVENrSlJXV05OWm1aT2FGbHBXRFZSWWpCUVlsSjBZbmxGZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFsbldVUldVakJTUVZGSUwwSkdaM2RXYjFwVllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BpVjFaeldWYzFibHBUT0hWYU1td3dZVWhXYVV3elpIWmpiWFJ0WWtjNU0yTjVPWGxhVjNoc1dWaE9iRXh1YkdoaVYzaEJZMjFXYldONU9XOWFWMFpyQ21ONU9YUlpWMngxVFVSclIwTnBjMGRCVVZGQ1p6YzRkMEZSUlVWTE1tZ3daRWhDZWs5cE9IWmtSemx5V2xjMGRWbFhUakJoVnpsMVkzazFibUZZVW04S1pGZEtNV015Vm5sWk1qbDFaRWRXZFdSRE5XcGlNakIzUm1kWlMwdDNXVUpDUVVkRWRucEJRa0ZuVVVsak1rNXZXbGRTTVdKSFZYZE9aMWxMUzNkWlFncENRVWRFZG5wQlFrRjNVVzlPZW1oc1dWUlZlRnBFUlRSWmFtaHRXV3BDYkUxRVJYcFBSRXB0VGpKV2JFMXFRWGRhYWtreFQxUnJlRTlFU1hoUFZHaHFDazU2UVdOQ1oyOXlRbWRGUlVGWlR5OU5RVVZGUWtFMVJHTnRWbWhrUjFWblZXMVdjMXBYUm5wYVZFRm5RbWR2Y2tKblJVVkJXVTh2VFVGRlJrSkNTbXNLWVZoT01HTnRPWE5hV0U1NlRESXhiR0pIUm5WYU1sVjNTRkZaUzB0M1dVSkNRVWRFZG5wQlFrSm5VVkJqYlZadFkzazViMXBYUm10amVUbDBXVmRzZFFwTlNVZEtRbWR2Y2tKblJVVkJaRm8xUVdkUlEwSkljMFZsVVVJelFVaFZRVU5IUTFNNFEyaFRMekpvUmpCa1JuSktORk5qVWxkaldYSkNXVGwzZW1wVENtSmxZVGhKWjFreVlqTkpRVUZCUjBSVmVuZHBlSGRCUVVKQlRVRlNha0pGUVdsQlNURkZaSEpzV1c0MmRtNVdZMkYzYTBKM0wwaFVLMmxaUkhRNVEwUUtXRkJTV1VaRWRub3ZSbFZ5TlhkSloxVTRhbnBNTUV0UGNIQklMM1ZNTURWbGNrcFlVR3hNWlVGSlRDc3dURVJQVWpFdlFWZ3lSemhaVnpoM1EyZFpTUXBMYjFwSmVtb3dSVUYzVFVSaFFVRjNXbEZKZDBObFYwazROaTh4S3l0RmRpdHpXR0V6Y1RKUmVrdFljSEpRWTJ0aGJVVlhaVWQ1YVZvMk1FcFdVMjV3Q214b1VXaG5ZVXBySzJGeVMzRjJUaklyZUdacFFXcEZRWFZKUWxGUGNrVkhTM281VWtKTWRqbDVNSEUwY0hJclNucG9WMGt4ZVZOclIySndTMk52VlVnS1lsWnRaV3B4TjB4RFMwZ3ZWMVIwTkc5MVFsZFZOMkp2Q2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1663548800,
          "logIndex": 3531130,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/melange/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3079230486",
      "sha": "78ea51d18b8fb0e01382f7ee200f2599182198c7"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

