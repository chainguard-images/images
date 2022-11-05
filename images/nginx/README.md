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
| `1.23.1-r0` | `sha256:ef537a031641f9b56e7e52c57dffdbd6ec8749b330114d77343567f733298cad`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ef537a031641f9b56e7e52c57dffdbd6ec8749b330114d77343567f733298cad) |  |
| `1.22.1` `1.22.1-r0` `latest` | `sha256:1ca64f8ae4f4fcdaa70f7d862447ac4ec43634a4ebd6c35e5879d3bcce42e7c9`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:1ca64f8ae4f4fcdaa70f7d862447ac4ec43634a4ebd6c35e5879d3bcce42e7c9) | `amd64` `arm64` `armv7` |
| `1.23.1` | `sha256:310f9a01fc3e7a9410ae7ea1d9cac5add66d3f95d081efa6693a829e1b6aaa70`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:310f9a01fc3e7a9410ae7ea1d9cac5add66d3f95d081efa6693a829e1b6aaa70) | `amd64` `arm64` `armv7` |
| `1` `1.23` `1.23.2` `1.23.2-r0` `mainline` | `sha256:a982ceee12165d332b835ce75124973361ebe5dbfbd7378ca44f47f19596b22b`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a982ceee12165d332b835ce75124973361ebe5dbfbd7378ca44f47f19596b22b) | `amd64` `arm64` `armv7` |
| `1.22.0` `1.22.0-r0` | `sha256:14854d1a7d0cb1a79dfc24675d8a712b5f8f02ec1f359a691669964bd0b6ecd2`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:14854d1a7d0cb1a79dfc24675d8a712b5f8f02ec1f359a691669964bd0b6ecd2) | `amd64` `arm64` `armv7` |
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
        "docker-manifest-digest": "sha256:1ca64f8ae4f4fcdaa70f7d862447ac4ec43634a4ebd6c35e5879d3bcce42e7c9"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "ee9595f02f1d3bcc8775737eec6e0452365fc601",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/nginx",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDZwiYTqhPSeVTYhc3lA9ZLdmGkbsuMblwVEpr2izAeDAIgZ0W3ddA62cVtC2SIjhhVigMidY+iyyg+BrFd/FTPuOs=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJmNDhmZWUwMTYzZTYzNzA2ZmJmMDc0Zjk5MGEzOGI4OTBhNmY2N2ZiNDg5OTdiM2EzM2UyNjg3MjUyOWU2YzBkIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNzRTlDRVM5SEZyQmhOREFOemJFS2FpV1dEUVd0TXlyWXRGeStETUdjY3B3SWdPZlhjR3hxb3BUUVlMM0dpZWJkZElYQjloWkE4NnJkL3FSWXY1azJMNFdvPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhha05EUVhrclowRjNTVUpCWjBsVlR6a3pNMFJQYTI1cVEydzRWbkJ5V25aTU0xbDNaMmRrU214amQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRGTlJFVjZUVVJCTUZkb1kwNU5ha2w0VFZSQk1VMUVSVEJOUkVFd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZQV0c1SVNGaGxORlZTT0c1eWRsaDNkMWROTW5OeVJWUkhiMncxT0U5WlMyRTFiVW9LWkdwbGVGSXhTVU42VUc1M1Z6SkNOV1ZOU2tnMlMxcHliVXBrZWxjcmVXSjJhUzk1YTJaNlJqQlhSRWQyTVVFNFQyRlBRMEZyTkhkblowcExUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZRWlhvNENqaE9SVmRqYVV4YWVHeEJVbmxaUlRCSlRVOVpaM1JyZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwM1dVUldVakJTUVZGSUwwSkdNSGRYTkZwYVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Tlc1aFZ6VTBUSGsxYm1GWVVtOWtWMGwyWkRJNWVXRXlXbk5pTTJSNlRETktiR0pIVm1oak1sVjFaVmRHZEdKRlFubGFWMXA2Q2t3eWFHeFpWMUo2VERJeGFHRlhOSGRQVVZsTFMzZFpRa0pCUjBSMmVrRkNRVkZSY21GSVVqQmpTRTAyVEhrNU1HSXlkR3hpYVRWb1dUTlNjR0l5TlhvS1RHMWtjR1JIYURGWmJsWjZXbGhLYW1JeU5UQmFWelV3VEcxT2RtSlVRVmRDWjI5eVFtZEZSVUZaVHk5TlFVVkRRa0ZvZWxreWFHeGFTRlp6V2xSQk1ncENaMjl5UW1kRlJVRlpUeTlOUVVWRVFrTm9iRnBVYXpGUFZGWnRUVVJLYlUxWFVYcFpiVTVxVDBSak0wNVVZM3BPTWxac1dYcGFiRTFFVVRGTmFrMHlDazVYV21wT2FrRjRUVUozUjBOcGMwZEJVVkZDWnpjNGQwRlJVVVZFYTA1NVdsZEdNRnBUUWxOYVYzaHNXVmhPYkUxRFZVZERhWE5IUVZGUlFtYzNPSGNLUVZGVlJVWXlUbTlaVjJ4MVdqTldhR050VVhSaFZ6Rm9XakpXZWt3eU5XNWhWelUwVFVJd1IwTnBjMGRCVVZGQ1p6YzRkMEZSV1VWRU0wcHNXbTVOZGdwaFIxWm9Xa2hOZG1KWFJuQmlha05DYVdkWlMwdDNXVUpDUVVoWFpWRkpSVUZuVWpoQ1NHOUJaVUZDTWtGT01EbE5SM0pIZUhoRmVWbDRhMlZJU214dUNrNTNTMmxUYkRZME0ycDVkQzgwWlV0amIwRjJTMlUyVDBGQlFVSm9SVlp2ZDJSUlFVRkJVVVJCUldOM1VsRkphRUZOUjJSRk1XeHlZMlJKYkZaQ2NIY0tOMjFvVURJMVJVbG5UbVZGTjI1blVtUXJjVTU2VHpWRFlVTlZVa0ZwUW1WbFdFWkplVFVyZGxKd1FVWldPV2RZV0dkT2FuWm9jR296UTJsclNHVnJWUXBIYjA0MGRrUnVOMlpFUVV0Q1oyZHhhR3RxVDFCUlVVUkJkMDV3UVVSQ2JVRnFSVUUwVnpKUloxRlZNRzAwWmxnd2NqWkphVWxLYkdSeWNVWkVNR29yQ2sxcmMxZHphM0p0YUdweVoybHJWbmg0VG1WcVZVZERaMmhQV2tGRVZuQTJiVlZwUkVGcVJVRXhRMU5SUmt3M1MzZElXVEY2ZDNnMFNWRndRMng0YWpJS05uWlFSbEZPVG1Kbk5rNWxkSFZOTmtsb2JqQXpNMWxoSzNob01TOUxlR296TjJGTmQyMW1SUW90TFMwdExVVk9SQ0JEUlZKVVNVWkpRMEZVUlMwdExTMHRDZz09In19fX0=",
          "integratedTime": 1667611815,
          "logIndex": 6530535,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/nginx/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/nginx",
      "githubWorkflowSha": "ee9595f02f1d3bcc8775737eec6e0452365fc601",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3398111040",
      "sha": "ee9595f02f1d3bcc8775737eec6e0452365fc601"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

