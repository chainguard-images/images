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
| `latest` | `sha256:9ed72163f05bd20ca1ec7d8ce34bac8a566f00b1dcf6a2884a66d5bb4c71a556`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:9ed72163f05bd20ca1ec7d8ce34bac8a566f00b1dcf6a2884a66d5bb4c71a556) | `amd64` |



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
        "docker-manifest-digest": "sha256:9ed72163f05bd20ca1ec7d8ce34bac8a566f00b1dcf6a2884a66d5bb4c71a556"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "f24f03e414c5821b1c6118a2b04e9ecc57964d70",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/wolfi-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIBasRaPnxpMIzwZe/XLJ2zBt4lazSvusprV9XvtphTIsAiAciRuEG+YAr68vFvk7JWXJ5EH2xFfjjF67VonZC/nsOg==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIwNWM3NWQwMzYzYjM5OTIzYTI0NjcwZGRlZGM5YWQ4NzZlMDFjMzAzNjY0NDk3MWU2NmM1NGNiODJlYTYzYjNkIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQUhOUFNWQUZDdTdtazEzZ3N2b2NUOTRqeUFnUkZpK2tmYit4bDR5Q1llQkFpQUVrbHZZaGhTNURNM3dFR3ZqeWk0aHVrMWdtU09TRDBFNDk3Vm5Vblo5OVE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlha05EUVhwWFowRjNTVUpCWjBsVlUxWTNaMHRCUWxwRWNFUnFlVWR2ZW1zdmFISkViV3BKUzBwQmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlROTlZGa3dUMFJOZDFkb1kwNU5ha2w0VFVSRk0wMVVXVEZQUkUxM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZxYTA5V2VrODBTRTFrUzI1RFQxQkZieTgzYmtoNmFIVkhUWFpOWlRST2JrcGlWSFVLWWs5clFtbGhNVGRqUmtWdlVqSmphSE5yTDFjMEsxbEdVMGxHWVdwWWRuTTNWMjl5VW1RMGIwNXVaa0owYVRSaWRqWlBRMEZzVVhkblowcFJUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ0U3prMkNtVTRTRGhCTkRSNFJEQk5VMHBNV0hNd1pHTlBURzF6ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKQldVUldVakJTUVZGSUwwSkhTWGRaU1ZwbFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6WkhaaVIxcHdURmRLYUdNeVZYWk1iV1J3WkVkb01WbHBPVE5pTTBweVdtMTRkbVF6VFhaamJWWnpXbGRHZWxwVE5UVlpWekZ6Q2xGSVNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcEJOVUpuYjNKQ1owVkZRVmxQTDAxQlJVSkNRM1J2WkVoU2QyTjZiM1pNTTFKMllUSldkVXh0Um1vS1pFZHNkbUp1VFhWYU1td3dZVWhXYVdSWVRteGpiVTUyWW01U2JHSnVVWFZaTWpsMFRVSkpSME5wYzBkQlVWRkNaemM0ZDBGUlNVVkNTRUl4WXpKbmR3cE9aMWxMUzNkWlFrSkJSMFIyZWtGQ1FYZFJiMXBxU1RCYWFrRjZXbFJSZUU1SFRURlBSRWw0V1dwR2FrNXFSWGhQUjBWNVdXcEJNRnBVYkd4Wk1rMHhDazU2YXpKT1IxRXpUVVJCWTBKbmIzSkNaMFZGUVZsUEwwMUJSVVZDUVRWRVkyMVdhR1JIVldkVmJWWnpXbGRHZWxwVVFYRkNaMjl5UW1kRlJVRlpUeThLVFVGRlJrSkNlR3BoUjBad1ltMWtNVmxZU210TVYyeDBXVmRrYkdONU9UTmlNbmh0WVZNeGFWbFlUbXhOUWpCSFEybHpSMEZSVVVKbk56aDNRVkZaUlFwRU0wcHNXbTVOZG1GSFZtaGFTRTEyWWxkR2NHSnFRMEpwWjFsTFMzZFpRa0pCU0ZkbFVVbEZRV2RTT0VKSWIwRmxRVUl5UVVGb1oydDJRVzlWZGpsdkNsSmtTRkpoZVdWRmJrVldia2RMZDFkUVkwMDBNRzB6YlhaRFNVZE9iVGw1UVVGQlFtY3JZbGw1U0VWQlFVRlJSRUZGWTNkU1VVbG9RVTByWjIxQldFWUtiRTl0VVZoYWIwTlVTRVY2TDFCYWVtaEpRMXBPVkhrNFprTk1VME5QZUhRNFpGcERRV2xCUmxFdmEweHFlVWd4UkVaeWJsWjVZamczUkVSSmJtMXlkZ3BEV0drMGVVVmpRMWxvZW1SNEwydEdjbFJCUzBKblozRm9hMnBQVUZGUlJFRjNUbTVCUkVKclFXcEJhR2sxUldjNFlVdDJTMGx0SzNSVmRVWm9iV1pJQ2tWaFEzaFNiMVZCTkRaWmFuZDVTbWg0VFVnd0x6bFZZVkpzZW1OSU9HVndNRkpMU25aNlRtVmlZV2REVFVJMlJFMVZUazR4V0ZGVWMxZDNNelZ1WWxnS2RVNUZURGQ1UW1odmRqRkZOR2d5WkRSV1J6aE1WVEk0ZVVneGFYTlZiM292VFRSNlZ6TlljR0ZhWVcwNGR6MDlDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1666025314,
          "logIndex": 5290703,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/wolfi-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/wolfi-base",
      "githubWorkflowSha": "f24f03e414c5821b1c6118a2b04e9ecc57964d70",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3267001178",
      "sha": "f24f03e414c5821b1c6118a2b04e9ecc57964d70"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

