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
| `1` `1.23` `1.23.1` `1.23.1-r0` `latest` `mainline` | `sha256:caab9bd1fd401c1e00ff507508f38727e5ec27f58a1693e7087b70ae57bae78d`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:caab9bd1fd401c1e00ff507508f38727e5ec27f58a1693e7087b70ae57bae78d) | `amd64` `arm64` `armv7` |
| `1.22` `1.22.0` `1.22.0-r0` `stable` | `sha256:008a2e45f42cc7ac056c1f690c3fe2833dfaf1f4da083cda2d782f024ab15936`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:008a2e45f42cc7ac056c1f690c3fe2833dfaf1f4da083cda2d782f024ab15936) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:caab9bd1fd401c1e00ff507508f38727e5ec27f58a1693e7087b70ae57bae78d"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "aee32d3ed2c7c11a038fe8d8672e673bc03ed57c",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/nginx",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIBvwTCj6pfk/nSnv1/I+2OS1KP4aXnFbQLp6z8xmFsrSAiArIK7aiEFzknpqO/AWm2DhpqbMXgXKBocL6Q6bxeixGg==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJiM2FhZjA5NzQ5YTAxZGFiYzQ4NmU4ODM3M2U0NzU1ODk4MzAxN2E1YjQ0ZWJjZWY3MmIzMWU2ODU0ZDA2NjY4In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJRXZETHlFb0VwR1kxYVhCS2c5UUZXSklWY0NzNnhRRnFEWVc0clZrbW5DU0FpQnpWNnJuN2dIMVRMU0ZlVWtkUTk3SjVtQTcyS1JWMGt6VGdYY2NxSDhybXc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnZla05EUVhseFowRjNTVUpCWjBsVlRtZDZUM05uZVROT1NIZGthMk5oVHpoS1FqRXlPRTVaZEhCcmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhwTmFrRXdUWHBGZUZkb1kwNU5ha2w0VFVSRmVrMXFRVEZOZWtWNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZFZFhCTlluZDBTVzk0ZWxSbmFtTnNlbGxOVDB4M2FsZFBiMjVqZFhabWVIRm1VazBLYzJOVVdYbENZbnBqUjA1M00xUjVNU3M1TW5oQlVuQlZiRk5ETWxwb1drUkZVME5wYUZaRFpIaEdaRXB5YVM5RlQzRlBRMEZyYTNkblowcEdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ0SzAxckNqWjNUMWw1Y0hZNGRDdExURzFXWld0U1drdFVPRXBqZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwM1dVUldVakJTUVZGSUwwSkdNSGRYTkZwYVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Tlc1aFZ6VTBUSGsxYm1GWVVtOWtWMGwyWkRJNWVXRXlXbk5pTTJSNlRETktiR0pIVm1oak1sVjFaVmRHZEdKRlFubGFWMXA2Q2t3eWFHeFpWMUo2VERJeGFHRlhOSGRQVVZsTFMzZFpRa0pCUjBSMmVrRkNRVkZSY21GSVVqQmpTRTAyVEhrNU1HSXlkR3hpYVRWb1dUTlNjR0l5TlhvS1RHMWtjR1JIYURGWmJsWjZXbGhLYW1JeU5UQmFWelV3VEcxT2RtSlVRVk5DWjI5eVFtZEZSVUZaVHk5TlFVVkRRa0ZTZDJSWVRtOU5SRmxIUTJselJ3cEJVVkZDWnpjNGQwRlJUVVZMUjBac1dsUk5lVnBFVG14YVJFcHFUakpOZUUxWFJYZE5lbWh0V2xSb2EwOUVXVE5OYlZVeVRucE9hVmw2UVhwYVYxRXhDazR5VFhkSVFWbExTM2RaUWtKQlIwUjJla0ZDUWtGUlQxRXpTbXhaV0ZKc1NVWktiR0pIVm1oak1sVjNTbEZaUzB0M1dVSkNRVWRFZG5wQlFrSlJVVmdLV1RKb2FHRlhOVzVrVjBaNVdrTXhjR0pYUm01YVdFMTJZbTFrY0dKdVozZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwcENaMjl5UW1kRlJVRmtXalZCWjFGRFFraHpSV1ZSUWpOQlNGVkJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUkRCNFdUQjVkMEZCUWtGTlFWSnFRa1ZCYVVKb01GbHZaVWgxTVhSNGJ5OVdjbUpVTlRJMWExRUtPR2xpTmxSVGJsQnRRVFJCZG5CQldHUnFUWFJ6VVVsblJFbE5iMlo0UjJwV1UxUTRRWE00T0VaNlduUXdkaTloYVZwc1NUVTVNWHBaWmpWekx5dEdhUXBpUldkM1EyZFpTVXR2V2tsNmFqQkZRWGROUkZwM1FYZGFRVWwzVUZGVllraHVNRU5vTDJWWFlUTnRZek12TDNCS09YWjNTRTgzZUc5NFMzQjZSRU5FQ2xCSGJFSklZM2xHVjFZM1VGaEVSVnBvVFhsb1JucDRTazVvYTFWQmFrSmtWamhyY2pJek1HaE1PRk4zUTJsbFJtdDNjMWhtVVVSek1HTm5hVmRKWlhNS05XVlVaVzFJY0ZodVlqTjVjMEk0SzFkbFRtdHZhWFEyVkdSS1JVdGFaejBLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1665693799,
          "logIndex": 5050490,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/nginx/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/nginx",
      "githubWorkflowSha": "aee32d3ed2c7c11a038fe8d8672e673bc03ed57c",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3245460539",
      "sha": "aee32d3ed2c7c11a038fe8d8672e673bc03ed57c"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

