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
| `1.22.0` `1.22.0-r0` `latest` | `sha256:c644ad1dd6e792322e4e4d905b7d937c150e031e2d1fbaec4ab4ff790d0d768b`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c644ad1dd6e792322e4e4d905b7d937c150e031e2d1fbaec4ab4ff790d0d768b) | `amd64` `arm64` `armv7` |
| `1.23.1` `1.23.1-r0` | `sha256:3336e0ca38453f65e849915420d56984bdefc13ce10fee0d66107feba46a58ab`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:3336e0ca38453f65e849915420d56984bdefc13ce10fee0d66107feba46a58ab) | `amd64` `arm64` `armv7` |
| `1` `1.23` `mainline` | `sha256:569586682ceac6667f87da7591627eb01337c768f757e93fab911591f2c3780d`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:569586682ceac6667f87da7591627eb01337c768f757e93fab911591f2c3780d) | `amd64` `arm64` `armv7` |
| `1.22` `stable` | `sha256:85007badb1a2a67a486ed03fff11c3b642eedff2c371809a1abee101bdc960ea`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:85007badb1a2a67a486ed03fff11c3b642eedff2c371809a1abee101bdc960ea) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:c644ad1dd6e792322e4e4d905b7d937c150e031e2d1fbaec4ab4ff790d0d768b"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "56462e09adaa8b445de049bc4665c449a5ab3e6e",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/nginx",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDvIvnq2Y1Ww+8ASOCH0pbctKAWf67S2NZjrV43nQdhfgIge1Yqcr9t5kol4Z9RoxiQrwDOkJnqAPS/5dn7rgyW0ks=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIxZjIyNzBmYzdlYmEyNjQ3ZmY5NjYzOWJiNWQ1MDhhMWJjODAxYjFkZmIxOWQzNDYzZjIwYzRmNmM3NmJkZmFlIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQVl6VThmRnFXU3ZaZ3hlN2kycWVXSzJKdmFYWisweWxZcUtNVEFMSnB6S0FpQi94dEZyT0kvTUJvdkZ5TkRRTm8rYVlvdTRyZGVKaHJUWE1qNEl4QjE3SFE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhWRU5EUVhrclowRjNTVUpCWjBsVlpGUlNaVXRhYzBsamRWTjZXRTkzY0ZaRmIyTkJUVXRuVEdWbmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1hkTlJFVjZUbnBWZWxkb1kwNU5ha2w0VFVSSmQwMUVSVEJPZWxWNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZRUTB0eFQxQkJUak52U1ZacFpXSktOU3RyWWxSQlpGVk5TVWxES3k5cWRGQk5Ua01LVWs5VGRFOXlhazl4UkZodE1GUXdNMmxNYzB0QlFVVlllV1JrU0ZCb1JIZFBjR3hLYUN0T1lrbHhiMWN3WVdweUsyRlBRMEZyTkhkblowcExUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZQV21kc0NqZFFOQ3RvWW1OVFF6aHhkWFZQUVROaFNVbzVjWGx2ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwM1dVUldVakJTUVZGSUwwSkdNSGRYTkZwYVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Tlc1aFZ6VTBUSGsxYm1GWVVtOWtWMGwyWkRJNWVXRXlXbk5pTTJSNlRETktiR0pIVm1oak1sVjFaVmRHZEdKRlFubGFWMXA2Q2t3eWFHeFpWMUo2VERJeGFHRlhOSGRQVVZsTFMzZFpRa0pCUjBSMmVrRkNRVkZSY21GSVVqQmpTRTAyVEhrNU1HSXlkR3hpYVRWb1dUTlNjR0l5TlhvS1RHMWtjR1JIYURGWmJsWjZXbGhLYW1JeU5UQmFWelV3VEcxT2RtSlVRVmRDWjI5eVFtZEZSVUZaVHk5TlFVVkRRa0ZvZWxreWFHeGFTRlp6V2xSQk1ncENaMjl5UW1kRlJVRlpUeTlOUVVWRVFrTm5NVTVxVVRKTmJWVjNUMWRHYTFsWFJUUlphbEV3VGxkU2JFMUVVVFZaYlUwd1RtcFpNVmw2VVRCUFYwVXhDbGxYU1hwYVZGcHNUVUozUjBOcGMwZEJVVkZDWnpjNGQwRlJVVVZFYTA1NVdsZEdNRnBUUWxOYVYzaHNXVmhPYkUxRFZVZERhWE5IUVZGUlFtYzNPSGNLUVZGVlJVWXlUbTlaVjJ4MVdqTldhR050VVhSaFZ6Rm9XakpXZWt3eU5XNWhWelUwVFVJd1IwTnBjMGRCVVZGQ1p6YzRkMEZSV1VWRU0wcHNXbTVOZGdwaFIxWm9Xa2hOZG1KWFJuQmlha05DYVdkWlMwdDNXVUpDUVVoWFpWRkpSVUZuVWpoQ1NHOUJaVUZDTWtGQmFHZHJka0Z2VlhZNWIxSmtTRkpoZVdWRkNtNUZWbTVIUzNkWFVHTk5OREJ0TTIxMlEwbEhUbTA1ZVVGQlFVSm5MMDFMUzNoWlFVRkJVVVJCUldOM1VsRkphRUZOTWtWaU5ETklkMUpsZEhOeE0xWUtTa2R4ZVVGeVJTOUpjVEpaWmk5TmQyTlliMnRJS3pjMldHNXRiRUZwUVhNeU9GRmlUblUyY1hoRFkxQnZlbGd3VG1WM2IwSkdlbkpFVVc4cmRVcFFOZ3B5T0hWbk1GSlVVMmhFUVV0Q1oyZHhhR3RxVDFCUlVVUkJkMDV2UVVSQ2JFRnFSVUZ6UTFsWlFXSmxaMFJZVGxGVUswdDZhSFJuUVU1cGJXSmlaemxvQ2pCUWFFZDZSVkJsU2pkUFVUSlpWRmxKTW1oeUwyWjBhMnhSVjNwTGJrdG5ZVmxHVFVGcVFUaHRVVEpvV2tsU2NHNTZSVXBuVVhKd2JsVlVURmh1TkdVS01qUjNjVXhFYkZVM0wzTnBaSEJTYURCS1FURm1hRTlCVERRMVQxRnNTR2h3WTBWNlpVbG5QUW90TFMwdExVVk9SQ0JEUlZKVVNVWkpRMEZVUlMwdExTMHRDZz09In19fX0=",
          "integratedTime": 1666229881,
          "logIndex": 5466981,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/nginx/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/nginx",
      "githubWorkflowSha": "56462e09adaa8b445de049bc4665c449a5ab3e6e",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3286149703",
      "sha": "56462e09adaa8b445de049bc4665c449a5ab3e6e"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

