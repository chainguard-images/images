# musl-dynamic

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/musl-dynamic/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/musl-dynamic/actions/workflows/release.yaml)

Base image with just enough files to run static binaries!<br/><br/>This image is meant to be used as a base image only, and is otherwise useless. It contains the `alpine-baselayout-data` package from Alpine, which is just a set of data files needed to support glibc and musl static binaries at runtime.<br/><br/>This image can be used with `ko build`, `docker`, etc, but is only suitable for running static binaries.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/musl-dynamic:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `1.2.3-r1` `latest` | `sha256:0226e70cc346ae50706bdf38aaa079db23c00f5d46397ff66eedfbd0f9e7d3db`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:0226e70cc346ae50706bdf38aaa079db23c00f5d46397ff66eedfbd0f9e7d3db) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


## Usage

See the [examples/](./examples/) directory for
an example C program and associated Dockerfile
that can be used with this image.


## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/musl-dynamic:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/musl-dynamic:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/musl-dynamic"
      },
      "image": {
        "docker-manifest-digest": "sha256:0226e70cc346ae50706bdf38aaa079db23c00f5d46397ff66eedfbd0f9e7d3db"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "e0d102c611e7f2aa933303c564122d8a9a09e2f5",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/musl-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCICGCUuM3XKh4/7onp66+PvdjIYKXyIlj1RdXztgCByfmAiBABPR5Flq1t/ZCfiRbAS1lRXyUynIIRe+WW/d9A5fHfw==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJmYmY4MzVkZDdjZGFlMjNiMTMwZjFmNDdjNjBhZjQzNGVhNjBlZjdhNjcxZDBmMDljMzFmNzJhYTM4MGI0MDdhIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJRitiRzY1RHdud0liQWJGZDhuOVJIenlmYk5TdysxRHRYYUlWeTFvRWZKRUFpRUEvdWhJUTVVRU56eVorNXgxS0ZEajJGcndxczhid3FoQTIvVnNmdVgwdXpJPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpWRU5EUVhwbFowRjNTVUpCWjBsVlUxUlNSalpWYUhOa2FFOXhabEJMVm1aRlFqWnBlWG8ySzBnd2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhwTmFrRjVUMFJCTWxkb1kwNU5ha2w0VFVSRmVrMXFRWHBQUkVFeVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVV2UWxReVdISnpibFprTkVOUmIydEhZblJMZFZwc04zQnplVVJZVGt4YVVsUXhSSFFLYjJGTGEyZHpaMlUxWTBOaE1sWlBUbTFKV25WNE1VNWtjemRUVEZKalZrWm9SSEJFZW1GeU1sTlVRMlpCVWxKNFpHRlBRMEZzV1hkblowcFRUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZrYVZOU0NqTnJjbVpSTVROM2NreFVUU3R0Ykc1Ulkza3djM1V3ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKbldVUldVakJTUVZGSUwwSkhVWGRaYjFwbllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVRGak1uZDBXa2hzZFZsWE1YQlplVGgxV2pKc01HRklWbWxNTTJSMlkyMTBiV0pIT1ROamVUbDVXbGQ0YkZsWVRteE1ibXhvQ21KWGVFRmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFFYTBkRGFYTkhRVkZSUW1jM09IZEJVVVZGU3pKb01HUklRbnBQYVRoMlpFYzVjbHBYTkhVS1dWZE9NR0ZYT1hWamVUVnVZVmhTYjJSWFNqRmpNbFo1V1RJNWRXUkhWblZrUXpWcVlqSXdkMFZuV1V0TGQxbENRa0ZIUkhaNlFVSkJaMUZGWTBoV2VncGhSRUV5UW1kdmNrSm5SVVZCV1U4dlRVRkZSRUpEYUd4TlIxRjRUVVJLYWs1cVJYaGFWR1J0VFcxR2FFOVVUWHBOZWtGNldYcFZNazVFUlhsTmJWRTBDbGxVYkdoTlJHeHNUVzFaTVUxQ2QwZERhWE5IUVZGUlFtYzNPSGRCVVZGRlJHdE9lVnBYUmpCYVUwSlRXbGQ0YkZsWVRteE5RM2RIUTJselIwRlJVVUlLWnpjNGQwRlJWVVZJYlU1dldWZHNkVm96Vm1oamJWRjBZVmN4YUZveVZucE1NakV4WXpKM2RGcEliSFZaVnpGd1dYcEJaRUpuYjNKQ1owVkZRVmxQTHdwTlFVVkhRa0U1ZVZwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1oxbG5SME5wYzBkQlVWRkNNVzVyUTBKQlNVVmxaMUkwUVVoWlFXUkJRVWxaU2t4M0NrdEdUQzloUlZoU01GZHpibWhLZUVaYWVHbHpSbW96UkU5T1NuUTFjbmRwUW1wYWRtTm5RVUZCV1ZCVVEwZGpNRUZCUVVWQmQwSkdUVVZOUTBsRGIyZ0tTRk5CZVVFM1ptNTFjakJGWkdsWlpXeEtZMlIyTkVOWmJXWk5TRGx5V2t0c2RVSm1iMDlDU0VGb09XWlhiRWN4TDJ0RE9XTjVRMUJMYUZwNVIwd3hNQXBFUlhoTVFWTXdOMHBYWjJKVlJHUlVTV28wTmsxQmIwZERRM0ZIVTAwME9VSkJUVVJCTW1kQlRVZFZRMDFSUkZoMWJVMWtNMUEwVm5kYVkzVjVORVpaQ25SRFMzQkRSelJGYmt4d00zZDVWVEJ3WkVoNmRUUnljbGxGVjBoQ0wwbE1abTB3ZFRGTFFWWlZabkl3TTBOVlEwMURNMDk0YURSc1JuWjFkMUIyU3pjS2RtbFNUa1J2U1RkdmFuTTJhbWwxTW0xWWFrNW9WV1l4WVRWMFdFMW5iWEZxYVdOeU5sWkhWbGR4WjFGdGJ6aEtMMEU5UFFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1665692927,
          "logIndex": 5049693,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/musl-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/musl-dynamic",
      "githubWorkflowSha": "e0d102c611e7f2aa933303c564122d8a9a09e2f5",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3245459593",
      "sha": "e0d102c611e7f2aa933303c564122d8a9a09e2f5"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

