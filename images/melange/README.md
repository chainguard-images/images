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
| `latest` `v0.1.0` | `sha256:e56185f0b696ce27ea4f4caa732e25eaa11fdc4aaf78c7df2b2c1a2a784f79b3`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:e56185f0b696ce27ea4f4caa732e25eaa11fdc4aaf78c7df2b2c1a2a784f79b3) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:e56185f0b696ce27ea4f4caa732e25eaa11fdc4aaf78c7df2b2c1a2a784f79b3"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "47e7e46b8c657748a3cb612e9b735a5ad3413e97",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/melange",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIBRuSri6MsiNgJJC5GJRfJmgLGNOl7PvcR1HX431gyZ9AiEA5JnpF7t+5mu0e+deGi4YyiDVRdIjluOuj58INO6ApDw=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJjOGE3OWU5NjczMmQ5MTFiYTNlMzA2ZDM1NTMzYTIxZTIzNGJiNDA1M2I3YzA1ZDYwNjllNzE0MGJmMDRkMDAwIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQXNJaVQ4TGpKUlZKaHNrdWExWGVCTGZWUGNaOVJNTGxVMXFySWdGaENybEFpQS91QkZBbWFkcmE2d1JNcDNTSmd0LzRpZW1Fa0dmTDZVOUJqRUkvZEtFdVE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlWRU5EUVhwTFowRjNTVUpCWjBsVlEzbElaa2hEZFhoRVYzTmtaekE0ZUhoeVlWUXpUMXBMVDBrNGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUVRSTlJFRXhUbnBCTUZkb1kwNU5ha2w0VFVSQk5FMUVSWGRPZWtFd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZTVWtwSVpHaEpiMG8wTkZSelJXMDNibEJCYzFOclpGUlhSSGhSZFhGRVZtZENNMHNLWW01cmRtNWFRV2hOTW5CTFdFWndabE5IWjJWeWNYZG9VVXhZYTBsUVpXbElSMDVPUmtsRGQyUlRUbG9ySzJkblNYRlBRMEZzUlhkblowcE9UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ5Y25SU0NtNWFNbWxhYlZSWVkycFRWRTVQYmtodFJXSkZTMFZOZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVd4aVIwWjFXakpWZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRFVVROYVZHUnNUa1JhYVU5SFRUSk9WR016VGtSb2FFMHlUbWxPYWtWNVdsUnNhVTU2VFRGWlZGWm9DbHBFVFRCTlZFNXNUMVJqZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWmlWMVp6V1ZjMWJscFVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFphMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZaWGRTTlVGSVkwRmtVVUZKV1VwTWQwdEdUQzloUlZoU0NqQlhjMjVvU25oR1duaHBjMFpxTTBSUFRrcDBOWEozYVVKcVduWmpaMEZCUVZsUE1VZEllbkZCUVVGRlFYZENSMDFGVVVOSlJuaDVTbFZxZWxGSUwwUUtXVnBtVm1ORlJFRTNkM01yVVhSME0yWTBRblJrYlZKeGVIa3pkSFZhV0RsQmFVSTBiR0Y2UmxCb1pXNWlUMWw0UW1kU2FXMVpTR1p1VWl0bVUyMVVUd28yT1RKTk1FSm1ibmxpTlVkMGFrRkxRbWRuY1docmFrOVFVVkZFUVhkT2NFRkVRbTFCYWtWQmFUZHRSM2hLU0VscFJqRXZWM2RKU2pWT1YxbEhiekpqQ21oaE1sa3lNa1pZZWtkQmIweHdjbmRpU204MVZYbzJhRzlpV2t4TlNVVTVaM2cyVXpSNmNFMUJha1ZCTTJkd05HVk5aV0pLWkVaUVEwbE5iRGxHV0hnS2VFUmpXRkZETTB0S1FVRlVjMVEzWW1Ka1JGTnRaSE5QU0c1WmFrVjBlRWQxY2t0cFExSk9VbTVwTnpVS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1665190634,
          "logIndex": 4664416,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/melange/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/melange",
      "githubWorkflowSha": "47e7e46b8c657748a3cb612e9b735a5ad3413e97",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3208493385",
      "sha": "47e7e46b8c657748a3cb612e9b735a5ad3413e97"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

