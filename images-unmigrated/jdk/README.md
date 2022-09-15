# jdk

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/distroless/readme-generator
-->

[![CI status](https://github.com/distroless/jdk/actions/workflows/release.yaml/badge.svg)](https://github.com/distroless/jdk/actions/workflows/release.yaml)

WORK IN PROGRESS

## Get It!

The image is available on `ghcr.io`:

```
docker pull ghcr.io/distroless/jdk:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:8e6fd3bf1a6d43103fe05b0ea2009cb852c29afac2b224394fce68690460f809`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:8e6fd3bf1a6d43103fe05b0ea2009cb852c29afac2b224394fce68690460f809) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |



## Signing

All distroless images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify ghcr.io/distroless/jdk:latest | jq
```

Output:
```
Verification for ghcr.io/distroless/jdk:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/distroless/jdk"
      },
      "image": {
        "docker-manifest-digest": "sha256:8e6fd3bf1a6d43103fe05b0ea2009cb852c29afac2b224394fce68690460f809"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "9bb50e43f10d11415391ab18b3a8cab468b6a64e",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/jdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIACdUm21cYo4Htlw5R0c0FaxLK5McKaHhNLyvhUn+97bAiEAiRHSsZAC/1ZO2xCw6bLDUJQQPFDE+f8T1y8LWSLvG2s=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIzMTJiYmZkOGJmY2Y1NDcyYjc4OTU4MTliNThjNzEzNTNiMDVkNjIwNWQwYzNhZjJkMmU5MGY3YjI4ZjA4ODNjIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJSHlLSVJMdEQ4MHc3d1o0cG1sMGdHd2xYeC9NSEE4T2V0MVNHTlZveGRVUUFpQTNoWUdab3c4Y29yRmtoUjFZZXZDZSt0TmJTakxhbGZWQ1dTK2tKUXRxUmc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnNSRU5EUVhodFowRjNTVUpCWjBsVlZHZFVjVkUyWWxKb1pYSjRRVEJzVUhrM2JHZFNWR3AzVWpkemQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRGTlZGVjVUbXBWTUZkb1kwNU5ha2wzVDFSRk1VMVVWWHBPYWxVd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZZV21wbGJWWlllamxMTW1ad1JEVkdaMWxyVEZaTGJHZEhVV0l5WjA5TVQwbEZWV2dLY1hJM1ZEbDRhRk4xUmtkVFMwbDBWekJ5SzBsTVJreEZiMWw1WTB0dWFteEhkRWhUVjNaa2QzWlJVbkJ1UVRGVk5YRlBRMEZxWjNkblowa3dUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZSTlcwNENrcFdiMnd5V1RKRWQxTlBiMkl4Y0ZSVFlXYzBiV3c0ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFobldVUldVakJTUVZGSUwwSkdVWGRWYjFwUllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BoYlZKeVRIazFibUZZVW05a1YwbDJaREk1ZVdFeVduTmlNMlI2VEROS2JHSkhWbWhqTWxWMVpWZEdkR0pGUW5sYVYxcDZUREpvYkZsWFVucE1NakZvQ21GWE5IZFBVVmxMUzNkWlFrSkJSMFIyZWtGQ1FWRlJjbUZJVWpCalNFMDJUSGs1TUdJeWRHeGlhVFZvV1ROU2NHSXlOWHBNYldSd1pFZG9NVmx1Vm5vS1dsaEthbUl5TlRCYVZ6VXdURzFPZG1KVVFWTkNaMjl5UW1kRlJVRlpUeTlOUVVWRFFrRlNkMlJZVG05TlJGbEhRMmx6UjBGUlVVSm5OemgzUVZGTlJRcExSR3hwV1dwVmQxcFVVWHBhYWtWM1drUkZlRTVFUlRGTmVtdDRXVmRKZUU5SFNYcFpWR2hxV1ZkSk1FNXFhR2xPYlVVeVRrZFZkMGhCV1V0TGQxbENDa0pCUjBSMmVrRkNRa0ZSVDFFelNteFpXRkpzU1VaS2JHSkhWbWhqTWxWM1NFRlpTMHQzV1VKQ1FVZEVkbnBCUWtKUlVVOWFSMng2WkVoS2RtSkhWbm9LWTNrNWNWcEhjM2RJVVZsTFMzZFpRa0pCUjBSMmVrRkNRbWRSVUdOdFZtMWplVGx2V2xkR2EyTjVPWFJaVjJ4MVRVbEhTMEpuYjNKQ1owVkZRV1JhTlFwQloxRkRRa2gzUldWblFqUkJTRmxCUTBkRFV6aERhRk12TW1oR01HUkdja28wVTJOU1YyTlpja0paT1hkNmFsTmlaV0U0U1dkWk1tSXpTVUZCUVVkRUNsRmpTMVEwWjBGQlFrRk5RVko2UWtaQmFVSlJTM3ByY0VoRk9HOVJWMHA2SzNVdlZUVTVZV2xWTUdOV1ozSjJjRmRxVVVRd2FIcEpNR2xNWmpkM1NXZ0tRVXBNVFdabU1IUmhNbWx4UVROaFkxWjVRa3hhVEc1RlJUbEpkMEozU2psNGFsZFNaWEUyYzNJeGMzQk5RVzlIUTBOeFIxTk5ORGxDUVUxRVFUSnJRUXBOUjFsRFRWRkVWelJDUTJkclJsaDRUVTUzU1dkdmVHVmtjemhvU0RSdE5uZHRZa0ZYVVhnNFRVdExUWEpVVTIxelJUVk1aMWN6V1VSR2VrbEhhMVZ3Q21GT1pUZHdhVGhEVFZGRVNrRnNhamc1TmtkdGVFRTBNbEZ2VW10Q1VuZDViaXRvYmpab1F6SkdZek52YzA5VlEyUktVVWd6V0hJeFYySm9UazFLUlVFS2VuSkpMM3BDT1dwNGQyczlDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1663255635,
          "logIndex": 3509578,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/jdk/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3061698592",
      "sha": "9bb50e43f10d11415391ab18b3a8cab468b6a64e"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

