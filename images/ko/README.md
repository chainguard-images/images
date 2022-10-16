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
| `0.11.2-r4` `latest` | `sha256:ff9f7e7172d3fe2e3af5c20e0d749d36b615f0c4526201031d455875d3ca4e21`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ff9f7e7172d3fe2e3af5c20e0d749d36b615f0c4526201031d455875d3ca4e21) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `s390x` |
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
        "docker-manifest-digest": "sha256:ff9f7e7172d3fe2e3af5c20e0d749d36b615f0c4526201031d455875d3ca4e21"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "5da22468021edbc45df8f018a3cbc4f6803820a7",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/ko",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIFoBAzq2XHyqCwdpQNiULCUCsaPiAXG8aeXON+lz1ihIAiEA6kCTa61xGTirwybH95TNTOOK4AQjw5cCuDRfI0Kc/r0=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI4MzgwYWY4MzkyMDc4M2U0ODA0N2Y1ODc3YmY0YzRkZjFkYTQ1ZjJmOTM3MzQxNzNmZGQwZDFiMzJkYWMxOTI1In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJR1dYTUJleHpGTHJaUGJjdS9ibGt1ekxZNHM0Z2o1RmtGMDluNDZOYzEvbUFpQmtYQlNvNUg3N2dMN3laUFVBNlhBWmNZYWl0WitjM1NhaDhYY21kZ1FrV2c9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnZha05EUVhsdFowRjNTVUpCWjBsVlpsZDBhRFpSTUhsTFRVOUJMekJKVGtkdmVreFRSV3R2UTNWamQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRKTlJFbDZUWHBWTTFkb1kwNU5ha2w0VFVSRk1rMUVTVEJOZWxVelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZzYmxjNFVFdGFWMk0xVTFOWlpWSkNOVEpNWVRZM2IxcFRjVTB5SzNKWlkyTnRhR1lLYkZWME1YTklUVmxUT1c1UVNWWXpjVFV6TUhWUFYwOVhUMFIzUVc5M1JqQnhabE01YVd4d05rTkdTbFUzUW5ablJIRlBRMEZyWjNkblowcEZUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZWU3pCWUNtRkhTV2hWYUZCeEt5OHhZV2xPZUdacVVFWk9TM052ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwQldVUldVakJTUVZGSUwwSkdiM2RYU1ZwWFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5ZEhaTWVUVnVZVmhTYjJSWFNYWmtNamw1WVRKYWMySXpaSHBNTTBwc1lrZFdhR015VlhWbFYwWjBZa1ZDZVZwWFducE1NbWhzQ2xsWFVucE1NakZvWVZjMGQwOVJXVXRMZDFsQ1FrRkhSSFo2UVVKQlVWRnlZVWhTTUdOSVRUWk1lVGt3WWpKMGJHSnBOV2haTTFKd1lqSTFla3h0WkhBS1pFZG9NVmx1Vm5wYVdFcHFZakkxTUZwWE5UQk1iVTUyWWxSQlYwSm5iM0pDWjBWRlFWbFBMMDFCUlVOQ1FXaDZXVEpvYkZwSVZuTmFWRUV5UW1kdmNncENaMFZGUVZsUEwwMUJSVVJDUTJjeFdrZEZlVTFxVVRKUFJFRjVUVmRXYTFsdFRUQk9WMUp0VDBkWmQwMVVhR2hOTWs1cFdYcFNiVTVxWjNkTmVtZDVDazFIUlROTlFuZEhRMmx6UjBGUlVVSm5OemgzUVZGUlJVUnJUbmxhVjBZd1dsTkNVMXBYZUd4WldFNXNUVU5KUjBOcGMwZEJVVkZDWnpjNGQwRlJWVVVLUmtkT2IxbFhiSFZhTTFab1kyMVJkR0ZYTVdoYU1sWjZUREowZGsxQ01FZERhWE5IUVZGUlFtYzNPSGRCVVZsRlJETktiRnB1VFhaaFIxWm9Xa2hOZGdwaVYwWndZbXBEUW1sbldVdExkMWxDUWtGSVYyVlJTVVZCWjFJNFFraHZRV1ZCUWpKQlFXaG5hM1pCYjFWMk9XOVNaRWhTWVhsbFJXNUZWbTVIUzNkWENsQmpUVFF3YlROdGRrTkpSMDV0T1hsQlFVRkNaemsyYTBRdmMwRkJRVkZFUVVWamQxSlJTV2hCVFRGemJ6VnhlQzlZYWpKWFMyaEpiM1J3VnpCVlYwOEtPRTh3UjBKek5GVm9XRkpQUmxjclMwWkJVbnBCYVVJMk9UVXZORzVCWWpkS2JFRkJVamRwYmpCemQwUnRTV3hKZG1KaU5rTm1NbVE0VlRWRmIzSjFUZ296ZWtGTFFtZG5jV2hyYWs5UVVWRkVRWGRPYmtGRVFtdEJha0pSUm1GbFJrSlpXakJIYkVkYVdUVXJOSFFyUTJsdk4yaGxiRzVJTVZaU01HcEJiblp4Q25aNVNqbFZhR1JEYkVoTVdDOWFXVGRZZVVGUFVWQjZhWGhYWjBOTlJqbG9UVFp1VlRVMVRtMXhjelZpWW1GVWJtUk9RbGQ2VlhaM1NUWjBRVUZzVmtzS1N6bERUVVppVFRGWE5XRlFPVmdyZFROeWVFTXpWa2hRYUd4WE5GTm5QVDBLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1665887675,
          "logIndex": 5191145,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/ko/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/ko",
      "githubWorkflowSha": "5da22468021edbc45df8f018a3cbc4f6803820a7",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3257959609",
      "sha": "5da22468021edbc45df8f018a3cbc4f6803820a7"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

