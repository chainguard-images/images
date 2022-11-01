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
| `latest` | `sha256:291cb0d76b47cf690e2172629d09b371f37285965dbacba7f1df0da8b56b8c36`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:291cb0d76b47cf690e2172629d09b371f37285965dbacba7f1df0da8b56b8c36) | `amd64` `arm64` `armv7` |



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
        "docker-manifest-digest": "sha256:291cb0d76b47cf690e2172629d09b371f37285965dbacba7f1df0da8b56b8c36"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "9272c8dc5a4a37d882f7c475a225e439e49e2025",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/hello-world",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIH/rJ/+lqnAIG1aKbQ4Hgvxbq5NrpzoMgv2/wC2QGn1sAiEA+tPswz8D5wVUd84eUYjJonc5Gjq2ESjNATzfQBj/b4o=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJhMmZkZWNlMmZjZGExOGZmZDk2YjFlZWU0YzNiYWE4NmVkZjM1MGRkNTUyMDk4MWZkMTc4YTU2YzUxNjc5NWMxIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQVV6bFdXWHcrOSs1RjA0bnRUdGNCUGpWN2FRd2Y5MXVOTGtSR3RnWnV2MkFpRUE3bU1XaTdGeGpZeUtlU2s0VXFPeXdBdGxwekR1N3k4SW04cUF1T3cwWlRzPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBSRU5EUVhweFowRjNTVUpCWjBsVlNsaDZRMGhIYUdNelR6VmFXV3NyYVdWNmJqWkZlbGxrYVRSemQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVhoTlJFVjVUa1JOTlZkb1kwNU5ha2w0VFZSQmVFMUVSWHBPUkUwMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZuVm1aWFJISkxibFl3TTA5dlZUWmlRelpWY0ZSNmFFcEhVVkkxT1hjM1lqbENaVzhLYlVOcGRuQnhVamhIWlRKeFlqaHJNMkpoUWpaamNVZHpjVmhVYjFaMGFFVmtNMFZpWkhjeGJWWTNabTV0Uld4c1ZHRlBRMEZzYTNkblowcFdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ1VjNWUENscHZTMGhzYW1neGMxbFZNM0U1TDJvNEwzUkROV0Z2ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5YUd4aVIzaDJURmhrZG1OdGVHdE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyYzFUV3BqZVZsNmFHdFplbFpvVGtkRmVrNHlVVFJQUkVwdFRqSk5NRTU2Vm1oTmFra3hDbHBVVVhwUFYxVXdUMWRWZVUxRVNURk5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKb2JHSkhlSFpNV0dSMlkyMTRhMDFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxSV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUkzUWtoclFXUjNRakZCVGpBNUNrMUhja2Q0ZUVWNVdYaHJaVWhLYkc1T2QwdHBVMncyTkROcWVYUXZOR1ZMWTI5QmRrdGxOazlCUVVGQ2FFUkVTMWhsYzBGQlFWRkVRVVZaZDFKQlNXY0tVVXhVWWlzd2RUSjNVRGRRT1VRNVJuQkhNblpNZDNCcE5UUnpjSGcySzBadU4zSlpTemMxZVhWV2EwTkpSR05tVUZsT1RUZEVjV0YwZG5rME1WTk9Wd3BaYlRKcVRVSnNhR3g1UldKSFFrc3pNa0kzV1M5WUwxWk5RVzlIUTBOeFIxTk5ORGxDUVUxRVFUSm5RVTFIVlVOTlVVUlBORWg2ZVdsQ1RrZG1UVFZ2Q2psNlpWTm9ha0pyY1U5VGMxTlZTMDlSV1VGWlREWlVjbEI2ZFVKMlJFVTBjSEZxUmt4c2VGZHVVMDVvTkhkeU9EQmFjME5OUkhoS1MzUjVTSGRGZW1jS1FWb3pXbW95ZDFFclRFMVhPWE5PZFdWTlMzaGlMM29yUm1kc09FZHpaVlZ1V2trMVlYaFRTVlpOVEc5SFVFUnlaamhDVTJwUlBUMEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1667265890,
          "logIndex": 6261479,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/hello-world/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/hello-world",
      "githubWorkflowSha": "9272c8dc5a4a37d882f7c475a225e439e49e2025",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3366023589",
      "sha": "9272c8dc5a4a37d882f7c475a225e439e49e2025"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

