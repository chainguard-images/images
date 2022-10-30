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
| `1.22.0` `1.22.0-r0` | `sha256:14854d1a7d0cb1a79dfc24675d8a712b5f8f02ec1f359a691669964bd0b6ecd2`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:14854d1a7d0cb1a79dfc24675d8a712b5f8f02ec1f359a691669964bd0b6ecd2) | `amd64` `arm64` `armv7` |
| `1.22` `stable` | `sha256:85007badb1a2a67a486ed03fff11c3b642eedff2c371809a1abee101bdc960ea`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:85007badb1a2a67a486ed03fff11c3b642eedff2c371809a1abee101bdc960ea) | `amd64` `arm64` `armv7` |
| `1.23.1-r0` | `sha256:ef537a031641f9b56e7e52c57dffdbd6ec8749b330114d77343567f733298cad`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ef537a031641f9b56e7e52c57dffdbd6ec8749b330114d77343567f733298cad) |  |
| `1.22.1` `1.22.1-r0` `latest` | `sha256:ca611789da1d986a10c9db7e418e833d6d4c73eb8a6c6e2feda44f0ad97c8904`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ca611789da1d986a10c9db7e418e833d6d4c73eb8a6c6e2feda44f0ad97c8904) | `amd64` `arm64` `armv7` |
| `1.23.1` | `sha256:310f9a01fc3e7a9410ae7ea1d9cac5add66d3f95d081efa6693a829e1b6aaa70`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:310f9a01fc3e7a9410ae7ea1d9cac5add66d3f95d081efa6693a829e1b6aaa70) | `amd64` `arm64` `armv7` |
| `1` `1.23` `1.23.2` `1.23.2-r0` `mainline` | `sha256:672d1c08c4875d3b03193721549da574713d2c06c36f8c116e3405b4ced40dc2`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:672d1c08c4875d3b03193721549da574713d2c06c36f8c116e3405b4ced40dc2) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:ca611789da1d986a10c9db7e418e833d6d4c73eb8a6c6e2feda44f0ad97c8904"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "191f330492530316f1a2c8620e8958e630972d8b",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/nginx",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIBh4JEaUBIMSXMDlv/U7Mc00VJbElRSwuRNDiWAu2k9DAiEAjmMBI/Z6NsU1TWCfvrdmxRt9+5ux4NCGNOZdl4iGnHg=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI2YmUzYzFkYzUzZjNkN2NkY2U5ZDkyODk4MDFmZjQxMWIzNWY5MWVmNjIwZWIxNjM0NDUyZGUzNTM4NzM3OWFhIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJSDFxcVpnc2plbWtIajVUVVZZeXJ5a1lSTGFhMEtnNXZkcXFYa0lGV2w2S0FpQTI3VEpMblJKWDI3c3Z5NnZicURoY1cvSXhDbDhmdVRvaVZhbVRQbitnb3c9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhha05EUVhrclowRjNTVUpCWjBsVll6aEtVelZLY1hGYWJVRllVbk52WlVGWFFqQjJObHBJTm5sM2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFVFhkTlJFVjZUMFJKTVZkb1kwNU5ha2w0VFVSTmQwMUVSVEJQUkVreFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZMZWpVeWJtWjBRak5oTjBaeFdDdHNkV0pHVkRRelpsSTVUazltTW1JeFpYRlNaRWNLZWpSbU1sRldiVzkyWTFJMlVEWTVWV1pQWVVOcVpYUk5iR2hPT0VWdGVscEdPWFpWV1hSS2FYSnRNMmxqYVN0dVNVdFBRMEZyTkhkblowcExUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZHWkdsd0NsUkliMk4zUmxSd1ZFcHBaMFJpTmtreWNqVXhOV1pWZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwM1dVUldVakJTUVZGSUwwSkdNSGRYTkZwYVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Tlc1aFZ6VTBUSGsxYm1GWVVtOWtWMGwyWkRJNWVXRXlXbk5pTTJSNlRETktiR0pIVm1oak1sVjFaVmRHZEdKRlFubGFWMXA2Q2t3eWFHeFpWMUo2VERJeGFHRlhOSGRQVVZsTFMzZFpRa0pCUjBSMmVrRkNRVkZSY21GSVVqQmpTRTAyVEhrNU1HSXlkR3hpYVRWb1dUTlNjR0l5TlhvS1RHMWtjR1JIYURGWmJsWjZXbGhLYW1JeU5UQmFWelV3VEcxT2RtSlVRVmRDWjI5eVFtZEZSVUZaVHk5TlFVVkRRa0ZvZWxreWFHeGFTRlp6V2xSQk1ncENaMjl5UW1kRlJVRlpUeTlOUVVWRVFrTm5lRTlVUm0xTmVrMTNUa1JyZVU1VVRYZE5la1V5V21wR2FFMXRUVFJPYWtsM1dsUm5OVTVVYUd4T2FrMTNDazlVWTNsYVJHaHBUVUozUjBOcGMwZEJVVkZDWnpjNGQwRlJVVVZFYTA1NVdsZEdNRnBUUWxOYVYzaHNXVmhPYkUxRFZVZERhWE5IUVZGUlFtYzNPSGNLUVZGVlJVWXlUbTlaVjJ4MVdqTldhR050VVhSaFZ6Rm9XakpXZWt3eU5XNWhWelUwVFVJd1IwTnBjMGRCVVZGQ1p6YzRkMEZSV1VWRU0wcHNXbTVOZGdwaFIxWm9Xa2hOZG1KWFJuQmlha05DYVdkWlMwdDNXVUpDUVVoWFpWRkpSVUZuVWpoQ1NHOUJaVUZDTWtGQmFHZHJka0Z2VlhZNWIxSmtTRkpoZVdWRkNtNUZWbTVIUzNkWFVHTk5OREJ0TTIxMlEwbEhUbTA1ZVVGQlFVSm9RMkZMVVZkSlFVRkJVVVJCUldOM1VsRkphRUZMWmxSU1dHTnFjRFZPWjJSQlMzb0tTVXBUTlhSSGNXeGFVMmRtU210RWNXTldaRlEwTDJzNWJEWTFXa0ZwUWtKeE4zZzFRelJXWkUwclppOUlSR1JSVXpKUVprUk9URmRXVjJaU1QxcG9XUXBhY1M5aVlVUTVjVmxFUVV0Q1oyZHhhR3RxVDFCUlVVUkJkMDV3UVVSQ2JVRnFSVUY0TjJJMFNsaEVZU3RtZGtwc05XUnRNRGd6Wm14aWEweHVNMFZEQ2tsR1IybEpaa1p6WTAxVk56YzVSR0l2TlZCRVRFTlpSalJDU1ZVek5WRXZZbk5DTUVGcVJVRjJjR28yU1c4elNGUnpMM1ZrVkZkMlpEZHNiMk5JTkVJS2NXVXpZVkZMTUZORFZYbzJSVTFJWVZVNFowcHlXV1J5VkZoM1RtOHJORUpNVjA4MVFsbHFhd290TFMwdExVVk9SQ0JEUlZKVVNVWkpRMEZVUlMwdExTMHRDZz09In19fX0=",
          "integratedTime": 1667093913,
          "logIndex": 6133637,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/nginx/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/nginx",
      "githubWorkflowSha": "191f330492530316f1a2c8620e8958e630972d8b",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3353634907",
      "sha": "191f330492530316f1a2c8620e8958e630972d8b"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

