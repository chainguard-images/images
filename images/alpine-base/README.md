# alpine-base

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/alpine-base/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/alpine-base/actions/workflows/release.yaml)

Alpine base image built with [apko](https://github.com/chainguard-dev/apko). Uses packages from the [Alpine distribution](https://www.alpinelinux.org/).

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/alpine-base:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:80be104c5b7f1ce65f42b780234090802f311e491b5e62155a2d766486eda41b`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:80be104c5b7f1ce65f42b780234090802f311e491b5e62155a2d766486eda41b) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


## Usage

```
docker run cgr.dev/chainguard/alpine-base echo "hello"
```

See the [examples/](./examples/) directory for how
to use this as a base image.


## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/alpine-base:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/alpine-base:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/alpine-base"
      },
      "image": {
        "docker-manifest-digest": "sha256:80be104c5b7f1ce65f42b780234090802f311e491b5e62155a2d766486eda41b"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "d38fe620fdd0c389d1e9b28cf94a1647b3ac0026",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/alpine-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIDclTRw8vHeJTVcbcto+9c3Rj2YElfYXpisOHnbNfx9cAiEAz/UWLS9Fn9qo4T7/ox5m0TrMdLomANDjB6Ab/tmGpto=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI5YzNkNmE3ZDkwNDRkNGYyMWEzMWM0ODQ5MmJmMjgzMjIwMTE4YzM2MzAzN2MwNWNiNGVkY2FmNjAyZDdkZjY4In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNTZGRvcm8zUzRNN1JTakhrZ2VUMFVVRFp2dXRzRE1CYnhYeGU3cEJPa21nSWhBSnltNGtCblEyK2l3dXNvcTZZNnV0cTNFejBUZUZxSXVSdFo0eWYxOVdGVSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpWRU5EUVhwbFowRjNTVUpCWjBsVlN6Vk1SMUZaVG1OVE5rWndjRkJwV2sxck5HMW5hV0l6V1dWVmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRSTlZFRXhUVVJWTVZkb1kwNU5ha2w0VFZSQk5FMVVSWGROUkZVeFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVYwUkdsbE9WZ3lObWRNYlZOU2NHdHpibU55UTBKdlNVcGpTRloyZVRacWVITkVVaklLT0ZKa05ETk1TVEpWWmxkSFoxQjVUM2xKYlVwVVpreHdkRlZVYUZKblJYUmFMM2RsYzIxdVR5OVZRbUZGZWtwNmEzRlBRMEZzV1hkblowcFRUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlU0UjNKekNraHNjM05YWWxaeGN6QlZhVlo0VVRneVdUQlBkRUpaZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Um5OalIyeDFXbE14YVZsWVRteE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJVMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRVkozWkZoT2J3cE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRIVVhwUFIxcHNUbXBKZDFwdFVtdE5SMDE2VDBSc2EwMVhWVFZaYWtrMFdUSlpOVTVIUlhoT2FsRXpDbGxxVG1oWmVrRjNUV3BaZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZExkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVV1JaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWlpWM2gzWVZjMWJFeFhTbWhqTWxWM1NGRlpTMHQzV1VKQ1FVZEVkbnBCUWdwQ1oxRlFZMjFXYldONU9XOWFWMFpyWTNrNWRGbFhiSFZOU1VkTFFtZHZja0puUlVWQlpGbzFRV2RSUTBKSWQwVmxaMEkwUVVoWlFUTlVNSGRoYzJKSUNrVlVTbXBIVWpSamJWZGpNMEZ4U2t0WWNtcGxVRXN6TDJnMGNIbG5Remh3TjI4MFFVRkJSMFZXZERGUk1sRkJRVUpCVFVGU2VrSkdRV2xGUVRCUFYwOEtPV3R5YVhKQ2FsUlhjWGxvTkRkWlowMXVVR1Z1YlU1cFFpdEJSM1Y1ZEROMlNrUXlkSEZSUTBsQ09YYzBha2hHYm5wMkwyRjFiM1ZPTUVreWNqQk5lZ3ByTTA0NVNrMTJhbU12VUZsck16SnVlbVJCU0UxQmIwZERRM0ZIVTAwME9VSkJUVVJCTW1kQlRVZFZRMDFSUTNGeWRqRnRia3RxV1hGRU1YWmFSVlJ2Q2tKVGVIcE5jbWRHV21OWlYwaFlRMmR6ZUc0M1JFUkhibXQxUmk5M1pFbHRhRXR3U1VKVlVqUXhkeTlXVGtoVlEwMUhiVUprTlRkMlduQXpRbEZyVkU0S1FtOU9aR2hoZDBoSFNtWlZZMkU0VTFwcGFYWnBUa1F5YVV4cVlWUXZSRGcyUVV0Q01tVlNLMVExVEVvMFoxQlpiMEU5UFFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1667904680,
          "logIndex": 6721240,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/alpine-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/alpine-base",
      "githubWorkflowSha": "d38fe620fdd0c389d1e9b28cf94a1647b3ac0026",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3418689881",
      "sha": "d38fe620fdd0c389d1e9b28cf94a1647b3ac0026"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

