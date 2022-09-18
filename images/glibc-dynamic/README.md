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
| `latest` | `sha256:3d74a20d1c3a37741ddad7f32220b42e22dec6a6b45f1640220b0757ad195667`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:3d74a20d1c3a37741ddad7f32220b42e22dec6a6b45f1640220b0757ad195667) | `amd64` |



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
        "docker-manifest-digest": "sha256:3d74a20d1c3a37741ddad7f32220b42e22dec6a6b45f1640220b0757ad195667"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "e9211bfc317b7f7b8b60806e3a64e1ebeca873dc",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/glibc-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCgreyOLNS4PCF4yOHHVIEl1lOk09guuhbE7s+vPOH98AIhAIWE41CPW4wwWv/fmxy0oCu9CO78n3ZKeDV9sisEe2/x",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJjNjM3ZTUxOGZjNTU1NTAwNzI2NGZkMDI1NTE4Mzg4MzYwOGFjMjk5MGRkN2QyOTQ3NTU3MjM3OGI1MDA4NDI5In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNVSGQrTWZWaDk5ZjFZcnJHOFhWQXQ1K3pMZzMxdGJEckVDVTZ1VDhsUTNBSWhBTXdlT0x1WUFRUFRvOWNhWkU1ejBMVU1sWExiUEtQSTUvQlAvUTVLUTRXWSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhha05EUVhwSFowRjNTVUpCWjBsVlJsSnZRVEZFTTNKUk5rSnpkRVl5VVVwTmVFUXpNVVp2VFU1cmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRSTlJFMTNUa1JOTkZkb1kwNU5ha2wzVDFSRk5FMUVUWGhPUkUwMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZIWTBGclEyTjRURVpRTWpZNU9URlpabHBsUVZBNVFXdHRWMUJLTDBWSGFuZzFiemtLVFRNNFlXUkljRTVUY3pZeFExcDNORkZrVjBaRVNIWTVieXRPTm1wMVRWSXdlbTFsYjNCUGNWa3ZWa1JXVVVVMFYwdFBRMEZzUVhkblowcE5UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZLWmpaRUNuTjRiMUZJTURBMmVGUlJNbTVqZWxKSGFtRkNNVUZaZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGQldVUldVakJTUVZGSUwwSkdOSGRZU1ZwaFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BhTW5od1dXMU5kRnBJYkhWWlZ6RndXWGs0ZFZveWJEQmhTRlpwVEROa2RtTnRkRzFpUnprelkzazVlVnBYZUd4WldFNXNURzVzYUdKWGVFRmpiVlp0Q21ONU9XOWFWMFpyWTNrNWRGbFhiSFZOUkd0SFEybHpSMEZSVVVKbk56aDNRVkZGUlVzeWFEQmtTRUo2VDJrNGRtUkhPWEphVnpSMVdWZE9NR0ZYT1hVS1kzazFibUZZVW05a1Ywb3hZekpXZVZreU9YVmtSMVoxWkVNMWFtSXlNSGRHWjFsTFMzZFpRa0pCUjBSMmVrRkNRV2RSU1dNeVRtOWFWMUl4WWtkVmR3cE9aMWxMUzNkWlFrSkJSMFIyZWtGQ1FYZFJiMXBVYTNsTlZFWnBXbTFOZWsxVVpHbE9NbGt6V1dwb2FVNXFRVFJOUkZwc1RUSkZNazVIVlhoYVYwcHNDbGt5UlRST2VrNXJXWHBCWTBKbmIzSkNaMFZGUVZsUEwwMUJSVVZDUVRWRVkyMVdhR1JIVldkVmJWWnpXbGRHZWxwVVFXMUNaMjl5UW1kRlJVRlpUeThLVFVGRlJrSkNhR3RoV0U0d1kyMDVjMXBZVG5wTU1tUnpZVmRLYWt4WFVqVmliVVowWVZkTmQwaFJXVXRMZDFsQ1FrRkhSSFo2UVVKQ1oxRlFZMjFXYlFwamVUbHZXbGRHYTJONU9YUlpWMngxVFVsSFMwSm5iM0pDWjBWRlFXUmFOVUZuVVVOQ1NIZEZaV2RDTkVGSVdVRkRSME5UT0VOb1V5OHlhRVl3WkVaeUNrbzBVMk5TVjJOWmNrSlpPWGQ2YWxOaVpXRTRTV2RaTW1JelNVRkJRVWRFVkc4MFZqTjNRVUZDUVUxQlVucENSa0ZwUVhVeU1WVnNVVmhvSzBkWksyZ0tkRGQxTm05SllraHZiVFp2VlRKSll6VkZRVnBzTVVkUlFTdEViWHBCU1doQlNURXdlSGRTUkd0VlRrZDZNMHR1Y1dwRE9UbGxiVUZNZVM5TldVcDRhd3B4VGtKUWExSnFaVkFyVVZSTlFXOUhRME54UjFOTk5EbENRVTFFUVRKalFVMUhVVU5OUjBOTmMzbDFUR3BNTjA1eVNEQjJaazl4UTJGNFRtTlFkV2wyQ2xsVlVXRlJVVWxCVVZwNmRTODBTbGhvV21NM01TOU9SRFV5Y1daNWMwWk1Wak51WVU1blNYZFhjMlZyU1VkbWMwVnJjblpZV25wb1owUnFZMVkzZFdNS2MzRjRiVFZ6YTNkcVRsWm1LMWRVWVU1T1V6VnpiQ3N3TVV0dmVIVmtMMUZoTkdGd1RqSnhVUW90TFMwdExVVk9SQ0JEUlZKVVNVWkpRMEZVUlMwdExTMHRDZz09In19fX0=",
          "integratedTime": 1663470282,
          "logIndex": 3528134,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/glibc-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3075644954",
      "sha": "e9211bfc317b7f7b8b60806e3a64e1ebeca873dc"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

