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
| `1` `1.23` `1.23.1` `1.23.1-r0` `latest` `mainline` | `sha256:738fedcd823fd010e508b16cb61dba312ec4c578e6551c37ee2b40c896a3e34f`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:738fedcd823fd010e508b16cb61dba312ec4c578e6551c37ee2b40c896a3e34f) | `amd64` `arm64` `armv7` |
| `1.22` `1.22.0` `1.22.0-r0` `stable` | `sha256:9eb500e0cbd7e521680793920e519a075b18e61d12fa6493fcf48d9e40bb5fee`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:9eb500e0cbd7e521680793920e519a075b18e61d12fa6493fcf48d9e40bb5fee) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:738fedcd823fd010e508b16cb61dba312ec4c578e6551c37ee2b40c896a3e34f"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "e1c47cccf9a2c369b9780e8d58f4409e5e7c54dd",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/nginx",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIGTRZKoUZIPIcYWzLgEKn4Cps0Cy/AxREWyELpGKU/kVAiEAmJtZyGoqQ2E0UXND36uZaibwi798kMAhLc7HkZWrvaM=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI1M2EzMTM0ODJkODIzYWY5NzQ4Mzg5ZDhjYzE2YjdiMjcwYzAzYWVjYWUxZmE1MjJjZjA5YTlmNGNhYTVlMzc5In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNBNHFYUW1ua3pwbEJNQ0d3cVZOY2EvR0tFMzQ5M0htYmxZRkRGQ1pucExBSWhBTTl6aittUXovbFNPcmhWbHdHRytlVWhmb2hsL2hrMnVCMTRWSFNid0FpKyIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhWRU5EUVhrclowRjNTVUpCWjBsVlVDdDFUVVUxVUdsaVNpdHJUMjlhU21GalpuUlBPVWhGTkVzMGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhsTlJFbDNUMFJWZDFkb1kwNU5ha2w0VFVSRmVVMUVTWGhQUkZWM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZZVUdwcFFXWTBTV0ZoUTNCU1ZpdE9lWEprTVU1T2F6QlJValpPZUdaU1JsVnNZemNLWTBabVJsZERTbVF6ZVZOa2VWaE1VMlpYY1VkTFRVbGhRMVZFYjJsdlJVUXZjRFZDVUdGc1pGSnRWREJRUTJWTWEzRlBRMEZyTkhkblowcExUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZzZFN0cENsTldTa2Q1ZFM5T1JVSkpVMU15YWtGbVpIcFhSMGxOZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwM1dVUldVakJTUVZGSUwwSkdNSGRYTkZwYVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Tlc1aFZ6VTBUSGsxYm1GWVVtOWtWMGwyWkRJNWVXRXlXbk5pTTJSNlRETktiR0pIVm1oak1sVjFaVmRHZEdKRlFubGFWMXA2Q2t3eWFHeFpWMUo2VERJeGFHRlhOSGRQVVZsTFMzZFpRa0pCUjBSMmVrRkNRVkZSY21GSVVqQmpTRTAyVEhrNU1HSXlkR3hpYVRWb1dUTlNjR0l5TlhvS1RHMWtjR1JIYURGWmJsWjZXbGhLYW1JeU5UQmFWelV3VEcxT2RtSlVRVmRDWjI5eVFtZEZSVUZaVHk5TlFVVkRRa0ZvZWxreWFHeGFTRlp6V2xSQk1ncENaMjl5UW1kRlJVRlpUeTlOUVVWRVFrTm9iRTFYVFRCT01rNXFXVEpaTlZsVVNtcE5lbGsxV1dwck0wOUVRbXhQUjFFeFQwZFpNRTVFUVRWYVZGWnNDazR5VFRGT1IxSnJUVUozUjBOcGMwZEJVVkZDWnpjNGQwRlJVVVZFYTA1NVdsZEdNRnBUUWxOYVYzaHNXVmhPYkUxRFZVZERhWE5IUVZGUlFtYzNPSGNLUVZGVlJVWXlUbTlaVjJ4MVdqTldhR050VVhSaFZ6Rm9XakpXZWt3eU5XNWhWelUwVFVJd1IwTnBjMGRCVVZGQ1p6YzRkMEZSV1VWRU0wcHNXbTVOZGdwaFIxWm9Xa2hOZG1KWFJuQmlha05DYVdkWlMwdDNXVUpDUVVoWFpWRkpSVUZuVWpoQ1NHOUJaVUZDTWtGQmFHZHJka0Z2VlhZNWIxSmtTRkpoZVdWRkNtNUZWbTVIUzNkWFVHTk5OREJ0TTIxMlEwbEhUbTA1ZVVGQlFVSm5PRzU2YjA5elFVRkJVVVJCUldOM1VsRkpaMkZwUkVGa2F6WlROMmxOVXpSNFprZ0tkVGRVYmtnellqbFVTRmt6VWpaaFF6bDNXVFpwWlhBeGNWVmpRMGxSUkU1cGJEWm9ibVF6T0RsNldtcDFZbVZWV0ZvNGFubG5PVzV5VTNGRU4zQkpPQXA1ZG05WFJURk9iRWRVUVV0Q1oyZHhhR3RxVDFCUlVVUkJkMDV2UVVSQ2JFRnFRbTlIVnpCRFlXcFdlV1pQTVN0Q09UQnVZa0pRWXpoMlowRnhTVXhWQ201cVpEZ3diemhsU1RsM1UycDRTbVY1V21zelZEbHVaMWxoZHpWdU0zVTVhMnRGUTAxUlJIVmhSMUZtTW5OR1MycDRSMnRXWTFkTWFEWndNRlYwUjNRS2FIRm9WVEpSTldaU2JGVmxRbUZhYkZFMU5XMWhSbXhYY1VvMGRrSlFkSFpxTTBkSFRXOUJQUW90TFMwdExVVk9SQ0JEUlZKVVNVWkpRMEZVUlMwdExTMHRDZz09In19fX0=",
          "integratedTime": 1665540546,
          "logIndex": 4933082,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/nginx/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/nginx",
      "githubWorkflowSha": "e1c47cccf9a2c369b9780e8d58f4409e5e7c54dd",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3231432358",
      "sha": "e1c47cccf9a2c369b9780e8d58f4409e5e7c54dd"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

