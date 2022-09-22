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
| `latest` | `sha256:3936d88e7e2b2d6825bedc9538424651b925f0daa89081ee9ec2b9fdc077be0a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:3936d88e7e2b2d6825bedc9538424651b925f0daa89081ee9ec2b9fdc077be0a) |  |



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
        "docker-manifest-digest": "sha256:3936d88e7e2b2d6825bedc9538424651b925f0daa89081ee9ec2b9fdc077be0a"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "b2680f836cacd76ddf1b5e8db61bec13aa3d0e16",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/jdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCaiFfWxuxFfCja+YK5rUzYFIGyip8CNMrnObuEXmaEXgIhAOXeknKCTSTA4ZSJ4i3PH25GJYLE2xWs8iqfnuAazbbB",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJlYWMxNDZjNDY4NTk0NTE3NmI0NWNlMzNmMmMyZDkzMDZjMGNmOTliMWU2ZjBmY2IxYWFkYjYyMzA0YzY5ZGIzIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNmT1ArT0g3aWdRUDVyRmJPS2xNOStsMjhKWXR5UFFudzhVNGFlc2dhZWxnSWdCOTBLQU5sRTJBaUdmaXRlSHRQWGRnWXZndlpoYmtLNUZYV0h5WW5ucDdrPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndha05EUVhsNVowRjNTVUpCWjBsVlVXUnpVWGhTVkdkaWREZHVRWE12VkZobmNTOXlRa1Z6UmxacmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hsTlJFbDRUWHBOZVZkb1kwNU5ha2wzVDFSSmVVMUVTWGxOZWsxNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVVyUlhOUVdXMXNaSE5QZFUxRWExbGphelpIUlRZNWIzVnhjQ3MwVGtoRVlqSldRU3NLWmtSTVkwdG5PRlpIZDI5SE1GSmtRbUU0TlhWbGFFNWlkM0JOYUZOcVlXNUNhM0Z2WW1GSE0yVnpWWGxzTW5KRWFUWlBRMEZyYzNkblowcElUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZwY2psV0NrcHBlVmhEUWt4aFpFNXZNMWg1ZDNkWFEyTmxheTg0ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Y0d0aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdldXcEpNazlFUW0xUFJFMHlXVEpHYWxwRVl6SmFSMUp0VFZkSk1WcFVhR3RaYWxsNFdXMVdhazFVVG1oWlZFNXJDazFIVlhoT2FrRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1Y1ZwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIweENaMjl5UW1kRlJVRmtXalZCWjFGRFFrZ3dSV1YzUWpWQlNHTkJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUkZsMmFTc3pRVUZCUWtGTlFWTkVRa2RCYVVWQk1rbHRkbWh0Vms4M2NIWk9iVE5XZW1aWVFUUUtNVkUyWW1kTWRIbFdjMkV5YUhoaGN6aHNlVTlQT1c5RFNWRkRSWE4wVUVoTkszRXJabXBxVDBaNFIwSktXbFF2WjBFMWJEVjRLMUEzYTFsamRsTkJiQXB6UTJOT1dIcEJTMEpuWjNGb2EycFBVRkZSUkVGM1RtOUJSRUpzUVdwQ2EwdFJWMmdyVDBKUFEzcEdaMnAzVkd0SmVrMTRZMFJZZDFVNE5FTldUblpzQ2pNMlJqSk5PSFZYVDNwemIyeE9NV3BpUXl0WVIyVlFPR0poYmxGaVNtOURUVkZFWTJjMmJVZDRNVk0xV1ZaSGVFMXdWbVphSzNSNVR6ZERkRGxsV1ZNS2RITnFTRFpCTUM5Q2JqVTJZblF6YVhkemVIY3ZURUZVYzNOWFoyY3JPR04zYWxFOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1663812813,
          "logIndex": 3715337,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/jdk/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3102392324",
      "sha": "b2680f836cacd76ddf1b5e8db61bec13aa3d0e16"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

