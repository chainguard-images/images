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
| `latest` | `sha256:2ef8a8ffd71c2a178dda6c239cf01da9b7fa6cd9e73d5e6cbb40191ee2346c28`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:2ef8a8ffd71c2a178dda6c239cf01da9b7fa6cd9e73d5e6cbb40191ee2346c28) |  |



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
        "docker-manifest-digest": "sha256:2ef8a8ffd71c2a178dda6c239cf01da9b7fa6cd9e73d5e6cbb40191ee2346c28"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "9d756ba72482cb7ab44990e0616974c12c5e2dfd",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/jdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIHRAAw94RobXPO9IMEfxrrmc0QXBNbIFmrEZu7VXI3kAAiEAwcW3fgAItK6d9jaYHswc7RGKv5D2iMaTP6cQ2ee4wKo=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJiYzU1ODU4NjcwMmIzNzkzYWRjNGI1MjAyOTNmYTU5OTUzMjJkZTZkZWMzNzcxNWY0ZmNhNWQwMjg1ZTFiYWRlIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURTUTNBY1doZG5NcFZpWVNkcmp4Nm1tOWxCbXNxNzVYQytJRERnYnpXd0pRSWhBT0lRQldCNzNmMXgyTWFVRW1RMGIxRFpVeUxZMnB0bklHZTM1Mjg3YkVxOCIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndSRU5EUVhsMVowRjNTVUpCWjBsVlNYQjZPVEYyUkhaaWNuUTNWWHBwSzFKcVRYVnlOWHBQYVZrNGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hwTlJFbDVUa1JKZUZkb1kwNU5ha2wzVDFSSmVrMUVTWHBPUkVsNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZUVlhONFNqTkRPVFZGZFhJd1ZDdERReXRZUW1sMk16UkhLek50WldoYVZEUkdVMUFLYVU5RFFrZDBSMDlWY1ZWMU1qWmFRV3hSTWxkd1JGSkhkMmx5V1dkSGRXWnNWRTgzWVVNeVFrMUdVekZoVTAxRlpHRlBRMEZyYjNkblowcEhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ4YkdsWUNuRkllR0ZUVW5SMlUwOVdVekY2TkVwc1pFZEpXa05KZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Y0d0aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdlQxZFJNMDVVV21sWlZHTjVUa1JuZVZreVNUTlpWMGt3VGtSck5VMUhWWGRPYWtVeVQxUmpNRmw2UlhsWmVsWnNDazF0VW0xYVJFRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1Y1ZwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwdENaMjl5UW1kRlJVRmtXalZCWjFGRFFraDNSV1ZuUWpSQlNGbEJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUkdGRGEwRnRkMEZCUWtGTlFWSjZRa1pCYVVJMlJtNDNUREZrWkhSRlRtdEpaRTl0TVdKVUsya0tVMlJ3Y2pscE9FZDZka0ZvZEdWdmVUaFhkMGROUVVsb1FWQjZaa3cyY0V0cEwzQlFVbXA2ZWk5eVdFcG9ZMjVzUWpWSFRYbDJkMlJPWkdORldDOVljUXA0WlN0S1RVRnZSME5EY1VkVFRUUTVRa0ZOUkVFeVkwRk5SMUZEVFVKUmMwNUNUbGN4VGpScWRsTktiM1ZDUm1aSmVHeE1iR0psV25wa2QxUnBkVmwyQ2xKamJISmpXVmRYV1VVd1puUTNNa1Y2VEZoNFoybEJhR1F3TDBORlowbDNaRUpuYUhoMWNFaEdOM05RWmpKdk5XZDVhUzlWWm1abWJHOXVUamxVT1RjS2NETkxWMjRyY1V0TU1UQlpiazlTWkVGS1NDOVJPVGhHUlU5MWJVdHRabXNLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1663899862,
          "logIndex": 3783152,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/jdk/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3110001863",
      "sha": "9d756ba72482cb7ab44990e0616974c12c5e2dfd"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

