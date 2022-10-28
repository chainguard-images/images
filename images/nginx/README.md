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
| `1.22.1` `1.22.1-r0` | `sha256:0de9a86594f5b0a240d7faeea4efc7f537f63f9b8b35cb0a8e9235e72f17800b`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:0de9a86594f5b0a240d7faeea4efc7f537f63f9b8b35cb0a8e9235e72f17800b) | `amd64` `arm64` `armv7` |
| `1` `1.23` `1.23.2` `1.23.2-r0` `latest` `mainline` | `sha256:fabb4e1a8890a6d019b7ad908b394c5d9783d6cddc0d824a5afc63d487df9ee5`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:fabb4e1a8890a6d019b7ad908b394c5d9783d6cddc0d824a5afc63d487df9ee5) | `amd64` `arm64` `armv7` |
| `1.23.1` | `sha256:310f9a01fc3e7a9410ae7ea1d9cac5add66d3f95d081efa6693a829e1b6aaa70`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:310f9a01fc3e7a9410ae7ea1d9cac5add66d3f95d081efa6693a829e1b6aaa70) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:fabb4e1a8890a6d019b7ad908b394c5d9783d6cddc0d824a5afc63d487df9ee5"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "2ea58b17802ae87f1336ae27b07a29b71254505f",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/nginx",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCb4yMVOMB2ddono7rMuhPWsF1q2QQwcmPfGtLUCHqauAIgRd0AjDDkHE8ZnRDKvb3cWcFbrSsKLtHIbAH496a9x6k=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJkMjc4MGI5MTI3M2NhMjQ1YWM1NDEyZmNmNGFjNGRkOGViOTMzM2JmZGYzYzZkODVjOTBmNmIyNmE3NmEzY2JjIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJR2xLYnVRQk5nVVI0TnFDYk5mVkRQdUE3WjhZbHZYOGFHb1RlMkJncmt0L0FpQkVERzhtUUxlNGNNYzBndm1kZ3R5dlVId2tlNlJiWks4d3h1K0NUNTRNU1E9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhWRU5EUVhrclowRjNTVUpCWjBsVlRWZGpUMjFaT1hNNFYzbGhNM3BuVkc5RFJFZHhWVk4zU1V4QmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1RSTlJFVjZUbFJWZUZkb1kwNU5ha2w0VFVSSk5FMUVSVEJPVkZWNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZLYlhoM1pYSlpUWG9yWTJGdWVGQTNNelpzYzBKTVFqZHdXR3RvVTBsRFpISlJTamdLYmpWRWRXUk5OVXMzVUc5dFozUkNUVTV0VERKUVVEbFJaeklyY0V4VU16ZzFVM3BQSzFwbE1FeGFiMlpZTUZsNGIwdFBRMEZyTkhkblowcExUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZKYjFwbkNtNWxXbTFpV25ablVEY3hkRlU1T1RkcGRsazJkVU5OZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwM1dVUldVakJTUVZGSUwwSkdNSGRYTkZwYVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Tlc1aFZ6VTBUSGsxYm1GWVVtOWtWMGwyWkRJNWVXRXlXbk5pTTJSNlRETktiR0pIVm1oak1sVjFaVmRHZEdKRlFubGFWMXA2Q2t3eWFHeFpWMUo2VERJeGFHRlhOSGRQVVZsTFMzZFpRa0pCUjBSMmVrRkNRVkZSY21GSVVqQmpTRTAyVEhrNU1HSXlkR3hpYVRWb1dUTlNjR0l5TlhvS1RHMWtjR1JIYURGWmJsWjZXbGhLYW1JeU5UQmFWelV3VEcxT2RtSlVRVmRDWjI5eVFtZEZSVUZaVHk5TlFVVkRRa0ZvZWxreWFHeGFTRlp6V2xSQk1ncENaMjl5UW1kRlJVRlpUeTlOUVVWRVFrTm5lVnBYUlRGUFIwbDRUbnBuZDAxdFJteFBSR1J0VFZSTmVrNXRSbXhOYW1ScFRVUmthRTFxYkdsT2VrVjVDazVVVVRGTlJGWnRUVUozUjBOcGMwZEJVVkZDWnpjNGQwRlJVVVZFYTA1NVdsZEdNRnBUUWxOYVYzaHNXVmhPYkUxRFZVZERhWE5IUVZGUlFtYzNPSGNLUVZGVlJVWXlUbTlaVjJ4MVdqTldhR050VVhSaFZ6Rm9XakpXZWt3eU5XNWhWelUwVFVJd1IwTnBjMGRCVVZGQ1p6YzRkMEZSV1VWRU0wcHNXbTVOZGdwaFIxWm9Xa2hOZG1KWFJuQmlha05DYVdkWlMwdDNXVUpDUVVoWFpWRkpSVUZuVWpoQ1NHOUJaVUZDTWtGQmFHZHJka0Z2VlhZNWIxSmtTRkpoZVdWRkNtNUZWbTVIUzNkWFVHTk5OREJ0TTIxMlEwbEhUbTA1ZVVGQlFVSm9RbmMzVERSQlFVRkJVVVJCUldOM1VsRkpaMFpPVjJFelJFWmpjbGh5WjFCc1pFWUtSMk50VTJ0cVpHMXRjRlpOZDJsRVdGRXZZVUY0YlZvd1VtMUpRMGxSUkdOTWIyUkRVVWRKV0cxa2IyUlBOMmhvYmxoTEsyZGFUMmM0U0dKdmRHdHFUUXBZTlM5TlpVTmFNSEI2UVV0Q1oyZHhhR3RxVDFCUlVVUkJkMDV2UVVSQ2JFRnFRV2xQV25sNmJqVk5lSEZMVlZOTFlYQXlVemMxUmpoak1sVkxjM1ZqQ214MlJVNUlhMmMwWm1sd0sybElWa2RhVmtOaVdHc3JUSFZTSzBjd1lrMW1hMGQzUTAxUlJFeEhPRWRsV21ZMVJEaDZiRlpGY0ZZNWEyVlpTRUp4TVcwS01FUm5OSFJPYzFWblEzVmtZM1IyVUUweWRsWjNTSGwzVlRSUVIySlpaMjVyWldka1RWQnZQUW90TFMwdExVVk9SQ0JEUlZKVVNVWkpRMEZVUlMwdExTMHRDZz09In19fX0=",
          "integratedTime": 1666920961,
          "logIndex": 6015193,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/nginx/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/nginx",
      "githubWorkflowSha": "2ea58b17802ae87f1336ae27b07a29b71254505f",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3342091230",
      "sha": "2ea58b17802ae87f1336ae27b07a29b71254505f"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

