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
| `1` `1.23` `1.23.1` `1.23.1-r0` `latest` `mainline` | `sha256:c4b7701d82c4c58178a7c008dc7f08506552b546ffdd2f9ccf0b5f88d1154704`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c4b7701d82c4c58178a7c008dc7f08506552b546ffdd2f9ccf0b5f88d1154704) | `amd64` `arm64` `armv7` |
| `1.22` `1.22.0` `1.22.0-r0` `stable` | `sha256:bc619cae72304858652b74a1e21d28badf64c439e5c19bf8647d20967c6a35bf`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:bc619cae72304858652b74a1e21d28badf64c439e5c19bf8647d20967c6a35bf) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:c4b7701d82c4c58178a7c008dc7f08506552b546ffdd2f9ccf0b5f88d1154704"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "41362987f2259b86774fa6334c64322a56b074b6",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/nginx",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDMKIau6leaMdRzSV/WWhXUeLCR7bR15gxljvIQSgXlMAIhAPgsyRW5MsEUK1ctgUtq2EzAs6ILO9LxKffAW3BXtuzo",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJlMDY2OGM3MWQ3MjYyZTg1YTk4NmMxMDBlZjMzYWJmZTI0ODNiZjRkMThmNDg3MDYxMjg3ZGM2NjE5ODNkNDYwIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJRnlGcldWMGY3c1hmV09IMS9BbUd1UnZuQmIvZHFJQjJxdEluZmwyaFdvTUFpRUFrNTBYSVdSb1NIZzUxYUYwYWJtV1dWZHpFZmNDcWpMSDR0SkV3eWFZZUJrPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhha05EUVhrclowRjNTVUpCWjBsVlIyNUlTSFpNUkhwUE9TOTRLelIzSzBSdmRWUmlkVzlaZUdoTmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hoTlJFVXdUbFJKZVZkb1kwNU5ha2wzVDFSSmVFMUVSVEZPVkVsNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZhVWpRMGJWZHlNME13WlhZd04zSndZbXBLWVZwUU9HdEtUVkpQV1dwRGFqbDBSV2NLT1dKVU0wTkVNbWg2VEdRd2FYUlhLMk40ZGtSMlJuZFhaMFE1WVZsTGFHWmlOSGxWYlhkM2NFVTBNa1JNV0hscFpuRlBRMEZyTkhkblowcExUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlUzY1ZKWkNrZGlSMjVCYjJaeU5EQnlOakkyYUhVNFlrNDFabXRKZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwM1dVUldVakJTUVZGSUwwSkdNSGRYTkZwYVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Tlc1aFZ6VTBUSGsxYm1GWVVtOWtWMGwyWkRJNWVXRXlXbk5pTTJSNlRETktiR0pIVm1oak1sVjFaVmRHZEdKRlFubGFWMXA2Q2t3eWFHeFpWMUo2VERJeGFHRlhOSGRQVVZsTFMzZFpRa0pCUjBSMmVrRkNRVkZSY21GSVVqQmpTRTAyVEhrNU1HSXlkR3hpYVRWb1dUTlNjR0l5TlhvS1RHMWtjR1JIYURGWmJsWjZXbGhLYW1JeU5UQmFWelV3VEcxT2RtSlVRVmRDWjI5eVFtZEZSVUZaVHk5TlFVVkRRa0ZvZWxreWFHeGFTRlp6V2xSQk1ncENaMjl5UW1kRlJVRlpUeTlOUVVWRVFrTm5NRTFVVFRKTmFtczBUakpaZVUxcVZUVlphbWN5VG5wak1GcHRSVEpOZWswd1dYcFpNRTE2U1hsWlZGVXlDbGxxUVROT1Iwa3lUVUozUjBOcGMwZEJVVkZDWnpjNGQwRlJVVVZFYTA1NVdsZEdNRnBUUWxOYVYzaHNXVmhPYkUxRFZVZERhWE5IUVZGUlFtYzNPSGNLUVZGVlJVWXlUbTlaVjJ4MVdqTldhR050VVhSaFZ6Rm9XakpXZWt3eU5XNWhWelUwVFVJd1IwTnBjMGRCVVZGQ1p6YzRkMEZSV1VWRU0wcHNXbTVOZGdwaFIxWm9Xa2hOZG1KWFJuQmlha05DYVdkWlMwdDNXVUpDUVVoWFpWRkpSVUZuVWpoQ1NHOUJaVUZDTWtGQmFHZHJka0Z2VlhZNWIxSmtTRkpoZVdWRkNtNUZWbTVIUzNkWFVHTk5OREJ0TTIxMlEwbEhUbTA1ZVVGQlFVSm5NVEkwYkRaWlFVRkJVVVJCUldOM1VsRkphRUZRVW1KTGMxTm9UREIyU21GMVpXZ0tWbGRYUldrck5rbHJUVEp4YVZOU2JHeGpOREl6TjNOeGVWWTBaVUZwUWxwYU9XOTNPWEJFTm5SQlpFMHZiWGd6Ym5kNk1sRXhMelZPTmtGUVZrOU1RZ3A0WTJnMk5UZEljelZxUVV0Q1oyZHhhR3RxVDFCUlVVUkJkMDV3UVVSQ2JVRnFSVUV6ZDNBNGJrMXJRVmgzTkhCNVVFNXZkV1U0V1VGM1pGcFNWVTQyQ205eVdYSXlXblpWZEc5aFlrTnROVFJMWmpOa05qWllaVkF3UW5aTmNtTlVURkJ3V1VGcVJVRjJWelpZWTA1V05VNDVjR2xZUTJ0R2IxQTVjeXN5WnpJS1QyaFdXRE42TVRGRllpODNSamhwUm1sVFozZEpaSHB5U2tndlVGbHZSRVp1U201RlNuaHRRZ290TFMwdExVVk9SQ0JEUlZKVVNVWkpRMEZVUlMwdExTMHRDZz09In19fX0=",
          "integratedTime": 1663724738,
          "logIndex": 3643906,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/nginx/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3094570968",
      "sha": "41362987f2259b86774fa6334c64322a56b074b6"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

