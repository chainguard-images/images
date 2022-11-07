# alpine-base

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/alpine-base/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/alpine-base/actions/workflows/release.yaml)

Alpine base image built with [apko](https://github.com/chainguard-dev/apko). Uses packages from the [Alpine distribution](https://www.alpinelinux.org/).

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/alpine-base:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:d0359007762f217f01530ec94205eb60acf163162f0fda37151c05062bfc0061`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:d0359007762f217f01530ec94205eb60acf163162f0fda37151c05062bfc0061) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


## Usage

```
docker run cgr.dev/chainguard/alpine-base echo "hello"
```

See the [examples/](./examples/) directory for how
to use this as a base image.


## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/alpine-base:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/alpine-base:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/alpine-base"
      },
      "image": {
        "docker-manifest-digest": "sha256:d0359007762f217f01530ec94205eb60acf163162f0fda37151c05062bfc0061"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "0cfbdf54a0112ec5e8658f0d1518b2e10ce3a426",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/alpine-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCB3kQIz00cDzjEYi2NjoSVTo/+621CPNEfSIyLh97RjAIhAPO09IbUqvRuKRHJ96y0xPw9UMkdbOYGkJQuR1d8d4c8",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIzYTQ5OTM4Zjc4ZmEzNmE3NGE1OGYwOWMzYmQwZGUxM2MwMzJjMDdkOTg4MzhkMWUxY2U3NzJhNmFhM2I1YTIxIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUR1VzlUUUdHRkdKbERvT2kyRGkxQlR4ZllsL0FtcGloR1orUEtXSWduU3BBSWdSUXkzdjJubFFueE9yT2RHZUcxM0ZScUp6U2VscUxRbXQza09PYm1uTlhzPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBSRU5EUVhweFowRjNTVUpCWjBsVlZVOXRaVFZyYURscE9XdHpXRm9yYlM5RlJGaEJibTlaWjJ0SmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVROTlJFVjNUV3BSTUZkb1kwNU5ha2w0VFZSQk0wMUVSWGhOYWxFd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZFTDNCeE0xaEpaUzlVTUZrelFYbFRXVEl3Y1hoclRYUlVXbTQ0YkhZck4ySkhka2dLTkRGRlpDdDRWVmt6ZW5SdUwxVjJNV3hRUzJwSE5GRlRVV3R5WldwU1FsZDJlbFF4VUZaQ1drZDZTbEZMYUdOQ1ZEWlBRMEZzYTNkblowcFdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZDVlRWcUNrNUdaSGhpV0RKRlRWaHFOMEZ3TVhGTVpXRXhPRUpOZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Um5OalIyeDFXbE14YVZsWVRteE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyZDNXVEphYVZwSFdURk9SMFYzVFZSRmVWcFhUVEZhVkdjeVRsUm9iVTFIVVhoT1ZFVTBDbGxxU214TlZFSnFXbFJPYUU1RVNUSk5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKR2MyTkhiSFZhVXpGcFdWaE9iRTFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxSV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUkzUWtoclFXUjNRakZCVGpBNUNrMUhja2Q0ZUVWNVdYaHJaVWhLYkc1T2QwdHBVMncyTkROcWVYUXZOR1ZMWTI5QmRrdGxOazlCUVVGQ2FFVXJZMlJIVVVGQlFWRkVRVVZaZDFKQlNXY0tTbk40V2taSVZ6QnBkWFozVERKV1RuQnFZaTlhVFZWMFVtTmhMMVkzZFVkYWF6TnJaRGhSVGxWRGEwTkpRVmhLZERremFubEpSbmRGTmpaTGJ6YzVTZ3BPVjFsRmFGZDNhbmQxVEhsWmJFUlZSRnBQY2l0d1JDOU5RVzlIUTBOeFIxTk5ORGxDUVUxRVFUSm5RVTFIVlVOTlEzRlZTRUZTTWs5bFkwUlNkWFJ3Q2xsSldUQjBhVGhrT0RCdlFUZE5RMU5WS3paTUszTjFTV2RVYkhFMVVXWnFUbkkwU2xGRmJsaFZVWEZqWm1SWVFubG5TWGhCVFZSQ1RrMXJaSG81T1dVS04wNURMMWx6SzNaUU0yWm9RMll2V1dGU1FsUndlVGR2VWxjMFUxUTNjSE5qUms1c01HUkhhelUzVTNrMFdrWnBXVFoyV0dablBUMEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1667782996,
          "logIndex": 6649964,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/alpine-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/alpine-base",
      "githubWorkflowSha": "0cfbdf54a0112ec5e8658f0d1518b2e10ce3a426",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3406788910",
      "sha": "0cfbdf54a0112ec5e8658f0d1518b2e10ce3a426"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

