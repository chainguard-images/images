# ko

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/ko/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/ko/actions/workflows/release.yaml)

This is an image that contains ko, go, and build-base.<br/><br/>This image is designed for use in situations where you would like to use `ko` with codebases that have C dependencies where `cgo` must be used. In these cases, staticly linking against musl instead of glibc results in smaller binaries.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/ko:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `0.11.2-r4` | `sha256:0917717d86a1fc860c25d4fc9092c0e50bbab0ee2ec191199dabe70bfe110f04`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:0917717d86a1fc860c25d4fc9092c0e50bbab0ee2ec191199dabe70bfe110f04) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `s390x` |
| `0.12.0-r0` `latest` | `sha256:3eda7458513e43488f487a674fe3062ac92d6cbfaa91e2804826266c620e1359`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:3eda7458513e43488f487a674fe3062ac92d6cbfaa91e2804826266c620e1359) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `s390x` |
| `0.11.2-r3` | `sha256:93226d747d17e7088140652ee698b488416f594d082b5e047eb20c1d23a65078`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:93226d747d17e7088140652ee698b488416f594d082b5e047eb20c1d23a65078) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `s390x` |


## Usage

### Using with CGO

Navigate to the `example/` directory:

```
cd example/
```

Then run:

```
docker run --rm -it \
  -v ${PWD}:/work \
  --workdir=/work \
  -e KO_DOCKER_REPO=example.com \
  -e CGO_ENABLED=1 \
  cgr.dev/chainguard/ko build ./ \
    --push=false \
    --preserve-import-paths
```

This will build the example program, but not push it, due to `--push=false`.

To push, you will need to mount in your Docker config to provide auth by adding:

```
  -v $DOCKER_CONFIG:/docker-config \
  -e DOCKER_CONFIG=/docker-config \
```

If you're using Docker credential helpers, those will need to be made available in the container as well so that `ko` can invoke them.


## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/ko:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/ko:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/ko"
      },
      "image": {
        "docker-manifest-digest": "sha256:3eda7458513e43488f487a674fe3062ac92d6cbfaa91e2804826266c620e1359"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "1a8122237f0820d468b54597905e7625812024a9",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/ko",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCiqwnbkqTAUX4XyTwViSdxNZ1PvFqV3NFgetJpemX+cwIhALamJpLkxrv0fhtQ52Yhj5gRuAjKKoWSIFYWDJIASm68",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIwNWJhYjdmMzRmMzU0NjQzNTE2OTBlNDA0MzA2MTIxMDdjZTY2N2U2NWM2NzA2Zjc4MTJhYjAzYmQ2YzZjZjdhIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNLV0hNNE5NRllyQXZGVXFIcC9XajdnZWlGdUtTZmM4U2U3dkFDcFZCNGRnSWhBTGl6Mk9yMzYwZlpVOE9iV0VmYTBGbDdwc21wdmZYZDM4cFlraU94WXZvLyIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnZha05EUVhsdFowRjNTVUpCWjBsVlprcENUR2hSV2twRGIydG9aMGxQZEdVd1FuRnlhWFJNTmpCamQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRWTlJFbDRUMFJKTTFkb1kwNU5ha2w0VFVSRk5VMUVTWGxQUkVrelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZQZDFsbE1WSkpOaXRqTHpnelFubHpWRmhJWXpOWUwyYzBhemh1ZWt4MVRtWTRRbEVLTkhseFZtTk9kRGsxY1cxaVRGWndlRW95UVhwSFMyc3hjbEJRTVhoTGNsVnVWakJNUWxGTE0ySlRPRE55TlRKeVNHRlBRMEZyWjNkblowcEZUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZIWlhvekNuWkhVMVpCT0ZCT2NtVndZemhOZFRWWWFHa3ZOV2hKZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwQldVUldVakJTUVZGSUwwSkdiM2RYU1ZwWFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5ZEhaTWVUVnVZVmhTYjJSWFNYWmtNamw1WVRKYWMySXpaSHBNTTBwc1lrZFdhR015VlhWbFYwWjBZa1ZDZVZwWFducE1NbWhzQ2xsWFVucE1NakZvWVZjMGQwOVJXVXRMZDFsQ1FrRkhSSFo2UVVKQlVWRnlZVWhTTUdOSVRUWk1lVGt3WWpKMGJHSnBOV2haTTFKd1lqSTFla3h0WkhBS1pFZG9NVmx1Vm5wYVdFcHFZakkxTUZwWE5UQk1iVTUyWWxSQlYwSm5iM0pDWjBWRlFWbFBMMDFCUlVOQ1FXaDZXVEpvYkZwSVZuTmFWRUV5UW1kdmNncENaMFZGUVZsUEwwMUJSVVJDUTJkNFdWUm5lRTFxU1hsTmVtUnRUVVJuZVUxSFVUQk9hbWhwVGxSUk1VOVVZelZOUkZac1RucFplVTVVWjNoTmFrRjVDazVIUlRWTlFuZEhRMmx6UjBGUlVVSm5OemgzUVZGUlJVUnJUbmxhVjBZd1dsTkNVMXBYZUd4WldFNXNUVU5KUjBOcGMwZEJVVkZDWnpjNGQwRlJWVVVLUmtkT2IxbFhiSFZhTTFab1kyMVJkR0ZYTVdoYU1sWjZUREowZGsxQ01FZERhWE5IUVZGUlFtYzNPSGRCVVZsRlJETktiRnB1VFhaaFIxWm9Xa2hOZGdwaVYwWndZbXBEUW1sbldVdExkMWxDUWtGSVYyVlJTVVZCWjFJNFFraHZRV1ZCUWpKQlFXaG5hM1pCYjFWMk9XOVNaRWhTWVhsbFJXNUZWbTVIUzNkWENsQmpUVFF3YlROdGRrTkpSMDV0T1hsQlFVRkNaeXMwU1RobGIwRkJRVkZFUVVWamQxSlJTV2hCU1hWd05FdEphVk5vZDFsemJWZFNSamRvU1had2NXc0tWbk1yUTI1eVVUQldiRTFhTlZReFNXaFNTbEZCYVVKRGJtOVlUSGQwUzFkc1NuZzNOVFJUT1doemFHeHBkVWRKVlV0aU9DczRkWFo0ZHpGeVFrMVJkUXBZUkVGTFFtZG5jV2hyYWs5UVVWRkVRWGRPYmtGRVFtdEJha0Y2VEUxTGJqaG9hRWhoWkRCMFR5czBiMHhDUmtwVlkweFBkMmN4U0Rnd1IxSTROV0UyQ2tWSGJVcHpRVzQxVjBsbWJtTlllWFY1YURWRlFYbHhUbGRNVVVOTlNHaE1SM2QyWW5WdVNrTXhibk1yTkhwQ2RYVTRkbkJ6YjFkWVRFcEZWMkl4ZDJrS04wSnZOWE5LTTBKSk9VTXpWR3BEY3k4dk5uTkJUMHRqWTBaaFQwVjNQVDBLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1666145926,
          "logIndex": 5401896,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/ko/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/ko",
      "githubWorkflowSha": "1a8122237f0820d468b54597905e7625812024a9",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3278311168",
      "sha": "1a8122237f0820d468b54597905e7625812024a9"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

