# python

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/distroless/readme-generator
-->

[![CI status](https://github.com/distroless/python/actions/workflows/release.yaml/badge.svg)](https://github.com/distroless/python/actions/workflows/release.yaml)

This is a minimal Python image based on Alpine, using Python apks available on the Alpine Community repositories (not built from source as of now).<br/><br/>While this image is being developed, we will stick to the latest stable Python version which at this moment is `3.10.7`. Supported versions in the long term are TBD.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/python:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:37f2f65b66e2ef0607ed68a3b0eb74ec6b94a4b78e7dd8efb7716474343450ea`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:37f2f65b66e2ef0607ed68a3b0eb74ec6b94a4b78e7dd8efb7716474343450ea) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


## Usage

To try out the image, run:

```shell
docker run --rm cgr.dev/chainguard/python python -VV
```

Python version installed 
```
Python 3.10.7 (main, Sep 11 2022, 22:42:41) [GCC 12.1.1 20220630]
```

Pip Version installed 

```shell 
docker run --rm cgr.dev/chainguard/python pip -V
```

```shell
pip 22.2.2 from /usr/lib/python3.10/site-packages/pip (python 3.10)
```


## Signing

All distroless images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/python:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/python:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/distroless/python"
      },
      "image": {
        "docker-manifest-digest": "sha256:37f2f65b66e2ef0607ed68a3b0eb74ec6b94a4b78e7dd8efb7716474343450ea"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "75f457813166f7cbde2b3939fa5e0cd03911fc91",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/python",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCUFXhxa3CpuyLcOKof30Jfe8z60aYZE6YGoLpXe5/p8gIgX399ghoqP4jq9rypLvdQylDkd25JFBPE6RZktHmfmpE=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI4MTQyZTE3YzFiZjU1OTM0NmU5YmM5Njg0OTE3MjQxZjcwODg5M2ZkYzFmMzFkODUwMmY1MTVlNDNiNWE4OWJmIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNpdDBPZytaeExBOFFsZ1hXWDcybldjbXVRemNSUDBKTzlDNk13MkdhbjFBSWhBT1dHYXJCL24vT2srT2h5ODE1dDRheTNMKzZrTWlJZHVYWXRrb3RZYk9RTCIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnRSRU5EUVhnMlowRjNTVUpCWjBsVldtaE9iRzkyU0dsblIzVk9LMFJKU2xOMmIzRkNWMGxvYTA5dmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hkTlJHdDZUVVJGTVZkb1kwNU5ha2wzVDFSSmQwMUVhekJOUkVVeFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZvUlUxalpXbFFjMWhDYWpaWWMzWlVaREZyUnpCVk5VWnZRWE5PU21ZNGFXTndNVmtLTVVkR1pWVjRNVzFNZEhWUFVsWTJlbWRVU1VONFZrWndkSEpSV25JcmNVVXplbVZHVVdOd1NUWTJibUZMTVd4TVkyRlBRMEZxTUhkblowazFUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZHWkd0NUNtRmtOamczVEVneUswVTVlbHBqWml0UFFVZGlTSGxaZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFsUldVUldVakJTUVZGSUwwSkdZM2RXV1ZwVVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BqU0d3d1lVYzVkVXg1Tlc1aFdGSnZaRmRKZG1ReU9YbGhNbHB6WWpOa2Vrd3pTbXhpUjFab1l6SlZkV1ZYUm5SaVJVSjVXbGRhZWt3eWFHeFpWMUo2Q2t3eU1XaGhWelIzVDFGWlMwdDNXVUpDUVVkRWRucEJRa0ZSVVhKaFNGSXdZMGhOTmt4NU9UQmlNblJzWW1rMWFGa3pVbkJpTWpWNlRHMWtjR1JIYURFS1dXNVdlbHBZU21waU1qVXdXbGMxTUV4dFRuWmlWRUZUUW1kdmNrSm5SVVZCV1U4dlRVRkZRMEpCVW5ka1dFNXZUVVJaUjBOcGMwZEJVVkZDWnpjNGR3cEJVVTFGUzBSak1WcHFVVEZPZW1kNFRYcEZNazV0V1ROWk1rcHJXbFJLYVUxNmEzcFBWMXBvVGxkVmQxa3lVWGROZW10NFRWZGFhazlVUlhkSVFWbExDa3QzV1VKQ1FVZEVkbnBCUWtKQlVVOVJNMHBzV1ZoU2JFbEdTbXhpUjFab1l6SlZkMGgzV1V0TGQxbENRa0ZIUkhaNlFVSkNVVkZTV2tkc2VtUklTbllLWWtkV2VtTjVPWGRsV0ZKdllqSTBkMGhSV1V0TGQxbENRa0ZIUkhaNlFVSkNaMUZRWTIxV2JXTjVPVzlhVjBaclkzazVkRmxYYkhWTlNVZEtRbWR2Y2dwQ1owVkZRV1JhTlVGblVVTkNTSE5GWlZGQ00wRklWVUZEUjBOVE9FTm9VeTh5YUVZd1pFWnlTalJUWTFKWFkxbHlRbGs1ZDNwcVUySmxZVGhKWjFreUNtSXpTVUZCUVVkRVYycDJZV2xuUVVGQ1FVMUJVbXBDUlVGcFFrcFhSRkpoT1RsR09ERXZkMU5aTjNsUE1WSldjM1pPZEhWNWVqVkRNRE5xVW5SeU9GQUtVVXAyVjBsblNXZFNTRGt4UW5KTGJTdGhTVzlVZVRkVlpXTjBLMHRWWkRSTGVrOU5OVEUyV0ZRMFRtdEphV1pPTUVrNGQwTm5XVWxMYjFwSmVtb3dSUXBCZDAxRVlVRkJkMXBSU1hoQlRHOU9XSHBMTW1ZMVpuQmtZbkJ6YUZGb1ZUWmxUMUF6ZEVVemJHZ3hja05qYTJOUk9IZExOamxzTXpFdk1ub3haRmRpQ210TFluSmFZVTUzV0hGQmNXNW5TWGRPUm1oVFFrUjBXSG96YUZJdmVYWTJiazF4VmxFeU1uTlhURXhEUmxCSGMzVnRZbkZIY1d4SlExQTRXRTF5WjBzS1RIZHdRMk5pYmtSa1lsZ3lURkJxUXdvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1663666238,
          "logIndex": 3596080,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/python/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3088985049",
      "sha": "75f457813166f7cbde2b3939fa5e0cd03911fc91"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

