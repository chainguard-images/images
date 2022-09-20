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
| `1.2.3-r1` `latest` | `sha256:8cffa36082b04d3709ed1d973185fce094db2a53f99f51b102d714129004959a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:8cffa36082b04d3709ed1d973185fce094db2a53f99f51b102d714129004959a) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:8cffa36082b04d3709ed1d973185fce094db2a53f99f51b102d714129004959a"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "ef20bfeb9d1726437d7cebf25634d8bf96409a20",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/musl-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCYEZqCP7ZvtexIwJjssqaSZs6qOtzovNU8tkQz8Ow0IQIgC28Ivu33xE0aNrKkoOBdhxX1lsJSzKfP3bBNlAVNERw=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIzMDlmMWY5MzY5Zjg2YWI0NWE1YTc0MzUwYWNmY2M4YmFiMzFiYjNmNzM2MWE5OTA4MDgyOWI3YzhhNTlkNGQ3In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FTUNIMlJtZzhTOFZSc0phV2JWVW1zN0R1L2lVUXM5Zyt1SUpTeFl4Syt1WHNFQ0lDRk5qSnBtRnBYeWxqQ0RzZFBZZ054TVkzNDRIc1VCUTJ5a091bGNUNFpJIiwicHVibGljS2V5Ijp7ImNvbnRlbnQiOiJMUzB0TFMxQ1JVZEpUaUJEUlZKVVNVWkpRMEZVUlMwdExTMHRDazFKU1VSMFJFTkRRWHB0WjBGM1NVSkJaMGxWUjJsNGEwdEVURmRUVW1VdmRGbG5SRkJXUTJ4V05EZFljVkp2ZDBObldVbExiMXBKZW1vd1JVRjNUWGNLVG5wRlZrMUNUVWRCTVZWRlEyaE5UV015Ykc1ak0xSjJZMjFWZFZwSFZqSk5ValIzU0VGWlJGWlJVVVJGZUZaNllWZGtlbVJIT1hsYVV6RndZbTVTYkFwamJURnNXa2RzYUdSSFZYZElhR05PVFdwSmQwOVVTWGROVkdNeFRucFJNVmRvWTA1TmFrbDNUMVJKZDAxVVozZE9lbEV4VjJwQlFVMUdhM2RGZDFsSUNrdHZXa2w2YWpCRFFWRlpTVXR2V2tsNmFqQkVRVkZqUkZGblFVVXJNUzl1ZEVadFdUY3pZa2huWW1Fd1NHOXBWV1ozVVRobU9HMVVWazF1WkVObGNXZ0tZamRSVG05TmJtcHVObkYyY2xkMVFVcHJTV0V2VWl0NVIzQkdRMU5WTkhsSWMxVnVieXR5Y1cxV1JtZEJabmxtZGt0UFEwRnNaM2RuWjBwVlRVRTBSd3BCTVZWa1JIZEZRaTkzVVVWQmQwbElaMFJCVkVKblRsWklVMVZGUkVSQlMwSm5aM0pDWjBWR1FsRmpSRUY2UVdSQ1owNVdTRkUwUlVablVWVkNTMmx0Q2s5a1ZHUkNZbHBIYUhWRVduazVNV2xQUTBnMU1IZE5kMGgzV1VSV1VqQnFRa0puZDBadlFWVXpPVkJ3ZWpGWmEwVmFZalZ4VG1wd1MwWlhhWGhwTkZrS1drUTRkMkpuV1VSV1VqQlNRVkZJTDBKSFVYZFpiMXBuWVVoU01HTklUVFpNZVRsdVlWaFNiMlJYU1hWWk1qbDBUREpPYjFsWGJIVmFNMVpvWTIxUmRBcGhWekZvV2pKV2Vrd3lNVEZqTW5kMFdraHNkVmxYTVhCWmVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9DbUpYZUVGamJWWnRZM2s1YjFwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFVLV1ZkT01HRlhPWFZqZVRWdVlWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwVm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkZZMGhXZWdwaFJFRXlRbWR2Y2tKblJVVkJXVTh2VFVGRlJFSkRhR3hhYWtsM1dXMWFiRmxxYkd0TlZHTjVUbXBSZWs0eVVUTlpNbFpwV21wSk1VNXFUVEJhUkdocENscHFhekpPUkVFMVdWUkpkMDFDZDBkRGFYTkhRVkZSUW1jM09IZEJVVkZGUkd0T2VWcFhSakJhVTBKVFdsZDRiRmxZVG14TlEzZEhRMmx6UjBGUlVVSUtaemM0ZDBGUlZVVkliVTV2V1Zkc2RWb3pWbWhqYlZGMFlWY3hhRm95Vm5wTU1qRXhZekozZEZwSWJIVlpWekZ3V1hwQlpFSm5iM0pDWjBWRlFWbFBMd3BOUVVWSFFrRTVlVnBYV25wTU1taHNXVmRTZWt3eU1XaGhWelIzWjFsdlIwTnBjMGRCVVZGQ01XNXJRMEpCU1VWbVFWSTJRVWhuUVdSblFVbFpTa3gzQ2t0R1RDOWhSVmhTTUZkemJtaEtlRVphZUdselJtb3pSRTlPU25RMWNuZHBRbXBhZG1OblFVRkJXVTVqUkVnd1ZrRkJRVVZCZDBKSVRVVlZRMGxDWjBVS1pFSm5Sa281YUZGTFdsTkphazVMVldSVlVuWnplRGhYWTBaWlZsbElPSEkzVGs1SU9YZG5Ta0ZwUlVFMUszbHNTMGRxZGpNMGVIUlRlazFyUVV0cE53cFpiVkZxTURWRlFYQjBUM1I1VUVGaGFUTkVNM3BwTkhkRFoxbEpTMjlhU1hwcU1FVkJkMDFFWVZGQmQxcG5TWGhCVERsbWQwUjVaVmhxYTFaWFlTdGFDamQyWWtWNGFUUkxVV1Y1YlZZMGRFdENaa1k1UzBwYVVFazVTVVZ4YVU0MmVUVTBaazVXVlU5TFkxRndhbGRET0dwblNYaEJTWEZCWlZjM1pIaGlhM2tLVVRkTlRqUlZVQzlQYTA4MVNWWkpPVmN4U1V0ak1uVmxTME5WYmt0WU4wRjNlR3NyU0ZGdFQybDZSRzluVFdaTFVEbExNa1pSUFQwS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1663696688,
          "logIndex": 3620571,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/musl-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3092332297",
      "sha": "ef20bfeb9d1726437d7cebf25634d8bf96409a20"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

