# template

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/template/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/template/actions/workflows/release.yaml)

WORK IN PROGRESS

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/template:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:70e1f57f19f91dffd91bcb1dc71967c8a22e05ee60a9e8d6b8ca39d4c71169ed`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:70e1f57f19f91dffd91bcb1dc71967c8a22e05ee60a9e8d6b8ca39d4c71169ed) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


## Usage

WORK IN PROGRESS


## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/template:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/template:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/template"
      },
      "image": {
        "docker-manifest-digest": "sha256:70e1f57f19f91dffd91bcb1dc71967c8a22e05ee60a9e8d6b8ca39d4c71169ed"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "6983e283088777f046b57e77a450144ea115219f",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/template",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCo1L5d86k+eZXgq4ZnfASuXm4Z05nJwSWIybmnHWsYawIhAJkMdC7tRw/zFdmtZWXWEuxDUWb5k91OOR/KL0LHr1JN",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJhZTQ4MzdlMGI4YzMwOGQ3ZmVkMjAzYTEwNzg0NjUwMDYzMDg4NDExODY2ODE1MjA3NDdlZDEyNzI1OTkzZjAwIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURKMzFuNXZvdzRMMTdaVE9MUkNPSUFBa2JjNW9mRmdOSzVMNTM3YUVWMEdnSWhBTFJBT3JxcXdrUGRSYy9udXVIMmVXSUp1TWF3QzRQUUpsbjdDRzZJR0paNiIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlla05EUVhwWFowRjNTVUpCWjBsVlMyaHZNbXBMUkUwclRWWkpiMDFDYlVnMWN5OHdXQ3RCTDFGcmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1RGTlJFa3dUMFJOZUZkb1kwNU5ha2w0VFVSSk1VMUVTVEZQUkUxNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVVyY3pWME9XRk1SbTFuTVVNM2FHMVBUWEZ6V0ZWNlUzbE1XREp2VmtwVlpsSlpSVXdLV2tWblJIUjVabGg0ZG5sUVFUaDJkREpVTkZCdGMzaDBhbUl2VDJGRWVrSmpNa1ZQZVhjM1RsbEVlRk5qWkRsd1RYRlBRMEZzVVhkblowcFJUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlYyU2tKWENuZDRXWEJZUTJGa1JHMWhiWE5ZTlhCb0syNUJLM3BuZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGbldVUldVakJTUVZGSUwwSkhRWGRZYjFwallVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6VW14aVdFSnpXVmhTYkV4NU5XNWhXRkp2WkZkSmRtUXlPWGxoTWxwellqTmtla3d6U214aVIxWm9ZekpWZFdWWFJuUmlSVUo1Q2xwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1QxRlpTMHQzV1VKQ1FVZEVkbnBCUWtGUlVYSmhTRkl3WTBoTk5reDVPVEJpTW5Sc1ltazFhRmt6VW5BS1lqSTFla3h0WkhCa1IyZ3hXVzVXZWxwWVNtcGlNalV3V2xjMU1FeHRUblppVkVGWFFtZHZja0puUlVWQldVOHZUVUZGUTBKQmFIcFpNbWhzV2toV2N3cGFWRUV5UW1kdmNrSm5SVVZCV1U4dlRVRkZSRUpEWnpKUFZHZDZXbFJKTkUxNlFUUlBSR016VGpKWmQwNUVXbWxPVkdSc1RucGthRTVFVlhkTlZGRXdDbHBYUlhoTlZGVjVUVlJzYlUxQ2QwZERhWE5IUVZGUlFtYzNPSGRCVVZGRlJHdE9lVnBYUmpCYVUwSlRXbGQ0YkZsWVRteE5RMmRIUTJselIwRlJVVUlLWnpjNGQwRlJWVVZIYlU1dldWZHNkVm96Vm1oamJWRjBZVmN4YUZveVZucE1NMUpzWWxoQ2MxbFlVbXhOUWpCSFEybHpSMEZSVVVKbk56aDNRVkZaUlFwRU0wcHNXbTVOZG1GSFZtaGFTRTEyWWxkR2NHSnFRMEpwWjFsTFMzZFpRa0pCU0ZkbFVVbEZRV2RTT0VKSWIwRmxRVUl5UVVGb1oydDJRVzlWZGpsdkNsSmtTRkpoZVdWRmJrVldia2RMZDFkUVkwMDBNRzB6YlhaRFNVZE9iVGw1UVVGQlFtaEJNRXR2U1c5QlFVRlJSRUZGWTNkU1VVbG9RVXQ0TlhKTlFWSUtWalkyUjNSd2VtUlJhVzh3VVdoblNrWkxPQzg1VEdwRU4zQlRkVk5RUzBGUVZWZDRRV2xCVGxob1kwSTJkWE5ZTkdNMldIaDFOVXB6UXpCNVZ6QlhZUXBRU2xsTFRXeHhOa1JvYjNoU2JtaDFjMVJCUzBKblozRm9hMnBQVUZGUlJFRjNUbTlCUkVKc1FXcENkWEpDTTNCV1RraFJWblppUzFKVmNFaENTV0pUQ2xGU2NtVnlhVkV2VXpGRWVrOWFTaXQyT0hWdllTOXlUelZsUmk5SEt6WnpPVzFDYmsxeFQzRkxSWE5EVFZGRFJqRlFMMjVNTWs1ck5VNXdWamhsU0dJS2NHaHNOSEU1ZFM4emJuTlNUMkZLWmtkMmMydHVLelZsVldveWJ6UlBWWFJvVkhoUlJFSnJWVmRqTHpGSE16ZzlDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1666666131,
          "logIndex": 5807249,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/template/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/template",
      "githubWorkflowSha": "6983e283088777f046b57e77a450144ea115219f",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3317799787",
      "sha": "6983e283088777f046b57e77a450144ea115219f"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

