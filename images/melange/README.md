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
| `latest` `v0.1.0` | `sha256:434b14edf41576cebc19a695398e195b91d067ddb83a7dce22db06998cd7d7ad`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:434b14edf41576cebc19a695398e195b91d067ddb83a7dce22db06998cd7d7ad) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:434b14edf41576cebc19a695398e195b91d067ddb83a7dce22db06998cd7d7ad"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "9c2ff7e3c48eb2604868a6e42a660afdc9afd7fe",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/melange",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCICg3FHSB8T9d2p4y4PlPztZJc8ie0sSGGoMnD96PjSq2AiBiYL9Y9CjSWR4sLdidKRxuYwoQbo23oTyQhGlr1Me/Pw==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJiNDQyZTFkOGY1NGYxYmNiZWI1OWJkMDllYjI0NWFmMDU0M2QwZjljZmEzYzhjMDQwYmFjMTA1OWQ3NzVhZjgxIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURlQlNVVjJQclZGTzlXeUx5cTFzaEdYL09xTFd5TzRjTE9MSzFSZlhhWlh3SWdNMVdlbnFFMzlQWk02c29LMC9TNXREWmM4WGMrTjcwa0QyNENNWGJwV1ZRPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlha05EUVhwVFowRjNTVUpCWjBsVlFYZDJRM1o2WlhsYVdsaFNUVWRLUVM5MlUyOHpNWGxwU0dkemQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhwTlJFVjNUVlJGTkZkb1kwNU5ha2w0VFVSRmVrMUVSWGhOVkVVMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZxVldSRVNXbGpReXRMSzFSNFZtUkxkVFpDVTNBMU1VaGhRWGRWTlZkclR5OUlaRGtLYURGM09FOUNMMU5zT1dzNFlUZ3hlSGxaZGtKME5rVjNPRWg1VVdSWmF5OTRWVlowUmxSSmRWVkljemxhWnpVMU9UWlBRMEZzVFhkblowcFFUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZPVFhsd0NrZ3pPR1ZOYVRSMlpuZEViemRyVlhwamFIbzNNVUZCZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVd4aVIwWjFXakpWZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRFYkdwTmJWcHRUakpWZWxsNlVUUmFWMGw1VG1wQk1FOUVXVFJaVkZwc1RrUkthRTVxV1hkWlYxcHJDbGw2YkdoYWJWRXpXbTFWZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWmlWMVp6V1ZjMWJscFVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFpjMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZabEZTTjBGSWEwRmtkMEZKV1VwTWQwdEdUQzloUlZoU0NqQlhjMjVvU25oR1duaHBjMFpxTTBSUFRrcDBOWEozYVVKcVduWmpaMEZCUVZsUVR6TkRjMHRCUVVGRlFYZENTVTFGV1VOSlVVUlhNMGd6YUZCamJqRUtXV000ZEZwQmFISnRkM0JWV0ZKSFdWRmxMellyY1VOaE1teE5WMVpsTlRWMVVVbG9RVTkxVWt4RVVFNDNkbTVLVWk5WFpuRlZTMWxRVTB0cVMyZDRWZ28xV1RsUmF6VlpOMkZSVkZJNWVuSm1UVUZ2UjBORGNVZFRUVFE1UWtGTlJFRXlaMEZOUjFWRFRVZEZjR1pKUVVKRFptRjJNMHBsU1hSdGNrMVlXVmcwQ2xocmNIaFNiM3BCUkRSVGFHZGhiMnhJTUROWUszWnNVMWhrVDFkdlluTmtRazUyZDJsNU5qSklVVWw0UVUxQ2JEWnVZbVpDVTBsRFptUk5kRzRyTW1NS1dHdDVTakk0TVRGaU5UTmpWbGN2TkhkVmVFaFpRa0o0YVZwbk1sWkVWbnBrTW5SNWEySTRWM0ZMTm1OdVFUMDlDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1665622889,
          "logIndex": 4995620,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/melange/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/melange",
      "githubWorkflowSha": "9c2ff7e3c48eb2604868a6e42a660afdc9afd7fe",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3238891135",
      "sha": "9c2ff7e3c48eb2604868a6e42a660afdc9afd7fe"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

