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
| `1.22` `1.22.0` `1.22.0-r0` `latest` `stable` | `sha256:2c866a5d51823f355074a5e56252f63eb40df196c3e9bb50d1769e6752244445`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:2c866a5d51823f355074a5e56252f63eb40df196c3e9bb50d1769e6752244445) | `amd64` `arm64` `armv7` |
| `1` `1.23` `1.23.1` `1.23.1-r0` `mainline` | `sha256:4310b2c131b65548e11df3658e7f953e899f17d06599720d242cacbfc5183ccd`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:4310b2c131b65548e11df3658e7f953e899f17d06599720d242cacbfc5183ccd) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:2c866a5d51823f355074a5e56252f63eb40df196c3e9bb50d1769e6752244445"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "8bbe00a9a822758739900dac2c1b160d24d83fff",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/nginx",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIBP3w5PzEh/vSqq7mmbs2BayzoWLdvqaOPfuiMfJfQBQAiEAogCWWztT3pF7vPnXOihKh5tHPN6V6nIkPqTQOvF/pCo=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJiODNjMDJmZThjNTBlNTllZmM1ODkzNTI0MWU1ZjRkN2YyOGE0MjU4MThkZTY5NDhmYWE2ZjViMjdlOTAzZGYxIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJR25uUFZKSHArTUFyWnUwTVQ4RmtPVWo3VDltM3RJaEtlczdEWmNjYnVjd0FpRUExT1BNRnkrZWFRM0k3ZmRaQWt6V1cwNDRmR0owaXRKUVJnS1pCRStSUDlZPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhha05EUVhwRFowRjNTVUpCWjBsVlkwRnBhbWhGV0dsb1RIaHdXRmh5ZDBKcmMzbEtkVTV6UWtGbmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlROTlJFbDNUV3BSTWxkb1kwNU5ha2w0VFVSRk0wMUVTWGhOYWxFeVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVV6TW5Sc1ptaHlTVTFwTTJwaGJtZ3dXSEJhUzBkc2JpOWhUR2w0U2xCdWFsRk1OVllLTUd4VGJXNUVTbVprVFRaYU9XWlFXbWhhYkU0eWNYbDBiSE5IUld4V2RqaE1TWFYxV2tjdlRVdG5RMDFRWm5NNGJtRlBRMEZyT0hkblowcE1UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlYwZUhZMkNsWnpSVU5YVlhOVVNVbzBURE16VW0xcUx6UkpTa2xCZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwM1dVUldVakJTUVZGSUwwSkdNSGRYTkZwYVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Tlc1aFZ6VTBUSGsxYm1GWVVtOWtWMGwyWkRJNWVXRXlXbk5pTTJSNlRETktiR0pIVm1oak1sVjFaVmRHZEdKRlFubGFWMXA2Q2t3eWFHeFpWMUo2VERJeGFHRlhOSGRQVVZsTFMzZFpRa0pCUjBSMmVrRkNRVkZSY21GSVVqQmpTRTAyVEhrNU1HSXlkR3hpYVRWb1dUTlNjR0l5TlhvS1RHMWtjR1JIYURGWmJsWjZXbGhLYW1JeU5UQmFWelV3VEcxT2RtSlVRVmRDWjI5eVFtZEZSVUZaVHk5TlFVVkRRa0ZvZWxreWFHeGFTRlp6V2xSQk1ncENaMjl5UW1kRlJVRlpUeTlOUVVWRVFrTm5ORmx0U214TlJFSm9UMWRGTkUxcVNUTk9WR2N6VFhwck5VMUVRbXRaVjAxNVdYcEdhVTFVV1hkYVJFa3dDbHBFWjNwYWJWcHRUVUozUjBOcGMwZEJVVkZDWnpjNGQwRlJVVVZFYTA1NVdsZEdNRnBUUWxOYVYzaHNXVmhPYkUxRFZVZERhWE5IUVZGUlFtYzNPSGNLUVZGVlJVWXlUbTlaVjJ4MVdqTldhR050VVhSaFZ6Rm9XakpXZWt3eU5XNWhWelUwVFVJd1IwTnBjMGRCVVZGQ1p6YzRkMEZSV1VWRU0wcHNXbTVOZGdwaFIxWm9Xa2hOZG1KWFJuQmlha05DYVhkWlMwdDNXVUpDUVVoWFpWRkpSVUZuVWpsQ1NITkJaVkZDTTBGQmFHZHJka0Z2VlhZNWIxSmtTRkpoZVdWRkNtNUZWbTVIUzNkWFVHTk5OREJ0TTIxMlEwbEhUbTA1ZVVGQlFVSm5LMDkwTXpOblFVRkJVVVJCUldkM1VtZEphRUZQWlhaT2FqSnlXVTVuYWpabVpsb0thV1JLVjNkWU9ETlJaRTVtVTFGTFVra3lOVlZXTjFCSWNURlFlRUZwUlVGMk5XVXZRbkpNVTBkVGVqSmhTUzlXUzJ0M1UxcDJabXhuYWtWcmRXTktSUXBWTnpWRmIwcHRLMFJPVFhkRFoxbEpTMjlhU1hwcU1FVkJkMDFFWVVGQmQxcFJTWGhCVFZGcGJWWjZiSGhZYkc1UlIxZ3ZNMkZCUzNSU1VDc3pNRWhSQ2tWWFNFSnRVazFvVDNCTVdXSnBhRkpFV2xVMk9YcFVVSEZoTVVWUE1sQk5ObTl5WVM5UlNYZEZTSFJFZDNkek5WQnRTMk5TYW1rclVucG5URmxOTWtFS1FtZG5UazFOYTA5cFJWTklZVlpLUTB4a2QzRlJVVFZPV21NdlJESnhVV3RLUWpSVmFYZ3pWd290TFMwdExVVk9SQ0JEUlZKVVNVWkpRMEZVUlMwdExTMHRDZz09In19fX0=",
          "integratedTime": 1665972176,
          "logIndex": 5249107,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/nginx/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/nginx",
      "githubWorkflowSha": "8bbe00a9a822758739900dac2c1b160d24d83fff",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3261759726",
      "sha": "8bbe00a9a822758739900dac2c1b160d24d83fff"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

