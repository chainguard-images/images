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
| `1.22` `1.22.0` `1.22.0-r0` `latest` `stable` | `sha256:fcfdeba2d73b1e5ae7a7ac3539e5fab1bd8727426c1b93233af027924be860cd`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:fcfdeba2d73b1e5ae7a7ac3539e5fab1bd8727426c1b93233af027924be860cd) | `amd64` `arm64` `armv7` |
| `1` `1.23` `1.23.1` `1.23.1-r0` `mainline` | `sha256:0b0ff8ffb693a8012c247ea64fe472dda8ed5de7bb93fe8b7058c537e165d2ae`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:0b0ff8ffb693a8012c247ea64fe472dda8ed5de7bb93fe8b7058c537e165d2ae) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:fcfdeba2d73b1e5ae7a7ac3539e5fab1bd8727426c1b93233af027924be860cd"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "1e6e1822c2d3c39b5664bb3bc511ee50473220de",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/nginx",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIG1rujV1RTegrmSoeIutN+EJyZMwXQqAhbMUSvq7z5lHAiBjlw6Pa2/3JVuYOERpOis+4H5orMR1KZcWMa3bSKiL2A==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI4MmM0NGI3NzcwMWU5MDQ1ZTAxM2Y5N2M0OGEyMTM1OWEzZWY5NDM5YTY5NWRjMWFhMmJkYTgxZmM1N2I5ZDJmIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJRDdpeWtSSDMraVhrSlZGQTRxZDNWamk5Y3NwRW5DWlR5ZmVDZy9wNXVqYUFpQmhKVmRCV2hoRFFxUHhIWXRwbXNpa01vcS9QTC9rZ1NKN0JTNkQvWFZFd0E9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhWRU5EUVhrclowRjNTVUpCWjBsVldHMHpXa1I1Tm5CRmIzWkJjVVpZVTFWTFZrazRka2RVZW1GcmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRSTlJFVXdUbFJGTUZkb1kwNU5ha2w0VFVSRk5FMUVSVEZPVkVVd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVV5VFZsa1ZWTjRXRVpGWjBFMGRtMXZhblp2YzBobVJqRTBhMHBEVXpsRE9GRlZjWGdLWVVGRWEzRjFSRlZrTUdGMGF6QmlTbE5UYjNwdE9ISXpjR2x4UzI1M1EyRnhja0ZFTlhKdWFFZE9lVnBWUVcweGNtRlBRMEZyTkhkblowcExUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZyYVVOeUNraG1RWGxPVUZGTlQyaFpOWGhHZW10alV6Wkljamh2ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwM1dVUldVakJTUVZGSUwwSkdNSGRYTkZwYVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Tlc1aFZ6VTBUSGsxYm1GWVVtOWtWMGwyWkRJNWVXRXlXbk5pTTJSNlRETktiR0pIVm1oak1sVjFaVmRHZEdKRlFubGFWMXA2Q2t3eWFHeFpWMUo2VERJeGFHRlhOSGRQVVZsTFMzZFpRa0pCUjBSMmVrRkNRVkZSY21GSVVqQmpTRTAyVEhrNU1HSXlkR3hpYVRWb1dUTlNjR0l5TlhvS1RHMWtjR1JIYURGWmJsWjZXbGhLYW1JeU5UQmFWelV3VEcxT2RtSlVRVmRDWjI5eVFtZEZSVUZaVHk5TlFVVkRRa0ZvZWxreWFHeGFTRlp6V2xSQk1ncENaMjl5UW1kRlJVRlpUeTlOUVVWRVFrTm5lRnBVV214TlZHZDVUVzFOZVZwRVRtcE5lbXhwVGxSWk1rNUhTbWxOTWtwcVRsUkZlRnBYVlRGTlJGRXpDazE2U1hsTlIxSnNUVUozUjBOcGMwZEJVVkZDWnpjNGQwRlJVVVZFYTA1NVdsZEdNRnBUUWxOYVYzaHNXVmhPYkUxRFZVZERhWE5IUVZGUlFtYzNPSGNLUVZGVlJVWXlUbTlaVjJ4MVdqTldhR050VVhSaFZ6Rm9XakpXZWt3eU5XNWhWelUwVFVJd1IwTnBjMGRCVVZGQ1p6YzRkMEZSV1VWRU0wcHNXbTVOZGdwaFIxWm9Xa2hOZG1KWFJuQmlha05DYVdkWlMwdDNXVUpDUVVoWFpWRkpSVUZuVWpoQ1NHOUJaVUZDTWtGQmFHZHJka0Z2VlhZNWIxSmtTRkpoZVdWRkNtNUZWbTVIUzNkWFVHTk5OREJ0TTIxMlEwbEhUbTA1ZVVGQlFVSm5LMnBGVEZsRlFVRkJVVVJCUldOM1VsRkpaMUl6U1RGTlYwSlNSRk5YT0hSSFVFa0taREJUYzBsbk9WaFVhVEZZU21aWFFtSlNZMnhYZUhSVlpraG5RMGxSUkZOUU1HWlJTV05pVTJSVlpIQm1XR0ZVU0hKbVpqRjBWVXhhWjFJelVHcEJPQXBwV1RKbVJqQnlabnA2UVV0Q1oyZHhhR3RxVDFCUlVVUkJkMDV2UVVSQ2JFRnFSVUZ0TXpkQ00xSkpZMEpxTDBSeFNGaEZOVFZMTlc4eU5rWllWQzlpQ2twSGIyNHhhR1ZTWXpoblVIWk9ibFFyUjFSVU1tUmpTMWd2WkZRNGRteFhXak41UlVGcVFUa3pOVzVoT0RaVVkza3JkaTlsUm1oSmNTOXphVkJWY3pZS09XMVlhV3htWm5sRFNrNUJNRmxwVkVWcVMyWk9TalJLVWxoelMwSkhZWEIxUVZSQ01teHJQUW90TFMwdExVVk9SQ0JEUlZKVVNVWkpRMEZVUlMwdExTMHRDZz09In19fX0=",
          "integratedTime": 1666057522,
          "logIndex": 5318448,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/nginx/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/nginx",
      "githubWorkflowSha": "1e6e1822c2d3c39b5664bb3bc511ee50473220de",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3269906508",
      "sha": "1e6e1822c2d3c39b5664bb3bc511ee50473220de"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

