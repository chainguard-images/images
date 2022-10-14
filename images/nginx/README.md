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
| `1` `1.23` `1.23.1` `1.23.1-r0` `latest` `mainline` | `sha256:f45669d78bbc90cc03d430a7276425adb013cb229998e79917c0f5d0c6049110`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:f45669d78bbc90cc03d430a7276425adb013cb229998e79917c0f5d0c6049110) | `amd64` `arm64` `armv7` |
| `1.22` `1.22.0` `1.22.0-r0` `stable` | `sha256:a2b1de52e1ba501c5f59d71060ca78a1084181dd5fcae0649832922b38ccda6f`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a2b1de52e1ba501c5f59d71060ca78a1084181dd5fcae0649832922b38ccda6f) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:f45669d78bbc90cc03d430a7276425adb013cb229998e79917c0f5d0c6049110"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "48cbb7cb63ccf98e5717f4dde317ab5ddc321a03",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/nginx",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIDc8g5cXYE8UDuFGXtnlZx/TTREQttltAd0zU/hBzzWLAiEAoKyE6TTtb1K/bAtbP4x1SLoksFaby9uPl9CSEsiAMG4=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI5MmVmNDk4YzE1YmI1NmJmOGU3NmU2ZGE2MGJhNDA1Zjg4ZmZiYTQ2MjczNzFmN2YzMGEyODZkYWVkZWUyMWQ1In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUQxM1ZqSklGTjJaRTZmY0xXTFdsRE1FK09mTDk2UkdUOUNraVAvRGxWQ1FRSWdmdHo4TXNMNUFHTy9mN0pRb3hZbDZ3clBFekdIclVzaWw0TC9hM2dBTmpjPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndla05EUVhrMlowRjNTVUpCWjBsVlZVTjRRV2hYTUM5bVZubEpSR05qVlZKUFpUUm1kVU5wTW5WemQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRCTlJFVXhUMVJOTVZkb1kwNU5ha2w0VFVSRk1FMUVTWGRQVkUweFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ3ZFc4dmREQXJUaTlrWkhsTGNWZzFUbXBPVGxRdmJVaEhXak01ZVU0MWVFeFpZa1VLWjJGNVEyRTNPVE5wU0VwSmJ6RnhjWEV5V1ZnMk5GTXdlbWRzZG1wck0wODJiWEZHUldSUWIzbHhaRzh4Y0Vod2FrdFBRMEZyTUhkblowcEtUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZFYkV4bENrOVpSVFZZTDB0Tk1sVkdXRzk1VG1Sc1JuaERSVGMwZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwM1dVUldVakJTUVZGSUwwSkdNSGRYTkZwYVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Tlc1aFZ6VTBUSGsxYm1GWVVtOWtWMGwyWkRJNWVXRXlXbk5pTTJSNlRETktiR0pIVm1oak1sVjFaVmRHZEdKRlFubGFWMXA2Q2t3eWFHeFpWMUo2VERJeGFHRlhOSGRQVVZsTFMzZFpRa0pCUjBSMmVrRkNRVkZSY21GSVVqQmpTRTAyVEhrNU1HSXlkR3hpYVRWb1dUTlNjR0l5TlhvS1RHMWtjR1JIYURGWmJsWjZXbGhLYW1JeU5UQmFWelV3VEcxT2RtSlVRVmRDWjI5eVFtZEZSVUZaVHk5TlFVVkRRa0ZvZWxreWFHeGFTRlp6V2xSQk1ncENaMjl5UW1kRlJVRlpUeTlOUVVWRVFrTm5NRTlIVG1sWmFtUnFXV3BaZWxreVRtMVBWR2hzVGxSamVFNHlXVEJhUjFKc1RYcEZNMWxYU1RGYVIxSnFDazE2U1hoWlZFRjZUVUozUjBOcGMwZEJVVkZDWnpjNGQwRlJVVVZFYTA1NVdsZEdNRnBUUWxOYVYzaHNXVmhPYkUxRFZVZERhWE5IUVZGUlFtYzNPSGNLUVZGVlJVWXlUbTlaVjJ4MVdqTldhR050VVhSaFZ6Rm9XakpXZWt3eU5XNWhWelUwVFVJd1IwTnBjMGRCVVZGQ1p6YzRkMEZSV1VWRU0wcHNXbTVOZGdwaFIxWm9Xa2hOZG1KWFJuQmlha05DYVZGWlMwdDNXVUpDUVVoWFpWRkpSVUZuVWpkQ1NHdEJaSGRDTVVGQmFHZHJka0Z2VlhZNWIxSmtTRkpoZVdWRkNtNUZWbTVIUzNkWFVHTk5OREJ0TTIxMlEwbEhUbTA1ZVVGQlFVSm5PVkV6TkdkM1FVRkJVVVJCUlZsM1VrRkpaMG96TURobmVEVnVTRlkxY2xveE5YRUtWRTQ0WWpJM2VXZFRXR0V3YUdSNmRsWk5aWEV6T0VaRVpubHpRMGxGVGpodldHa3JSVmREVFhGM1UyOWxjek0zV0VJM0wybFJjblZOVVRkTWFYcDBUZ3BxV1dWU2R6WnBVRTFCYjBkRFEzRkhVMDAwT1VKQlRVUkJNbU5CVFVkUlEwMUZNa0Y0VW5Sd1UwaEJiV3d5TjJ4S1lUQjJkbmxYVUVkbWJFVkpURFV2Q2swMmNEQnRVRE5VTjFwalVXOXhNV3BoZVdNeGFUTkxlV3B3TTNKTVVEQk5UbWRKZDBoWE5ITmhNa2s0U0VkelJGRnNhbXdyWlhSSVYyeFNkM1ZWYVRRS1UyUnVPWEk1YkdaTWMwZEhZMWxVUzJONlVsZDBhemxaVDFORVR6bGlSbGd3TVdvd0NpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1665712784,
          "logIndex": 5064628,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/nginx/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/nginx",
      "githubWorkflowSha": "48cbb7cb63ccf98e5717f4dde317ab5ddc321a03",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3246870019",
      "sha": "48cbb7cb63ccf98e5717f4dde317ab5ddc321a03"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

