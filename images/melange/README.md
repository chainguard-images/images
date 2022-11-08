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
| `latest` `v0.1.0` | `sha256:f5f5f386d5b82685904a96542cfce58a10f949587ddc9b467a4913aa382df64e`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:f5f5f386d5b82685904a96542cfce58a10f949587ddc9b467a4913aa382df64e) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:f5f5f386d5b82685904a96542cfce58a10f949587ddc9b467a4913aa382df64e"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "75f83a8474e84b75906bb1a21cab944667f5f422",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/melange",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIHMf8HReU3FU5EBn1hU81BoCh79H7uvbU/S1423kiCllAiEAt3CBnck7sGNOffHUtZ7gPwpQyKK77xpRFmV57GcvHxY=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJlZTA5OGY4ODliNzAzZDdlNjVkZGNlMDVkZDEyMGRmNDY1YjViNzU0ZGIwN2UyYzQ3Nzc5MjRhMGY5YjQxMWY4In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURzdjR2MEY5UHVETW1COFhJYS9qeVhwcUlYbzZaL3FoZW9BVXFpdHJxeVd3SWdXQVVlTktTaWtnSHV5NkVFZmNmelBlaDJGRFZyUVFLWUdBdDdNZW9BZENrPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlSRU5EUVhwTFowRjNTVUpCWjBsVlQyRnZhRXBzUldoemNUWlpiVzVyUnl0cVpXRjJVWEZzYkZrNGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRSTlJFRXdUMVJCTlZkb1kwNU5ha2w0VFZSQk5FMUVRVEZQVkVFMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ0VDJaaFZVVndaMUZMVkhkNk5rZElWbVJyUzBzellWRXhNWFJKYzFoc01scE1XR01LY1hGdVFUZHZPSGR0TDBaNldtWXpjMFJUUW1aUVJsRkRPRFZyV0U1SE5taDZTV3hqYTNsYWMxaGhURFowVURKUGNIRlBRMEZzUlhkblowcE9UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV4ZUc1SkNsTTJUVEJyTTNSNVYxWktjMVF6Y1dGSGJsUkxOR1JOZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVd4aVIwWjFXakpWZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRFWXpGYWFtZDZXVlJuTUU1NlVteFBSRkpwVG5wVk5VMUVXbWxaYWtab1RXcEdhbGxYU1RWT1JGRXlDazVxWkcxT1Yxa3dUV3BKZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWmlWMVp6V1ZjMWJscFVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFphMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZaWGRTTlVGSVkwRmtVVVJrVUZSQ2NYaHpZMUpOYlUxYUNraG9lVnBhZW1ORGIydHdaWFZPTkRoeVppdElhVzVMUVV4NWJuVnFaMEZCUVZsU1ZYUnRRVVZCUVVGRlFYZENSMDFGVVVOSlJrUnRhbnBHV2tseU5Fa0tkMDExUlROSWRHVklWMjU2WWpCUGVWWnhibTU1UlZWU1lWQmhMemR2V1hGQmFVRnpjM28xWm5wUlNuY3ZTMWRQY1hocWRVNU9iV3RzVFdGRFVtSXlZZ28wV1haeGNqWmlhMGhTVWs5dFZFRkxRbWRuY1docmFrOVFVVkZFUVhkT2IwRkVRbXhCYWtWQk5YcE1TbVpIU1dKRVdFOHZOazlwVkVVeGJFc3ZiRkZNQ2xOSE5saFhPVVV2YVZZck1IZG5NMVJGTkVoWE5VNUNiekJMTUZCNVVtSTJNRXc0U1VJM1pWTkJha0kxYVhacVpUUkpSR3BuTW5oVFJVcFlhVE15UkNzS1YwRnRNbTgwUlRaa2VrWnNXV2hUZUZneFFXa3daVzF2WW5GVVIwNDVWbFF6U1ZjeU1XNHJaa1p6VFQwS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1667868558,
          "logIndex": 6703263,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/melange/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/melange",
      "githubWorkflowSha": "75f83a8474e84b75906bb1a21cab944667f5f422",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3415300551",
      "sha": "75f83a8474e84b75906bb1a21cab944667f5f422"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

