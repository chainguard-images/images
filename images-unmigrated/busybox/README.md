# busybox

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/busybox/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/busybox/actions/workflows/release.yaml)

Container image with only busybox and libc (available in both musl and glibc variants). Suitable for running any binaries that only have a dependency on glibc/musl.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/busybox:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `1.35.0-r2-glibc` | `sha256:4c73e4981c7b786aa9bcf32742acb112d9e4b1db47a8eaac841cd96308a698e7`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:4c73e4981c7b786aa9bcf32742acb112d9e4b1db47a8eaac841cd96308a698e7) | `amd64` |
| `1.35.0-r27` `latest` | `sha256:0aeb02b4ce6fda386e8c6b9dcb568c834f0c167ee37f07f8049c53ced0761bbb`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:0aeb02b4ce6fda386e8c6b9dcb568c834f0c167ee37f07f8049c53ced0761bbb) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r25` | `sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |



## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/busybox:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/busybox:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/busybox"
      },
      "image": {
        "docker-manifest-digest": "sha256:0aeb02b4ce6fda386e8c6b9dcb568c834f0c167ee37f07f8049c53ced0761bbb"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "734b08713fd7053a897cea4b6d5c06470ea8ed17",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/busybox",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDPlOQSyZJGD+c+6LaN/WtVie2AMq3mBI8tUokb3EhzMQIhANY5YTQE60Zc2cR2hSfa0c7FQV/1RmedlzIGrwBfgswM",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJjNDE3ZTViNmFkNDU2ZjI3M2ZmYTMwZWZjNjVkMjZhNzM3YWM3ZDRhNzNjZTQxZmM2ZmY3MjkwNjQwYTU3YTljIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNLOCtjdkw4RzFUeEl3VVorK0FJSkt4NUg0ZXlnRjA5MUZXL0orbzlSQ0x3SWdLTnp5ZGcyR3dETFlmd0xKU1JSSHl5WHZ6ZHhFVEZyZDlqWlNLOGc3SHJNPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlSRU5EUVhwUFowRjNTVUpCWjBsVlRsQk1TV3d6ZHpVd1pFbEJkVk0zZDBjd1dFMHpVR2xaUVV4WmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhoTlJFRXdUbFJGZDFkb1kwNU5ha2w0VFVSRmVFMUVRVEZPVkVWM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZtZUd0a1pFNVFSamRhV2xWWFUzQXpOVTQyUWpKU2EwdHlSMGRHYldwNlEycDNaMVVLU0hGTGRIaENWamRVYWpKdGNGUldSV000T0ZWTk5WRjRTRGRJVjNKak9YbEZXRlpWVkZrNVdGbFlSRlVyVURZM2EyRlBRMEZzU1hkblowcFBUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ5UkhSMkNuQTVaSGhpVUM5Q1VHVjZUblV2TUdKcWJFSlZjbVpCZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5U2pGak0yeHBZak5uZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRFWTNwT1IwbDNUMFJqZUUweVdtdE9la0V4VFRKRk5FOVVaR3BhVjBVd1dXcGFhMDVYVFhkT2FsRXpDazFIVm1oUFIxWnJUVlJqZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWlpibFo2WlZkS2RtVkVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFpiMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZaa0ZTTmtGSVowRmtaMEZKV1VwTWQwdEdUQzloUlZoU0NqQlhjMjVvU25oR1duaHBjMFpxTTBSUFRrcDBOWEozYVVKcVduWmpaMEZCUVZsUVJXZExlRE5CUVVGRlFYZENTRTFGVlVOSlVVTTBZU3R1T1VGWFFtc0tiM1IxVEdaaFVsUk1jWGxtVFZBNE1YbDRVbGR1UVhGc1ozUlJhRkZQWjJOMFFVbG5UbWRRVnpCbmEyZFVlSHBUYm5SbVoxTnlURTF0ZGpBck5pdG5iUXBoVmt4MVlYRllWVUZhWTFkU1ZUUjNRMmRaU1V0dldrbDZhakJGUVhkTlJGcDNRWGRhUVVsM1lqVnNLMlpWVFd4V2FGTlJLMm8yYjFaV2NIQXJTRzVxQ2xZMVFWaG9SR3BYUW1aVlRHTnJlakZ5U0ZCS1EzVnNWa0p6TVUxSlp6Wm1ZbU5xUW1SdE1GWkJha0poYVRGTGJVMVpZemhVYzJ0T1psUkpTekZwVlZvS1RYQkNlRTE2WldWWlNHUTFlVEJ3VmtNclNIWkxWM2Q1TldKSVNHeFVPVXhDWlhGQ0wybzBZVVptUVQwS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1665449131,
          "logIndex": 4857299,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/busybox/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/busybox",
      "githubWorkflowSha": "734b08713fd7053a897cea4b6d5c06470ea8ed17",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3223316574",
      "sha": "734b08713fd7053a897cea4b6d5c06470ea8ed17"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

