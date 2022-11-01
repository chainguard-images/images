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
| `1.2.3-r1` `latest` | `sha256:7705e3d1df59bc0de79ed3166f31486121f43d55c1f6a3edf53a2bab8b79eb93`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:7705e3d1df59bc0de79ed3166f31486121f43d55c1f6a3edf53a2bab8b79eb93) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:7705e3d1df59bc0de79ed3166f31486121f43d55c1f6a3edf53a2bab8b79eb93"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "e9170e96bfbc3387929cd9711475de1a85cd3f9f",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/musl-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIGzjIUMa5UVRmqYAWyq54nrRaDusgf825DwNSeonzlGiAiEAzjLLY9BXIu/lh5hHxxBxgh/6YoNOz81IOBrZZg71Plk=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJmYmVhNDdjNGMyYzMxM2NlNzlkYmM5MjExZGZmMzFlNmUyZGE0MjZhNDYwYmI1MGM5YjM4YjQyY2RlMDBkMmI0In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURVMFRsRGFFbjgwK2gwUUZqU3dTTC9KNXFBZFNQNjh1anprUkpJOUxpc0RnSWdEeXRZckdla0I1cG9qdmh5TlNVZnVXMnVHL0xNVVptUm43amRPR1FiL1k0PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBha05EUVhwNVowRjNTVUpCWjBsVlMyMUhhbmQyYVZvdlZGaFVUa3R0WW5JNWNrRlZlR3c1WmlzNGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVhoTlJFbDNUbXBKZUZkb1kwNU5ha2w0VFZSQmVFMUVTWGhPYWtsNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZpWTNWd0sydE9kalF6U0RKRmVIaG9aMFFyYjJKdU9HRklXRloxYm5wMlRYaFJaMWdLUzNOdlpGWmFRbGhaWTFZNFZGWldObkJ0WTBGd2NWZEpTRkowT0dFeVFXSnBLMHB6ZUUxdFlXOVpiRXRhUlVaeVQyRlBRMEZzYzNkblowcFlUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV3TWpjMUNuTmFVRzFuVTFoUmRFcFhZVTF4V0hrelpEUXJXREJWZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKbldVUldVakJTUVZGSUwwSkhVWGRaYjFwbllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVRGak1uZDBXa2hzZFZsWE1YQlplVGgxV2pKc01HRklWbWxNTTJSMlkyMTBiV0pIT1ROamVUbDVXbGQ0YkZsWVRteE1ibXhvQ21KWGVFRmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFFYTBkRGFYTkhRVkZSUW1jM09IZEJVVVZGU3pKb01HUklRbnBQYVRoMlpFYzVjbHBYTkhVS1dWZE9NR0ZYT1hWamVUVnVZVmhTYjJSWFNqRmpNbFo1V1RJNWRXUkhWblZrUXpWcVlqSXdkMFpuV1V0TGQxbENRa0ZIUkhaNlFVSkJaMUZKWXpKT2J3cGFWMUl4WWtkVmQwNW5XVXRMZDFsQ1FrRkhSSFo2UVVKQmQxRnZXbFJyZUU1NlFteFBWRnBwV20xS2FrMTZUVFJPZW10NVQxZE9hMDlVWTNoTlZGRXpDazVYVW14TlYwVTBUbGRPYTAweVdUVmFha0ZqUW1kdmNrSm5SVVZCV1U4dlRVRkZSVUpCTlVSamJWWm9aRWRWWjFWdFZuTmFWMFo2V2xSQmMwSm5iM0lLUW1kRlJVRlpUeTlOUVVWR1FrSTFhbUZIUm5CaWJXUXhXVmhLYTB4WGJIUlpWMlJzWTNrNWRHUllUbk5NVjFJMVltMUdkR0ZYVFhkSVVWbExTM2RaUWdwQ1FVZEVkbnBCUWtKblVWQmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFKUjBwQ1oyOXlRbWRGUlVGa1dqVkJaMUZEUWtoelJXVlJRak5CU0ZWQkNqTlVNSGRoYzJKSVJWUktha2RTTkdOdFYyTXpRWEZLUzFoeWFtVlFTek12YURSd2VXZERPSEEzYnpSQlFVRkhSVTFRUTA1RVowRkJRa0ZOUVZKcVFrVUtRV2xCU0dkcGR6aHJSbVpUT1RVNU1VZExlU3RqTTNaUVdGUlVSVWxGT1c5MlJqVjBSRTlsVTBOU1JGTlpRVWxuWTI5QloxYzRhME50VWpad2Jtc3lZd3BhWTFaUWNqWmFRVlY1VkRWbGJVdFdZMFZxV2xSWmJsaFhUakIzUTJkWlNVdHZXa2w2YWpCRlFYZE5SR0ZCUVhkYVVVbDRRVXhKZFhkTFJEZE5ObGhsQ20xaksyMWpNMDFvZERGSFQydzJWMVp5WmtZMlRtRjJjekkxZVZWV2VWSk9jR0ZvWm5kMGRVOWxlRkJ3UlRCdGFEZEdRVXBTVVVsM1pUSm5SR2h6Vm13S2NqUjRaR28zUlU4NGEyY3JkbXN3TDNrdlVWZGhiRkpPUVVkQ2JscHlNVGh1TXpaT1kzUkViM1JCVlVkVFdHeDFNbkJXV1hWWmF6RUtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1667268420,
          "logIndex": 6263398,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/musl-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/musl-dynamic",
      "githubWorkflowSha": "e9170e96bfbc3387929cd9711475de1a85cd3f9f",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3366215947",
      "sha": "e9170e96bfbc3387929cd9711475de1a85cd3f9f"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

