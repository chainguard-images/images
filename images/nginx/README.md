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
| `1.22` `1.22.0` `1.22.0-r0` `latest` `stable` | `sha256:e0e27c24114f56e89d5678e2a3a9fa4b2e08d7962771edd1673f96eeb15204f2`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:e0e27c24114f56e89d5678e2a3a9fa4b2e08d7962771edd1673f96eeb15204f2) | `amd64` `arm64` `armv7` |
| `1` `1.23` `1.23.1` `1.23.1-r0` `mainline` | `sha256:fe774dcaece2ff9de93bb72915e655c1d03a4a59969a921126d15670a03ceb5e`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:fe774dcaece2ff9de93bb72915e655c1d03a4a59969a921126d15670a03ceb5e) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:e0e27c24114f56e89d5678e2a3a9fa4b2e08d7962771edd1673f96eeb15204f2"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "53d6251b9bad996595de310fcf7e6ddbb5ce61e3",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/nginx",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQD/ptUXaJMGXb6F4/+0M6G3tYTk/Zr7yrDoonq7VbgzNwIhAPT10gkrm3f2YSfvswVTO13XFy17/R+v85MBO4ATflK1",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJiODc0ZGUyMjJiMzE1ZmM1M2IyZDJkODEyMmNjOWQ0Njk4N2VhNWFiNTBiYjViZTAxMmUzMDQxMDE2MmFhZTkwIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUMrNzBVOVBlWEJoWGNOcGdXRU15Zi9pZ1Y3TDhBSlhKRGxobmJnaERCTzFRSWhBSVJ3YkRlMEJxQXFYNkFSZDFmWE83enYvOWxIRmdFeW5CdUttaU05WGMyViIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhha05EUVhrclowRjNTVUpCWjBsVlFrVmpTV3RtYkdFNFRsTjVVR2MyYmpaa1ZEbGFPWE0yUzBKdmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRKTlJFVXhUMVJWZUZkb1kwNU5ha2w0VFVSRk1rMUVTWGRQVkZWNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZGVlc1TlkwaDRSMjVqYjFaSFlXeHZiM2R6UW5CM09FaE9PRlJWWmxKNVIxaDBOa0lLUjIxV1JYTnJWVWg2Ukc5TFVsQkxTMXBpV0ZoYWFsUlBOa05qV214R05YZHpURFpyU0ZkRVp6QmlZV2xHTDFGcmNYRlBRMEZyTkhkblowcExUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZPUVhKNkNrSlRka0V4TkRSSVVXOXNSR2s1TWs5V2RVMTNZakYzZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwM1dVUldVakJTUVZGSUwwSkdNSGRYTkZwYVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Tlc1aFZ6VTBUSGsxYm1GWVVtOWtWMGwyWkRJNWVXRXlXbk5pTTJSNlRETktiR0pIVm1oak1sVjFaVmRHZEdKRlFubGFWMXA2Q2t3eWFHeFpWMUo2VERJeGFHRlhOSGRQVVZsTFMzZFpRa0pCUjBSMmVrRkNRVkZSY21GSVVqQmpTRTAyVEhrNU1HSXlkR3hpYVRWb1dUTlNjR0l5TlhvS1RHMWtjR1JIYURGWmJsWjZXbGhLYW1JeU5UQmFWelV3VEcxT2RtSlVRVmRDWjI5eVFtZEZSVUZaVHk5TlFVVkRRa0ZvZWxreWFHeGFTRlp6V2xSQk1ncENaMjl5UW1kRlJVRlpUeTlOUVVWRVFrTm5NVTB5VVRKTmFsVjRXV3BzYVZsWFVUVlBWRmt4VDFSV2ExcFVUWGhOUjFwcVdtcGtiRTV0VW10WmJVa3hDbGt5VlRKTlYxVjZUVUozUjBOcGMwZEJVVkZDWnpjNGQwRlJVVVZFYTA1NVdsZEdNRnBUUWxOYVYzaHNXVmhPYkUxRFZVZERhWE5IUVZGUlFtYzNPSGNLUVZGVlJVWXlUbTlaVjJ4MVdqTldhR050VVhSaFZ6Rm9XakpXZWt3eU5XNWhWelUwVFVJd1IwTnBjMGRCVVZGQ1p6YzRkMEZSV1VWRU0wcHNXbTVOZGdwaFIxWm9Xa2hOZG1KWFJuQmlha05DYVdkWlMwdDNXVUpDUVVoWFpWRkpSVUZuVWpoQ1NHOUJaVUZDTWtGQmFHZHJka0Z2VlhZNWIxSmtTRkpoZVdWRkNtNUZWbTVIUzNkWFVHTk5OREJ0TTIxMlEwbEhUbTA1ZVVGQlFVSm5PVFpGTVRKUlFVRkJVVVJCUldOM1VsRkpaMlpFT0ZKa1l6RTNia0pqUzFoSFduTUtWSFJpWldGRVJESmpOM1FyTWtWVVJVTk1aR3R2TW5jeUsxVnpRMGxSUTNnelRXNUxkRnAyT0ZodFRrcEpaamQ0U0ZaWldqVjBOM1UzVFVWc2Mxb3dSQW96YUZORlNtVkdPVmQ2UVV0Q1oyZHhhR3RxVDFCUlVVUkJkMDV3UVVSQ2JVRnFSVUU0YVZrMGRqSjJiRkEwZEc5cVJFZDJUamQ0YVdwUWJEaDFkSGRPQ25Sd0szUkpaRWN3ZDBKQlprc3hWRlZUU25KaVJXVTNXbnB6YWsxdGVGUkhLMFJ2YVVGcVJVRXJSM2xqZGtJeVR5dENUbVZCTVRsRVQzUnlaR3RrV1hjS2VWaE9aM0ZMUlZOUGFVWnVSVVk0UzIxblptWnhhbHAwUTJKUFN6VnJWRzl4TmpOTE5VWlVZUW90TFMwdExVVk9SQ0JEUlZKVVNVWkpRMEZVUlMwdExTMHRDZz09In19fX0=",
          "integratedTime": 1665885608,
          "logIndex": 5189622,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/nginx/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/nginx",
      "githubWorkflowSha": "53d6251b9bad996595de310fcf7e6ddbb5ce61e3",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3257851512",
      "sha": "53d6251b9bad996595de310fcf7e6ddbb5ce61e3"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

