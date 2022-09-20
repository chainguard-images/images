# busybox

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/busybox/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/busybox/actions/workflows/release.yaml)

An image that contains busybox and musl, suitable for running any binaries that only have a dependency on musl.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/busybox:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `1.35.0-r25` `latest` | `sha256:7065578b2f02eb2996ea3c376d502c2689300b914a8ee145aa583f167ebd8aba`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:7065578b2f02eb2996ea3c376d502c2689300b914a8ee145aa583f167ebd8aba) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r2-glibc` | `sha256:ab543f0c4ad2386fd8f9969321fa3f7f37c6d7faf26048fca5130241b9c45425`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ab543f0c4ad2386fd8f9969321fa3f7f37c6d7faf26048fca5130241b9c45425) | `amd64` |



## Signing

All distroless images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/busybox:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/busybox:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/busybox"
      },
      "image": {
        "docker-manifest-digest": "sha256:7065578b2f02eb2996ea3c376d502c2689300b914a8ee145aa583f167ebd8aba"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "94b514610f97cd7ce787fefdaa3fe3282e22d894",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/busybox",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCCBIFdsC0ZB2NBplwOy1jMoUIjYSOKk13EygTzNIlJoAIhAMRbYLDsULTIL4ULqv5/tiKSocA3ykE4zvFHdv5yXpKS",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIxOTRiYzkyYTg4NWE3MWY1OWNmZDUzOTllODVhYjU3ZTMxY2ExMzc2Y2MzNDQ0YTg2Mjk1ZmEwMzBiNzljNmQ1In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJREthN2xTWVNBNFZOR29rdUU5SURsZG5yWFh6VTJHSlpjVUFWaVhGdk9jR0FpQllRaXNmNTBvSkdiMjI1VWRSQTNEOFgvV0ROTjlNYXhXUU1pbE9vckYxa2c9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnRla05EUVhsRFowRjNTVUpCWjBsVldrZzFZbkpUZFdJMlFqUjFiV2htWm0xMU1IbDFieko2T1dSSmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hkTlZGVjNUV3BWTkZkb1kwNU5ha2wzVDFSSmQwMVVWWGhOYWxVMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZCTjJOMVJWZExRbWsyVkRsalRTOVZhakF6TWl0T1dGSmxORkJqVUdJNFIxTXZXRzRLSzBwb2RVMW9kakZLY0M5UmJuWnNiMUphVUhodVoyRTRaRWhUUW1VM1pYTjJaWE00ZVhoMmVHeElOMHRPY0RaUWNVdFBRMEZxT0hkblowazNUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlY2YUZsekNrOVhkMUIyVkZaUmEyY3hWVVZLVms1T1VUSlVTV3h6ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFsbldVUldVakJTUVZGSUwwSkdaM2RXYjFwVllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BaYmxaNlpWZEtkbVZET0hWYU1td3dZVWhXYVV3elpIWmpiWFJ0WWtjNU0yTjVPWGxhVjNoc1dWaE9iRXh1YkdoaVYzaEJZMjFXYldONU9XOWFWMFpyQ21ONU9YUlpWMngxVFVSclIwTnBjMGRCVVZGQ1p6YzRkMEZSUlVWTE1tZ3daRWhDZWs5cE9IWmtSemx5V2xjMGRWbFhUakJoVnpsMVkzazFibUZZVW04S1pGZEtNV015Vm5sWk1qbDFaRWRXZFdSRE5XcGlNakIzUldkWlMwdDNXVUpDUVVkRWRucEJRa0ZuVVVWalNGWjZZVVJCTWtKbmIzSkNaMFZGUVZsUEx3cE5RVVZFUWtObk5VNUhTVEZOVkZFeVRWUkNiVTlVWkdwYVJHUnFXbFJqTkU0eVdteGFiVkpvV1ZST2JWcFVUWGxQUkVwc1RXcEthMDlFYXpCTlFuZEhDa05wYzBkQlVWRkNaemM0ZDBGUlVVVkVhMDU1V2xkR01GcFRRbE5hVjNoc1dWaE9iRTFEUVVkRGFYTkhRVkZSUW1jM09IZEJVVlZGUlcxU2NHTXpVbmtLWWpKNGJHTXpUWFpaYmxaNlpWZEtkbVZFUVdSQ1oyOXlRbWRGUlVGWlR5OU5RVVZIUWtFNWVWcFhXbnBNTW1oc1dWZFNla3d5TVdoaFZ6UjNaMWxyUndwRGFYTkhRVkZSUWpGdWEwTkNRVWxGWlhkU05VRklZMEZrVVVGSldVcE1kMHRHVEM5aFJWaFNNRmR6Ym1oS2VFWmFlR2x6Um1velJFOU9TblExY25kcENrSnFXblpqWjBGQlFWbE9ZbUpJYWxCQlFVRkZRWGRDUjAxRlVVTkpTRkJpTkc1Rk9XeGhZMlJJV1RaMWJUWktOR0k0TkcxbGVuSlJkM1JXWVRVck55OEtjV04wVVc5bFMxTkJhVUo2Vmt3dlVuUkZla3hrYWs1SlkyNDFZWFZsV21wT1JGVjBaMFJWVWxKVVFpdEJWVE5QTHpWRlRFaEVRVXRDWjJkeGFHdHFUd3BRVVZGRVFYZE9jRUZFUW0xQmFrVkJOVE12UVVjeWJYSjVaMnB3YW1WVmJIVkhMMjFUZG1ORFJFTjFabkF2ZDNNcmNuWnRjMncxZUdkclFXWXJNa2hFQ25kb2VWVllTbFFyT1VoUFZrMXJja2xCYWtWQmFrVmlRMHBVVVVkQmFtd3hPVFJuTTFOUVlXaDRVRTFMUjNaM1ZWTlllbXhvYjBKdlUzRlVaMEpPWkVrS2RqSkZOekUyVGxSd2NrNURlVTB4Ykc0M05sWUtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1663686226,
          "logIndex": 3612212,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/busybox/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3091196968",
      "sha": "94b514610f97cd7ce787fefdaa3fe3282e22d894"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

