# nginx

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/nginx/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/nginx/actions/workflows/release.yaml)

A minimal nginx base image rebuilt every night from source.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/nginx:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `1.22` `1.22.0` `1.22.0-r0` `stable` | `sha256:04f70aed2f4f2a237bac6120a8da7ce38c15128833ab5d3e91ea64ff535818b0`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:04f70aed2f4f2a237bac6120a8da7ce38c15128833ab5d3e91ea64ff535818b0) | `amd64` `arm64` `armv7` |
| `1` `1.23` `1.23.1` `1.23.1-r0` `latest` `mainline` | `sha256:d080561bf039aaee4f9de5db2834ec8c9a37b22411ee3f9b46eaa3fca926cf0d`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:d080561bf039aaee4f9de5db2834ec8c9a37b22411ee3f9b46eaa3fca926cf0d) | `amd64` `arm64` `armv7` |


## Usage

To try out the image, run:

```
docker run -p 8080:80 cgr.dev/chainguard/nginx
```

If you navigate to `localhost:8080`, you should see the nginx welcome page.

To run an example Hello World app, navigate to the root of this repo and run:

```
docker run -v $(pwd)/examples/hello-world/site-content:/var/lib/nginx/html -p 8080:80 cgr.dev/chainguard/nginx
```

If you navigate to `localhost:8080`, you should see `Hello World from Nginx Distroless!`.



## Signing

All distroless images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/nginx:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/nginx:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/nginx"
      },
      "image": {
        "docker-manifest-digest": "sha256:d080561bf039aaee4f9de5db2834ec8c9a37b22411ee3f9b46eaa3fca926cf0d"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "7fd9a62f1870f5aacef33749b2185c3fd8bd1102",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/nginx",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCar0E2Pw9Fw5tc0Zt/KakaLBQR5FhVXmHczim626BsZwIhALsuHvvdpZfsEkM/RgJtcueUziIx7qhZAmpN9Q7VOU+5",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJiZDNhZmVjY2Q3OWJkM2M4NTRhN2ZkN2QzYzk4OWNhNTQwOWRiNDIzNzhlYjExYTUzMTJlNWI3N2Y1MmQ4MmI2In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQW5manBoTGhYVDhFM0hGL1lJSnFCb2pxcFgwTWx1TjcxSVRmR2FCbEpPZUFpRUFrSUNLaEoyQURVKzhhVnVtYnh1dUNnU0FEaXUrTGQ3UG5Md0JkWWNwcCt3PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnNla05EUVhoNVowRjNTVUpCWjBsVlZGWllRbFU0ZUROVVdWVXJWa0p4Y0V4TE1rOVNhR1J2V25SdmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRWTmFrbDVUa1JSTkZkb1kwNU5ha2wzVDFSRk5VMXFTWHBPUkZFMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZTTmpscmJrRnpaVU5rU3pnNVJIVktjMjFCTWpoV1FqaEhiMjAzVDJGSVVITkpWWE1LTkRBM1EwbHFUR3BXVjNVeE5YUXZkSEZ2ZWs5NGRHRnJkWEZwY1RacmRGZFZWeTlWUzB3M1dXa3ZNV3M0ZUVkSVV6WlBRMEZxYzNkblowa3pUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZRWnpaVkNtSXdUVzlzYm5kTlNUWTFTbTQwZFVoSU1UWmhRWGgzZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFsQldVUldVakJTUVZGSUwwSkdXWGRXU1ZwVFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BpYldSd1ltNW5ka3h0WkhCa1IyZ3hXV2s1TTJJelNuSmFiWGgyWkROTmRtTnRWbk5hVjBaNldsTTFOVmxYTVhOUlNFcHNXbTVOZG1GSFZtaGFTRTEyQ21KWFJuQmlha0UxUW1kdmNrSm5SVVZCV1U4dlRVRkZRa0pEZEc5a1NGSjNZM3B2ZGt3elVuWmhNbFoxVEcxR2FtUkhiSFppYmsxMVdqSnNNR0ZJVm1rS1pGaE9iR050VG5aaWJsSnNZbTVSZFZreU9YUk5Ra2xIUTJselIwRlJVVUpuTnpoM1FWRkpSVUpJUWpGak1tZDNUbWRaUzB0M1dVSkNRVWRFZG5wQlFncEJkMUZ2VGpKYWEwOVhSVEpOYlZsNFQwUmpkMXBxVm1oWlYwNXNXbXBOZWs1NlVUVlpha2w0VDBSV2FrMHlXbXRQUjBwclRWUkZkMDFxUVdOQ1oyOXlDa0puUlVWQldVOHZUVUZGUlVKQk5VUmpiVlpvWkVkVloxVnRWbk5hVjBaNldsUkJaVUpuYjNKQ1owVkZRVmxQTDAxQlJVWkNRa0pyWVZoT01HTnRPWE1LV2xoT2Vrd3lOVzVoVnpVMFRVSXdSME5wYzBkQlVWRkNaemM0ZDBGUldVVkVNMHBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUTBKcFVWbExTM2RaUWdwQ1FVaFhaVkZKUlVGblVqZENTR3RCWkhkQ01VRkJhR2RyZGtGdlZYWTViMUprU0ZKaGVXVkZia1ZXYmtkTGQxZFFZMDAwTUcwemJYWkRTVWRPYlRsNUNrRkJRVUpuTVdaaGJtOVZRVUZCVVVSQlJWbDNVa0ZKWjFvclp6aG9SR2hrSzA4d05VTnBMMVk1YkdONldsRnVlR3MwYW14aFExUlJZbUZLVmtodGNXY0tLMjgwUTBsQldFbHNTbmxRZGpCMlVEazJXa3BxT1VSUVVUWnlWSE0wVTFrMVdTOVFWQ3RVVVV4RE1IRlNXSEZYVFVGdlIwTkRjVWRUVFRRNVFrRk5SQXBCTW10QlRVZFpRMDFSUTNkWE1DOUpXVzV0YjJ3d1NUWlhMMEZYY0ROclVEWmpaazFYVmxadFZEWkNNbGxGVkhWMmNuRXZkRUpoZWtjeGRqZFhWMmxOQ25Od2JqWkJkR2hSTkV4blEwMVJRMDE2TlhaUWJFbEpPRk5sWjJFMlZ6VkZNVkk0U0hReFFUVTNWelJpZERkMFUxWXlXRmh6WTBsRFlsbGtTbTlMUTNJS09FTjBTMFYzTm1jdlIyNUNNV1J2UFFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1663626298,
          "logIndex": 3565096,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/nginx/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3085954749",
      "sha": "7fd9a62f1870f5aacef33749b2185c3fd8bd1102"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

