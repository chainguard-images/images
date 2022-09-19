# hello-world

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/distroless/readme-generator
-->

[![CI status](https://github.com/distroless/hello-world/actions/workflows/release.yaml/badge.svg)](https://github.com/distroless/hello-world/actions/workflows/release.yaml)

Hello, world!

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/hello-world:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:df99a60bc7947575d33fa2a2b65e6c14a0bb6cce0720a16d52d81e9458bcdb99`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:df99a60bc7947575d33fa2a2b65e6c14a0bb6cce0720a16d52d81e9458bcdb99) | `amd64` `arm64` `armv7` |



## Signing

All distroless images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/hello-world:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/hello-world:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/distroless/hello-world"
      },
      "image": {
        "docker-manifest-digest": "sha256:df99a60bc7947575d33fa2a2b65e6c14a0bb6cce0720a16d52d81e9458bcdb99"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "6f3e21a97b45b0abb803b2e0401dbd29a4277974",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/hello-world",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCICpstAqPZPURRnolbdFJEF6FIQtafVhpwSZEfuai9GbSAiEA9h5cdNU1aGfRQrT50dAScNnBHn2SvN9kAFBgo7vZ9d4=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIyN2IxYjM5NDA4ZTJjY2E0YmE3Yzc0NTliZTA5NDEzOWI0MzNhMWUwZDg5YjFhMTJjOTJmNmYyNDg5NGUyZjNiIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURGV0FQcVBCRXU4aWlMR3laWWEyOG8rMnhpbVdYaXlEZkRFSEkvWUUrRU53SWhBSTkydEJmYnFBOFJ4NzV4eTM0VksxUlRmVDF2d3ArYWNVRXM3cnl5eHNxWiIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhWRU5EUVhrMlowRjNTVUpCWjBsVlJqaHpORTFXVFhKTWRsaEJRa1J0YUhjek56ZDZZM0kyTjBsM2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRWTlJFVjRUMFJCTUZkb1kwNU5ha2wzVDFSRk5VMUVSWGxQUkVFd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVU1VERnM1JEbDBla05wZGxoRlFXSndibXhYT0U5V1NWRTVSa3hRTUZkdVdEQmFOemtLWVdNNWEyYzNVMjkyU25OcGNHazVaVlJ6Ym1ZeGJVVkRja2wzSzJsYUwxbHNSR05HT1VkM2FXSXhhbGRQTUN0U2NUWlBRMEZyTUhkblowcEtUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlYzT0hSR0NsQkNTbmsxVTJOVWFWWjVVV0ZCSzIwdlpVTnFRMDFSZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwbldVUldVakJTUVZGSUwwSkdkM2RYYjFwWllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BoUjFaellrYzRkR1F5T1hsaVIxRjJURzFrY0dSSGFERlphVGt6WWpOS2NscHRlSFprTTAxMlkyMVdjMXBYUm5wYVV6VTFXVmN4YzFGSVNteGFiazEyQ21GSFZtaGFTRTEyWWxkR2NHSnFRVFZDWjI5eVFtZEZSVUZaVHk5TlFVVkNRa04wYjJSSVVuZGplbTkyVEROU2RtRXlWblZNYlVacVpFZHNkbUp1VFhVS1dqSnNNR0ZJVm1sa1dFNXNZMjFPZG1KdVVteGlibEYxV1RJNWRFMUNXVWREYVhOSFFWRlJRbWMzT0hkQlVVbEZRMGhPYW1GSFZtdGtWM2hzVFVSWlJ3cERhWE5IUVZGUlFtYzNPSGRCVVUxRlMwUmFiVTB5VlhsTlYwVTFUakpKTUU1WFNYZFpWMHBwVDBSQmVsbHFTbXhOUkZGM1RWZFNhVnBFU1RWWlZGRjVDazU2WXpWT2VsRjNTRUZaUzB0M1dVSkNRVWRFZG5wQlFrSkJVVTlSTTBwc1dWaFNiRWxHU214aVIxWm9ZekpWZDBwQldVdExkMWxDUWtGSFJIWjZRVUlLUWxGUlYxcEhiSHBrU0VwMllrZFdlbU41T1c5YVYzaHpZbmt4TTJJelNuTmFSRUZrUW1kdmNrSm5SVVZCV1U4dlRVRkZSMEpCT1hsYVYxcDZUREpvYkFwWlYxSjZUREl4YUdGWE5IZG5XWE5IUTJselIwRlJVVUl4Ym10RFFrRkpSV1pSVWpkQlNHdEJaSGRCU1ZsS1RIZExSa3d2WVVWWVVqQlhjMjVvU25oR0NscDRhWE5HYWpORVQwNUtkRFZ5ZDJsQ2FscDJZMmRCUVVGWlRsUlZkVTF3UVVGQlJVRjNRa2xOUlZsRFNWRkVZV1Z1T0VOdVpEVmhlbXBPZEZVeFYwSUtOR2szWlVWS2RFc3hUbXRPY1dSTWJXUlZUaTlDSzBZeVZIZEphRUZOUkZaUWVHRkhUMVpFU1c5TVpsaEZZMU5LYjJWRlZ6a3ZZelpxUmtOWWVsTTFSUXBIVUVsM1pFRlRWazFCYjBkRFEzRkhVMDAwT1VKQlRVUkJNbXRCVFVkWlEwMVJSRXBLV0dwSVRFaEtjRFZCUVU1QlVWZHZjMk0zVm5sc1UwVnlVMnQ2Q2pka2NVZElXblp1Vm5CbE9VSlZORXcxY1doTWRETklWR0owUXpkeGQzZHpWRWQzUTAxUlEwOHZiamhaTVROd01EUmxMemN4V0RGUVlXdGhZMFl3TURVS1MwdHhkMEp4WlROQkwyMHdjMUpQTkdnM016QlBMM3BCT0VkdVdDOTFiVTVQU0RCRWNHZEJQUW90TFMwdExVVk9SQ0JEUlZKVVNVWkpRMEZVUlMwdExTMHRDZz09In19fX0=",
          "integratedTime": 1663550292,
          "logIndex": 3531238,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/hello-world/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3079335450",
      "sha": "6f3e21a97b45b0abb803b2e0401dbd29a4277974"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

