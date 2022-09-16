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
| `1.22` `1.22.0` `1.22.0-r0` `latest` `stable` | `sha256:0c3920ea7be52404b035787182ccc3ceeaa7f5a374decf6b03a569b6accf536c`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:0c3920ea7be52404b035787182ccc3ceeaa7f5a374decf6b03a569b6accf536c) | `amd64` `arm64` `armv7` |
| `1` `1.23` `1.23.1` `1.23.1-r0` `mainline` | `sha256:4f0297412798b7a578d5262a1df6563ed30ff0f7c993764bd51df851a9a925a3`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:4f0297412798b7a578d5262a1df6563ed30ff0f7c993764bd51df851a9a925a3) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:0c3920ea7be52404b035787182ccc3ceeaa7f5a374decf6b03a569b6accf536c"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "a17b77b1cf8a6010d46feffed1133b3b120a4c24",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/nginx",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCnqUqVmEGxJs5wJ9F6u592VRlvOWrvnwzwbWbKmIPJxwIgNOI9vAdDX91vOP41KAFDvnnUueqogNDsbj6n+M1L224=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJjYmM5NzEwYjhhZGE2NzJkZGZjYzNjNjI5YmUxOGNmMmUxMDMwMTk5NmUyMzk0ZGM0ODQyYmY1NWMzYzhiZDM0In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNCOG1vV0YrdWZPRC91bHNOYWQxYUZzRnpiU2tMMldONUFFZ210M1RiaXRRSWdkZmZnbFp4K1Jac3NLUlpFRXg0cXl6MkxiWFFGU1V5bXlNcEkyb01ZNzlBPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnRla05EUVhsSFowRjNTVUpCWjBsVldGUlRSbEl4VFVwaUwzazNVa1l2Y2xGQlVXUldlR1oxZEZOUmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRKTlJFVXdUWHBGZDFkb1kwNU5ha2wzVDFSRk1rMUVSVEZOZWtWM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZrZDFoNUsxZGhXbVI0Wm1JNVkwTjBhRWRKT1RGR2NtWlVOMnRVUXpWR1VFTk9WRmtLUkcxNE16QlpiVE5uTTJSc05sUkJXVWhET0ZaVGNrODNXR0pOVEdseVdHcHVReXQ1SzFaT1YyaFlkSFJSYldVd1F6WlBRMEZyUVhkblowazRUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ5Y1RGQkNreENZMmxDTTJwMGIzUnViRzExTm5weFZIVmlWakZCZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFsQldVUldVakJTUVZGSUwwSkdXWGRXU1ZwVFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BpYldSd1ltNW5ka3h0WkhCa1IyZ3hXV2s1TTJJelNuSmFiWGgyWkROTmRtTnRWbk5hVjBaNldsTTFOVmxYTVhOUlNFcHNXbTVOZG1GSFZtaGFTRTEyQ21KWFJuQmlha0UxUW1kdmNrSm5SVVZCV1U4dlRVRkZRa0pEZEc5a1NGSjNZM3B2ZGt3elVuWmhNbFoxVEcxR2FtUkhiSFppYmsxMVdqSnNNR0ZJVm1rS1pGaE9iR050VG5aaWJsSnNZbTVSZFZreU9YUk5RbGxIUTJselIwRlJVVUpuTnpoM1FWRkpSVU5JVG1waFIxWnJaRmQ0YkUxRVdVZERhWE5IUVZGUlFncG5OemgzUVZGTlJVdEhSWGhPTWtrelRqSkplRmt5V1RSWlZGbDNUVlJDYTA1RVdtMWFWMXB0V2xkUmVFMVVUWHBaYWs1cFRWUkpkMWxVVW1wTmFsRjNDa2hCV1V0TGQxbENRa0ZIUkhaNlFVSkNRVkZQVVROS2JGbFlVbXhKUmtwc1lrZFdhR015VlhkSVoxbExTM2RaUWtKQlIwUjJla0ZDUWxGUlVWcEhiSG9LWkVoS2RtSkhWbnBqZVRsMVdqSnNkV1ZFUVdSQ1oyOXlRbWRGUlVGWlR5OU5RVVZIUWtFNWVWcFhXbnBNTW1oc1dWZFNla3d5TVdoaFZ6UjNaMWx2UndwRGFYTkhRVkZSUWpGdWEwTkNRVWxGWmtGU05rRklaMEZrWjBGSldVcE1kMHRHVEM5aFJWaFNNRmR6Ym1oS2VFWmFlR2x6Um1velJFOU9TblExY25kcENrSnFXblpqWjBGQlFWbE9SRGx6YlRaQlFVRkZRWGRDU0UxRlZVTkpVVVJQTTBodFpqQXZRVGhpWkhWa1ZWUmpSVGhvTlZwRU5rUXhSMk5IYjJOUlVXUUtjMDFIWjFoeFRUUnZkMGxuVUdsdlFXNHdjbEl2UlRScWRVSmxla1JIWTJsWWRYbDVSMkpXTDBsb2MxZHNlVmR4UVRCRVFYTXZZM2REWjFsSlMyOWFTUXA2YWpCRlFYZE5SR0ZCUVhkYVVVbDNVWGxXWWpKbVZrSTJiVUp2WjFoQ2JuVkZaRFZWVjNGbVdGcGFSbU5sYzFabU1EZFhjRGsyY3pobWJtMXlZVVJxQ25KVFdVaFpRblJqVnpFMlYxazFhVlJCYWtWQlozTkZlWHBLTmpsS2VtbEpZbWhFV0VFMGNIZzFTbFExUVdSUWNFZG1hR1psT1U1M2QycEtSSGMwZVZrS1puUTBXa2hYV0ZrNWJXOHJSbEZ6TTJkMU0zY0tMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1663292606,
          "logIndex": 3512340,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/nginx/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3064802349",
      "sha": "a17b77b1cf8a6010d46feffed1133b3b120a4c24"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

