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
| `latest` | `sha256:1740f19f60792bb973a53c5174b72d16a76089f3e111687ef58f011b56c533e8`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:1740f19f60792bb973a53c5174b72d16a76089f3e111687ef58f011b56c533e8) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:1740f19f60792bb973a53c5174b72d16a76089f3e111687ef58f011b56c533e8"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "da19d9d9e7f43ac1bc4fae26da1a481c0d55045a",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/sdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIHGXMGpFF0uiHKur0JQwtesHRdV81gbReqmzNG10IfA/AiB+qZ7a1PbMsgmnRj9uDvHAH8DIpdIZR3OiNZi436bUjg==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI1NDVhMzQ3NTI0NGY4NzNhOTY1YzQyYjg5MGI1OTQ4OGViMTJjN2Q3MGIzMzc0MjZkNzM5MWI1NGRjM2ExNDY1In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNuMisxdXNOQUZHWW96UXdrTEFxWC9VZVFVL1dsUHpKVkFtTnd3Mnk1Z0RBSWhBTXBvMGtubm9iZUlnaENjbk50a2xJTnRPMk9KZWRJRWNtYTRvRzc2aDRQKyIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnZha05EUVhscFowRjNTVUpCWjBsVlpuZ3lXbFpGYW0xNFVuVkVXV0V3VXk5VFRUaHZSamxSTkZaemQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhwTlZHc3hUbXBWTlZkb1kwNU5ha2w0VFVSRmVrMXFRWGRPYWxVMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZhVkhKaVJEUjZNREZJYVZZMFQyOWFhWGs0VFd0elluUkRNRkZZUjNCUlZYTkVlVXNLTjFGSmRXSXhkRXhvV0Rrd2RWZHVhbEZ6TlVNNVVrVktWbWMxVTNCRk9GbDZkbmRDTUU5clVXOVVXa3BsZHpSNVJFdFBRMEZyWTNkblowcEVUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlYzTlZsUkNuSXdiVXBUUlVweFdFSm5ZakoyUW1kblRrRnhibU5GZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6VG10aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwVm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkZZMGhXZW1GRVFUSkNaMjl5UW1kRlJRcEJXVTh2VFVGRlJFSkRhR3RaVkVVMVdrUnNhMDlYVlROYWFsRjZXVmROZUZsdFRUQmFiVVpzVFdwYWExbFVSbWhPUkdkNFdYcENhMDVVVlhkT1JGWm9DazFDZDBkRGFYTkhRVkZSUW1jM09IZEJVVkZGUkd0T2VWcFhSakJhVTBKVFdsZDRiRmxZVG14TlEwMUhRMmx6UjBGUlVVSm5OemgzUVZGVlJVWlhUbThLV1Zkc2RWb3pWbWhqYlZGMFlWY3hhRm95Vm5wTU0wNXJZWHBCWkVKbmIzSkNaMFZGUVZsUEwwMUJSVWRDUVRsNVdsZGFla3d5YUd4WlYxSjZUREl4YUFwaFZ6UjNaMWx6UjBOcGMwZEJVVkZDTVc1clEwSkJTVVZtVVZJM1FVaHJRV1IzUVVsWlNreDNTMFpNTDJGRldGSXdWM051YUVwNFJscDRhWE5HYWpORUNrOU9TblExY25kcFFtcGFkbU5uUVVGQldWQlROaXR3VTBGQlFVVkJkMEpKVFVWWlEwbFJRMjR5TWsxdGNqVkJZM00zVFZOc1kxVXlUR1JZY1hjM1QyUUtSamhpYW5wQlRDdERPVkp1VmtoV1drcFJTV2hCVUdWTFlXaHFjSEpTSzJGdmJuTnVSbGR1U0dWa1dIbFRla2Q2VDJwMlRtbHNhak5WVTNWeGNsQmFPQXBOUVc5SFEwTnhSMU5OTkRsQ1FVMUVRVEpuUVUxSFZVTk5VVU4wT1VaWlFYUjVOMDFoWTFRd1NtMWFNRzU2YnpSNGIxaEhiRGhRWVZONFlqTkVWVTFoQ25veloxQnNPV3hSZWtZeFNqWnhiR1ZCUVZOMGVXVnVRbU5tV1VOTlJuVm9PRmswVG01QlZXeFBWVVV4ZWs5VmFWRjFjamhvVFZoVlRVaGFUMUkwVUVZS1ZUUjVSVVEwT1hOSFRrZFNaRXR5V1VWVGVVNVRMMlJQZVV0V05VOTNQVDBLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1665691028,
          "logIndex": 5048010,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/sdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/sdk",
      "githubWorkflowSha": "da19d9d9e7f43ac1bc4fae26da1a481c0d55045a",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3245005598",
      "sha": "da19d9d9e7f43ac1bc4fae26da1a481c0d55045a"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

