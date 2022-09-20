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
| `12.1.1_git20220630` `12.1.1_git20220630-r5` `latest` | `sha256:5c5a8348be43e8112e986d441d6a4f4f49b0d3b1b2cd0adb5d5c95699b068938`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:5c5a8348be43e8112e986d441d6a4f4f49b0d3b1b2cd0adb5d5c95699b068938) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:5c5a8348be43e8112e986d441d6a4f4f49b0d3b1b2cd0adb5d5c95699b068938"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "10fbd6dfb9d8bdbd2fd626e8bb7f4b1eecfa3395",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/gcc-musl",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIEbQMCcgZD8XMS0lbHrJog9MVefwfIVucYLcLa8hhW3zAiEAvDa6eHI+mUAg2DzZw9s/AEXoezBvY6YC80RPL6tYcsA=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI1NGYyZmE2YjdjNDkwMDg3MDg3YWRhYTAzOTk1NTBmYTljMmY4ODJjYmYyM2MwMDUwOGI5MzRkN2RiODJkMmVkIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJSDNIRStyMjJHKzRtTndsRytXZVVYanNLOVRSVDloZ05GTjM4eW9sbFcvT0FpQlQ4T2pzWHN6b2IzVXVqd2pOMlRuZnoyRC9CR3JGbnpnNUlTMjMvY3BwVkE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlSRU5EUVhwTFowRjNTVUpCWjBsVlpuaHdZMnB0TkhGcVJtTndUV1p6Uld4RVpIUjBaVlkzWlZkTmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hkTlZHTXhUMVJWTlZkb1kwNU5ha2wzVDFSSmQwMVVaM2RQVkZVMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ6YzJrM1NEWnFWMlZ3UXpOUEswRXdUbkprTVROUmFXaHBWMWMwZFdsWU1GaHJjM2dLVTFCMVdtVlhVbEp0Yms1c2JYWmFXR3BqYWs5UlZHbDVaM0V6TVhnMlNVOWpZV1Y0ZFM5alN6aHdOVlVyVkRoaWNuRlBRMEZzUlhkblowcE9UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZvTWtSUENuaHBOWEZJWlZSc1ltMVFaV0ZqWlRoSE5VRjZVRkp2ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGbldVUldVakJTUVZGSUwwSkhRWGRZYjFwallVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkdwWmVURjBaRmhPYzB4NU5XNWhXRkp2WkZkSmRtUXlPWGxoTWxwellqTmtla3d6U214aVIxWm9ZekpWZFdWWFJuUmlSVUo1Q2xwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1QxRlpTMHQzV1VKQ1FVZEVkbnBCUWtGUlVYSmhTRkl3WTBoTk5reDVPVEJpTW5Sc1ltazFhRmt6VW5BS1lqSTFla3h0WkhCa1IyZ3hXVzVXZWxwWVNtcGlNalV3V2xjMU1FeHRUblppVkVGVFFtZHZja0puUlVWQldVOHZUVUZGUTBKQlVuZGtXRTV2VFVSWlJ3cERhWE5IUVZGUlFtYzNPSGRCVVUxRlMwUkZkMXB0U210T2JWSnRXV3BzYTA5SFNtdFpiVkY1V20xUk1rMXFXbXhQUjBwcFRqSlpNRmxxUm14YVYwNXRDbGxVVFhwUFZGVjNTRUZaUzB0M1dVSkNRVWRFZG5wQlFrSkJVVTlSTTBwc1dWaFNiRWxHU214aVIxWm9ZekpWZDB0QldVdExkMWxDUWtGSFJIWjZRVUlLUWxGUllWa3lhR2hoVnpWdVpGZEdlVnBETVhCaVYwWnVXbGhOZGxveVRtcE1WekV4WXpKM2QwaFJXVXRMZDFsQ1FrRkhSSFo2UVVKQ1oxRlFZMjFXYlFwamVUbHZXbGRHYTJONU9YUlpWMngxVFVsSFRFSm5iM0pDWjBWRlFXUmFOVUZuVVVOQ1NEQkZaWGRDTlVGSVkwRkRSME5UT0VOb1V5OHlhRVl3WkVaeUNrbzBVMk5TVjJOWmNrSlpPWGQ2YWxOaVpXRTRTV2RaTW1JelNVRkJRVWRFV0VFMlNVcFJRVUZDUVUxQlUwUkNSMEZwUlVGMmF6SlVaVmw0TTFNeGQzb0tZbVZWYzNSMVluQmhNbWxFVUhSbmMwZFJabHBXVVU1RFNHVXhOR3hIYzBOSlVVTldNVFl2YlVWaE5YYzVkR05aZFZsRGN6UTJOMWhzUWxCT01ISlFlQXB5ZDFsNVR6aG5kMmRPUW1RNFJFRkxRbWRuY1docmFrOVFVVkZFUVhkT2IwRkVRbXhCYWtKQllWSmhabTVYTkhabU5raHBaVGRUVW5KdVRGVXJORFJRQ2xaWGVsZEVSbkpVUlVwS2VVbGllbXBwTUZWaVFrVmFibmRKVlV0NlpXNXpPVEZTVjFGVk9FTk5VVVJ1SzJKNVRYTlNVVTR6TWxoS1pXMWlZa2N6VmxVS2JrNDNMMnB6VVZoRFJEQnNhbFZYY1dsbU1VZFJOVnB4Unk5UGMyaFljbXB5V25aVFRYcHRiRWNyY3owS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1663696848,
          "logIndex": 3620819,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/gcc-musl/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3092332717",
      "sha": "10fbd6dfb9d8bdbd2fd626e8bb7f4b1eecfa3395"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

