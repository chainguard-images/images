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
| `1.22` `1.22.0` `1.22.0-r0` `latest` `stable` | `sha256:aca088e1a91b5a82b50d76061d19f1fa5cd2aa970b5274354e92d6ab4bf2587e`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:aca088e1a91b5a82b50d76061d19f1fa5cd2aa970b5274354e92d6ab4bf2587e) | `amd64` `arm64` `armv7` |
| `1` `1.23` `1.23.1` `1.23.1-r0` `mainline` | `sha256:96e8c00f0bf1fde2f693c886097a578f56ffc94a02d647ff286957a760b631e5`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:96e8c00f0bf1fde2f693c886097a578f56ffc94a02d647ff286957a760b631e5) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:aca088e1a91b5a82b50d76061d19f1fa5cd2aa970b5274354e92d6ab4bf2587e"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "650d6fcc5da524263e3ee571162b87e0e9c604d8",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/nginx",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIExMD61jKzekZ4jUopE7p5f6nvYYzUFZ0TIalTCYpbhGAiAGkLt+C6GnJ7mgzaUjZQZFJF6h4BMnaLJeBl2dPbPW3Q==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIyNzFmMjZlZGM3MjQwN2E4NmM4YzIwNWUyMmNlYzg0Y2NhNjViYTFlOGFmOGQwYzQ0ZmM5ZmUzMWFkN2Q1MWYxIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUN4NWUwclFJNU5NVVo3U08yTE5nQW1WKy9XK05GQ2dMb3k3TkJYTW4xMTJnSWhBTTNQN2Jtd3BJVEE2Q01HMlVLdTZzUi90d0FiRk9PYmp5S3diTjJmeVFlRSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnNla05EUVhneVowRjNTVUpCWjBsVlNsQk1SVUpaU0RGclkwZFhORm94VFVWVlRsbHVhVWRyY0ZKTmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRCTlJHdDNUa1JKZUZkb1kwNU5ha2wzVDFSRk1FMUVhM2hPUkVsNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZvYjFkbUwzbzBSVlJSWWpSMFJIUkViRzl6TVVoTk5GbHNZazA0ZVM5UVRGWlZNVTRLT0RoR04zcEJkeTg0T0VZMmVIUlhOVTQyVERSeVFsUXZZVGhQVDJwcFlVWjNNaTlKVkdScWFtOWpkV1pXYkhkcWNqWlBRMEZxZDNkblowazBUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZNTlRSNENuTjNiRzFRZDBneFIwOUZPV0U1WVdKalNEaFVZbVJKZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFsQldVUldVakJTUVZGSUwwSkdXWGRXU1ZwVFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BpYldSd1ltNW5ka3h0WkhCa1IyZ3hXV2s1TTJJelNuSmFiWGgyWkROTmRtTnRWbk5hVjBaNldsTTFOVmxYTVhOUlNFcHNXbTVOZG1GSFZtaGFTRTEyQ21KWFJuQmlha0UxUW1kdmNrSm5SVVZCV1U4dlRVRkZRa0pEZEc5a1NGSjNZM3B2ZGt3elVuWmhNbFoxVEcxR2FtUkhiSFppYmsxMVdqSnNNR0ZJVm1rS1pGaE9iR050VG5aaWJsSnNZbTVSZFZreU9YUk5Ra2xIUTJselIwRlJVVUpuTnpoM1FWRkpSVUpJUWpGak1tZDNUbWRaUzB0M1dVSkNRVWRFZG5wQlFncEJkMUZ2VG1wVmQxcEVXbTFaTWsweFdrZEZNVTFxVVhsT2FrNXNUVEpXYkU1VVkzaE5WRmw1V1dwbk0xcFVRbXhQVjAweVRVUlNhMDlFUVdOQ1oyOXlDa0puUlVWQldVOHZUVUZGUlVKQk5VUmpiVlpvWkVkVloxVnRWbk5hVjBaNldsUkJaVUpuYjNKQ1owVkZRVmxQTDAxQlJVWkNRa0pyWVZoT01HTnRPWE1LV2xoT2Vrd3lOVzVoVnpVMFRVSXdSME5wYzBkQlVWRkNaemM0ZDBGUldVVkVNMHBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUTBKcFoxbExTM2RaUWdwQ1FVaFhaVkZKUlVGblVqaENTRzlCWlVGQ01rRkJhR2RyZGtGdlZYWTViMUprU0ZKaGVXVkZia1ZXYmtkTGQxZFFZMDAwTUcwemJYWkRTVWRPYlRsNUNrRkJRVUpuZW5NNUwwdDNRVUZCVVVSQlJXTjNVbEZKWjFoM2RVRTRMMUkzVUdSSmJteHpRM1JCSzFkYWFWRkZOelZRUVRaRGJWbEtaVzk1YTNRelYwSUtRV00wUTBsUlJIZERPR1pNVTNsVGJUTXlZWE4wVm5Gd01HTTRlVmxrWlRad2FYRjZSbkp6ZWpKRGMyTnlabGg0YUZSQlMwSm5aM0ZvYTJwUFVGRlJSQXBCZDA1dlFVUkNiRUZxUW5sSE0xbFhUa3RTT1dGSWVIZ3lRVVJ4U0RkMVdYRXZTbUpUV1hCS1N6ZGFORzVrVm5sSlEyMDJNVWxpUWpsMGQycFJZakZwQ2xwMk5sSkxWSFJDVEhoWlEwMVJSR0psUkZCQllteElaRVUxUjJaUE1GcEtNRkE1YVdob1JEaDNZbkpVT0hOb2NsWnVUekJ4U0U1Rk1reDJhbGxpVVRJS1dXaFhhbk00T1hKRWRpOVRTa1E0UFFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1663146278,
          "logIndex": 3494654,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/nginx/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3051362481",
      "sha": "650d6fcc5da524263e3ee571162b87e0e9c604d8"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

remove me