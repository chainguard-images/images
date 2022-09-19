# glibc-dynamic

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/distroless/readme-generator
-->

[![CI status](https://github.com/distroless/glibc-dynamic/actions/workflows/release.yaml/badge.svg)](https://github.com/distroless/glibc-dynamic/actions/workflows/release.yaml)

Base image with just enough to run arbitrary glibc binaries.<br/><br/>This image is meant to be used as just a base image only. It does not contain any programs that can be run, other than `/sbin/ldconfig`.<br/><br/>You must bring your own artifacts to use this image, e.g. with a Docker multi-stage build. If you want locale support other than `C.UTF-8`, you must bring your own locale data as well. This may change in the future based on user feedback.<br/><br/>See also [musl-dynamic](https://github.com/distroless/musl-dynamic) which is an equivalent image for running dynamically-linked musl binaries.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/glibc-dynamic:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:f2203a550c14ec547a9483219e769150fbba11c7f31ce295c7b0412b139285ee`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:f2203a550c14ec547a9483219e769150fbba11c7f31ce295c7b0412b139285ee) | `amd64` |



## Signing

All distroless images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/glibc-dynamic:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/glibc-dynamic:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/distroless/glibc-dynamic"
      },
      "image": {
        "docker-manifest-digest": "sha256:f2203a550c14ec547a9483219e769150fbba11c7f31ce295c7b0412b139285ee"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "95dda92156661666d99c1236102b748077571d26",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/glibc-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDXbMGyZjEbVau2ifmIjcB6IHa1IVXKWl14ns5USlNergIgK+IDwRYo+AydqfwPjc/pAc/OZSXI+XkmsSAx/5LWnVk=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI1YzYwYzg5MDYyYTQ2MDU4ZWJjYzhhNzcyYmVhMzdlMDZhZmQ2NDA2OTAyZGM1MThkYWY5NDIyNGE3OGVhNzRlIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQ1U2RUZYenQyQ2FBYnVJbkEwamtNbDhlcVdUNnZkeUpIZVQ1czlMNHVQRUFpQTJSQzIyNFRkUHNVV2pkaVd0bE91QWhMMTFKc0JzNzdOSDdRUnZOamExMFE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhla05EUVhwRFowRjNTVUpCWjBsVlNEQXJiRFZsY1d4c1UxTkxjVlF2YjBVNE5tTnRjSGhLZHpWTmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRWTlJFa3hUVlJCTTFkb1kwNU5ha2wzVDFSRk5VMUVUWGROVkVFelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZHY25GT01XSjRPRlJwUW1SbVR6WjVVQ3RTYTFWRmFYSnpVemR5ZUhndlpreGFSSFFLUkZSRWNGWnphMEpwYzJkV01HRnRaRmhyTWs1VWNWSjRlR2RpV0hSamFHMURkalY2VEZvMWFsUkJTelJDUzBzMFlVdFBRMEZyT0hkblowcE1UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZzUVdSaENuQlBUbVExYUdrNE1GVlpkVWMxU3pKQksxQlROekkwZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGQldVUldVakJTUVZGSUwwSkdOSGRZU1ZwaFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BhTW5od1dXMU5kRnBJYkhWWlZ6RndXWGs0ZFZveWJEQmhTRlpwVEROa2RtTnRkRzFpUnprelkzazVlVnBYZUd4WldFNXNURzVzYUdKWGVFRmpiVlp0Q21ONU9XOWFWMFpyWTNrNWRGbFhiSFZOUkd0SFEybHpSMEZSVVVKbk56aDNRVkZGUlVzeWFEQmtTRUo2VDJrNGRtUkhPWEphVnpSMVdWZE9NR0ZYT1hVS1kzazFibUZZVW05a1Ywb3hZekpXZVZreU9YVmtSMVoxWkVNMWFtSXlNSGRHWjFsTFMzZFpRa0pCUjBSMmVrRkNRV2RSU1dNeVRtOWFWMUl4WWtkVmR3cE9aMWxMUzNkWlFrSkJSMFIyZWtGQ1FYZFJiMDlVVm10YVIwVTFUV3BGTVU1cVdUSk5WRmt5VG0xUk5VOVhUWGhOYWsweVRWUkJlVmxxWXpCUFJFRXpDazU2VlROTlYxRjVUbXBCWTBKbmIzSkNaMFZGUVZsUEwwMUJSVVZDUVRWRVkyMVdhR1JIVldkVmJWWnpXbGRHZWxwVVFXMUNaMjl5UW1kRlJVRlpUeThLVFVGRlJrSkNhR3RoV0U0d1kyMDVjMXBZVG5wTU1tUnpZVmRLYWt4WFVqVmliVVowWVZkTmQwaFJXVXRMZDFsQ1FrRkhSSFo2UVVKQ1oxRlFZMjFXYlFwamVUbHZXbGRHYTJONU9YUlpWMngxVFVsSFNrSm5iM0pDWjBWRlFXUmFOVUZuVVVOQ1NITkZaVkZDTTBGSVZVRkRSME5UT0VOb1V5OHlhRVl3WkVaeUNrbzBVMk5TVjJOWmNrSlpPWGQ2YWxOaVpXRTRTV2RaTW1JelNVRkJRVWRFVlRablZHUjNRVUZDUVUxQlVtcENSVUZwUVM5VFRUWlVZMlpyU2taNGJtVUtOWFJCVFN0NVEwVnRURVYxWVdWaVVVRkRVbk51T1ZSRFpsbDNNVUYzU1dkYWJsWTFaa1pNT1dGQ05rSXZVVFJEYWt0U2JVNUdVblZaWTFSdGExbFhOd295ZWtaUmFreHdSa0pSVFhkRFoxbEpTMjlhU1hwcU1FVkJkMDFFWVZGQmQxcG5TWGhCVDJGeE0xbG9ZbVV5Wm5GbFZVMTFheTlrYlRCb1dEaE1TbTFoQ2xOc1pVc3lNemt3ZUdacVpuQnBRM1pwUWpKamVWQmhNbnBxVERkSFFYTlpkekYxWlhSblNYaEJTMHgzYldGaVVIQkdkbkUzZVZocWIySlVLM296WVRBS00zbG5VRk5vY2xFMlFtOVJTVVp4WVM5c05rc3hRWFJqUlM5NVNVdG1hbTFTT0dNelRUVlFlVkIzUFQwS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1663555870,
          "logIndex": 3531608,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/glibc-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3079623919",
      "sha": "95dda92156661666d99c1236102b748077571d26"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

