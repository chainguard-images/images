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
| `latest` `v0.1.0` | `sha256:b19e450ca11b910ee017986f6f376e3e11c5b41e16560773b605c3094a9ebf68`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:b19e450ca11b910ee017986f6f376e3e11c5b41e16560773b605c3094a9ebf68) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:b19e450ca11b910ee017986f6f376e3e11c5b41e16560773b605c3094a9ebf68"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "316b8de770ada9fad3596fd1f3ce3e0ab35a44b6",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/melange",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDLM1t6SQx6EiXdE0xTRReN7Ju0SHaZx1wtwr58GCL3cQIgSxHSLElraDc7cEzYwDAa61BGEGofPlecadhQEP10FKc=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI3NjM5MTIwZjExMWJkNDA0ZDgyMGJkNTNhNzQ4MzVlY2ZjNmViODFiN2YzNmJhYWMwNzU1NzZjMTE3NmM4ODIyIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJSFpMZXJObWpGcVBiRUtpY2JaMUZYYmtRWklkVVBlQVZ5enpVQUV5YkJOa0FpRUFrTzNXZUJoR0ErQUdUSE5sQjQvQmR1MnJGT0ZzZUdROG93UjVPOGpCeEt3PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlha05EUVhwVFowRjNTVUpCWjBsVlZuSlBTRlp1VUdSRWNtSkZlQ3RzVFZkclZsVkhOVTk0TUdaM2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1hsTlJFVjNUWHBSZVZkb1kwNU5ha2w0VFVSSmVVMUVSWGhOZWxGNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZuVmxCSk0wMUxVWE5RVjA0eE9YVnpUMGR2WkdsNFFWWkZiMjFpY1ZWeGVUVlFRbllLVG10TUwxVmxkV0V5VWk5ek5TOVFhRXhzVEd0UWNHUkpWWHBTVEdneFJtczFiRmMwZGpWNU5YZDRVR1JUYjBsWmRFdFBRMEZzVFhkblowcFFUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV4Ym1nM0NrOTFjM3BUZWxveE1uQkVWMk42VkZaaWFTdHNPR0pyZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVd4aVIwWjFXakpWZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRFVFhoT2JVazBXa2RWTTA1NlFtaGFSMFUxV20xR2EwMTZWVFZPYlZwclRWZFplbGt5VlhwYVZFSm9DbGxxVFRGWlZGRXdXV3BaZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWmlWMVp6V1ZjMWJscFVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFpjMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZabEZTTjBGSWEwRmtkMEZKV1VwTWQwdEdUQzloUlZoU0NqQlhjMjVvU25oR1duaHBjMFpxTTBSUFRrcDBOWEozYVVKcVduWmpaMEZCUVZsUU9VNDFaR1ZCUVVGRlFYZENTVTFGV1VOSlVVTXdZbEl6TW5jeFdUZ0tWMGhRVERWWlowc3dSbVpGTWtGeWEzRnpaRlIxVVROaVQzaFRhM2hMUkhwU1owbG9RVkJvVFdKTlpUZ3dTazFOZURaNmNYSXhRV1V4Ym1WRFJTdFVZUW93WWt4c1RtVlNlak0zZW5BMVNreHFUVUZ2UjBORGNVZFRUVFE1UWtGTlJFRXlaMEZOUjFWRFRVaHVRM1pPT1RCMWNFeHpjV2hQVHpOTFRsbDFkak5wQ2tacmQwNW9VVUp6WkdkdVFsTjJjMmhFT0VJMmJFRklXRE5PTkhBMlpVZ3hUVEpuTnpGT1RrMVdVVWw0UVVseVMxUTFNRVJFWkVFeVZWWklURTlrUVdjS1R6ZHViVXBXU1VoYUwyWXJaa0pNZGk5VGJTOUpiQzlsWmxONUwxVmtRV1lyV1dSalVYZHphVlZaWVhoRVVUMDlDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1666400634,
          "logIndex": 5608477,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/melange/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/melange",
      "githubWorkflowSha": "316b8de770ada9fad3596fd1f3ce3e0ab35a44b6",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3301333290",
      "sha": "316b8de770ada9fad3596fd1f3ce3e0ab35a44b6"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

