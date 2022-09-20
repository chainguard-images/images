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
| `1` `1.23` `1.23.1` `1.23.1-r0` `latest` `mainline` | `sha256:002710a0de8e2c60f8d80094685e0852440ee543b364f17cae50c83e02573104`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:002710a0de8e2c60f8d80094685e0852440ee543b364f17cae50c83e02573104) | `amd64` `arm64` `armv7` |
| `1.22` `1.22.0` `1.22.0-r0` `stable` | `sha256:3b54cc84914b352b0eb55414f3c70042ace2e014693dbb71a56c397b9d51244d`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:3b54cc84914b352b0eb55414f3c70042ace2e014693dbb71a56c397b9d51244d) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:002710a0de8e2c60f8d80094685e0852440ee543b364f17cae50c83e02573104"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "bee23980604feb4917d7786401b222f042624c00",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/nginx",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIDRyBXfhxLwX8czyK8Aggia2+KEfY/QfIzooLJGVg6EvAiBdHIIHC9XGFT7aOW0MBN9zeGra2GJP0FDE2oB9r+1BoA==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJlOWE2Yjg4OGM2YzA3OTJjZTRlNTJiYjhiNGQwZDBjNjRmNjZmNjY2NTc1ZmJlZWIzYjM1ZWZkYWYxYThhNTA5In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJREN6VGQxbTBLNE9sM284cm1TaStWYmZaWnhPNUdVdjB0RHNUL0QyOWpUYUFpQXppcEd6UkVFZGoySVRaSnNTV01qcWRHT2lDelZYQ2l5REZ1aXdOb1Fwb1E9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndWRU5EUVhsMVowRjNTVUpCWjBsVlZYbzFVbmh3YjNKWmIwNVhRVEpPV0V0a2NHNTBhekZ1WldNMGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hkTlZHZDZUbFJSZWxkb1kwNU5ha2wzVDFSSmQwMVVaekJPVkZGNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZHYkcxeWJubEVhSE5hU0U5UVZWRjVVbUpxTWxCMFl6Z3pXV0p3UzNCSGNXbzNaMWdLYzNBclJIWTJWVU4yYmpOTWNEWXZZbTk1VGl0T1FUWmhURmxDZDNsSE0zWkhObVE0TVdOWFExRTJVR1ZGWkVWd2NHRlBRMEZyYjNkblowcEhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZtYzJSWENtMWlVa1JMVXpsMk5EY3ZZMUpQYUdoWVFsaDBTRmgzZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwM1dVUldVakJTUVZGSUwwSkdNSGRYTkZwYVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Tlc1aFZ6VTBUSGsxYm1GWVVtOWtWMGwyWkRJNWVXRXlXbk5pTTJSNlRETktiR0pIVm1oak1sVjFaVmRHZEdKRlFubGFWMXA2Q2t3eWFHeFpWMUo2VERJeGFHRlhOSGRQVVZsTFMzZFpRa0pCUjBSMmVrRkNRVkZSY21GSVVqQmpTRTAyVEhrNU1HSXlkR3hpYVRWb1dUTlNjR0l5TlhvS1RHMWtjR1JIYURGWmJsWjZXbGhLYW1JeU5UQmFWelV3VEcxT2RtSlVRVk5DWjI5eVFtZEZSVUZaVHk5TlFVVkRRa0ZTZDJSWVRtOU5SRmxIUTJselJ3cEJVVkZDWnpjNGQwRlJUVVZMUjBwc1dsUkplazlVWjNkT2FrRXdXbTFXYVU1RWEzaE9NbEV6VG5wbk1rNUVRWGhaYWtsNVRXMVpkMDVFU1RKTmFsSnFDazFFUVhkSVFWbExTM2RaUWtKQlIwUjJla0ZDUWtGUlQxRXpTbXhaV0ZKc1NVWktiR0pIVm1oak1sVjNTbEZaUzB0M1dVSkNRVWRFZG5wQlFrSlJVVmdLV1RKb2FHRlhOVzVrVjBaNVdrTXhjR0pYUm01YVdFMTJZbTFrY0dKdVozZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwdENaMjl5UW1kRlJVRmtXalZCWjFGRFFraDNSV1ZuUWpSQlNGbEJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUkZoRE9EaG1RVUZCUWtGTlFWSjZRa1pCYVVJclR6RkNZa0ZoUVVRMWJtRkJTVEp3ZERKcWMxUUtSbFl4ZVhCUVNFcGxNalJNVHpaWmVtOXRla2hJWjBsb1FVOVZRMEZxYzNNNWVVNHljMmQ2ZEZGbVVHTmlTbTVZY1hWTFdIbHBaVWhOY21VMGRtc3ZaQXBOUlVvelRVRnZSME5EY1VkVFRUUTVRa0ZOUkVFeVowRk5SMVZEVFVOT05rOXBOV1phTUZvelNteFdjbEZuVldaSGMyUTJSUzlsV0V4d01qSnRaVEZtQ2xWV2EyZFVUVzU2VXpSeGVXaHlNVVpsWjBaUVZqSTFNa2MxZFV4aVVVbDRRVkJ2UjJNcll5OTVOaXRHTmtkS2EwNDJLMUpDZGpaSkwyZGFTbmhzUkU4S1RFcFphamRTVERCbVFUVmtUV1l5UmtRMlltWmxZM0ZMZUZFNVRTODRXVWhvWnowOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1663698967,
          "logIndex": 3622764,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/nginx/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3092423774",
      "sha": "bee23980604feb4917d7786401b222f042624c00"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

