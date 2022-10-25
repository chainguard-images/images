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
| `latest` `v0.1.0` | `sha256:c893131b367501be2bf763cf11a2c8b42c80a5e13e9f1b11a4a3d82757faf5f9`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c893131b367501be2bf763cf11a2c8b42c80a5e13e9f1b11a4a3d82757faf5f9) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:c893131b367501be2bf763cf11a2c8b42c80a5e13e9f1b11a4a3d82757faf5f9"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "30a3f8afdd2a19878a06a20e7919aecd0411abd6",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/melange",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIBqYaumDR3ovMHV0iSmw2valfh7MO9vA4u2fL97G6Vo8AiEA/5z+QPrtJnO/UviC41/K9VEdrYCWDSOfeq1cEsNFmp0=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJkNjgzNjE3NTA2YmJjZjRhZjZhYjczZWE1YzA4Mjg5ZTRlMGJiNmEyNDM1MzY5Mzc2MGIzOTZmMzNjOGZmZGMwIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQjZFUGxxVWVsemlmeFpVSlJ2b2xld0NPTnZYdFhQWnZ4U3M1d3FpTXA1ekFpRUE4ZzR5ZzJXaDY4Yzd2MWdtREtFbUxoN3NnbUlJS0ptTFFlUmQ4bnVxQ21vPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlSRU5EUVhwTFowRjNTVUpCWjBsVlJFdEJXazQ0WjJvcmVrVmtTRVZIV0hCdWFrRkZVRXRFZDJGTmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1RGTlJFVjNUbFJSTUZkb1kwNU5ha2w0VFVSSk1VMUVSWGhPVkZFd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ5VEU1WmQyWTFlalk1Tmpkd05UWjNla1ZDUWxBemRXbzNhaTlHVlZkTU4xWkdWVkVLZERjclZYcEpZMWx6VUU0M2NtOXJNRXhCVEZVeUsyaG5VVk15VlZKbWFXTmtXWFpGWlVjMlFrOXRVMXBIWVZsalkyRlBRMEZzUlhkblowcE9UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ6UmpObkNtVlpSMlJpWmtGR1JFRlROVTFoVnpoMGRtNTFlakIzZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVd4aVIwWjFXakpWZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRFVFhkWlZFNXRUMGRHYlZwSFVYbFpWRVUxVDBSak5GbFVRVEpaVkVsM1dsUmpOVTFVYkdoYVYwNXJDazFFVVhoTlYwWnBXa1JaZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWmlWMVp6V1ZjMWJscFVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFphMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZaWGRTTlVGSVkwRmtVVUZKV1VwTWQwdEdUQzloUlZoU0NqQlhjMjVvU25oR1duaHBjMFpxTTBSUFRrcDBOWEozYVVKcVduWmpaMEZCUVZsUlRYSkpaemhCUVVGRlFYZENSMDFGVVVOSlIyVnpTRmhFTkdOMWJtZ0tWbkZoZVRKb1ZGVlpSbkJxV2xONFVYWnhXa1JNWVN0QlRXNUxXVTFqYUhCQmFVSkpVMGc0TUdVelQwWkxVa04wT1VKNFpqUlNhakVyWmxkNFZubGthd3AxZW5ONFNHOXROVlYwYkZRNWFrRkxRbWRuY1docmFrOVFVVkZFUVhkT2IwRkVRbXhCYWtFeVIwRjFSMmRYVERkVVoyNXJZalphWkVrNVpUbEtPWEJqQ21Kc2JESkVUaXRYWW5wSU9HTndlWGM0U1hsSVFYZ3JaVUVyY0dKbFVrSkpRV1Y0ZEZoelNVTk5VVVJxUzA0dmRuSnhjREY0YUhkNWEyVkZjMncyZEV3S2NtaHFZa2R3TDJOek5VSlBNbFI1SzFNM1dEQlhaVGxwWVhwNGRVZFBielpaUWtWUlJGUkJNbWxaVVQwS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1666659953,
          "logIndex": 5802315,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/melange/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/melange",
      "githubWorkflowSha": "30a3f8afdd2a19878a06a20e7919aecd0411abd6",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3317340567",
      "sha": "30a3f8afdd2a19878a06a20e7919aecd0411abd6"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

