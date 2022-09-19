# melange

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/distroless/readme-generator
-->

[![CI status](https://github.com/distroless/melange/actions/workflows/release.yaml/badge.svg)](https://github.com/distroless/melange/actions/workflows/release.yaml)

Container image for running [melange](https://github.com/chainguard-dev/melange) workflows to build APK packages.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/melange:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` `v0.1.0` | `sha256:3412176ce39e7866a91b7b2cf8f61f0293a802e5b1963a21ef531d5afc3838e7`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:3412176ce39e7866a91b7b2cf8f61f0293a802e5b1963a21ef531d5afc3838e7) | `amd64` `arm64` `armv7` |


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
        "docker-reference": "ghcr.io/distroless/melange"
      },
      "image": {
        "docker-manifest-digest": "sha256:3412176ce39e7866a91b7b2cf8f61f0293a802e5b1963a21ef531d5afc3838e7"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "7fbd731518593b58ed3b405b94d137b25cdd4541",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/melange",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCICGV9a58XoOl/v0XIsE0kwJzsy3f9jqLgoww8QM0TxkBAiB5zJnybWnNVeNxnZui9/Gf403OLHqcvkvx/6am5cWq2g==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI3OTFlNDkwYTQ1NTRjZmNlMjdkZDNkNDVkYzNmM2UwNDhmNDM0NDlkOWU5NWY0NzBlZjk2NmRjZmExM2Q1ZmI5In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURESjJGdUlNS3FacEdJb2lyam5oc2hxczMyN1pOdS9OcklUM2M0RDFJdE1BSWhBSVNWeE9QY3ZHTUlxeFRUZEErVHhhdGFZZ1h4Ry9oSExoYU40MlNnUXZ0MyIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnRWRU5EUVhsRFowRjNTVUpCWjBsVlVWSTFUbEoxYldveUsxb3paRFkzS3pZck9VODRUV2cxY0haWmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRWTmFrbDVUMFJCZVZkb1kwNU5ha2wzVDFSRk5VMXFTWHBQUkVGNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVV6TWtsVmF5dG9OblJUYXpSTmNUVm5iR2RaU0VabVJWUjBVMHRyZWsxemFEWlNhekVLTUd0VmEzQlVLek5PY0dKUldDczJPVGhMY1RaSFJGVmlUR2syY0daMGRFVlhWRVpMWkhGdGRGZ3dMekZ6VDBsMWN6WlBRMEZxT0hkblowazNUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZXVW5wSUNrNDNSQzlyUlVkeE1sWkphMnBZT1VkdFpHTlhNRnB2ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFsbldVUldVakJTUVZGSUwwSkdaM2RXYjFwVllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BpVjFaeldWYzFibHBUT0hWYU1td3dZVWhXYVV3elpIWmpiWFJ0WWtjNU0yTjVPWGxhVjNoc1dWaE9iRXh1YkdoaVYzaEJZMjFXYldONU9XOWFWMFpyQ21ONU9YUlpWMngxVFVSclIwTnBjMGRCVVZGQ1p6YzRkMEZSUlVWTE1tZ3daRWhDZWs5cE9IWmtSemx5V2xjMGRWbFhUakJoVnpsMVkzazFibUZZVW04S1pGZEtNV015Vm5sWk1qbDFaRWRXZFdSRE5XcGlNakIzUldkWlMwdDNXVUpDUVVkRWRucEJRa0ZuVVVWalNGWjZZVVJCTWtKbmIzSkNaMFZGUVZsUEx3cE5RVVZFUWtObk0xcHRTbXRPZWsxNFRsUkZORTVVYTNwWmFsVTBXbGRSZWxscVVYZE9WMGsxVGtkUmVFMTZaR2xOYWxacVdrZFJNRTVVVVhoTlFuZEhDa05wYzBkQlVWRkNaemM0ZDBGUlVVVkVhMDU1V2xkR01GcFRRbE5hVjNoc1dWaE9iRTFEUVVkRGFYTkhRVkZSUW1jM09IZEJVVlZGUlcxU2NHTXpVbmtLWWpKNGJHTXpUWFppVjFaeldWYzFibHBVUVdSQ1oyOXlRbWRGUlVGWlR5OU5RVVZIUWtFNWVWcFhXbnBNTW1oc1dWZFNla3d5TVdoaFZ6UjNaMWxyUndwRGFYTkhRVkZSUWpGdWEwTkNRVWxGWlhkU05VRklZMEZrVVVGSldVcE1kMHRHVEM5aFJWaFNNRmR6Ym1oS2VFWmFlR2x6Um1velJFOU9TblExY25kcENrSnFXblpqWjBGQlFWbE9XRE5hVEdOQlFVRkZRWGRDUjAxRlVVTkpSM1JOT0cxMFEzb3libVI1VWtkblZWRnhRelowTVM5bGJFUjNORzlPWmpseWVrb0tibU5EVG05RFRqSkJhVUkzWTNodFQwaHdXVUZ6V0RkUWVuWlFVa1ptYlhkNUswOXlSMlJ6VTFwWVMxWnRWMlptYjIwNUwwRkVRVXRDWjJkeGFHdHFUd3BRVVZGRVFYZE9ia0ZFUW10QmFrRk5aR2RCVEdOVGJVOWFaMWRaYzBKMmNYSnFTbmRSV0dFeFdGQkhWMGRtWTBJd1NsQTBZbFJIVVRFMlRUVm9SMmx1Q2xVNVNXSXhiRkJYWWxVNGIwMUphME5OUTBWWGNtMHZkbFJMUnpjMmJtSm5SMmMyVUZwcWQzZDJlRFJ6VWxvMVlXNVVibkpQUzJKeFlsQndjRE5oVkdNS00yOUpOME5xZEhwc2VtMDFNRWRLVlV4UlBUMEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1663626498,
          "logIndex": 3565241,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/melange/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3085949324",
      "sha": "7fbd731518593b58ed3b405b94d137b25cdd4541"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

