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
| `latest` | `sha256:cbe08bae8bd699f27c41c3c0e98f8d07c181f0e5ef9ffb00a39cf7f3c198dd4a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:cbe08bae8bd699f27c41c3c0e98f8d07c181f0e5ef9ffb00a39cf7f3c198dd4a) |  |



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
        "docker-manifest-digest": "sha256:cbe08bae8bd699f27c41c3c0e98f8d07c181f0e5ef9ffb00a39cf7f3c198dd4a"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "6d1647cb421bd6374e4ed05446cbd748dbf354f5",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/jdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIG9Rk4az7uP83oRDffo37j2slUaNZxZpGEama5qxDMCHAiEAlrWy0jdfZwAgHkd1dhPbq4V3Rxps2RpmNbv3JA7RwnY=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIyZGM4YjI3NWM4YjllNTM4NjE3MzdhMDYxY2MzNWM0YzA3NmI3MTJjZTk1NWVmNDBjY2FjYmEyOTNiYjk4MWEzIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNUR1I4dEZnVHZDOVBmS0ZMVit3cXVKSUpWTHkreXE3cC85d3R0OSt3ZDhRSWdlUkx0REFTT1RYSlB2SU9FVzUwZVExamgzRm80Q0Q2YndoM0hYbmQzejJFPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnZha05EUVhsbFowRjNTVUpCWjBsVlNUSkVlRTEyUWt4Tk5YUmhZVVppYVhCUE1GcHRTbTEwY21rNGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRSTlZFRXdUMVJKZVZkb1kwNU5ha2w0VFZSQk5FMVVRVEZQVkVsNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVYzVFhsMlNsWktNelFyTWpGWmNFbzJhR1JwYURGWlZuWldVVlpTTW10cVdrTXdUM0FLVldSTlFXb3phMkV6ZEVGalRUY3JiV2gzYkZaeU1UaFRaRXd6Umxoc1VYZFhkbWwzT0ZOVU0xcFhRMnhCZFVOaU5YRlBRMEZyV1hkblowcERUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZTVm5KUUNtSkRZMlJtVWpSNE9YSmxaMHR5ZEN0aWEwWmhVRVU0ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Y0d0aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwVm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkZZMGhXZW1GRVFUSkNaMjl5UW1kRlJRcEJXVTh2VFVGRlJFSkRaekphUkVVeVRrUmthbGxxVVhsTlYwcHJUbXBOTTA1SFZUQmFWMUYzVGxSUk1FNXRUbWxhUkdNd1QwZFNhVnBxVFRGT1Ixa3hDazFDZDBkRGFYTkhRVkZSUW1jM09IZEJVVkZGUkd0T2VWcFhSakJhVTBKVFdsZDRiRmxZVG14TlEwMUhRMmx6UjBGUlVVSm5OemgzUVZGVlJVWlhUbThLV1Zkc2RWb3pWbWhqYlZGMFlWY3hhRm95Vm5wTU1uQnJZWHBCWkVKbmIzSkNaMFZGUVZsUEwwMUJSVWRDUVRsNVdsZGFla3d5YUd4WlYxSjZUREl4YUFwaFZ6UjNaMWx2UjBOcGMwZEJVVkZDTVc1clEwSkJTVVZtUVZJMlFVaG5RV1JuUkdSUVZFSnhlSE5qVWsxdFRWcElhSGxhV25walEyOXJjR1YxVGpRNENuSm1LMGhwYmt0QlRIbHVkV3BuUVVGQldWSlhNaXRSVUVGQlFVVkJkMEpJVFVWVlEwbERNVTVTVFhKamFIZFJiMFJUT1VWTmRVSk1lRFpUT0ROb2NtMEtLMU55T1RoNVFtWXZObTlSWTIweFprRnBSVUV3WkRKSFNrVmhSbXBrT0ZNM1FXVmtTbXRGTmpKSlNVZEVhVVpETVc0NVVYVjJSVXhTSzFkemVrYzBkd3BEWjFsSlMyOWFTWHBxTUVWQmQwMUVZVkZCZDFwblNYaEJTM1I0WlRWUU9EUXhlbFJrYlhGbU4wUmliSG81VTBkVFYyVm1hRGd5UkZOSFl6STVaMGt3Q2pkRFVVcERXblpNTlRCaFVuWnhjM0JKVEVaQmVYcHNhMDFuU1hoQlRGRkxRVmhETVdnMk1tVlVWVzF0YlRSR04xbFlUVFpPTm1Oa2RHSnhTMlJqTW5vS2FITnRhMkpMT0RVd1ZXODNTVkZXTDB0Vk1HTldhMjlNWm0xeVlUbFJQVDBLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1667904563,
          "logIndex": 6721055,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/jdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/jdk",
      "githubWorkflowSha": "6d1647cb421bd6374e4ed05446cbd748dbf354f5",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3418662542",
      "sha": "6d1647cb421bd6374e4ed05446cbd748dbf354f5"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

