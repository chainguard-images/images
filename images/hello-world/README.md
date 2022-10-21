# hello-world

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/hello-world/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/hello-world/actions/workflows/release.yaml)

Hello, world!

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/hello-world:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:b10ac3191610e407765edde3a283b1379fa8b55a496b2ad4be0a593206c00207`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:b10ac3191610e407765edde3a283b1379fa8b55a496b2ad4be0a593206c00207) | `amd64` `arm64` `armv7` |



## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

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
        "docker-reference": "ghcr.io/chainguard-images/hello-world"
      },
      "image": {
        "docker-manifest-digest": "sha256:b10ac3191610e407765edde3a283b1379fa8b55a496b2ad4be0a593206c00207"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "0fbdab8f929004556cdc91c20d19fa198b84488c",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/hello-world",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIBhIoHWWQMhIhnpqonlOj5QdLGEeMC4QmktwuaOzS/N6AiEAqZ7yGQQg3SJzkiyhmzklc46M22qTFOLOBagsBD9Vv40=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI4NDE3NDUyMTI2M2Q0MTNjYTVjNzQzMWE2NmQ0YTFlOWMzYmUzZjY5YmMyODkzZDdmODBiM2MwMjEyN2NlYWUyIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJRHFJR1hrdUY3RG9ycEprOUVyM1hEblZxMHR3NmVHT1N3M2ZqZFR0NmhxVEFpRUFtdHdzNG1uN1N5QWtnV1U2U3JtYVMxUU81YVo0cVR6WGJTdmlJU2lKSEkwPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpla05EUVhweFowRjNTVUpCWjBsVlYxcEJiMWxuTVVwbVQxbHRjVFp3WVc1YVltOUpSRFZwT0RoamQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1hoTlJFa3dUbFJCTlZkb1kwNU5ha2w0VFVSSmVFMUVTVEZPVkVFMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVYzWVZOWGFFNU9TR3RzY205M2RuWjJUMVJPYkdKS01rRXdLMWhVYmtwT1UwZzRWVFlLTVRZNGQxSkhORWxrY0ZJMVVtazFVSHBtWWxwWmRFSnlVVWRSZEV0cE5rTnJkMlJPZVdkeWVqSlFjRXR3YWxRMmFXRlBRMEZzYTNkblowcFdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZFUzJGaUNtSm5VWFpzU0ZSbmVWTktUMHRqVjJRd1NWVkpVRkpCZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5YUd4aVIzaDJURmhrZG1OdGVHdE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyZDNXbTFLYTFsWFNUUmFhbXQ1VDFSQmQwNUVWVEZPYlU1cldYcHJlRmw2U1hkYVJFVTFDbHB0UlhoUFZHaHBUMFJSTUU5RWFHcE5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKb2JHSkhlSFpNV0dSMlkyMTRhMDFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxSV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUkzUWtoclFXUjNRakZCUVdobkNtdDJRVzlWZGpsdlVtUklVbUY1WlVWdVJWWnVSMHQzVjFCalRUUXdiVE50ZGtOSlIwNXRPWGxCUVVGQ1p5OW9kVWMzTkVGQlFWRkVRVVZaZDFKQlNXY0tSRWQ2YlhsTWIwTkRiell2TVc1MFNUUmpjSGxxYkV4dFlqVnFOMkV2YkdwSmJFVnRTRWgwVVdoamMwTkpSVXhtVERCQ2FHOTVXSGRIVVRWclVYVnNlUXBITWxsNmN5dGlSVXd5Vm13cmIzcDNVblZwTlRnM1dGVk5RVzlIUTBOeFIxTk5ORGxDUVUxRVFUSmpRVTFIVVVOTlEyOVhNSEF2ZGtod01uZDRXWFJ4Q2pCQksyZElUak5oTW1NeFEzSk9iemR6ZDFKcFlXeDNNWEZOWTJ4NmFHNWlabmMxTmxORVduSmlaMDFYUkhGNVlrRjNTWGRSTnpodVdETmtZamxVVnpBS2JFcFVjeXR2TWtRNWJHbExOVFpyY21ocE1GaE5XRVJZUmpWT1IzSnRaM0pwY2tvdlEzVnFTRkJ4TVU5TFVUWkhOMjU2Y1FvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1666320321,
          "logIndex": 5534232,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/hello-world/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/hello-world",
      "githubWorkflowSha": "0fbdab8f929004556cdc91c20d19fa198b84488c",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3294068013",
      "sha": "0fbdab8f929004556cdc91c20d19fa198b84488c"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

