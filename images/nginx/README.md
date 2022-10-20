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
| `1.22` `stable` | `sha256:85007badb1a2a67a486ed03fff11c3b642eedff2c371809a1abee101bdc960ea`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:85007badb1a2a67a486ed03fff11c3b642eedff2c371809a1abee101bdc960ea) | `amd64` `arm64` `armv7` |
| `1.23.1-r0` | `sha256:ef537a031641f9b56e7e52c57dffdbd6ec8749b330114d77343567f733298cad`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ef537a031641f9b56e7e52c57dffdbd6ec8749b330114d77343567f733298cad) |  |
| `1.22.1` `1.22.1-r0` `latest` | `sha256:7eb8b4767be40f5c9bd4d2b86e712735d1aa5f734970329a7157c858b391462d`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:7eb8b4767be40f5c9bd4d2b86e712735d1aa5f734970329a7157c858b391462d) | `amd64` `arm64` `armv7` |
| `1.23.1` | `sha256:310f9a01fc3e7a9410ae7ea1d9cac5add66d3f95d081efa6693a829e1b6aaa70`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:310f9a01fc3e7a9410ae7ea1d9cac5add66d3f95d081efa6693a829e1b6aaa70) | `amd64` `arm64` `armv7` |
| `1` `1.23` `1.23.2` `1.23.2-r0` `mainline` | `sha256:4a8333a6e0a8152775855d76938600358d69e58e872e2a08214fde132e5dcf30`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:4a8333a6e0a8152775855d76938600358d69e58e872e2a08214fde132e5dcf30) | `amd64` `arm64` `armv7` |
| `1.22.0` `1.22.0-r0` | `sha256:14854d1a7d0cb1a79dfc24675d8a712b5f8f02ec1f359a691669964bd0b6ecd2`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:14854d1a7d0cb1a79dfc24675d8a712b5f8f02ec1f359a691669964bd0b6ecd2) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:7eb8b4767be40f5c9bd4d2b86e712735d1aa5f734970329a7157c858b391462d"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "d5711631fff5e6f24f2e413c04204f44dad227e3",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/nginx",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIB4nVYm9NnyPV2Sj8HELFrCWZeyeO1LYAboa4B9hlA6uAiEA+RSgfArNqmnb8BVxISG9myQ7bpgkmR1xmtaJFWTsKo0=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIxNmE5OWQ2MTViMmUyZDc5OGQ3MGY5ODBkYzc3ZGEyZDUzZGM5NTQ4MTM5NzAwZTc3MWU3YWU3MzdlYjJhYTNiIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQlpLeCtEcGtMTjc4WXVCS0NuYjcrdXdwbUhMODJtYTZOcmRpRHgzZ1RjNUFpRUEwUUlCWStGTGZHRUVWVmFjbGUrT1ZUUG55WkZPUC91dE42dVFuZDViWGk0PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndWRU5EUVhseFowRjNTVUpCWjBsVlVGbEdlRVl4WmpKSlRuaE5TemQzYzJ0bWFrZHpSelJsVVcxSmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1hkTmFrVjZUV3BWTWxkb1kwNU5ha2w0VFVSSmQwMXFSVEJOYWxVeVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVY0YTNsQ2VtNXhSMFZ4UW5JNE9USjRWWG93Y1ZKUU9IQXdTbWhoTjFWd2VXSnJUVmNLWjJwU04wTktZVzVwZEZWMmVqVlJURFV6U1dWck4wNVFTekJPT0VNeGN6TTNPR0kwV0ZnNFNHVjRWRWxNVVhNclowdFBRMEZyYTNkblowcEdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZHU0hoUENtUlpaU3RJY1cxSWNtUk1UbEkyUjFrdlRrcHNabXMwZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwM1dVUldVakJTUVZGSUwwSkdNSGRYTkZwYVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Tlc1aFZ6VTBUSGsxYm1GWVVtOWtWMGwyWkRJNWVXRXlXbk5pTTJSNlRETktiR0pIVm1oak1sVjFaVmRHZEdKRlFubGFWMXA2Q2t3eWFHeFpWMUo2VERJeGFHRlhOSGRQVVZsTFMzZFpRa0pCUjBSMmVrRkNRVkZSY21GSVVqQmpTRTAyVEhrNU1HSXlkR3hpYVRWb1dUTlNjR0l5TlhvS1RHMWtjR1JIYURGWmJsWjZXbGhLYW1JeU5UQmFWelV3VEcxT2RtSlVRVk5DWjI5eVFtZEZSVUZaVHk5TlFVVkRRa0ZTZDJSWVRtOU5SRmxIUTJselJ3cEJVVkZDWnpjNGQwRlJUVVZMUjFFeFRucEZlRTVxVFhoYWJWcHRUbGRWTWxwcVNUQmFha3BzVGtSRmVsbDZRVEJOYWtFd1dtcFJNRnBIUm10TmFra3pDbHBVVFhkSVFWbExTM2RaUWtKQlIwUjJla0ZDUWtGUlQxRXpTbXhaV0ZKc1NVWktiR0pIVm1oak1sVjNTbEZaUzB0M1dVSkNRVWRFZG5wQlFrSlJVVmdLV1RKb2FHRlhOVzVrVjBaNVdrTXhjR0pYUm01YVdFMTJZbTFrY0dKdVozZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwcENaMjl5UW1kRlJVRmtXalZCWjFGRFFraHpSV1ZSUWpOQlNGVkJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUkRreFFrWk1kMEZCUWtGTlFWSnFRa1ZCYVVKbU5qWjFiMlZpYldOWWFFVjBSalUyUWtGYUswZ0tiSGhVVjNaT1RsRnZWVGRPU2pSRmVteFBZWEZPVVVsblNsUndWVUpsUlhSaVZsaHZRVzgxY0hsM2NsSXlhR3hQU0VoblJFaDRUMFZQT1dZMmIwZzFkQW93WTNkM1EyZFpTVXR2V2tsNmFqQkZRWGROUkdGUlFYZGFaMGw0UVU4eldVaEJaa2xYVWpZd1ptSmphMlJQWkV0elVscE1ablJ3YkU5UmRIQkZjVUYxQ2pGcGRGUnNMemN6YkZSMWFsZEJTME5wVlZOelVUZFRVMUZpY1VRclVVbDRRVTFDV0hOSWRsUkRRV042TUVSWGVFUk9helZhUTNOblZEZHVja0ZJV0djS1RUWTFWSFphUjBGdFVFRk9aMGhsT1dWNFdGWTRiRXRrT0dReVozQXpZbFJ2WnowOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1666301588,
          "logIndex": 5520360,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/nginx/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/nginx",
      "githubWorkflowSha": "d5711631fff5e6f24f2e413c04204f44dad227e3",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3292964746",
      "sha": "d5711631fff5e6f24f2e413c04204f44dad227e3"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

