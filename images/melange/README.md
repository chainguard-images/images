# melange

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/melange/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/melange/actions/workflows/release.yaml)

Container image for running [melange](https://github.com/chainguard-dev/melange) workflows to build APK packages.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/melange:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` `v0.1.0` | `sha256:14b28a8544afd9e2bd48a85d121c91febc459035f8d42f4965143aa3ffce3ad4`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:14b28a8544afd9e2bd48a85d121c91febc459035f8d42f4965143aa3ffce3ad4) | `amd64` `arm64` `armv7` |


## Usage

To build the melange workflow in [examples](examples/gnu-hello.yaml):

```
docker run --privileged -v "$PWD":/work cgr.dev/chainguard/melange build /work/examples/gnu-hello.yaml
```

Output will be in the `packages` directory.

To build the melange package for the host architecture:

```
docker run --privileged -v "$PWD":/work cgr.dev/chainguard/melange build --empty-workspace --arch $(uname -m) /work/melange.yaml
```

To get a shell, you can change the entrypoint:

```
docker run --privileged -v "$PWD":/work -it --entrypoint /bin/sh cgr.dev/chainguard/melange

/ # melange version
...
```
Note that melange uses bubblewrap internally, which requires various Linux capabilities, hence the
use of `--privileged`. Because of this requirement, we recommend this image is used only for local
development and testing.


## Signing

All distroless images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/melange:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/melange:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/melange"
      },
      "image": {
        "docker-manifest-digest": "sha256:14b28a8544afd9e2bd48a85d121c91febc459035f8d42f4965143aa3ffce3ad4"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "workflow_dispatch",
      "1.3.6.1.4.1.57264.1.3": "25339bb99db2576c623ec552bca204e4cdd59bd4",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/melange",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCICIqnmc6a49oV2uV/EqDU0TVL19SMonpsNfG7j/aFgryAiBLEaJ/T0ERHuaCy6QQpobFpykdWRER2XZqczpfox+oGg==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIwMTFkZjFjYTI2MGRiYThhMzc3MWM2YjhiZDYwMjQ0ZWE5ZTVjYzU0NjkwNDgwYjY4ZjFkYzg3NWYzNDkzNjA4In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUQ2N3NsaFVPdEw0TnNCKzNoWGxMRVg3aGUrZVpRNlo4NDcxZDUzVUZJZmFRSWhBTGhyK09OSVdDTSsrOXlET2xFZm1LMEFUa0hDZUszZHdNWHlrb0VTUW8xKyIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBha05EUVhwNVowRjNTVUpCWjBsVlNXNXpkamhJTW5OM1VYbGxiWFprVVdZMFExWXhOV2xoUzJaVmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hkTlZGbDVUbFJSZVZkb1kwNU5ha2wzVDFSSmQwMVVXWHBPVkZGNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZSWW0wd1QxQnNNR3B4UVZsalZUSTFOVXBaYlcxa1ExVmpURXMzVTNWbmVHOHJjV0VLZEcxMlVXOUtkV2t2YWtNNFZXcGlaMkpKTlhOSlVIbzFZMjlDZWpSM1NYRXdNVGtyVmxwb2J6Sk1NMFZwWnpaU1ZXRlBRMEZzYzNkblowcFlUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlUxVDNBNENtVlVRbWhLWkRWeWNWbGxhbU5sY1UxUlR5dEpVMWQzZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVd4aVIwWjFXakpWZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWpoSFEybHpSMEZSVVVKbk56aDNRVkZKUlVWWVpIWmpiWFJ0WWtjNU13cFlNbEp3WXpOQ2FHUkhUbTlOUkZsSFEybHpSMEZSVVVKbk56aDNRVkZOUlV0RVNURk5lazAxV1cxSk5VOVhVbWxOYWxVelRtMU5NazFxVG14WmVsVXhDazF0U21wWlZFbDNUa2RWTUZreVVtdE9WR3hwV2tSUmQwaEJXVXRMZDFsQ1FrRkhSSFo2UVVKQ1FWRlBVVE5LYkZsWVVteEpSa3BzWWtkV2FHTXlWWGNLU25kWlMwdDNXVUpDUVVkRWRucEJRa0pSVVZwWk1taG9ZVmMxYm1SWFJubGFRekZ3WWxkR2JscFlUWFppVjFaeldWYzFibHBVUVdSQ1oyOXlRbWRGUlFwQldVOHZUVUZGUjBKQk9YbGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMmRaYjBkRGFYTkhRVkZSUWpGdWEwTkNRVWxGWmtGU05rRklaMEZrWjBGSkNsbEtUSGRMUmt3dllVVllVakJYYzI1b1NuaEdXbmhwYzBacU0wUlBUa3AwTlhKM2FVSnFXblpqWjBGQlFWbE9ZblZFVkZCQlFVRkZRWGRDU0UxRlZVTUtTVWg0U0hkaU1tUmliMjV4V0VJNWJFWldVRmRCWkdRNVpsQnpZM1UxVFRoaFdtbzJUazR5WldGeU5GbEJhVVZCSzJGMVZVTm5aVE5vZVhoYWNIaHBVQXBIZGtGdVR6RXhXbTV1VTNvMmJ6RTRlbmRHWlZWRFUzRkxZamgzUTJkWlNVdHZXa2w2YWpCRlFYZE5SR0ZCUVhkYVVVbDRRVkJwUVUxVFpuSnFZVVV4Q2pWNGIzbFZOVFZ6VWxKMU5HbHJiRFpyTW05Rk1UQXlhRXAyYTI5cVVYaFBZV2xvZFdob2FHUTRhWGd2VTFNNUswMVJOalUxWjBsM1RURlRVVUZuV1hBS1NFRkVMMEkxWW1KRFpUVlpPR1pVUjJOR1MwRjVWVk13U1RRM2EzTnJlR05VVFc5NFptTk5Ua1JsZVRKTk1rUjVZall2Y2t0SVkwNEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1663691164,
          "logIndex": 3616150,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/melange/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3091638342",
      "sha": "25339bb99db2576c623ec552bca204e4cdd59bd4"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

