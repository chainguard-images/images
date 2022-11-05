# jdk

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/jdk/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/jdk/actions/workflows/release.yaml)

WORK IN PROGRESS

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/jdk:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:f09ba6d26a97eca2e0e2b3c0be812a35ca20f3f84601225caaf1b383460ea3d8`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:f09ba6d26a97eca2e0e2b3c0be812a35ca20f3f84601225caaf1b383460ea3d8) |  |



## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/jdk:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/jdk:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/jdk"
      },
      "image": {
        "docker-manifest-digest": "sha256:f09ba6d26a97eca2e0e2b3c0be812a35ca20f3f84601225caaf1b383460ea3d8"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "fcf799590e30dca6a4e7d510f3048176b32bf9ce",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/jdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCGHYPxFaStL1T+q0ddXHyVKRn5uGfXr5naUIPAs5kV1wIgSBcpVFOm/MJs4EdjKLdi4QUENczy5HXTccZjJMLwFZI=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI3YTQ1MmEyOTI2M2JkNTVmMzViZWFlOWJhYjMwMmY5ZjRhZTZkMjE0YjMwNWMyYWQ1NzExNjRmM2E0YTgzYjJhIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNMRjNVdUZXWXB5RFpaSzNYY005cktnRGZJZTNNMTJCNmNNZXdQTS9XYkdnSWhBTkJ5MFlrRU9wTUY3bEpId2NSTmc1cmRvUnlETHJoS1pTR2V5Z0ZxSXNLLyIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndha05EUVhsNVowRjNTVUpCWjBsVlZFdDZOV3hpWlVSaFZVMXViMVJtVlhOTFRtSlJURTVJY0VkSmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRGTlJFVXhUWHBGZVZkb1kwNU5ha2w0VFZSQk1VMUVTWGROZWtWNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZwYkVONGRTdDVOakZPVEZKR1J5c3piVGxYTTBnMmJIQmFPVFl6ZGxOWlltb3dhR3dLTldGVU5YTndTV0ZhZGtkcFIzcDRTa3gyTW5wamRUQXJURVZqT1ZOSEswSlVkM0pQVVRGVlZtcG9MM05JTTNSdFMyRlBRMEZyYzNkblowcElUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZDZVZSckNqUTBNVTlTYlRJM1JIVlZTME5uZFZNNFlVVTNOMlJOZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Y0d0aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdldtMU9iVTU2YXpWT1ZHdDNXbFJOZDFwSFRtaE9iVVV3V2xSa2EwNVVSWGRhYWsxM1RrUm5lRTU2V21sTmVrcHBDbHBxYkdwYVZFRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1Y1ZwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIweENaMjl5UW1kRlJVRmtXalZCWjFGRFFrZ3dSV1YzUWpWQlNHTkJNMVF3ZDJGellraEZWRXBxUjFJMFkyMVhZek5CY1VwTENsaHlhbVZRU3pNdmFEUndlV2RET0hBM2J6UkJRVUZIUlZKWU0zbG9aMEZCUWtGTlFWTkVRa2RCYVVWQmNtb3dlV0pPSzBaQmFYRlVUekF4ZVdaUlRsa0tVMFYxZUdWR2NEWnhNRmx4VFVVNGVXOUVUWEpYV205RFNWRkVSVEZyZVdjNU0wTlJSbEpRY2l0elpUZDRkRTAzWmxNMFVtZHhZazFaYW5CdVVXWTNRUXBtYkUxdWVWUkJTMEpuWjNGb2EycFBVRkZSUkVGM1RtOUJSRUpzUVdwRlFXMURNVXROV214c05WWk1VbmhYUWxsU1ltcFBjek5KZWpWTFpXMXdVbGxoQ2twMVRFZDBhbmt2TkN0bVMxQTViRlJKZG14a0wwSXdSM053WTBWMVUwSklRV3BDV1ZVNVVWVmlRVGRaZVRWVFdrNDRWRkZZYjA1RU5tVkNVbXhPYmxVS01rMUdaMWc0VlZKamF6TlJSVFZ2UmtWbVlYVjFSMWhSWkhrdlJtUkNWVWd5UjBVOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1667613194,
          "logIndex": 6531689,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/jdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/jdk",
      "githubWorkflowSha": "fcf799590e30dca6a4e7d510f3048176b32bf9ce",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3398224672",
      "sha": "fcf799590e30dca6a4e7d510f3048176b32bf9ce"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

