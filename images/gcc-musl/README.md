# gcc-musl

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/gcc-musl/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/gcc-musl/actions/workflows/release.yaml)

Minimal container image for building C applications (which do not require glibc).

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/gcc-musl:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `12.2.1_git20220924-r3` `latest` | `sha256:178239dd332aa9d52ddbc6b98f293f8a2d196f090dc5c3fecc9ce4bc0e3b1be9`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:178239dd332aa9d52ddbc6b98f293f8a2d196f090dc5c3fecc9ce4bc0e3b1be9) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `12.2.1_git20220924-r2` | `sha256:9f6f5fdd3b89a2bfae12e1db7294ebb3d21598f60a28e771a6b8ea66259c2d2e`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:9f6f5fdd3b89a2bfae12e1db7294ebb3d21598f60a28e771a6b8ea66259c2d2e) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


## Usage

To build the C application in [examples/hello/main.c](examples/hello/main.c):

```
$ docker run --rm -v "${PWD}:/work" cgr.dev/chainguard/gcc-musl examples/hello/main.c -o hello
```

This will write a Linux binary to `./hello`. If you're on Linux and have the musl library, you
should be able to run it directly. Otherwise you can run it in a container e.g:

```
$ docker run --rm -v "$PWD/hello:/hello" cgr.dev/chainguard/musl-dynamic /hello
Hello World!
```

We can also do this all in a multi-stage Dockerfile e.g:

```Dockerfile
FROM cgr.dev/chainguard/gcc-musl as build

COPY hello.c /work/hello.c
RUN cc hello.c -o hello

FROM cgr.dev/chainguard/musl-dynamic

COPY --from=build /work/hello /hello
CMD ["/hello"]
```

And we can also compile statically to be used in environments without musl:


```Dockerfile
FROM cgr.dev/chainguard/gcc-musl as build

COPY hello.c /work/hello.c
RUN cc --static hello.c -o hello

FROM cgr.dev/chainguard/static

COPY --from=build /work/hello /hello
CMD ["/hello"]
```


## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/gcc-musl:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/gcc-musl:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/gcc-musl"
      },
      "image": {
        "docker-manifest-digest": "sha256:178239dd332aa9d52ddbc6b98f293f8a2d196f090dc5c3fecc9ce4bc0e3b1be9"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "55d4a80c2cb507660e4538f07e84b0e2113228ce",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/gcc-musl",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDPz2pDC9ssD7+t96PQY3tfZLt8GqiAagbrIzjuNw3P+gIgQok1AAlFQvHm0Wq3nrxzVjl5Tfnm/4NrPPkaWH9CdR0=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIxZTkwNDExMWU2ZWFmMTEzOWU3YzNjNDlmZDhjOTQxYzNiZWEyN2YwYjBmNzZjMDQyN2I2YzdjM2M1MGNkNmYzIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQXhYL0dyeWpkdjVUZUFmYkRHYm9QSy9ZcVJBRXJHbFBpVW5kZkRRNmdBL0FpQmpXWTJHU2ZIL2tXa2ZoWktHcVVFNk1SWHpPbjZKRkZ5QmdiSmF0d3B2N3c9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpSRU5EUVhwWFowRjNTVUpCWjBsVlUwMUNXVzFETlNzclVFa3hWMnB0UzFsWmMwZzVjV0ZFV0dOVmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRKTlJFRXdUMFJOTkZkb1kwNU5ha2w0VFVSRk1rMUVRVEZQUkUwMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVUyWmtreWQwc3hiVEZ6VHpoRGVGRlJOVzAxVkhVeE9USlVNVTQzWTNaT1lsTjRlVmdLVldsS2FWWk9SRGs1YzJSMmIwc3lPSEJOT1ZOeU5XOUpaamR3YzBVNVoybEVUV1ZvVW1ZemJHUmhTazVuYVdWcE0zRlBRMEZzVVhkblowcFJUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZhYlRKRkNpdFBjbkJEVm1KcVNGVkJXWFZQUWtWVmRGQldkbFJ2ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGbldVUldVakJTUVZGSUwwSkhRWGRZYjFwallVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkdwWmVURjBaRmhPYzB4NU5XNWhXRkp2WkZkSmRtUXlPWGxoTWxwellqTmtla3d6U214aVIxWm9ZekpWZFdWWFJuUmlSVUo1Q2xwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1QxRlpTMHQzV1VKQ1FVZEVkbnBCUWtGUlVYSmhTRkl3WTBoTk5reDVPVEJpTW5Sc1ltazFhRmt6VW5BS1lqSTFla3h0WkhCa1IyZ3hXVzVXZWxwWVNtcGlNalV3V2xjMU1FeHRUblppVkVGWFFtZHZja0puUlVWQldVOHZUVUZGUTBKQmFIcFpNbWhzV2toV2N3cGFWRUV5UW1kdmNrSm5SVVZCV1U4dlRVRkZSRUpEWnpGT1YxRXdXVlJuZDFsNlNtcFphbFYzVG5wWk1rMUhWVEJPVkUwMFdtcEJNMXBVWnpCWmFrSnNDazFxUlhoTmVrbDVUMGRPYkUxQ2QwZERhWE5IUVZGUlFtYzNPSGRCVVZGRlJHdE9lVnBYUmpCYVUwSlRXbGQ0YkZsWVRteE5RMmRIUTJselIwRlJVVUlLWnpjNGQwRlJWVVZIYlU1dldWZHNkVm96Vm1oamJWRjBZVmN4YUZveVZucE1NbVJxV1hreGRHUllUbk5OUWpCSFEybHpSMEZSVVVKbk56aDNRVkZaUlFwRU0wcHNXbTVOZG1GSFZtaGFTRTEyWWxkR2NHSnFRMEpwWjFsTFMzZFpRa0pCU0ZkbFVVbEZRV2RTT0VKSWIwRmxRVUl5UVVGb1oydDJRVzlWZGpsdkNsSmtTRkpoZVdWRmJrVldia2RMZDFkUVkwMDBNRzB6YlhaRFNVZE9iVGw1UVVGQlFtYzVOVVJ3U2sxQlFVRlJSRUZGWTNkU1VVbG9RVTgwVDFwbWRqRUthMHR0WkU5eU4xVnpNWFp6VmpaTFNqVkphMEV6YzNCSFpIbGFPSFZJVFRGbFZsSlNRV2xDWkhWbWMyVkZRazB2TXpVM1dYUjBaelpXUVRCNlZtTTJad29yWWtWQ1UyUjBSemRXVlRGRk5WRjRPVVJCUzBKblozRm9hMnBQVUZGUlJFRjNUbkJCUkVKdFFXcEZRVGsxWVhGblNrbDRaRXRXWTFwR1pqUkxRM0oxQ2tGRVdYTjJWbFZ2VG1oaE5FaFFSakpuVDBsMVpFbEJhMXBDTkZGbk5VdDFSMEZaVm5NMmFXRm1WRWM0UVdwRlFXdzNjSGcwV25Odk5EWlpZM2g1V25VS2MyTXJPRUYyYVd4c1NITjFiVU5pYTBFMVlVcEhSVTR5TTBKVFVGb3ZkRzR2Vlc1a1ZIVnRjRm8wUWpadWFtMXNDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1665881336,
          "logIndex": 5186323,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/gcc-musl/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/gcc-musl",
      "githubWorkflowSha": "55d4a80c2cb507660e4538f07e84b0e2113228ce",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3257729046",
      "sha": "55d4a80c2cb507660e4538f07e84b0e2113228ce"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

