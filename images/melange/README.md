# melange

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/melange/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/melange/actions/workflows/release.yaml)

Container image for running [melange](https://github.com/chainguard-dev/melange) workflows to build APK packages.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/melange:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` `v0.1.0` | `sha256:0a84abf368bf5e15247ac6ac846afa0395359cf0e86654052d3cb00a103680e1`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:0a84abf368bf5e15247ac6ac846afa0395359cf0e86654052d3cb00a103680e1) | `amd64` `arm64` `armv7` |


## Usage

To build the melange workflow in [examples](examples/gnu-hello.yaml):

```
docker run --privileged -v "$PWD":/work cgr.dev/chainguard/melange build /work/examples/gnu-hello.yaml
```

Output will be in the `packages` directory.

To build the melange package for the host architecture:

```
docker run --privileged -v "$PWD":/work cgr.dev/chainguard/melange build --empty-workspace --arch $(uname -m) /work/melange.yaml
```

To get a shell, you can change the entrypoint:

```
docker run --privileged -v "$PWD":/work -it --entrypoint /bin/sh cgr.dev/chainguard/melange

/ # melange version
...
```
Note that melange uses bubblewrap internally, which requires various Linux capabilities, hence the
use of `--privileged`. Because of this requirement, we recommend this image is used only for local
development and testing.


## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/melange:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/melange:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/melange"
      },
      "image": {
        "docker-manifest-digest": "sha256:0a84abf368bf5e15247ac6ac846afa0395359cf0e86654052d3cb00a103680e1"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "5b54ec0be91fb5b5174d533baa673ca82c346cae",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/melange",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIA35Ke0Exj2mm7urvygp2laoypzCDxVdC4zGcSoIkLUMAiEA3Mz31gMdyiFF4YyInFpel2O8yHHCTqUg8cuoMJyCMYI=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJiM2U1ZjRmZjE4ZDc5NGVkMjFjMjMzNjU3Nzk1YmQ0NTEwNGMzOWQ1N2MwYzc4OTA2MmJjYjE1MTQ3ZjhlNmEyIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURuZURDK0hscUNqenNCSFhwanFzdGlScmVDZk9qTDhQbEhnRkJRM2plKzRnSWdGL0tURG10cm5GMzd6WDFUaEd1T1l5VmU5eG9rLzlxbzhQcEhjbVZrL2g0PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlha05EUVhwVFowRjNTVUpCWjBsVldua3lOVEJoZEVVM1RVSk5XVzV3V0VwMWNXaEtXbU5RZUhrd2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1hkTlJFRXhUMFJKTlZkb1kwNU5ha2w0VFVSSmQwMUVSWGRQUkVrMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVY1Vkdac1UwNXBZemN4UjJGNVdHUkhhVk5ZUkhOaU1GZHFSalpPZDB4b1NubFRVREFLZDFBd1kzVkxUM05vVDNsaEwyWTFRWEUxYmxsM1NUWkNkM1ZOVUROMmIydFVla3QzZHpsWVFsVkVkekZpZEcxNVYwdFBRMEZzVFhkblowcFFUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV2UVZCNUNuVkVNREV3T1Uxak0yUmplWEJsU2tWS1ZYTjRSWGRKZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVd4aVIwWjFXakpWZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRFVm1sT1ZGSnNXWHBDYVZwVWEzaGFiVWt4V1dwVmVFNTZVbXRPVkUxNldXMUdhRTVxWTNwWk1rVTBDazF0VFhwT1JGcHFXVmRWZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWmlWMVp6V1ZjMWJscFVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFpjMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZabEZTTjBGSWEwRmtkMEZKV1VwTWQwdEdUQzloUlZoU0NqQlhjMjVvU25oR1duaHBjMFpxTTBSUFRrcDBOWEozYVVKcVduWmpaMEZCUVZsUWVUVm9hbEpCUVVGRlFYZENTVTFGV1VOSlVVTTBiVTgzTnk5V0x6Z0tSR05ZVmxoRWNYQlRRVXh2V1U1UFYzcE1PV051VEdsNk5GaGpUVkJLV1hseVFVbG9RVkJPT1RkWk1UVTBURUZEVmtsWVFuTmhXRFU1ZERkVVVVODBUUXBQY1dwSVdIZG1WMFJPTW1WV2FtZFBUVUZ2UjBORGNVZFRUVFE1UWtGTlJFRXlaMEZOUjFWRFRWRkRZbk5SZVhNMlppOTZhR1JHTmpKa09WbzBORzVzQ2xScmVXeHNTekZuVFhodE1UbElTVkJrUlhreFRISkJNM0JqZURNeVVVNDVhMFUwVEhwSVZ5OHlXVGhEVFVobE1tTnVhM05KYTNCNloxWTBUVUpoTW1VS09XRXllRWRHUjBZclFWZEdlRWN3VmpCQlpVSktjV04wUkhaSWJuVlBSakZhUXlzelJXOHhlamxvZVZRelp6MDlDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1666227525,
          "logIndex": 5465176,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/melange/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/melange",
      "githubWorkflowSha": "5b54ec0be91fb5b5174d533baa673ca82c346cae",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3286006143",
      "sha": "5b54ec0be91fb5b5174d533baa673ca82c346cae"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

