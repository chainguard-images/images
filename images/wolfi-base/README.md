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
| `latest` | `sha256:4fd09c2addaebcf4289aeef1e95a035aeea06a4adfdf1583f3526d7403e4d9f6`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:4fd09c2addaebcf4289aeef1e95a035aeea06a4adfdf1583f3526d7403e4d9f6) | `amd64` |



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
        "docker-manifest-digest": "sha256:4fd09c2addaebcf4289aeef1e95a035aeea06a4adfdf1583f3526d7403e4d9f6"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "24c849595706286df0abd81101d131698137a687",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/wolfi-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQD68237P3NFjiseG+dObZWa7/oAVPW8RKlJoZfcDwPcsAIgXy3GMflcp7L9ZszJ4VloRXF3lyD0hUmj401bgDKuGfw=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI5ODdjOTA5Y2IyNDc5ZDIzMmZiN2U3NTRiZjY2OTc1NTVlNDk1YjZiOTA4ZDNlMGQ4NGY1MDFlMDczN2Y4NWY0In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNEZ0NYeUI5VmtxRGNON2IrckNDRGhvOSt4YzNFdUZ6U2ZjSDZmNUt0TTFRSWhBT0dCZnpxalZsYWtMRTQ2bUwydFNlM3Yzc3krYnJKYkx2UzRrMHZWWWZBVSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBWRU5EUVhweFowRjNTVUpCWjBsVlN6bFFaazQxY0dsc1NHSXJiMDgzWTBkSU56SklkRGMyWjJ0TmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRCTlJFVXdUWHBGTTFkb1kwNU5ha2w0VFZSQk1FMUVSVEZOZWtVelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZOUzI1RlNqVnBaM3BhYlhCMlExaExNMk53UzBwNVVFVlFTVkpZY3pjeFdTOTFZVmdLUkdkTU9WcHJNR0ZtVTJ0dlNFSXZNalpMZFdkRk5HWnpTRGRLYTNwdU1FWTJSaTkzV2twM2JUTXJaa3BCT1drME9UWlBRMEZzYTNkblowcFdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZXWTBNeUNsbGpiVTFJUmxKQ1VqSkRaMnhzU1U5cFdEQkhUM0kwZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKQldVUldVakJTUVZGSUwwSkhTWGRaU1ZwbFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6WkhaaVIxcHdURmRLYUdNeVZYWk1iV1J3WkVkb01WbHBPVE5pTTBweVdtMTRkbVF6VFhaamJWWnpXbGRHZWxwVE5UVlpWekZ6Q2xGSVNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcEJOVUpuYjNKQ1owVkZRVmxQTDAxQlJVSkNRM1J2WkVoU2QyTjZiM1pNTTFKMllUSldkVXh0Um1vS1pFZHNkbUp1VFhWYU1td3dZVWhXYVdSWVRteGpiVTUyWW01U2JHSnVVWFZaTWpsMFRVSlpSME5wYzBkQlVWRkNaemM0ZDBGUlNVVkRTRTVxWVVkV2F3cGtWM2hzVFVSWlIwTnBjMGRCVVZGQ1p6YzRkMEZSVFVWTFJFa3dXWHBuTUU5VVZUVk9WR04zVG1wSk5FNXRVbTFOUjBacFdrUm5lRTFVUVhoYVJFVjZDazFVV1RWUFJFVjZUakpGTWs5RVkzZElRVmxMUzNkWlFrSkJSMFIyZWtGQ1FrRlJUMUV6U214WldGSnNTVVpLYkdKSFZtaGpNbFYzUzJkWlMwdDNXVUlLUWtGSFJIWjZRVUpDVVZGaldUSm9hR0ZYTlc1a1YwWjVXa014Y0dKWFJtNWFXRTEyWkRJNWMxcHRhM1JaYlVaNldsUkJaRUpuYjNKQ1owVkZRVmxQTHdwTlFVVkhRa0U1ZVZwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1oxbHpSME5wYzBkQlVWRkNNVzVyUTBKQlNVVm1VVkkzUVVoclFXUjNSR1JRVkVKeENuaHpZMUpOYlUxYVNHaDVXbHA2WTBOdmEzQmxkVTQwT0hKbUswaHBia3RCVEhsdWRXcG5RVUZCV1ZKQlZHOUVSVUZCUVVWQmQwSkpUVVZaUTBsUlEyVUtXU3RFUjBsck1rdHlXa05FTjJrd0sycE1NVmsyZGpCWGVGZFpkbEkwZFRONVIyY3paRGxzVTNoblNXaEJTVkZvVkRWWGNFSk5TbWcxVERaWFVGWTBOd3B1UWpSU1FYSjRUalZFZFVoelJIWXljMmxDTjNaVFdHeE5RVzlIUTBOeFIxTk5ORGxDUVUxRVFUSnJRVTFIV1VOTlVVTjJjMnBSWTNaSFRrOUhSM2RIQ2toak5IVmhaVWxMVW1ObGNFSnpSa2N4VlVOQlRrSmxNamhCWTBvNU1GWlJRbkZaVVZBNE4zQkRUek5LY0ZaVUwwVTRkME5OVVVOYVZ6WnlZamRLUW5rS2EzYzRVVXB3WVdwUFExSkVjRmxXVFc1NlZFeDJjRFJVYkdjek9Fa3ZWM1poUzA5UVRYVndZazByVkhaYVFXcHFZaTlZUm1WM01EMEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1667526200,
          "logIndex": 6460208,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/wolfi-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/wolfi-base",
      "githubWorkflowSha": "24c849595706286df0abd81101d131698137a687",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3390611698",
      "sha": "24c849595706286df0abd81101d131698137a687"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

