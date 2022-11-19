# python

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/python/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/python/actions/workflows/release.yaml)

This is a minimal Python image based on Alpine, using Python apks available on the Alpine Community repositories (not built from source as of now).<br/><br/>While this image is being developed, we will stick to the latest stable Python version which at this moment is `3.10.7`. Supported versions in the long term are TBD.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/python:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `migration` `migration-20221119` | `sha256:bd5fb01c0e49167e21f2a4be26a1e58262b391813bed99bb7fd81a1ec2457974`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:bd5fb01c0e49167e21f2a4be26a1e58262b391813bed99bb7fd81a1ec2457974) | `amd64` |
| `latest` | `sha256:eadfa3f6ec49e83ea9c87023606ee8a01fa8678acae8cf294aaf923d76f034cf`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:eadfa3f6ec49e83ea9c87023606ee8a01fa8678acae8cf294aaf923d76f034cf) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `migration-20221118` | `sha256:0012ef5bfc2d6791c962b1cc99cc2c2934cf216ca5937c9eb2a80935c8ad898a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:0012ef5bfc2d6791c962b1cc99cc2c2934cf216ca5937c9eb2a80935c8ad898a) | `amd64` |


## Usage

To try out the image, run:

```shell
docker run --rm cgr.dev/chainguard/python python -VV
```

Python version installed 
```
Python 3.10.7 (main, Sep 11 2022, 22:42:41) [GCC 12.1.1 20220630]
```

Pip Version installed 

```shell 
docker run --rm cgr.dev/chainguard/python pip -V
```

```shell
pip 22.2.2 from /usr/lib/python3.10/site-packages/pip (python 3.10)
```


## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/python:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/python:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/python"
      },
      "image": {
        "docker-manifest-digest": "sha256:eadfa3f6ec49e83ea9c87023606ee8a01fa8678acae8cf294aaf923d76f034cf"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "49008a89c99fe59a98db0aa9b850d9f64a8bff7b",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/python",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCID5wGgoOQhlCxMrgxZv9VJ7mqzu9irtK9/VOjnF62NP2AiEA6emuP+zY/0D/qrNa28AMCN6OzAFs015hXu+MPEfjpZI=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI4YmVjNGU3MTgyYTVlYmZlZjM1YjRjMzQwNThmYjgxMGJkNzcxOTFkMDY0NDExOGI3NWI5OWVhODc3YmIxNjNmIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJRmcvc1huVldOdU1wTlRuZ1JxdGpDeGtsSjh2d3BuRzVMVnQzcC92alUyaEFpRUF0blBGU005cDFoSFJXMVV2bXU2VDBIQmlkWUwwQllvallMWjNxUXBjb0JVPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhWRU5EUVhwRFowRjNTVUpCWjBsVlFrWXhVbXd5U25reFkySkxUVEJ6Tmt3eE5ISlhaVEEwZFZsSmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlRWTlJFVXdUbXBGTVZkb1kwNU5ha2w0VFZSRk5VMUVSVEZPYWtVeFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZOYUROalNIRmpUbFJUYjNWUlowaHpVREJyUXk5UWFrUklhRmQwZHk5cGJUSjVPR1lLVGtaeU9YSkxTM0ExYUZKaEszRnNORlpvTjNwdk1ITmhTakE0YzNaamJFaFBSMVpFZW1weFlYUlpWRVZLUXpOcU9FdFBRMEZyT0hkblowcE1UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZtY0RkSENrZ3dLMWgxZDJOdmFUSjBNR2RUV25CSFRXSXhVbHBaZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGQldVUldVakJTUVZGSUwwSkdOSGRZU1ZwaFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UWpWa1IyaDJZbWs0ZFZveWJEQmhTRlpwVEROa2RtTnRkRzFpUnprelkzazVlVnBYZUd4WldFNXNURzVzYUdKWGVFRmpiVlp0Q21ONU9XOWFWMFpyWTNrNWRGbFhiSFZOUkd0SFEybHpSMEZSVVVKbk56aDNRVkZGUlVzeWFEQmtTRUo2VDJrNGRtUkhPWEphVnpSMVdWZE9NR0ZYT1hVS1kzazFibUZZVW05a1Ywb3hZekpXZVZreU9YVmtSMVoxWkVNMWFtSXlNSGRHWjFsTFMzZFpRa0pCUjBSMmVrRkNRV2RSU1dNeVRtOWFWMUl4WWtkVmR3cE9aMWxMUzNkWlFrSkJSMFIyZWtGQ1FYZFJiMDVFYTNkTlJHaG9UMFJzYWs5VWJHMWFWRlUxV1ZSck5GcEhTWGRaVjBVMVdXcG5NVTFIVVRWYWFsa3dDbGxVYUdsYWJWa3pXV3BCWTBKbmIzSkNaMFZGUVZsUEwwMUJSVVZDUVRWRVkyMVdhR1JIVldkVmJWWnpXbGRHZWxwVVFXMUNaMjl5UW1kRlJVRlpUeThLVFVGRlJrSkNhR3BoUjBad1ltMWtNVmxZU210TVYyeDBXVmRrYkdONU9YZGxXRkp2WWpJMGQwaFJXVXRMZDFsQ1FrRkhSSFo2UVVKQ1oxRlFZMjFXYlFwamVUbHZXbGRHYTJONU9YUlpWMngxVFVsSFNrSm5iM0pDWjBWRlFXUmFOVUZuVVVOQ1NITkZaVkZDTTBGSVZVRXpWREIzWVhOaVNFVlVTbXBIVWpSakNtMVhZek5CY1VwTFdISnFaVkJMTXk5b05IQjVaME00Y0Rkdk5FRkJRVWRGYWxwRFpFcDNRVUZDUVUxQlVtcENSVUZwUVcxcGJXOVlkblo0YURSc2JYY0tSVkZzTUhkRVIwcFJOVlkwTUVaNlIwSm9UVXRGVlZnMGIyaFlkV1JCU1dkWlFVVlViM2hyVUZGM1ExVXdWVU5XTmtGRVZ6ZHdOM3A2VTFwSFFYZGpSZ3BqY3l0VmRXRnVlazEwVVhkRFoxbEpTMjlhU1hwcU1FVkJkMDFFV25kQmQxcEJTWGRTUkZSSFNtbG1ia2hDYzBzclIweDZZWFIwVjNaV1pXczVTMWhOQ25kUVNFc3hSbUU0YzNscFpWbFFXVzlTTldORWVFUkJhV2h2U2pKM2VsWktXbUpOZUVGcVFWVmFlamd4VEhVelRISnRNWEJFYjFKc1pHMWxWaTl5YnpFS2MxVkRaV0ZUUnpRMk1GRktRWEJVWmpWTFlrMDBURUpTSzI5NlFrazJRMDF3Y2tRNFVsaHpQUW90TFMwdExVVk9SQ0JEUlZKVVNVWkpRMEZVUlMwdExTMHRDZz09In19fX0=",
          "integratedTime": 1668822398,
          "logIndex": 7385598,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/python/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/python",
      "githubWorkflowSha": "49008a89c99fe59a98db0aa9b850d9f64a8bff7b",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3501509847",
      "sha": "49008a89c99fe59a98db0aa9b850d9f64a8bff7b"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

