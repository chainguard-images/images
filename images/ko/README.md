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
| `0.11.2-r4` `latest` | `sha256:e37808dbc4fed08562e401b7ecb443e721e124c2debcaed454f49671b4e6182c`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:e37808dbc4fed08562e401b7ecb443e721e124c2debcaed454f49671b4e6182c) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `s390x` |
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
        "docker-manifest-digest": "sha256:e37808dbc4fed08562e401b7ecb443e721e124c2debcaed454f49671b4e6182c"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "97f5d5dc4fe2d2ea6f374945260be3cbc08b673e",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/ko",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIHaRBCQjei1mhDzu+Nxisfba2GXRbNWMEevz4id/RoeRAiEArasLuJvs3x76xwH5iliW/QcJ5ImL2S+yLFBK8sM5SDg=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI0YjNhM2U0MGVhNTE2MWUwNTk4YWZmYjE3MzU1ZmUxNWM1NjQ5MzljYWQ5OTljYzUzYjVhYmFhYmM3NGMyMjBhIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURYL1ZNZlZwdVF5OVp2RWJBTytLZDFCZ2laMDNGeWVkamQ0R3JUdnNFVmVnSWdROHJTa3dRQUpFRHpTWVppZ1JmS2Z2RENJUkdBbkFhNThMS2tRaHl1UG5BPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndSRU5EUVhsdFowRjNTVUpCWjBsVVVuVlVhSFZZVlRVM1JGUklRMkpMTjA1TVREVkRlVVFyYWxSQlMwSm5aM0ZvYTJwUFVGRlJSRUY2UVRNS1RWSlZkMFYzV1VSV1VWRkxSWGQ0ZW1GWFpIcGtSemw1V2xNMWExcFlXWGhJYWtGalFtZE9Wa0pCVFZSR1dFNXdXak5PTUdJelNteE1WMngxWkVkV2VRcGlWMVpyWVZkR01GcFVRV1ZHZHpCNVRXcEZkMDFFYTNkTmFrVXhUVlJvWVVaM01IbE5ha1YzVFVScmQwMXFTVEZOVkdoaFRVRkJkMWRVUVZSQ1oyTnhDbWhyYWs5UVVVbENRbWRuY1docmFrOVFVVTFDUW5kT1EwRkJVMlZWWkhjd01YaHVNSEZUUkVwVU5VSnlkRWgwUTBKbk4wNU5UWGN4V1hadFVEZDBVbFFLWVZJeE56WnVTVmxRY0RsWVpWbHZRaXRLYlZaM056aEtVVGRaYzJZd1IxaGpTMUZDYWk4NVpIUlhiMFJ3VlVSdWJ6UkpRMU5VUTBOQmExVjNSR2RaUkFwV1VqQlFRVkZJTDBKQlVVUkJaMlZCVFVKTlIwRXhWV1JLVVZGTlRVRnZSME5EYzBkQlVWVkdRbmROUkUxQ01FZEJNVlZrUkdkUlYwSkNVakYxVVZKR0NtUmpZVlpGYWsxTmFsZ3lRWHBDVVZwWk5HNTJWMnBCWmtKblRsWklVMDFGUjBSQlYyZENWR1l3SzI1UVZtbFJVbXgyYlc4eVQydHZWbUZNUjB4b2FHc0tVSHBDYTBKblRsWklVa1ZDUVdZNFJWZHFRbGxvYkZwdlpFaFNkMk42YjNaTU1tUndaRWRvTVZscE5XcGlNakIyV1RKb2FHRlhOVzVrVjBaNVdrTXhjQXBpVjBadVdsaE5kbUV5T0haTWJXUndaRWRvTVZscE9UTmlNMHB5V20xNGRtUXpUWFpqYlZaeldsZEdlbHBUTlRWWlZ6RnpVVWhLYkZwdVRYWmhSMVpvQ2xwSVRYWmlWMFp3WW1wQk5VSm5iM0pDWjBWRlFWbFBMMDFCUlVKQ1EzUnZaRWhTZDJONmIzWk1NMUoyWVRKV2RVeHRSbXBrUjJ4MlltNU5kVm95YkRBS1lVaFdhV1JZVG14amJVNTJZbTVTYkdKdVVYVlpNamwwVFVKWlIwTnBjMGRCVVZGQ1p6YzRkMEZSU1VWRFNFNXFZVWRXYTJSWGVHeE5SRmxIUTJselJ3cEJVVkZDWnpjNGQwRlJUVVZMUkdzeldtcFdhMDVYVW1wT1IxcHNUVzFSZVZwWFJUSmFhazB6VGtSck1FNVVTVEpOUjBwc1RUSk9hVmw2UVRSWmFsa3pDazB5VlhkSVFWbExTM2RaUWtKQlIwUjJla0ZDUWtGUlQxRXpTbXhaV0ZKc1NVWktiR0pIVm1oak1sVjNTV2RaUzB0M1dVSkNRVWRFZG5wQlFrSlJVVlVLV1RKb2FHRlhOVzVrVjBaNVdrTXhjR0pYUm01YVdFMTJZVEk0ZDBoUldVdExkMWxDUWtGSFJIWjZRVUpDWjFGUVkyMVdiV041T1c5YVYwWnJZM2s1ZEFwWlYyeDFUVWxIVEVKbmIzSkNaMFZGUVdSYU5VRm5VVU5DU0RCRlpYZENOVUZJWTBGRFIwTlRPRU5vVXk4eWFFWXdaRVp5U2pSVFkxSlhZMWx5UWxrNUNuZDZhbE5pWldFNFNXZFpNbUl6U1VGQlFVZEVkVzlhTkRWUlFVRkNRVTFCVTBSQ1IwRnBSVUUwUlhoMVFtOVRZVmMzYmt0VU5YbFZPVnBvYkZodE5rMEtOVkZ2V1ZwbVpWZGhSMmxvV0hOTmNtODFiME5KVVVOME1XeFpNVk5sTmpSamNVbExNREY0YldkcGEzTm5OV3BYUmtKdE5WVmFka1U1VFhaRVIyZElOZ3AyZWtGTFFtZG5jV2hyYWs5UVVWRkVRWGRPY0VGRVFtMUJha1ZCTWxKT1lqUkZjRE42UlVsTmVYZEVTRmRtVUdKV01FaDRjMnBSYzBNdlJqUkhVVWQxQ2paMGRtWlNPVlkzWW1KRmJYSmtWVnAxWkVGNVUxVXJiVlZoZFUxQmFrVkJiR3BRY0dwaFNuaDRkMWxVZGxBclRWRTJaamhNT1hsUVZGZFJXSEJJVEdzS1dXVXdPSFZMY1RZd1MwdFNUMHBEUkdSRVFXaGxjVkJ2UlVkcFptdFZaamNLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1665281758,
          "logIndex": 4727700,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/ko/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/ko",
      "githubWorkflowSha": "97f5d5dc4fe2d2ea6f374945260be3cbc08b673e",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3212550997",
      "sha": "97f5d5dc4fe2d2ea6f374945260be3cbc08b673e"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

