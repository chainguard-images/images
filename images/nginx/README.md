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
| `1` `1.23` `1.23.1` `1.23.1-r0` `latest` `mainline` | `sha256:9922051f911dde2772336ee81518c9a91806cb2851f340112de566405909f012`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:9922051f911dde2772336ee81518c9a91806cb2851f340112de566405909f012) | `amd64` `arm64` `armv7` |
| `1.22` `1.22.0` `1.22.0-r0` `stable` | `sha256:78aa2333a23fe168b08d1a4bc6e8044ed82da68a7aa429d0183d34d2f24359a7`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:78aa2333a23fe168b08d1a4bc6e8044ed82da68a7aa429d0183d34d2f24359a7) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:9922051f911dde2772336ee81518c9a91806cb2851f340112de566405909f012"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "a7eecc2d1427ebc4b2de35e234c62f9b65acb282",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/nginx",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQD3i/B9imdphXQgQFbCCc29GIS6gKpo9p/rwhuUpHAEUgIgM3aQGILhfk2QrHldKIMo5N1lm+3E7URekY8plXBsTJ0=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIyOGNjOWJiOGRjOTMwNTJhY2MxYzI4MTc0NjI3YzY0ZTUzY2VhM2VhN2UxOTRmZWUzMjEwMDBmMmU4Yzk3MTdiIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJRU1Gd3R4WlJHekpDQmVENnpMRStjWnZ6MER6TVQxbWJ0a25KS0FnUDZud0FpRUErYU5pbXExQWJlMUJUVEdiRTBKZGVCbEhuR1dFUDBwTExYeTRybzlxQVBVPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnVSRU5EUVhsSFowRjNTVUpCWjBsVlMwOUxNVTl1YWpobFN6Z3lORFJPVWpRelNYZ3JZbWxLUVdaWmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlROTlJFVjZUMVJWTWxkb1kwNU5ha2wzVDFSRk0wMUVSVEJQVkZVeVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZUV1RZeU1uWlBjV1JyWkdacVlVMU1ZbUZtY2tjMEwzaHpSMVZqTWxGdVFrWTBTVm9LTnpKNlMwbzBlV3hPV1RNeVZXRmtlSFF4VldWUVdFdE5Rbmd6YUZBM00yTlRaVEoxV1ZWcFIyZEJiMEkwTkVSc1EyRlBRMEZyUVhkblowazRUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV6UWpRekNtcFFaR0ZXVFhGWFdFZGpPRlV4Wm1wT1ZWcHNkRWxqZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFsQldVUldVakJTUVZGSUwwSkdXWGRXU1ZwVFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BpYldSd1ltNW5ka3h0WkhCa1IyZ3hXV2s1TTJJelNuSmFiWGgyWkROTmRtTnRWbk5hVjBaNldsTTFOVmxYTVhOUlNFcHNXbTVOZG1GSFZtaGFTRTEyQ21KWFJuQmlha0UxUW1kdmNrSm5SVVZCV1U4dlRVRkZRa0pEZEc5a1NGSjNZM3B2ZGt3elVuWmhNbFoxVEcxR2FtUkhiSFppYmsxMVdqSnNNR0ZJVm1rS1pGaE9iR050VG5aaWJsSnNZbTVSZFZreU9YUk5RbGxIUTJselIwRlJVVUpuTnpoM1FWRkpSVU5JVG1waFIxWnJaRmQ0YkUxRVdVZERhWE5IUVZGUlFncG5OemgzUVZGTlJVdEhSVE5hVjFacVdYcEthMDFVVVhsT01sWnBXWHBTYVUxdFVteE5lbFpzVFdwTk1GbDZXWGxhYW14cFRtcFdhRmt5U1hsUFJFbDNDa2hCV1V0TGQxbENRa0ZIUkhaNlFVSkNRVkZQVVROS2JGbFlVbXhKUmtwc1lrZFdhR015VlhkSVoxbExTM2RaUWtKQlIwUjJla0ZDUWxGUlVWcEhiSG9LWkVoS2RtSkhWbnBqZVRsMVdqSnNkV1ZFUVdSQ1oyOXlRbWRGUlVGWlR5OU5RVVZIUWtFNWVWcFhXbnBNTW1oc1dWZFNla3d5TVdoaFZ6UjNaMWx2UndwRGFYTkhRVkZSUWpGdWEwTkNRVWxGWmtGU05rRklaMEZrWjBGSldVcE1kMHRHVEM5aFJWaFNNRmR6Ym1oS2VFWmFlR2x6Um1velJFOU9TblExY25kcENrSnFXblpqWjBGQlFWbE9Ta2RwT1ZkQlFVRkZRWGRDU0UxRlZVTkpVVU1yTW1kM1VtTmhVSFJWV0doWmMzRm9aeTh5WWs1RlpHVmhLMVpMVDFvdldYa0thVGxzV2taVlNUVTNkMGxuV25SUWFqSkZNa00zY2tGRUwxcFNSRlpZTnpoWU5qQkxZekUxVURnd1dYQkRNVWhUVVZOMllUTnlhM2REWjFsSlMyOWFTUXA2YWpCRlFYZE5SR0ZSUVhkYVowbDRRVWxoZDBKV1ZtcFVLM0pRU0dRMGQybHhXV0pyTWpkbE1FcFZRMlJpY0haRlFVaHFlalU1VDFCalEzcExjMjFCQ25JeFMxaExibW8wY0doWVdUSllkV2RRWjBsNFFVcHlhRU15ZUVZNVJXWktNbkJsWWtsME9TdHJSU3MyYUZscGMyaEthRloyWm1oVk9FaDRjMlZ2ZFZnS2N6TlNObWhwUlcxdGVtcFhaMVpIUTJ4emVteHNkejA5Q2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1663378806,
          "logIndex": 3523595,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/nginx/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3071638358",
      "sha": "a7eecc2d1427ebc4b2de35e234c62f9b65acb282"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

