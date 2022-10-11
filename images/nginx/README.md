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
| `1.22` `1.22.0` `1.22.0-r0` `latest` `stable` | `sha256:6262ea17d49441d351caf519400a91b8ad466f75a9e4d655a5c72db8c8f188e9`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:6262ea17d49441d351caf519400a91b8ad466f75a9e4d655a5c72db8c8f188e9) | `amd64` `arm64` `armv7` |
| `1` `1.23` `1.23.1` `1.23.1-r0` `mainline` | `sha256:8b9b16b5a850a7f57007e57120645dd28c9f8326fff065b36c8fb028867ce0d9`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:8b9b16b5a850a7f57007e57120645dd28c9f8326fff065b36c8fb028867ce0d9) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:6262ea17d49441d351caf519400a91b8ad466f75a9e4d655a5c72db8c8f188e9"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "f6a933610e59a87bde8a64913c44c231b85ea9eb",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/nginx",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCtcAFbmTePFwJEfoRcGRVOGeMBas28LNyygxizfAFqyQIhALh3Ik5WycKN/labuxuQPcVcbsViwlY6ODW/bygTesPn",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJkZmRmY2UzYzAzNTQ1MTk3NjU0ZDExN2U2ZDM3NjNhNmI0MTE3ZDZlNGQ5YzA5ZjUyOGE2MzFiMWQ4MTNlYzcwIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQURDNys3QXp4SWxDQ294aFptVDB5a2xHcHllMnE3MEtqY0JNY0xJa1kxdkFpRUEvNnBCdk1PSTgyZkdGc3dZMXQwR3g2cXdhcUVhemwzWTlrTlZ2TzlqNUFzPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhWRU5EUVhrMlowRjNTVUpCWjBsVlkzUjJTRzR2TjI5Uk5pdFhaR1JSWkhZd1NrTnpVMDlWWm5ZMGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhoTlJFVjZUMVJGTlZkb1kwNU5ha2w0VFVSRmVFMUVSVEJQVkVVMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVV3YjBjelNuSk5ha3N6YjI4NGIxcDBUV3hsYkU0M1FYUlpXSFJKYUV3dloyOUxLMDBLY1doaVoxUnZiVWQ0UnpRemIxUXpiMnQ0UTNKSE9HbE5SbTVQV1hwM1YxWTFRemcwT1ZkcWJXczFUbmxyWm5aR1NYRlBRMEZyTUhkblowcEtUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZCTnpkR0NrdHBZV055TkV0V1p6UjFOMmxvYm1saFEzVk5kbFJuZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwM1dVUldVakJTUVZGSUwwSkdNSGRYTkZwYVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Tlc1aFZ6VTBUSGsxYm1GWVVtOWtWMGwyWkRJNWVXRXlXbk5pTTJSNlRETktiR0pIVm1oak1sVjFaVmRHZEdKRlFubGFWMXA2Q2t3eWFHeFpWMUo2VERJeGFHRlhOSGRQVVZsTFMzZFpRa0pCUjBSMmVrRkNRVkZSY21GSVVqQmpTRTAyVEhrNU1HSXlkR3hpYVRWb1dUTlNjR0l5TlhvS1RHMWtjR1JIYURGWmJsWjZXbGhLYW1JeU5UQmFWelV3VEcxT2RtSlVRVmRDWjI5eVFtZEZSVUZaVHk5TlFVVkRRa0ZvZWxreWFHeGFTRlp6V2xSQk1ncENaMjl5UW1kRlJVRlpUeTlOUVVWRVFrTm9iVTV0UlRWTmVrMHlUVlJDYkU1VWJHaFBSR1JwV2tkVk5GbFVXVEJQVkVWNldYcFJNRmw2U1hwTlYwazBDazVYVm1oUFYxWnBUVUozUjBOcGMwZEJVVkZDWnpjNGQwRlJVVVZFYTA1NVdsZEdNRnBUUWxOYVYzaHNXVmhPYkUxRFZVZERhWE5IUVZGUlFtYzNPSGNLUVZGVlJVWXlUbTlaVjJ4MVdqTldhR050VVhSaFZ6Rm9XakpXZWt3eU5XNWhWelUwVFVJd1IwTnBjMGRCVVZGQ1p6YzRkMEZSV1VWRU0wcHNXbTVOZGdwaFIxWm9Xa2hOZG1KWFJuQmlha05DYVZGWlMwdDNXVUpDUVVoWFpWRkpSVUZuVWpkQ1NHdEJaSGRDTVVGQmFHZHJka0Z2VlhZNWIxSmtTRkpoZVdWRkNtNUZWbTVIUzNkWFVHTk5OREJ0TTIxMlEwbEhUbTA1ZVVGQlFVSm5PRk41VVU1SlFVRkJVVVJCUlZsM1VrRkpaMFpRWjNOWldERXZRM2x4UW5SVVEwSUtTVVpVV1VocmVHSlFiVlZaTmtNNFZsTTJNbEF4YlcxdU9FMW5RMGxEV21SdGRpOTJlR1J6U1Vzek1VUldSazF1Y2xaNWF5OTZTekZRTnpWTU15dG1WZ3BSVXpoMldUSkVVazFCYjBkRFEzRkhVMDAwT1VKQlRVUkJNbXRCVFVkWlEwMVJSRWhOUVZCSVpFVkRPV0pzU2toUEwwdzJWWGt3U0V4S09YcE1ka1ZIQ2psSU1ERmljSGhyVlVoV05qSnNTVWxQVUd0a1Uyb3lUMFl4UTJsdVVEQmlRVWxKUTAxUlJHcFBhMWx4VDNocGFVbHJWR2hyVkZrNFlVUXJSbUk0ZW1JS01teE9XSFJWVkhsVmJWbHRUaTlYWlhrMlYwb3lVMmxEVDJwbVIzVlhabGhEYlZkREszZ3dQUW90TFMwdExVVk9SQ0JEUlZKVVNVWkpRMEZVUlMwdExTMHRDZz09In19fX0=",
          "integratedTime": 1665452375,
          "logIndex": 4859660,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/nginx/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/nginx",
      "githubWorkflowSha": "f6a933610e59a87bde8a64913c44c231b85ea9eb",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3223444816",
      "sha": "f6a933610e59a87bde8a64913c44c231b85ea9eb"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

