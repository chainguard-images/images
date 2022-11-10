# jdk

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/jdk/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/jdk/actions/workflows/release.yaml)

WORK IN PROGRESS

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/jdk:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `openjdk-17` `openjdk-17-20221110` `openjdk-17.0` `openjdk-17.0.5` `openjdk-17.0.5.8` `openjdk-17.0.5.8-r0` | `sha256:78b2d14deafae3a60a72898f410cda21e249d4af7c5317e0b737de29cbbeccfc`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:78b2d14deafae3a60a72898f410cda21e249d4af7c5317e0b737de29cbbeccfc) | `amd64` |
| `openjdk-11-20221109` | `sha256:01ab33f239cb9bab311ba4fe63b1f85864de6dd6d0b3119ea7d5ec638a1e4e5a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:01ab33f239cb9bab311ba4fe63b1f85864de6dd6d0b3119ea7d5ec638a1e4e5a) | `amd64` |
| `openjdk-11` `openjdk-11-20221110` `openjdk-11.0` `openjdk-11.0.17` `openjdk-11.0.17.8` `openjdk-11.0.17.8-r0` | `sha256:31c4733dc8a6957f9dba56f987900c28b3cd949b5a11787682c9898dcc7d6d85`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:31c4733dc8a6957f9dba56f987900c28b3cd949b5a11787682c9898dcc7d6d85) | `amd64` |
| `openjdk-jre-11-20221109` | `sha256:3805ce10c4eae441ff9a27542dd182477256bc18f537698e5551a18684b5b411`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:3805ce10c4eae441ff9a27542dd182477256bc18f537698e5551a18684b5b411) | `amd64` |
| `openjdk-jre-17` `openjdk-jre-17-20221110` `openjdk-jre-17.0` `openjdk-jre-17.0.5` `openjdk-jre-17.0.5.8` `openjdk-jre-17.0.5.8-r0` | `sha256:a9d6a64a94aaa91df669f7c882719d26052f9f6c0cdaa6ddffeb018878c838c6`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a9d6a64a94aaa91df669f7c882719d26052f9f6c0cdaa6ddffeb018878c838c6) | `amd64` |
| `openjdk-jre-11` `openjdk-jre-11-20221110` `openjdk-jre-11.0` `openjdk-jre-11.0.17` `openjdk-jre-11.0.17.8` `openjdk-jre-11.0.17.8-r0` | `sha256:1716238d84fbfc88eed5b06471194edf4092e94d2c4df4e31cc49b6d3a0f3100`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:1716238d84fbfc88eed5b06471194edf4092e94d2c4df4e31cc49b6d3a0f3100) | `amd64` |
| `openjdk-17-20221109` | `sha256:ad0036b87381b5a8a91f92be081b5b1a0027f88f52f87664a82b1820c29fe564`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ad0036b87381b5a8a91f92be081b5b1a0027f88f52f87664a82b1820c29fe564) | `amd64` |
| `latest` | `sha256:eb0f469d04afe86315c7aa4ba9a4dd42e06098f73a707842b7c95e63ba4edac4`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:eb0f469d04afe86315c7aa4ba9a4dd42e06098f73a707842b7c95e63ba4edac4) |  |
| `openjdk-jre-17-20221109` | `sha256:35f2836f1afa57fa1064e481d2e10e14c756b98a7a54a37cfdf138ebc564342b`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:35f2836f1afa57fa1064e481d2e10e14c756b98a7a54a37cfdf138ebc564342b) | `amd64` |



## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/jdk:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/jdk:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/jdk"
      },
      "image": {
        "docker-manifest-digest": "sha256:eb0f469d04afe86315c7aa4ba9a4dd42e06098f73a707842b7c95e63ba4edac4"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "3ffc1ed12894f048cd611d891bf3a129902f0c08",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/jdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIC18oBcGcOZVlorfVvROFAB/OtFMZNCigqcCQZNiKjQfAiEAvFiXIorcLCcEV6BfT9JaZ3ipGBNNI4jKKl99M094ygA=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI3Yzc0NDQ3YmU4NjM1YTk5YTNlYTFjMDQ2YjE5YjY4MDVhMWVmYzVkYjhhMzI0MDg5YWUwNzUxOTU0YWEwZWQ3In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNzMWtKUVg5MUVjSS9nVWZBMUltek9HVXJkTFljQWw4V0xreEhGUm5ENmFRSWhBTGRscFJLZ08rNlhPb0NTV1I3MFFzTkxTdjgrVDEzOTA3QjA3RlgvUkZBQiIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndSRU5EUVhseFowRjNTVUpCWjBsVlNXNXRTRFJ4YTNsRVVsVXJTM0U0U3pCV2ExWkxXbmwxUjBkSmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlhkTlJFVXhUbFJCZDFkb1kwNU5ha2w0VFZSRmQwMUVTWGRPVkVGM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVV3TURNeFdEUk5OVzF5VkdoREsyczFjazlWTjA5aldHOVNiVVpOY0VkdFNUVXlURGNLY0ZJeGNGUnJOSGQ2VjFWamVVNUxWVFkyTW5ZNFMxaFZjbk55ZEZOWVdqVjNaWEpXYzBjeVZWcENMME5YTjBsWFUwdFBRMEZyYTNkblowcEdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZGZG5Nd0NtTnBLM0F3Y21wa2VGTTJja2N3ZWxwc1ltZ3ZiMGc0ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Y0d0aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdlRUSmFiVmw2Um14YVJFVjVUMFJyTUZwcVFUQlBSMDVyVG1wRmVGcEVaelZOVjBwdFRUSkZlRTFxYXpWTlJFcHRDazFIVFhkUFJFRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1Y1ZwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwcENaMjl5UW1kRlJVRmtXalZCWjFGRFFraHpSV1ZSUWpOQlNGVkJNMVF3ZDJGellraEZWRXBxUjFJMFkyMVhZek5CY1VwTENsaHlhbVZRU3pNdmFEUndlV2RET0hBM2J6UkJRVUZIUlZoNk9XcEVVVUZCUWtGTlFWSnFRa1ZCYVVKalpGZ3hOMVUwVldkc1ZsUnZMekpOUm5GVlNFVUtlRmg0TkdoNlYxcG5ObUl5TmpaWU5VMXlXbmw0WjBsblQySTNSMFZNUkdGbU5YUkdPVzFYU0dzeVRsSXJlakIwVkVwc1ZqTlZUekJ2T1ZkdVRqaHlUQXBzY2poM1EyZFpTVXR2V2tsNmFqQkZRWGROUkdGQlFYZGFVVWwzVkZKbGFreExibWhLY2tNM01sZFhUVVpRWTFrelZVTnpZaXR6Wm1ScGVUZHhXalJLQ2pKdFkzUlVaVGRDY1d0TmVGVk9UREJJWTJSYU9EZHZRa3RDVDFSQmFrVkJhMUF5ZFhGMWQwaFFkbTVYWWtFclJVUnVNWEI2TlRrdlQyNUZiVlpqYTJJS05HUjVSMGxGTUd0dU5XdFFOeTk2U1d4alRHUjJTaTlTYms5VGVrRkpjVmdLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1668045303,
          "logIndex": 6806896,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/jdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/jdk",
      "githubWorkflowSha": "3ffc1ed12894f048cd611d891bf3a129902f0c08",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3433336870",
      "sha": "3ffc1ed12894f048cd611d891bf3a129902f0c08"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

