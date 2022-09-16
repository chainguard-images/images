# musl-dynamic

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/distroless/readme-generator
-->

[![CI status](https://github.com/distroless/musl-dynamic/actions/workflows/release.yaml/badge.svg)](https://github.com/distroless/musl-dynamic/actions/workflows/release.yaml)

Base image with just enough files to run static binaries!<br/><br/>This image is meant to be used as a base image only, and is otherwise useless. It contains the `alpine-baselayout-data` package from Alpine, which is just a set of data files needed to support glibc and musl static binaries at runtime.<br/><br/>This image can be used with `ko build`, `docker`, etc, but is only suitable for running static binaries.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/musl-dynamic:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `1.2.3-r1` `latest` | `sha256:d09ded6574b6c699441c4fe1ae2ac09777fefc25a13b8aa98d1a7e9423b39717`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:d09ded6574b6c699441c4fe1ae2ac09777fefc25a13b8aa98d1a7e9423b39717) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


## Usage

See the [examples/](./examples/) directory for
an example C program and associated Dockerfile
that can be used with this image.


## Signing

All distroless images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/musl-dynamic:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/musl-dynamic:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/distroless/musl-dynamic"
      },
      "image": {
        "docker-manifest-digest": "sha256:d09ded6574b6c699441c4fe1ae2ac09777fefc25a13b8aa98d1a7e9423b39717"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "90e75203a703792dc246859ad6eb8af35f3a5c2c",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/musl-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDi76sui2cBxTe5gp4fa7qd+j7rlqNdXmIRxxzgt8dCOAIgaRGcV8Dw/4tN6hXRp1JHjo+f657vpr1a1D4a58lA8uQ=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJjZmQzNmNjMWYyMTNlMDM4ZWY3ODcxYWI1YzhkOTNmMjU3MjhkODJiMjI1YWRmMGU1OTMzNGI2NjZmZTAxMDlkIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJRm5GMzBsK1RweXNVNVNsTlZDV0ZmSmVsMDNsOTdCc2hsNkk5N1drZnphREFpRUFnRis3Y2RlT0piL1B4NTZaZnNlUi9rUlc3bHNvb2lGT085Y0lNUVlWckM0PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhSRU5EUVhrMlowRjNTVUpCWjBsVlpGZHdjV1ZGVlVSMVVqZzJlblZQYkRkWmFFOVZTbk5IZEhSVmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRKTlJFbDZUV3BSZWxkb1kwNU5ha2wzVDFSRk1rMUVTVEJOYWxGNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZSYW05MlNGVXhXQ3M1ZUZkWlRsQTRjRU5uWlNzMWJ6aFZabkJPVldvck1FZGhjemdLT0hoWWNrTmpWSFo1YTBSVk1WcDVXbTlHYzAxWVdrOUtUMnhTU25kMGRYTkxZM05PU1c0MEt6aDBPR054UzFoTlFuRlBRMEZyTUhkblowcEtUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZITXpsdUNrMHlkVVpzTURSMFJsVmFNVU5NUVd0MlVWbFVXRTFKZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwM1dVUldVakJTUVZGSUwwSkdNSGRYTkZwYVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BpV0ZaNllrTXhhMlZYTldoaVYyeHFUSGsxYm1GWVVtOWtWMGwyWkRJNWVXRXlXbk5pTTJSNlRETktiR0pIVm1oak1sVjFaVmRHZEdKRlFubGFWMXA2Q2t3eWFHeFpWMUo2VERJeGFHRlhOSGRQVVZsTFMzZFpRa0pCUjBSMmVrRkNRVkZSY21GSVVqQmpTRTAyVEhrNU1HSXlkR3hpYVRWb1dUTlNjR0l5TlhvS1RHMWtjR1JIYURGWmJsWjZXbGhLYW1JeU5UQmFWelV3VEcxT2RtSlVRVmRDWjI5eVFtZEZSVUZaVHk5TlFVVkRRa0ZvZWxreWFHeGFTRlp6V2xSQk1ncENaMjl5UW1kRlJVRlpUeTlOUVVWRVFrTm5OVTFIVlROT1ZFbDNUVEpGTTAxRVRUTlBWRXByV1hwSk1FNXFaekZQVjBaclRtMVdhVTlIUm0xTmVsWnRDazB5UlRGWmVrcHFUVUozUjBOcGMwZEJVVkZDWnpjNGQwRlJVVVZFYTA1NVdsZEdNRnBUUWxOYVYzaHNXVmhPYkUxRFZVZERhWE5IUVZGUlFtYzNPSGNLUVZGVlJVWXlVbkJqTTFKNVlqSjRiR016VFhaaVdGWjZZa014YTJWWE5XaGlWMnhxVFVJd1IwTnBjMGRCVVZGQ1p6YzRkMEZSV1VWRU0wcHNXbTVOZGdwaFIxWm9Xa2hOZG1KWFJuQmlha05DYVZGWlMwdDNXVUpDUVVoWFpWRkpSVUZuVWpkQ1NHdEJaSGRDTVVGQmFHZHJka0Z2VlhZNWIxSmtTRkpoZVdWRkNtNUZWbTVIUzNkWFVHTk5OREJ0TTIxMlEwbEhUbTA1ZVVGQlFVSm5NRkZyU2xodlFVRkJVVVJCUlZsM1VrRkpaMEpUYTB4SU0wMW5hekozVGpscFRuRUtibXBxVjNOQ2VrOW1ZMFZvYWxsU1VIZGpkelpZVVhSSVVtbFpRMGxHUW1sM1VWWlVLMFZLTW1VM2FGVmlkbWRMYW1Od2FURndPV05DVm14TGVHTnZTd28wTm1odlZXSktjMDFCYjBkRFEzRkhVMDAwT1VKQlRVUkJNbWRCVFVkVlEwMURTbTF2UTNwellTOHhhQzlFVTBKRE1WQm5NVWhSYWswMEswTnpXWEppQ2xRMVEzRmpXR3hrYmxrelVYZEplWHBrYVZkQ1VXSm1SMGN4V0c1d1dsTXlNM2RKZUVGT09WWmlZamRwVkRCUVREUmlkSGQxYzBONU5tSk1OR2RqVTFnS01XWlhaMEk1THpjeWVVRTRWMXBKU0RCVU0zaFJTSFJrTDB3eVpGUkZZMDVhZG1VNVdXYzlQUW90TFMwdExVVk9SQ0JEUlZKVVNVWkpRMEZVUlMwdExTMHRDZz09In19fX0=",
          "integratedTime": 1663295583,
          "logIndex": 3512531,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/musl-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3065024265",
      "sha": "90e75203a703792dc246859ad6eb8af35f3a5c2c"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

