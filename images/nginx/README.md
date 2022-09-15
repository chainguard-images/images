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
| `1` `1.23` `1.23.1` `1.23.1-r0` `latest` `mainline` | `sha256:b2dcf5402c0083c28cbc161a057a2bfd962b96809df0a62d33f569f6597f4245`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:b2dcf5402c0083c28cbc161a057a2bfd962b96809df0a62d33f569f6597f4245) | `amd64` `arm64` `armv7` |
| `1.22` `1.22.0` `1.22.0-r0` `stable` | `sha256:c1b8521b28d09e47bbeee9bc251e69cf9bc2cbef12c7cbf5e46a7804febe8338`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c1b8521b28d09e47bbeee9bc251e69cf9bc2cbef12c7cbf5e46a7804febe8338) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:b2dcf5402c0083c28cbc161a057a2bfd962b96809df0a62d33f569f6597f4245"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "1758caf76b217b29495b0b1e90e2d75009fee002",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/nginx",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDoxHHNoCZNqxUzNEr7eLPyux0i6JnBJIlLZ9vYmS9wEQIhAOAi8cRbZN8ZziTKyBnyjY+Xs0uo41A7UENpYTUXSvtK",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJhZWU2MTExNTM1MTFiYTRlOGUwMzhhNjJkMGUzMjExNTQ0ZmM5MThmYTUzZWMwZjRhM2UwNWE0ZWE3NTgxZGFhIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQU9LQ3RIOHYwQ0kxK0ROcUQzcG5mc2dTMTRUSXpueVRKbDR5V3pJYStVUkFpQUJJTjgwSFM0S0gxbWdIUDl4MXdvQm9ubzg5bUNvZjk4bFJoWWE0SHRRWmc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnRla05EUVhsTFowRjNTVUpCWjBsVlpWVnRZM1ptZVdkbVZFVmpORk5RYkZJMmNWb3hkSEF5TUZaM2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRGTlJFbDRUMVJWTlZkb1kwNU5ha2wzVDFSRk1VMUVTWGxQVkZVMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVY1VTNOdVRtUmFTazh5UnpCTk1XOWhZalpuWWpWVGFEaENWbVpHYkdGalVuRndUMmdLTTBrM0syTjNZMjQxYURWVFEzQlZWVVl5YkdoMlRtMVJMMlF6VjJONVdqQjFibE54ZVZCc05VOVRhVzR3WmtwMmFHRlBRMEZyUlhkblowazVUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ5ZEc1U0NuQk9aakJXTW5GUUwwOVNNRXd5Wm5Wc2VERlJOR2cwZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFsQldVUldVakJTUVZGSUwwSkdXWGRXU1ZwVFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BpYldSd1ltNW5ka3h0WkhCa1IyZ3hXV2s1TTJJelNuSmFiWGgyWkROTmRtTnRWbk5hVjBaNldsTTFOVmxYTVhOUlNFcHNXbTVOZG1GSFZtaGFTRTEyQ21KWFJuQmlha0UxUW1kdmNrSm5SVVZCV1U4dlRVRkZRa0pEZEc5a1NGSjNZM3B2ZGt3elVuWmhNbFoxVEcxR2FtUkhiSFppYmsxMVdqSnNNR0ZJVm1rS1pGaE9iR050VG5aaWJsSnNZbTVSZFZreU9YUk5RbGxIUTJselIwRlJVVUpuTnpoM1FWRkpSVU5JVG1waFIxWnJaRmQ0YkUxRVdVZERhWE5IUVZGUlFncG5OemgzUVZGTlJVdEVSVE5PVkdocVdWZFpNMDV0U1hsTlZHUnBUV3ByTUU5VVZtbE5SMGw0V2xScmQxcFVTbXRPZWxWM1RVUnNiVnBYVlhkTlJFbDNDa2hCV1V0TGQxbENRa0ZIUkhaNlFVSkNRVkZQVVROS2JGbFlVbXhKUmtwc1lrZFdhR015VlhkSVoxbExTM2RaUWtKQlIwUjJla0ZDUWxGUlVWcEhiSG9LWkVoS2RtSkhWbnBqZVRsMVdqSnNkV1ZFUVdSQ1oyOXlRbWRGUlVGWlR5OU5RVVZIUWtFNWVWcFhXbnBNTW1oc1dWZFNla3d5TVdoaFZ6UjNaMWx6UndwRGFYTkhRVkZSUWpGdWEwTkNRVWxGWmxGU04wRklhMEZrZDBGSldVcE1kMHRHVEM5aFJWaFNNRmR6Ym1oS2VFWmFlR2x6Um1velJFOU9TblExY25kcENrSnFXblpqWjBGQlFWbE5LemhwU2xOQlFVRkZRWGRDU1UxRldVTkpVVU5FTVhjelRVcEJXa3hYWmxJMmVVZGtjMHhXWmk5ME5FVTJPRk0yU0hoU1YyZ0tTa1ZpWTBwQksxZHFaMGxvUVVsNk5IaGpaVFo1YlU4MVRHeGhVbFYzUjFvNFRYUk9OakpVY0RJNFZWSldVRVZxSzFwRFZrZHVSakJOUVc5SFEwTnhSd3BUVFRRNVFrRk5SRUV5WTBGTlIxRkRUVUZqZDJkR1FscEZhRmQyTWxkRVZIVXpjbEJ5UVVWdE1WRm9Sa2RPWkdGR1ZsZDNiRlZJVEdOclVUaExNa3hMQ2xabGRtUnliblJQTTBGVFJrVkNPRFowVVVsM1ZUa3JZbWxWTjNOQ1NFNHdlbVJtVVVkVFExVXdlWEU1TmxKNmFrTnpSbkpNTnk5TmNWUnZOMXBwYVc4S01tZzNXbTlUUVRsMWRXcE5NbTR2ZG1nd1pHY0tMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1663208417,
          "logIndex": 3503951,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/nginx/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "2",
      "run_id": "3057167868",
      "sha": "1758caf76b217b29495b0b1e90e2d75009fee002"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

