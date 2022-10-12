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
| `latest` | `sha256:c26af3fc0b18e76e8306dfc71740b95816b3902ede57111138bf671da472cc70`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c26af3fc0b18e76e8306dfc71740b95816b3902ede57111138bf671da472cc70) | `amd64` |



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
        "docker-manifest-digest": "sha256:c26af3fc0b18e76e8306dfc71740b95816b3902ede57111138bf671da472cc70"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "068837cbb0d071d07b02efdaf5cc7c8a3a5ef579",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/wolfi-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCbT8A/uvbg+R1qtnhxTfK9NcJ19+WBzXMkm0CzQmnMLgIhAL4qNaGEnRTiieYjmNIfKo4xW3jI7mIF+XtnTTnSSv0L",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJkYzdlZDQyNTBhYTdhNTQwNDkzMmI3Yzk3NDMyODFjMDBlNTIyNTQ0MTdkNGNhNzRkZmEzMzJlN2E0N2E2YTUyIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJRkZ3TCtrQzJySk9Rd2F4bDBDOEgyUGsxNEdrY1VFaGtrL1NKWkphenFVZUFpRUF6WElubklaOXlUNk1ENnN1bDdubVN3QURSa0lrSm9YUlpMRkx5UHl0NEdZPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpSRU5EUVhwWFowRjNTVUpCWjBsVlRGb3hNamx6V1VOSUwxUXZkMGRGUm5CbVNIQnVPV2hSYm5CemQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhsTlZHdDVUVVJOZVZkb1kwNU5ha2w0VFVSRmVVMVVhM3BOUkUxNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZMU0hsaE9HODBkR3hKTkU1RmFUY3dabkJHWlRGMFUxTktiSEZCWjNoWWEzTnRlQ3NLWlhaVFNsSlNaREpZTVVJck5EVTVUbEk1ZUVWVWRGa3lSV0pQWjFaYVdFMXVWMWx5TVdKT2NsRnVTbXRMWkVscmFtRlBRMEZzVVhkblowcFJUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZHVG1oa0NuVTFWMlZSTDFabVdEYzNWeXQ1YmxobGQzaG9ibTFOZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKQldVUldVakJTUVZGSUwwSkhTWGRaU1ZwbFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6WkhaaVIxcHdURmRLYUdNeVZYWk1iV1J3WkVkb01WbHBPVE5pTTBweVdtMTRkbVF6VFhaamJWWnpXbGRHZWxwVE5UVlpWekZ6Q2xGSVNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcEJOVUpuYjNKQ1owVkZRVmxQTDAxQlJVSkNRM1J2WkVoU2QyTjZiM1pNTTFKMllUSldkVXh0Um1vS1pFZHNkbUp1VFhWYU1td3dZVWhXYVdSWVRteGpiVTUyWW01U2JHSnVVWFZaTWpsMFRVSkpSME5wYzBkQlVWRkNaemM0ZDBGUlNVVkNTRUl4WXpKbmR3cE9aMWxMUzNkWlFrSkJSMFIyZWtGQ1FYZFJiMDFFV1RSUFJFMHpXVEpLYVUxSFVYZE9la1pyVFVSa2FVMUVTbXhhYlZKb1dtcFdhbGw2WkdwUFIwVjZDbGxVVm14YWFsVXpUMVJCWTBKbmIzSkNaMFZGUVZsUEwwMUJSVVZDUVRWRVkyMVdhR1JIVldkVmJWWnpXbGRHZWxwVVFYRkNaMjl5UW1kRlJVRlpUeThLVFVGRlJrSkNlR3BoUjBad1ltMWtNVmxZU210TVYyeDBXVmRrYkdONU9UTmlNbmh0WVZNeGFWbFlUbXhOUWpCSFEybHpSMEZSVVVKbk56aDNRVkZaUlFwRU0wcHNXbTVOZG1GSFZtaGFTRTEyWWxkR2NHSnFRMEpwWjFsTFMzZFpRa0pCU0ZkbFVVbEZRV2RTT0VKSWIwRmxRVUl5UVVGb1oydDJRVzlWZGpsdkNsSmtTRkpoZVdWRmJrVldia2RMZDFkUVkwMDBNRzB6YlhaRFNVZE9iVGw1UVVGQlFtYzRNbXRNVG10QlFVRlJSRUZGWTNkU1VVbG5SMlEwUjB0SWVGTUtUVmMyUXpSalFUVnRiRWREV25CdFdtUlVVMHAxTVhwTU9WSmxNSGRpYzA1RU0ydERTVkZEVVZFMVV6bFBTR3d3WTJzcmRqVmxWWFJsV1ZKbVQweFVUZ28wTHpoSldUQlpLMlpxVEUxNmNtWlJabXBCUzBKblozRm9hMnBQVUZGUlJFRjNUbkJCUkVKdFFXcEZRV2RVT0RKV05URk9NekZLYVc5eU4wWXZkbFJrQ25nM2FUUmxMMHhYV0ZCbVFXSjBkMWRRY2twSlJtOVJiRGxDZUdGTlFXNTZUVVJ1VXpWeU9HVm5XbFZWUVdwRlFURnJZMHhyVnl0alpHRjNaSFVyZUc4S2RHTkljMHRxUlhoV2JUTlpWMDlvYTFSeVdraHlSR2t4Y1hvMlRHMWxiSGt5TlRRMk9FbHpLMUpzYjA5WFN6bFVDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1665602436,
          "logIndex": 4980850,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/wolfi-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/wolfi-base",
      "githubWorkflowSha": "068837cbb0d071d07b02efdaf5cc7c8a3a5ef579",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3237294199",
      "sha": "068837cbb0d071d07b02efdaf5cc7c8a3a5ef579"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

