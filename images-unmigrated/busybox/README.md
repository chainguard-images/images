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
| `1.35.0-r2-glibc` | `sha256:a76760a49c6966fa0516404736d7949299433d959ab9910d841e2e3a0f301d48`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a76760a49c6966fa0516404736d7949299433d959ab9910d841e2e3a0f301d48) | `amd64` |
| `1.35.0-r3-glibc` | `sha256:ad5253c513c65022193c84275ec6395b88d82ce1e194d9bffe04084ea0aaf973`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ad5253c513c65022193c84275ec6395b88d82ce1e194d9bffe04084ea0aaf973) | `amd64` |
| `1.35.0-r27` `latest` | `sha256:ca7e35f7356f5857af7bce94e9294bed4c5847b4fcba1dc7c34029a8e4000071`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ca7e35f7356f5857af7bce94e9294bed4c5847b4fcba1dc7c34029a8e4000071) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
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
        "docker-manifest-digest": "sha256:ca7e35f7356f5857af7bce94e9294bed4c5847b4fcba1dc7c34029a8e4000071"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "bc05e42d23c67514b72c86c4dd395e74e0f4053a",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/busybox",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIBf6mmp0GN4SX9ts+7sxHqFGd8t2nArZB4qotPVhqW4WAiEA3UoGTuY94GCJtxXOeQ62TrTnZ29NOOhrrfBqdBVKvgE=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJkYzNlMmVkOWExMjVhZjBiZGRjMmI1YTBhNDcyNWQyZTIxMmU5OWE0MTE3NjQxMzEwMWYzY2QxOWE5YjBkZjgxIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQm85cy85djEyMzZuc01CaHZmQjFaeTA0UkYrV0lLMVZvcFdGYjl2ZGI0aEFpQXVnWnh1cnFyb1VXcnFRVGZla280akw1d2NvcjJ0aCtmM1hacGFjcFlsQlE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhla05EUVhwTFowRjNTVUpCWjBsVlYxSlFWalJRUjJ0Rk5pczRjMDl0TWtSNGIweGxTamhYY0VJNGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1hkTlJFRXdUbFJGTTFkb1kwNU5ha2w0VFVSSmQwMUVRVEZPVkVVelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZNU0RKNWRHaFNUbk0wUkZWcFoxVlFVMjB2Um1SeVZUUktSakpwTjFCNGIwaE5OM1lLTUdaMlJtbHhWVmxoYW5wM2FsQlhXVkJqYldaSGVqVlBNMVZWVVc1d1QwcDVWbE5FUTFOa1VGWXliSHBwZEc1SGVXRlBRMEZzUlhkblowcE9UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZJUjB4SUNrMW5OemxGUVVsWlQybFdZVzgyUTFCcU9VTnFSMUJKZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5U2pGak0yeHBZak5uZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRIU21wTlJGWnNUa1JLYTAxcVRtcE9hbU14VFZSU2FVNTZTbXBQUkZwcVRrZFNhMDE2YXpGYVZHTXdDbHBVUW0xT1JFRXhUVEpGZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWlpibFo2WlZkS2RtVkVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFphMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZaWGRTTlVGSVkwRmtVVUZKV1VwTWQwdEdUQzloUlZoU0NqQlhjMjVvU25oR1duaHBjMFpxTTBSUFRrcDBOWEozYVVKcVduWmpaMEZCUVZsUWVUSm5UakJCUVVGRlFYZENSMDFGVVVOSlJIbENTVlJNZVZGME1Ya0taR3RaTlRrMFdrMVdRMWx4TDJoQ2JXazJSbk5GTkV4TFRtWjNiMjVyWmxKQmFVRkdTRVJoTTFBNFZGbGhhMDFsYkRCalVsWmxORkZwY1ZoU1QwZ3dSQXBtVEdOR2NrWTFaVFE1TXpWb1ZFRkxRbWRuY1docmFrOVFVVkZFUVhkT2JrRkVRbXRCYWtKc2VHVmFUMkZHVUZCMFZGVjNXQ3RtVVRSTVRHRlFLekptQ2s5dFYwUlFiM2hYT0VGNWVGSm9VMlp4WkZvNFpWZFVaR293ZWpSS1dUaERRbU5ZYUU1QmIwTk5SMDlTZUhCcFZVOHhOVGxVUmtwV1pWRnFjV0ZhVDNNS1NXZFZTSGxuTVZwelNuZEJja2RuWVZCMFYyTnRVR3hOWjFWcVVHbDBSREprWjNaS1oxUkdjRkJuUFQwS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1666226737,
          "logIndex": 5464526,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/busybox/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/busybox",
      "githubWorkflowSha": "bc05e42d23c67514b72c86c4dd395e74e0f4053a",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3286016685",
      "sha": "bc05e42d23c67514b72c86c4dd395e74e0f4053a"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

