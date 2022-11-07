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
| `latest` `v0.1.0` | `sha256:d36eadbeed8dd458c8d0ddd057c0fd32e44d3a832e336dd914d18aea0b6d4b62`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:d36eadbeed8dd458c8d0ddd057c0fd32e44d3a832e336dd914d18aea0b6d4b62) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:d36eadbeed8dd458c8d0ddd057c0fd32e44d3a832e336dd914d18aea0b6d4b62"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "594622b4efa6fbdd67f18d320639c128cf261eb4",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/melange",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQC3T2MsTU1sphFGHg/Lx/7mBmIyjOUKKKKK6jotehW03wIhAMGTJG1FFqR5bMHfC9c89ILApqK+xyWf7zpD8e6X7vnM",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIzYjAyZDU2YjViYzBlYWNmNzM5NjdiMGQ5NWEwNDM1NTkzMzQxMWE3NWQ2ZDI0OWRiMjY1NzAzMTMwMDE1ZjQ3In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUR4M1VFTHpad0tSWHR5a21OWFAxc3Q0eGlmUVZSbEIrV0lDeWdXQS82aVZRSWdXVUUxc3ZLSHRFVStoWWMyeEtJVjIraTFQSndhTWxqQU5wMmgwY0pLRmlzPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlWRU5EUVhwUFowRjNTVUpCWjBsVlZGSTRha05qVVVwemEzYzVaRzVVV0RKbGJURlJWemhUZFZkTmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVROTlJFRXdUMVJOZDFkb1kwNU5ha2w0VFZSQk0wMUVRVEZQVkUxM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVY1Y2pWUldpdFdVVzlvVm5oVU1HVnZaSHBLVGxaRFZWbHhTVEZPVWxwRVRrNWtTbm9LYW05R1FTdEdkM2gwWmpWWFZHcHFkSGhQWW5sbFUyVmFMM2hIVEhFclRXaHZhVXBvVDJscFNsVmtOREl2U1ZremVuRlBRMEZzU1hkblowcFBUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlY0TlROekNuazFXR3BwYUVaR1oweG9MMkV3U1hGbWRqUkdNekpCZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVd4aVIwWjFXakpWZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRFVlRWT1JGbDVUVzFKTUZwWFdtaE9iVnBwV2tkUk1rNHlXWGhQUjFGNlRXcEJNazE2YkdwTlZFazBDbGt5V1hsT2FrWnNXV3BSZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWmlWMVp6V1ZjMWJscFVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFpiMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZaa0ZTTmtGSVowRmtaMFJrVUZSQ2NYaHpZMUpOYlUxYUNraG9lVnBhZW1ORGIydHdaWFZPTkRoeVppdElhVzVMUVV4NWJuVnFaMEZCUVZsU1VHdEdhR3BCUVVGRlFYZENTRTFGVlVOSlJUWkZiVEZCSzAxclVIWUtSWE5VT0hObllYTTBhR0pKU0M5TVMxbFFjVVpMWkVSeFlrNUZXakJKZVcxQmFVVkJhSFZMT1daM1NpOXBhM2c0V25OUk1tMDFjR3B4YkRKR2JEaHZVQXBQVW5aMWNWVXZPV0pHYkRGNldqaDNRMmRaU1V0dldrbDZhakJGUVhkTlJHRkJRWGRhVVVsNFFVcHlLMmxIY2xJMmRVNDVNa2cwUVM5b01HSm5WblZLQ200elV5OWFXRVEzV1RVd2VFTmtkSFJTVkRreWNsQkdabnBrWWxrNFUzQndXRk5KUVdOWlRrWklVVWwzV1hwa1prRkljRGxsY0ZReE5scHNRbFJXYlVrS1RYVjVaVGh0V1ZkRVpYVlJha05pTjFwNVZXOWlUVGRpZUUxWFZqYzBObmhSYjFSTFpVNWxXazh5YzFjS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1667782178,
          "logIndex": 6649364,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/melange/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/melange",
      "githubWorkflowSha": "594622b4efa6fbdd67f18d320639c128cf261eb4",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3406696469",
      "sha": "594622b4efa6fbdd67f18d320639c128cf261eb4"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

