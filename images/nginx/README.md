# nginx

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/distroless/readme-generator
-->

[![CI status](https://github.com/distroless/nginx/actions/workflows/release.yaml/badge.svg)](https://github.com/distroless/nginx/actions/workflows/release.yaml)

A minimal nginx base image rebuilt every night from source.

## Get It!

The image is available on `distroless.dev`:

```
docker pull distroless.dev/nginx:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `1` `1.23` `1.23.1` `1.23.1-r0` `latest` `mainline` | `sha256:f80521a1cf0a093c1bea5a06a72da62faf8cd60e02e7a5f332fef88e3d74b013`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:f80521a1cf0a093c1bea5a06a72da62faf8cd60e02e7a5f332fef88e3d74b013) | `amd64` `arm64` `armv7` |
| `1.22` `1.22.0` `1.22.0-r0` `stable` | `sha256:4e1551f6d0c39f62c8a6da01ac4ec1d7aa6bd495c2fa8bee20c8989450438b41`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:4e1551f6d0c39f62c8a6da01ac4ec1d7aa6bd495c2fa8bee20c8989450438b41) | `amd64` `arm64` `armv7` |


## Usage

To try out the image, run:

```
docker run -p 8080:80 distroless.dev/nginx
```

If you navigate to `localhost:8080`, you should see the nginx welcome page.

To run an example Hello World app, navigate to the root of this repo and run:

```
docker run -v $(pwd)/examples/hello-world/site-content:/var/lib/nginx/html -p 8080:80 distroless.dev/nginx
```

If you navigate to `localhost:8080`, you should see `Hello World from Nginx Distroless!`.



## Signing

All distroless images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify distroless.dev/nginx:latest | jq
```

Output:
```
Verification for distroless.dev/nginx:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/distroless/nginx"
      },
      "image": {
        "docker-manifest-digest": "sha256:f80521a1cf0a093c1bea5a06a72da62faf8cd60e02e7a5f332fef88e3d74b013"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "8235c72b2f289b3a4652c359d18274f00588bd70",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/nginx",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIEOes/L0CDcCfeLTWgJd/RNITWKZo8l4JN6+U++0vYy0AiEA6yZOBxHUi/DkOqLDXn00Xsbk5DRE5artABuP6q4aZdg=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJiNjRhNWFiOGJlOGY0Yzg0ODczYjcyOTM1YTAyYjI5NWQ3NGZhYTEyMzEyZjI0Mjk3NGI2NjcxY2FjN2FkOWNlIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJRk05TEZwT052ZE9HMXRaRFhpL3JFUzQ5Qmk0WGw4SUpVNXFqUXFmYWo1a0FpRUF0N2hQR2NjOGJoNVJtUmF5ZmVFblBvdWlXTldTY2ZhNFR4NW5ZVVhEMGNnPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnRla05EUVhsSFowRjNTVUpCWjBsVlZYSlJVWGczU0N0VEwzRXpNM0pyUW5ZMWEyUm1TRkpEVW1oUmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRWTlJFVjZUbnBOZDFkb1kwNU5ha2wzVDFSRk5VMUVSVEJPZWsxM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZqZDFSeWFVVXZTVWx4WVZOQ1ltZE9abWd4TldOeFN6bE1ZbFZvVEhGQ2FEZ3pUMWtLWVVSbU1teEVjRlprTlc5T1duQnlSVFJyV1M4MVVGaFVVR3B2V2pKaFRVOXVTRlZJVkZKSFEyRkJVMVpETTI1VVJEWlBRMEZyUVhkblowazRUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZPUzFSeENtdFFkR3BqVTFWTWNqVlRZMEZWVVRjeFRXdHhVMXBqZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFsQldVUldVakJTUVZGSUwwSkdXWGRXU1ZwVFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BpYldSd1ltNW5ka3h0WkhCa1IyZ3hXV2s1TTJJelNuSmFiWGgyWkROTmRtTnRWbk5hVjBaNldsTTFOVmxYTVhOUlNFcHNXbTVOZG1GSFZtaGFTRTEyQ21KWFJuQmlha0UxUW1kdmNrSm5SVVZCV1U4dlRVRkZRa0pEZEc5a1NGSjNZM3B2ZGt3elVuWmhNbFoxVEcxR2FtUkhiSFppYmsxMVdqSnNNR0ZJVm1rS1pGaE9iR050VG5aaWJsSnNZbTVSZFZreU9YUk5RbGxIUTJselIwRlJVVUpuTnpoM1FWRkpSVU5JVG1waFIxWnJaRmQ0YkUxRVdVZERhWE5IUVZGUlFncG5OemgzUVZGTlJVdEVaM2xOZWxacVRucEthVTF0V1hsUFJHeHBUVEpGTUU1cVZYbFplazB4VDFkUmVFOUVTVE5PUjFsM1RVUlZORTlIU210T2VrRjNDa2hCV1V0TGQxbENRa0ZIUkhaNlFVSkNRVkZQVVROS2JGbFlVbXhKUmtwc1lrZFdhR015VlhkSVoxbExTM2RaUWtKQlIwUjJla0ZDUWxGUlVWcEhiSG9LWkVoS2RtSkhWbnBqZVRsMVdqSnNkV1ZFUVdSQ1oyOXlRbWRGUlVGWlR5OU5RVVZIUWtFNWVWcFhXbnBNTW1oc1dWZFNla3d5TVdoaFZ6UjNaMWx2UndwRGFYTkhRVkZSUWpGdWEwTkNRVWxGWmtGU05rRklaMEZrWjBGSldVcE1kMHRHVEM5aFJWaFNNRmR6Ym1oS2VFWmFlR2x6Um1velJFOU9TblExY25kcENrSnFXblpqWjBGQlFWbE9WRnBMZVVKQlFVRkZRWGRDU0UxRlZVTkpVVVJZUjJ0dmQzSXpRekJNVUZGeFQxWk1jSGx5V0UxR1pXVXpTbTV1UkRobU5VUUtORWR3YmpSR00yZGFRVWxuVDI5dlUxcGxka0ZMYTJkUWVrbFFjR0ptYmtGQmNXRXlWVlZFZFZwNlltZGxURTlhTjIxYWMwVkVRWGREWjFsSlMyOWFTUXA2YWpCRlFYZE5SR0ZCUVhkYVVVbDNWemxVTUVwUU1HdFNRemRvVVM4d2RFTXlZbnBSUzNwNE1YWkhObkEzV2tKeVRIcHdjVTVtVm1STGJpODVlamRYQ2xKMlJXSk1ZMHBYYUc5Q1IwMUJlamRCYWtWQmNVNUNUa3c0V214SVpWcHZlRkp6YWsxS2FtRk5NMVp2ZVZoQ0wwY3Jhell5T1dkbFJuUkpURm8wZWxVS04zRXpNMUZJVW1sS2QwZFhlakF4UVd4Rk1UTUtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1663551457,
          "logIndex": 3531291,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/nginx/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3079347564",
      "sha": "8235c72b2f289b3a4652c359d18274f00588bd70"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

