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
| `1.22` `1.22.0` `1.22.0-r0` `latest` `stable` | `sha256:d91aa467bac5d4f3337a2f646f9e781be2ea5168b5066c22d30fca901bd02e21`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:d91aa467bac5d4f3337a2f646f9e781be2ea5168b5066c22d30fca901bd02e21) | `amd64` `arm64` `armv7` |
| `1` `1.23` `1.23.1` `1.23.1-r0` `mainline` | `sha256:b4c58e937fae723c5612ec7f6676a619bb42c56b3d314cb6e807adc1bf1b5357`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:b4c58e937fae723c5612ec7f6676a619bb42c56b3d314cb6e807adc1bf1b5357) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:d91aa467bac5d4f3337a2f646f9e781be2ea5168b5066c22d30fca901bd02e21"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "2ab5533cdb0c15214a218d2ba962328187066331",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/nginx",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCID2QiNacudIOO8lLz66tmA/wM1IGEuRpHRHKleAmb4chAiBmMW/9cJHFF/1l5kld//JA/GsovtPWjHzWte0K8zlVJg==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIxMjRjYTIyNThhYmNjMGJiMmE3YzM1M2M4OTJlMTU5YzAzMmI4N2JiYzlkYmYwZWM4ZTBjMmU4Y2NjYTNlM2M3In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJSEpHaDZMYzFuMzcwdTZVYVhIU3NsNG83ZlY5MTJpT0VxdE44eDhHN3R3TUFpQk9MK2wvRjQrS2J5L1JwaGkrb2d0ZVZhMzJBSEF6S0I4MEs4cTllWElVRVE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnRSRU5EUVhnMlowRjNTVUpCWjBsVlQyUmxMM0pqYm1Ka1FVUXhjREl2ZUROREsySkxVRGhRWnpWRmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRCTlZGVjNUMVJOZVZkb1kwNU5ha2wzVDFSRk1FMVVWWGhQVkUxNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZXUTNkTmQyTkNiMFpDYkU5S1R6aHRTRFJZYUdoMVpFNWpSak13ZERSeFNFTkJPVzhLUkZKcEswOUNkazg1VVVZMmVVUXpUbVozVkRGaE1WRkRWV0Z4U0hnMU1ERkdNWGNyYTJWS05qaDNaakpXUWxadWJrdFBRMEZxTUhkblowazFUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlYwVDB0a0NsaFVjamh0TjJKamJXNXphV3BZTjFjd1V6UnhUME00ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFsQldVUldVakJTUVZGSUwwSkdXWGRXU1ZwVFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BpYldSd1ltNW5ka3h0WkhCa1IyZ3hXV2s1TTJJelNuSmFiWGgyWkROTmRtTnRWbk5hVjBaNldsTTFOVmxYTVhOUlNFcHNXbTVOZG1GSFZtaGFTRTEyQ21KWFJuQmlha0UxUW1kdmNrSm5SVVZCV1U4dlRVRkZRa0pEZEc5a1NGSjNZM3B2ZGt3elVuWmhNbFoxVEcxR2FtUkhiSFppYmsxMVdqSnNNR0ZJVm1rS1pGaE9iR050VG5aaWJsSnNZbTVSZFZreU9YUk5Ra2xIUTJselIwRlJVVUpuTnpoM1FWRkpSVUpJUWpGak1tZDNUbWRaUzB0M1dVSkNRVWRFZG5wQlFncEJkMUZ2VFcxR2FVNVVWWHBOTWs1cldXcENhazFVVlhsTlZGSm9UV3BGTkZwRVNtbFpWR3N5VFdwTmVVOUVSVFJPZWtFeVRtcE5lazFVUVdOQ1oyOXlDa0puUlVWQldVOHZUVUZGUlVKQk5VUmpiVlpvWkVkVloxVnRWbk5hVjBaNldsUkJaVUpuYjNKQ1owVkZRVmxQTDAxQlJVWkNRa0pyWVZoT01HTnRPWE1LV2xoT2Vrd3lOVzVoVnpVMFRVSXdSME5wYzBkQlVWRkNaemM0ZDBGUldVVkVNMHBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUTBKcGQxbExTM2RaUWdwQ1FVaFhaVkZKUlVGblVqbENTSE5CWlZGQ00wRkJhR2RyZGtGdlZYWTViMUprU0ZKaGVXVkZia1ZXYmtkTGQxZFFZMDAwTUcwemJYWkRTVWRPYlRsNUNrRkJRVUpuZW5sTlZYbHJRVUZCVVVSQlJXZDNVbWRKYUVGUFlUbDZhME5QVURSNGJXRm9aMkk0UmsxNFpURkhNRVZ5VEVkTVpFbFpMemh2VVc1dk1uVUtWRFp2ZFVGcFJVRjVNSFZSY1dseVUyRlhiMjFhY3pWbU4yVlNPRE5MV0M4eFpVY3ZjVFV4U0dSMWIyRkxkMFZ0VERnMGQwTm5XVWxMYjFwSmVtb3dSUXBCZDAxRVlVRkJkMXBSU1hkVGJteDFVMngwV0V4Rk1WWTJPWGR1V2swMU1UbDVZbmg1V1dOTmF6UnhjMkV3VGxBdk5XcFdaMWt5UkhSSFpESmtkbmRXQ2pSTWQyTTNWbVpIVW1oRmJrRnFSVUZ6ZUROR0t6RjVRVVZWV1V4alZXRk9ORmQ2UlRsR1JVeFBjRzVsTURSckx5dEJOMWxZWlRWWlkwbHNNRFZEWnpBS05YZGpkblJKVlhkM1lURnlUWFJ5WXdvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1663168183,
          "logIndex": 3497556,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/nginx/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3053765981",
      "sha": "2ab5533cdb0c15214a218d2ba962328187066331"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

