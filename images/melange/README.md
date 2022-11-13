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
| `latest` `v0.1.0` | `sha256:eca689753c147622ce19594c8e92f01ef77e14fccc89623d2cc0b6ab97baad99`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:eca689753c147622ce19594c8e92f01ef77e14fccc89623d2cc0b6ab97baad99) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:eca689753c147622ce19594c8e92f01ef77e14fccc89623d2cc0b6ab97baad99"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "44c14f9e5446f67eaf3bd62840eff7eb6653bde5",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/melange",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIEKqgveBpV8jCOyRS/UcMJ+hDaw79g18LV39HxQ1Hyb8AiBqyrkwyTzBx093NP/Lpxz7nWw2ZZvUksP1sgck+aJEMg==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJhZWRhMDBlY2ZjY2ZmOWQ1ZWE3ZjA3MWU3MTk1NWEyYjIwZDNkZTE5ODAxNzExNzhjOGM1YTkyNzcxY2JiM2IxIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNONUhsNXE1SUpFUURaNUc5SlgyYnU3angwZTJIQmhjUG1IUzNiWVJVczRnSWdXOG5KUFpnN0VGYTJuVjBLKzNDWTY2Z0hhcnA3OHI2eTlML2M2TnBNT2ZZPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlWRU5EUVhwUFowRjNTVUpCWjBsVlpsUXhUbGxuWjNCQlJTOXBhM2xvUkhKbGVHTnBNa0V4ZWk5emQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlhwTlJFRXdUbnBWZWxkb1kwNU5ha2w0VFZSRmVrMUVRVEZPZWxWNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVU1SzBKbUsyZDVjbGRhTjJoaFpFUXhPVWQzUjFvclVFVjNlV2xXTUhoeWRYTnVTVkFLV0Roak1FVjJibGxDWkhOUFNHTkxia3R6UjJsNFJGTkxaVEEyVkZob1ZqRkJWVWxZVERkM2RrUlhiekZvUmxrM2JuRlBRMEZzU1hkblowcFBUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ5TkUxQ0NsbHNTMEV2YlRGb1ZteHZORE50WVU4MFNUZHJObGd3ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVd4aVIwWjFXakpWZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRFVVRCWmVrVXdXbXBzYkU1VVVUQk9iVmt5VGpKV2FGcHFUbWxhUkZsNVQwUlJkMXBYV20xT01sWnBDazVxV1RGTk1rcHJXbFJWZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWmlWMVp6V1ZjMWJscFVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFpiMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZaa0ZTTmtGSVowRmtaMFJrVUZSQ2NYaHpZMUpOYlUxYUNraG9lVnBhZW1ORGIydHdaWFZPTkRoeVppdElhVzVMUVV4NWJuVnFaMEZCUVZsU2RXUlJVbWxCUVVGRlFYZENTRTFGVlVOSlVVUkxhMlUzYjAxVmNGZ0tSbTQyT1d3eWREaEhjRzlRY25GSVpEbERUVVZ5V1UwMVpXSmlXSGxzZFVsb1VVbG5XbEJGUTJsalVWRjRXVUpTVjBNM2RXUlVWRnBDWjNCTWFEbGhVUW8wTmk4cmMzUjZXbU5MU2pjNFMwVjNRMmRaU1V0dldrbDZhakJGUVhkTlJHRkJRWGRhVVVsM1prRlpaa2xGYmxVd2NXMVZNVWh2Y2xWeGRqSkxNRFpaQ2tKMFRVOTVkVlZQTDJWTGRHcFNjM0YzWWt4UFNreFFVeTgyU0dwMFlTODFjMEZSV1ZsSFJXSkJha1ZCZEZVMVJucE9NV2RsV0Vwc1ltZHRhVkpoVEdzS1kwMVFkREZuZUc0MFpHeDZiVVV3TTJWVVMybHJLek4yVERscldWSkpXV2RUWW5ZeU0yeDNLMjVyT1ZnS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1668300481,
          "logIndex": 6962449,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/melange/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/melange",
      "githubWorkflowSha": "44c14f9e5446f67eaf3bd62840eff7eb6653bde5",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3453159672",
      "sha": "44c14f9e5446f67eaf3bd62840eff7eb6653bde5"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

