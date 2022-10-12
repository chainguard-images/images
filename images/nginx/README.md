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
| `1` `1.23` `1.23.1` `1.23.1-r0` `latest` `mainline` | `sha256:a0f147f30dba5d3b399fa97550cbef7cc8f5af5b6064266b6108c5e0d4497225`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a0f147f30dba5d3b399fa97550cbef7cc8f5af5b6064266b6108c5e0d4497225) | `amd64` `arm64` `armv7` |
| `1.22` `1.22.0` `1.22.0-r0` `stable` | `sha256:85b2a4f5d97e9de85d33e6b428758c13c6759093a7b8bfc48bd99bfd07a44b55`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:85b2a4f5d97e9de85d33e6b428758c13c6759093a7b8bfc48bd99bfd07a44b55) | `amd64` `arm64` `armv7` |


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

If you navigate to `localhost:8080`, you should see `Hello World from Nginx!`.



## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

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
        "docker-manifest-digest": "sha256:a0f147f30dba5d3b399fa97550cbef7cc8f5af5b6064266b6108c5e0d4497225"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "3c4ad39f879656a4d582bb7d167a52322a15c04f",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/nginx",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIF9ZwtuZLZ4sEg2A4TESJmcgZlAD2rkytxMZjsDdGjuGAiEAntayTw6/QVdrCj1bNCMo7dOUEvSSZJaIfbNDOnW4654=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIzZGJjMzE5MDZiMjlmMGZmOGU5M2ExMzMwY2VlMjU0Yjk1ZTk4MmRiY2YxOWFlMjVhNWNiMjRhNjNlNDY0ZWEzIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQTVMVTdzc2NxV2pIUjN1bUZsc2xmNGZJTWp6bkEvSEs4cFUvOXBPWTFhQUFpQnVuQmdsY09MNnVOUzkzeVA2YThJaDdYdS8vaExkNXRoZEkwUWFFZHQxTUE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndSRU5EUVhsMVowRjNTVUpCWjBsVlVVaDBaVWh5VTBjNFdqaElWa2d6Tm5nME1rSnJTR1JZUVVaemQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhsTlZHZDZUMFJWZDFkb1kwNU5ha2w0VFVSRmVVMVVaekJQUkZWM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZKZFd0clMyc3hWbGRSTm1aNk1rVm9WRXRWZW10Uk5UWnZiMnBDVkROamJUYzRVRXNLYVdnM05FNW9ORTkyVkhwaFZWUlNjVUZoY2pGVGFtNVdTelJVTkRBemFVUkVRekJpUTBaaWFtdFFRM3BsVEZCRFFuRlBRMEZyYjNkblowcEhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlY0WlRKcENsSjBNelU0UlZOaFdGcDFjaTlGWjNsVlpqaFFRelZOZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwM1dVUldVakJTUVZGSUwwSkdNSGRYTkZwYVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Tlc1aFZ6VTBUSGsxYm1GWVVtOWtWMGwyWkRJNWVXRXlXbk5pTTJSNlRETktiR0pIVm1oak1sVjFaVmRHZEdKRlFubGFWMXA2Q2t3eWFHeFpWMUo2VERJeGFHRlhOSGRQVVZsTFMzZFpRa0pCUjBSMmVrRkNRVkZSY21GSVVqQmpTRTAyVEhrNU1HSXlkR3hpYVRWb1dUTlNjR0l5TlhvS1RHMWtjR1JIYURGWmJsWjZXbGhLYW1JeU5UQmFWelV3VEcxT2RtSlVRVk5DWjI5eVFtZEZSVUZaVHk5TlFVVkRRa0ZTZDJSWVRtOU5SRmxIUTJselJ3cEJVVkZDWnpjNGQwRlJUVVZMUkU1cVRrZEdhMDE2YkcxUFJHTTFUbXBWTWxsVVVtdE9WR2Q1V1cxSk0xcEVSVEpPTWtVeFRXcE5lVTF0UlhoT1YwMTNDazVIV1hkSVFWbExTM2RaUWtKQlIwUjJla0ZDUWtGUlQxRXpTbXhaV0ZKc1NVWktiR0pIVm1oak1sVjNTbEZaUzB0M1dVSkNRVWRFZG5wQlFrSlJVVmdLV1RKb2FHRlhOVzVrVjBaNVdrTXhjR0pYUm01YVdFMTJZbTFrY0dKdVozZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwdENaMjl5UW1kRlJVRmtXalZCWjFGRFFraDNSV1ZuUWpSQlNGbEJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUkhwWU15czBVVUZCUWtGTlFWSjZRa1pCYVVGak1tMU9XbXBOU21KNkswTkxRMjB6ZFhkWGJYUUtZVGhrVmxKeVNuTm5SWHB6VHpGRWJXWnVaVmxpWjBsb1FVbDVaRlZHTTBSRVJYbDRXQzkxZDJSTlRUUnFka1pOS3pSRWNYUk5iWGx0UWtoQmNIZHVNZ3BxVWxscFRVRnZSME5EY1VkVFRUUTVRa0ZOUkVFeVkwRk5SMUZEVFVkRksxTTFOVzVIZG1RNFNrcGFOVlpaY0dSV0wyeEZXVzlEWlVwSU9TODBVVzlDQ25NNGJWTjBRV2h6WkVrM2F5ODRLM3BYU1U1VWJXVkRhVzFMUkVwWFFVbDNaa1pxZWk5a2FsUlVSV2hSTlhKSGFYSnRXVGxXV2s5a1FqSmxXbTloWVVJS2IxWlZWelZqTnk5bFFUZG1MMDFzVW1GRWFpdHJaRlJsTUZSUGJFTXlWekFLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1665599939,
          "logIndex": 4978875,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/nginx/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/nginx",
      "githubWorkflowSha": "3c4ad39f879656a4d582bb7d167a52322a15c04f",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3236945806",
      "sha": "3c4ad39f879656a4d582bb7d167a52322a15c04f"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

