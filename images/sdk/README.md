# sdk

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/sdk/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/sdk/actions/workflows/release.yaml)

Development image for [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/sdk:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:a5a13d72de1e6bb1fe737f4f0299c5bdd5aa64e4dd7ceb4ca643d1e7803c2ab3`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a5a13d72de1e6bb1fe737f4f0299c5bdd5aa64e4dd7ceb4ca643d1e7803c2ab3) | `amd64` `arm64` `armv7` |


## Usage

### With melange

Clone down your development fork/branch:

```
git clone https://github.com/chainguard-dev/melange.git
cd melange
```

Run the image, mounting the repo workspace (`--privileged` flag required):

```
docker run --privileged --rm -it -v "${PWD}:${PWD}" -w "${PWD}" cgr.dev/chainguard/sdk
```

Upon entering the image, you should see the following welcome message:

```

Welcome to the development environment!


[sdk] ❯
```

Inside the environment, test out local changes to the melange codebase
by running the following:

```
make melange install
```

Then run melange commands as normal:

```
melange keygen

melange build \
  --arch x86_64,arm64 \
  --empty-workspace \
  --repository-append packages \
  --signing-key melange.rsa \
  examples/gnu-hello.yaml
```

### With apko

Clone down your development fork/branch:

```
git clone https://github.com/chainguard-dev/apko.git
cd apko
```

Run the image, mounting the repo workspace:

```
docker run --rm -it -v "${PWD}:${PWD}" -w "${PWD}" cgr.dev/chainguard/sdk
```

Upon entering the image, you should see the following welcome message:

```

Welcome to the development environment!


[sdk] ❯
```

Inside the environment, test out local changes to the apko codebase
by running the following:

```
make apko install
```

Then run apko commands as normal:

```
apko build --debug \
  examples/alpine-base.yaml \
  alpine-base:latest output.tar
```


## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/sdk:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/sdk:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/sdk"
      },
      "image": {
        "docker-manifest-digest": "sha256:a5a13d72de1e6bb1fe737f4f0299c5bdd5aa64e4dd7ceb4ca643d1e7803c2ab3"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "03bc4579f50901d21b300389ee789a93185f2c4a",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/sdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIDzeqtr5zlQ84EjC88kPxwpxOCy4z6mGOQYHMIWgft3hAiARfr+T9cDkqNjsLhVxuobN88Fsj9OUAJAfFoXPy11Htg==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJiZGUwMjhkNjZiMmEzZjNkNmJlYzEwYzI5NmE2YzU5OWM4NTRmN2FhNGU1YTllYWE1OTAzNmZjZDU0ZjQ0MjJmIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURwQXlvQTlEa21semhnbW5VcmZGd3g4eWxpWXo1aUNVam44T29EZG5FYk1BSWhBSmY2RmNkODdYM2x4OTV6d25mTnpOWkRrOGZiK0VGenZiTDJJK0pyWU0zdyIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnZWRU5EUVhscFowRjNTVUpCWjBsVlpYSjRNSFpPYVRGNWRFcHRiWGxPUldaaFlVdElOemhNY0c5UmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhwTmFrVjNUbFJWZDFkb1kwNU5ha2w0VFVSRmVrMXFSWGhPVkZWM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVUwVXpFdlkyMXhPRkk1WWxCTWRXSnVUbXc1V1hGalNUUmlXV2t6UW5Bd2MwRmhMelFLWmtSdVRsQlZWaXRFV0V4V1ZXbFZMMHcyV0dzNWVqVkZPVU5UZVhaVFIyUkpla1UyYUhnelVWQlBhMDgwWTJkWE1EWlBRMEZyWTNkblowcEVUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZSTlVsSUNtYzJOMWRTU0dWTmNXNWxia3hVZUdsV2JEWldVSGwzZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6VG10aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwVm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkZZMGhXZW1GRVFUSkNaMjl5UW1kRlJRcEJXVTh2VFVGRlJFSkRaM2ROTWtwcVRrUlZNMDlYV1RGTlJHdDNUVmRSZVUxWFNYcE5SRUY2VDBSc2JGcFVZelJQVjBVMVRYcEZORTVYV1hsWmVsSm9DazFDZDBkRGFYTkhRVkZSUW1jM09IZEJVVkZGUkd0T2VWcFhSakJhVTBKVFdsZDRiRmxZVG14TlEwMUhRMmx6UjBGUlVVSm5OemgzUVZGVlJVWlhUbThLV1Zkc2RWb3pWbWhqYlZGMFlWY3hhRm95Vm5wTU0wNXJZWHBCWkVKbmIzSkNaMFZGUVZsUEwwMUJSVWRDUVRsNVdsZGFla3d5YUd4WlYxSjZUREl4YUFwaFZ6UjNaMWx6UjBOcGMwZEJVVkZDTVc1clEwSkJTVVZtVVZJM1FVaHJRV1IzUVVsWlNreDNTMFpNTDJGRldGSXdWM051YUVwNFJscDRhWE5HYWpORUNrOU9TblExY25kcFFtcGFkbU5uUVVGQldWQlVTM1pEUzBGQlFVVkJkMEpKVFVWWlEwbFJSRUUyV0ZGclpVWTBUSFJUYVVFNVUyVkZaa0l6VkVsRVIyY0thRGROT0VOeFRVdFJaemh5TDJaemJHSkJTV2hCU1RaMmRHOUZZMk5QUWxJM1JVMTFNbGhUTVN0SlpYbE1TRk4zZGpOcFJtUjZRMjVRVEVwb2RtOWpUQXBOUVc5SFEwTnhSMU5OTkRsQ1FVMUVRVEpqUVUxSFVVTk5RMHROUlVsNUwxaHhaMDl5VUdKcFJ6QmpWR2hPVWs5M2RtNDNNak5KZDFSaVkyNWliV1JHQ25NelJHTkRVbUpOSzFwaU0yeDNOV2x1TVU5ck5rc3lTbVIzU1hkSloyZzBRM1pJVGtKeVJVVnRiMjVUYXpST1ozRm9LMlpPVXpaMk5VNTBUMFF3VFVvS1YzQjBiMVZFVkVkclptYzNRVVpQWTJ0U05qbGthV1E0VFVoTWJRb3RMUzB0TFVWT1JDQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENnPT0ifX19fQ==",
          "integratedTime": 1665695160,
          "logIndex": 5051625,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/sdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/sdk",
      "githubWorkflowSha": "03bc4579f50901d21b300389ee789a93185f2c4a",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3245463244",
      "sha": "03bc4579f50901d21b300389ee789a93185f2c4a"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

