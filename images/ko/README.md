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
| `0.11.2-r3` `latest` | `sha256:15d2399d06e6c744711adc58ed96decfec0658b53de74c5828adc315ecc77dd2`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:15d2399d06e6c744711adc58ed96decfec0658b53de74c5828adc315ecc77dd2) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `s390x` |


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
        "docker-manifest-digest": "sha256:15d2399d06e6c744711adc58ed96decfec0658b53de74c5828adc315ecc77dd2"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "3c26786f91d4d0d9ddf22e3597747e9e33bd003a",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/ko",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIFLNmYJk+cV5nND7PqjVePYJ2mRYruc0jv0GfwqaY1KNAiEAlbffWJHDw3IdUT4+JkLksjwVsug5pKfc+GiR5XZTXMI=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI0OTRjMDdhMDE0YjkwMzc1ZjFkMzM1M2JlNWU5MjkxNWRmNDY0M2ZiYTBmNmU4Y2YyMDE2NTQzYmViMmIzMWVkIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUR5aXNFU2hYem5lU2ZkRXhTeDMvOGZPNDFJUXkrd041clVNTkp1VHBneThRSWdhdHZDKzk1VFVEa1M2cnk1RmFSQ001WHlWVjhOY05ZY1k0VjNvMFoydE5rPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndSRU5EUVhseFowRjNTVUpCWjBsVlFtUlphMnRJTm5sc1RYbHJUMjA0UmxSV1lrbFJkVEl2U1dKSmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hsTlJFbDRUbFJCTVZkb1kwNU5ha2wzVDFSSmVVMUVTWGxPVkVFeFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZzVlZWWGFIcDRZM3BqTDJ0bUwwTjZlRWh6YlhWR1owcDNiSEpRZDFCelZFcElkMWdLV2pWb1dIUk1lREYwZVhGaGRrRjFNMHRaV25aeE5XRk9SVUZzTjJwV2FYSlBORTFXZVRGWlZIa3pPRWcwV2s5TGQyRlBRMEZyYTNkblowcEdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlY2WTBsNUNtUjBLMWREWVZKbU5Hd3Zha3gxUzJSalJFRktLMXBqZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwQldVUldVakJTUVZGSUwwSkdiM2RYU1ZwWFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5ZEhaTWVUVnVZVmhTYjJSWFNYWmtNamw1WVRKYWMySXpaSHBNTTBwc1lrZFdhR015VlhWbFYwWjBZa1ZDZVZwWFducE1NbWhzQ2xsWFVucE1NakZvWVZjMGQwOVJXVXRMZDFsQ1FrRkhSSFo2UVVKQlVWRnlZVWhTTUdOSVRUWk1lVGt3WWpKMGJHSnBOV2haTTFKd1lqSTFla3h0WkhBS1pFZG9NVmx1Vm5wYVdFcHFZakkxTUZwWE5UQk1iVTUyWWxSQlYwSm5iM0pDWjBWRlFWbFBMMDFCUlVOQ1FXaDZXVEpvYkZwSVZuTmFWRUV5UW1kdmNncENaMFZGUVZsUEwwMUJSVVJDUTJkNldYcEpNazU2WnpKYWFtdDRXa1JTYTAxSFVUVmFSMUp0VFdwS2JFMTZWVFZPZW1Nd1RqSlZOVnBVVFhwWmJWRjNDazFFVG1oTlFuZEhRMmx6UjBGUlVVSm5OemgzUVZGUlJVUnJUbmxhVjBZd1dsTkNVMXBYZUd4WldFNXNUVU5KUjBOcGMwZEJVVkZDWnpjNGQwRlJWVVVLUmtkT2IxbFhiSFZhTTFab1kyMVJkR0ZYTVdoYU1sWjZUREowZGsxQ01FZERhWE5IUVZGUlFtYzNPSGRCVVZsRlJETktiRnB1VFhaaFIxWm9Xa2hOZGdwaVYwWndZbXBEUW1sM1dVdExkMWxDUWtGSVYyVlJTVVZCWjFJNVFraHpRV1ZSUWpOQlFXaG5hM1pCYjFWMk9XOVNaRWhTWVhsbFJXNUZWbTVIUzNkWENsQmpUVFF3YlROdGRrTkpSMDV0T1hsQlFVRkNaekpNTmt0T2EwRkJRVkZFUVVWbmQxSm5TV2hCVEVNeWJXWkdUVFJuTkU1NGJWbEpURkJTYmxKdE9HOEthMjlPWVhoWWVXbE9SbXhVWkc5aVdtRTVkMWhCYVVWQmIycE9Ta1ZXZDJwVk1USjFZMUJUVTJSM1pXdEdNVTl1T1M5dVNFdEpTMjEwZGtGeUt6TkpaUXBhSzJkM1EyZFpTVXR2V2tsNmFqQkZRWGROUkdGQlFYZGFVVWwzUVhWalVHOVpMMGhsZDNSaU1Dc3Jia1UxTTNkU1VuSkJWVlk1V0ZKWU1tdFFXa05RQ2pWUmVuQXlhQzl1TUhScE1GTkpLMjl1YXl0dmJtMDFVVEF2YWt4QmFrVkJlRE5zUmpKUGQxcHhXRWt4YzFwd01ucG9hazlOUVVOdWFGTnpjbVJ2ZWtjS05tUk9VamxIU1hCWVluWjJVMjFTVGpGUlZ6WlNkRlpEY1ZsVVZUaHpTV29LTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1663812924,
          "logIndex": 3715428,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/ko/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3102392033",
      "sha": "3c26786f91d4d0d9ddf22e3597747e9e33bd003a"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

