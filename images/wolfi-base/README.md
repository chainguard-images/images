# wolfi-base

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/wolfi-base/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/wolfi-base/actions/workflows/release.yaml)

WORK IN PROGRESS

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/wolfi-base:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:df205c8f012f053f658dd6ebb7f2cd8d78ea4262028d0f14b137da04d6facc23`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:df205c8f012f053f658dd6ebb7f2cd8d78ea4262028d0f14b137da04d6facc23) | `amd64` |



## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/wolfi-base:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/wolfi-base:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/wolfi-base"
      },
      "image": {
        "docker-manifest-digest": "sha256:df205c8f012f053f658dd6ebb7f2cd8d78ea4262028d0f14b137da04d6facc23"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "ffe6b7819174e3f2d3e997ac8bef703e4063738e",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/wolfi-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDTg1iEe154hnNItc9i8Nu7j5bVhP1Akt+hCxpP5cMtzAIgWyQKwPDQPzADVXZZyas0Kv5qv/LZo1suf6lZSqVw1fQ=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJhODE5YWU1NWQ2ZjFjNTJmMTJiZjI3MjFhNGI2YTA4ODZhZTlmYWMyNGMwZmY2ZjMzOGRiM2I0NWFmNmEzMTI0In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQmR1MktySUJYYzBia0lOOFRqQUJES2liY1Nya3R1M3Q1SFNlcEoxMFdxWkFpQXFVL3h1eFgwVGtBaXhmOE9LUDBvK3lFNkxlY2Q5NFBoZEZXb2I4cE5MdUE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBWRU5EUVhweFowRjNTVUpCWjBsVlZtc3pURll5Tnk4NUszTkJjRmRFZDJWSFFVMXJSM0p1WVRScmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hwTlJFVXhUMVJSZDFkb1kwNU5ha2wzVDFSSmVrMUVTWGRQVkZGM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZyYW1KYWRVTnNhMkoyUWxjdmFVZHRSMHBMVldsaFQwUkJUblJNTVU5UGRtaFZjMWNLYWtWcFRuTm9aa1UxZEdvdmRpOVFURmQ1T1dwallUaHJkM2h2WkU5V1NYbzNVVU0xVm1kemNYWmxhemt3VDIxemRFdFBRMEZzYTNkblowcFdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ6V2xkVENqSlhhSEpWU25Vd1VVeDFOREJSZFZaQlNWTkNXbTAwZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKQldVUldVakJTUVZGSUwwSkhTWGRaU1ZwbFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6WkhaaVIxcHdURmRLYUdNeVZYWk1iV1J3WkVkb01WbHBPVE5pTTBweVdtMTRkbVF6VFhaamJWWnpXbGRHZWxwVE5UVlpWekZ6Q2xGSVNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcEJOVUpuYjNKQ1owVkZRVmxQTDAxQlJVSkNRM1J2WkVoU2QyTjZiM1pNTTFKMllUSldkVXh0Um1vS1pFZHNkbUp1VFhWYU1td3dZVWhXYVdSWVRteGpiVTUyWW01U2JHSnVVWFZaTWpsMFRVSlpSME5wYzBkQlVWRkNaemM0ZDBGUlNVVkRTRTVxWVVkV2F3cGtWM2hzVFVSWlIwTnBjMGRCVVZGQ1p6YzRkMEZSVFVWTFIxcHRXbFJhYVU1NlozaFBWRVV6VGtkVmVscHFTbXROTWxVMVQxUmthRmw2YUdsYVYxa3pDazFFVG14T1JFRXlUWHBqZWs5SFZYZElRVmxMUzNkWlFrSkJSMFIyZWtGQ1FrRlJUMUV6U214WldGSnNTVVpLYkdKSFZtaGpNbFYzUzJkWlMwdDNXVUlLUWtGSFJIWjZRVUpDVVZGaldUSm9hR0ZYTlc1a1YwWjVXa014Y0dKWFJtNWFXRTEyWkRJNWMxcHRhM1JaYlVaNldsUkJaRUpuYjNKQ1owVkZRVmxQTHdwTlFVVkhRa0U1ZVZwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1oxbHpSME5wYzBkQlVWRkNNVzVyUTBKQlNVVm1VVkkzUVVoclFXUjNRVWxaU2t4M0NrdEdUQzloUlZoU01GZHpibWhLZUVaYWVHbHpSbW96UkU5T1NuUTFjbmRwUW1wYWRtTm5RVUZCV1U1dlJXMXJjVUZCUVVWQmQwSkpUVVZaUTBsUlEyMEtZMVV3VGs0MWFIcGxNMkpPU0N0UVZXUk1UbTV3UVVSVmNVNXJibkozZWpoVVNIbGxNV2tyY25ablNXaEJTWFZNYTIxUVdqQnlabWRwWTJSNVEwTTBRZ3BXU0VwTVkyUlVRbVZ3YkRJeFltdzNTRk00UmpWemFUQk5RVzlIUTBOeFIxTk5ORGxDUVUxRVFUSnJRVTFIV1VOTlVVUkplVU42YjFFNFpHOXlOVVY2Q25OVGNscGtRMHhCU1ZBd1ppdFhVWEp1WW1oUmNWZzBNWEpPVkZneEszSTVlVkY1TmtkbVozUk1ZMGNyVW5VM1lqQXpVVU5OVVVOWmIwSlNSbWhYUTNjS2JUaEpiSFp2VG5weGJXVTJaazlGUW5CV2RFeGtTVGxXWkhselVFVklTV0ZaYVVKNGFVNWlZMXA0WWxkR1FVTkdkbWxGUTNwNll6MEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1663898388,
          "logIndex": 3782082,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/wolfi-base/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3109932381",
      "sha": "ffe6b7819174e3f2d3e997ac8bef703e4063738e"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

