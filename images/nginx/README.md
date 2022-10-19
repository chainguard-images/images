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
| `1` `1.23` `1.23.1` `1.23.1-r0` `latest` `mainline` | `sha256:569586682ceac6667f87da7591627eb01337c768f757e93fab911591f2c3780d`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:569586682ceac6667f87da7591627eb01337c768f757e93fab911591f2c3780d) | `amd64` `arm64` `armv7` |
| `1.22` `1.22.0` `1.22.0-r0` `stable` | `sha256:85007badb1a2a67a486ed03fff11c3b642eedff2c371809a1abee101bdc960ea`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:85007badb1a2a67a486ed03fff11c3b642eedff2c371809a1abee101bdc960ea) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:569586682ceac6667f87da7591627eb01337c768f757e93fab911591f2c3780d"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "ea597549a9adc47bbdead7c88d2de65cd28b0a5e",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/nginx",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDjkMP5rI7FHWqGykSdpLdEWr4GF04MY26fQrUHCBCbPQIhAMbXo+296EIdNDLNXNK1EHnAQzeC6z4U8npzrGc5SjBs",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJkNmFjYTNjNGY0YjIwNmJmNGVjODI0MTRhZDNiZDk2ZWI3ZTg0MTAzMGU2MzBiZmYyM2EwZDM0ZWMyNjdjNDUyIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNiZ2owWURBVmRGdGFxMjg3OVMvNkpRU0EzK1d6VmNJTE1jTXk1V2xFeXJnSWhBTVVrWkdIWFdWdmFBOXlQREJsdWNMTWJ2TWFUTG9RZDZ6RTAxdmZUaktGVCIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhWRU5EUVhrclowRjNTVUpCWjBsVlMxaHFSV3c0SzFaRFExaHpSV1JXZW1samMwYzVia3d4VmtOTmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRWTlJFVXdUMFJKTUZkb1kwNU5ha2w0VFVSRk5VMUVSVEZQUkVrd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVU0YTJob1FqRmtVamxJVURObFRXMHhVRGxWVUhVNFRXeERTak5UTVVGNk9TOU5iRlVLYmxnNVZuSjRPVlJOV0d0VmEzVkpPVGRuUld3NVZERTJhMmMxVlRGNFMxbFRlbEZYYlVwV1oyOUlXbTFOYmtwTFJUWlBRMEZyTkhkblowcExUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZMUW5CVENtaENZbkJqZGtKT0szUktkME5wZUZwUFIxSnlWbVJ2ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwM1dVUldVakJTUVZGSUwwSkdNSGRYTkZwYVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Tlc1aFZ6VTBUSGsxYm1GWVVtOWtWMGwyWkRJNWVXRXlXbk5pTTJSNlRETktiR0pIVm1oak1sVjFaVmRHZEdKRlFubGFWMXA2Q2t3eWFHeFpWMUo2VERJeGFHRlhOSGRQVVZsTFMzZFpRa0pCUjBSMmVrRkNRVkZSY21GSVVqQmpTRTAyVEhrNU1HSXlkR3hpYVRWb1dUTlNjR0l5TlhvS1RHMWtjR1JIYURGWmJsWjZXbGhLYW1JeU5UQmFWelV3VEcxT2RtSlVRVmRDWjI5eVFtZEZSVUZaVHk5TlFVVkRRa0ZvZWxreWFHeGFTRlp6V2xSQk1ncENaMjl5UW1kRlJVRlpUeTlOUVVWRVFrTm9iRmxVVlRWT2VsVXdUMWRGTlZsWFVtcE9SR1JwV1cxU2JGbFhVVE5aZW1jMFdrUkthMXBVV1RGWk1sRjVDazlIU1hkWlZGWnNUVUozUjBOcGMwZEJVVkZDWnpjNGQwRlJVVVZFYTA1NVdsZEdNRnBUUWxOYVYzaHNXVmhPYkUxRFZVZERhWE5IUVZGUlFtYzNPSGNLUVZGVlJVWXlUbTlaVjJ4MVdqTldhR050VVhSaFZ6Rm9XakpXZWt3eU5XNWhWelUwVFVJd1IwTnBjMGRCVVZGQ1p6YzRkMEZSV1VWRU0wcHNXbTVOZGdwaFIxWm9Xa2hOZG1KWFJuQmlha05DYVdkWlMwdDNXVUpDUVVoWFpWRkpSVUZuVWpoQ1NHOUJaVUZDTWtGQmFHZHJka0Z2VlhZNWIxSmtTRkpoZVdWRkNtNUZWbTVIUzNkWFVHTk5OREJ0TTIxMlEwbEhUbTA1ZVVGQlFVSm5Lek4wWTFwQlFVRkJVVVJCUldOM1VsRkpaMDB4Y0V4R2FHZFJXa05OZW5WalNXNEtTRWM1ZG1WTFkyc3JOMXBrYmtocmIwcGFRV2R2Y1RscGRGbG5RMGxSUkZGWWNubDNPRTlZYjJWclJTdE9lV2czUzFwSU9YVm9Ua3BGYkRsMFdrcE9hd3BpT1hNNFpHczNSbU42UVV0Q1oyZHhhR3RxVDFCUlVVUkJkMDV2UVVSQ2JFRnFSVUZvZDJaWUwwVlhRbGhCWkdaaWQwVkRVRUpYUTA0NVVVcG1Zbk5uQ25oME9WSkROSEJEVjBGV1RFRjVheXRXTm04clJGaFJhQzk0VWtKMFNGTXpORmxwVUVGcVFXRmtZVE00WnpsVU1qSjRNa3RCTUVGMk0yTkpNMDkwYlZFS1JEVnhOMU56V25SUU4yZzJZVUpPVkRseGF6VlJUREJTUlRWQlZWa3pVRXhHYkRCM1NTOXZQUW90TFMwdExVVk9SQ0JEUlZKVVNVWkpRMEZVUlMwdExTMHRDZz09In19fX0=",
          "integratedTime": 1666144122,
          "logIndex": 5400531,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/nginx/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/nginx",
      "githubWorkflowSha": "ea597549a9adc47bbdead7c88d2de65cd28b0a5e",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3278133336",
      "sha": "ea597549a9adc47bbdead7c88d2de65cd28b0a5e"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

