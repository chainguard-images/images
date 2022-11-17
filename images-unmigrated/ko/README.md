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
| `0.12.0-r1` `latest` | `sha256:7d70f4cca52d0662f35bace065e8a50fed8be93a35b7ebb941533c92a17d5074`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:7d70f4cca52d0662f35bace065e8a50fed8be93a35b7ebb941533c92a17d5074) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `s390x` |
| `0.11.2-r3` | `sha256:93226d747d17e7088140652ee698b488416f594d082b5e047eb20c1d23a65078`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:93226d747d17e7088140652ee698b488416f594d082b5e047eb20c1d23a65078) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `s390x` |
| `0.11.2-r4` | `sha256:2ca08ad880640dfc889a872786674323c0047cdc76fe5afc958ee90659297509`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:2ca08ad880640dfc889a872786674323c0047cdc76fe5afc958ee90659297509) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `s390x` |
| `0.12.0-r0` | `sha256:a6b1c0876bf8ed88d9b58141f25ee6aa5199bd1b71d8b14e8a8c660d26e7256c`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a6b1c0876bf8ed88d9b58141f25ee6aa5199bd1b71d8b14e8a8c660d26e7256c) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `s390x` |


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
        "docker-manifest-digest": "sha256:7d70f4cca52d0662f35bace065e8a50fed8be93a35b7ebb941533c92a17d5074"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "8943e912bd365162984de81998f3b14d0f5cd021",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/ko",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDR1dWM4EGN+N9yvnixmQ1isUCyU8uUbzV/9S8o8Ety+gIhALf7acRenb753vkX56XlbF9OQj5uco9Bha/M5Jadx9Ka",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJjOGUxZjI1YTUwNWMwMzllNzdlN2ZmZjUwY2I0YzljMWExMWNiNjQyMDhhMmFiZDcyOTRiZTVjMDRhMzk4YTcwIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURKZmVjZ1EwcEgrMHZEa2pyeDJVUit1VXNqdXluZ05JRmVIQTdkaWx4cGdBSWhBUHI5U0lXSnQ0bWJrVWJyMGZKVTFyQ2tLMkdNY1plbkpwbEkvK01SMlZaciIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnZha05EUVhscFowRjNTVUpCWjBsVlIzQXlTMk5tYUZOclUzUkRWMWxvV2l0Wk0wZHNRV3RXTkM5emQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlROTlJFVXdUMFJKZDFkb1kwNU5ha2w0VFZSRk0wMUVSVEZQUkVsM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ6VlZwaGVuSnhSM0p5VXpObGJrNHdieXRQZEVsa09HMTBkRnA1VVROUFFuWlVka3NLVHpCM01HcElZVzlWVlN0U2JWRkpVM05EWVZSNFV6SktabVZoU0ZOR1ZuQjNiMmhhUTB0SE1ubDRTRTA1V0Rkc2FYRlBRMEZyWTNkblowcEVUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZWUjA1bUNteHRhVkpoVm1sUWQzcFdVbkJUVVRCbU5sQkRlVGgzZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwQldVUldVakJTUVZGSUwwSkdiM2RYU1ZwWFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5ZEhaTWVUVnVZVmhTYjJSWFNYWmtNamw1WVRKYWMySXpaSHBNTTBwc1lrZFdhR015VlhWbFYwWjBZa1ZDZVZwWFducE1NbWhzQ2xsWFVucE1NakZvWVZjMGQwOVJXVXRMZDFsQ1FrRkhSSFo2UVVKQlVWRnlZVWhTTUdOSVRUWk1lVGt3WWpKMGJHSnBOV2haTTFKd1lqSTFla3h0WkhBS1pFZG9NVmx1Vm5wYVdFcHFZakkxTUZwWE5UQk1iVTUyWWxSQlYwSm5iM0pDWjBWRlFWbFBMMDFCUlVOQ1FXaDZXVEpvYkZwSVZuTmFWRUV5UW1kdmNncENaMFZGUVZsUEwwMUJSVVJDUTJjMFQxUlJlbHBVYTNoTmJVcHJUWHBaTVUxVVdYbFBWR2N3V2tkVk5FMVVhelZQUjFsNldXcEZNRnBFUW0xT1YwNXJDazFFU1hoTlFuZEhRMmx6UjBGUlVVSm5OemgzUVZGUlJVUnJUbmxhVjBZd1dsTkNVMXBYZUd4WldFNXNUVU5KUjBOcGMwZEJVVkZDWnpjNGQwRlJWVVVLUmtkT2IxbFhiSFZhTTFab1kyMVJkR0ZYTVdoYU1sWjZUREowZGsxQ01FZERhWE5IUVZGUlFtYzNPSGRCVVZsRlJETktiRnB1VFhaaFIxWm9Xa2hOZGdwaVYwWndZbXBEUW1sUldVdExkMWxDUWtGSVYyVlJTVVZCWjFJM1FraHJRV1IzUWpGQlRqQTVUVWR5UjNoNFJYbFplR3RsU0Vwc2JrNTNTMmxUYkRZMENqTnFlWFF2TkdWTFkyOUJka3RsTms5QlFVRkNhRWxPUm5rNVVVRkJRVkZFUVVWWmQxSkJTV2RGVFZoMk0zRkVUMmhOUjFkRFdUZHVRek5UWm1aT1RGVUtTMnd6VDJoRWNVUldWM0o0UkhwTlptVjRjME5KUjFaMFUyZEJVbTV6U25JNGNFUkpTRE4zWjFNNVQzVlpTRmhzZEdJNVJtMTVhM1kyWjBScU1qQkNWZ3BOUVc5SFEwTnhSMU5OTkRsQ1FVMUVRVEpuUVUxSFZVTk5VVVJCVXpKeWJGUmpZU3RtTDFkSVlTdEJTazFGVkRKNldUSldjRXR2U21VeFMyRTVWSHBFQ2tsWWRGRlpRbFJqYW1sQ1ltb3JVM0puZEROTE9URnlURWR6YTBOTlJtdHBXRWhLWW5SSGFrcGpjMDUxTmpab1dIaHBkazFYUm13MWJVWlplVlExTlhNS1dXczBVM2hGVWxSdmFqQkxVVlkyVjNSMFpERnllSGQ1Umk5MmRETlJQVDBLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1668649718,
          "logIndex": 7242906,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/ko/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/ko",
      "githubWorkflowSha": "8943e912bd365162984de81998f3b14d0f5cd021",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3484635321",
      "sha": "8943e912bd365162984de81998f3b14d0f5cd021"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

