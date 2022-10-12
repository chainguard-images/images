# hello-world

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/hello-world/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/hello-world/actions/workflows/release.yaml)

Hello, world!

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/hello-world:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:f24401e056414debacbc3eeb603d2f3be9c3c026a7182e58148a698c53a01174`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:f24401e056414debacbc3eeb603d2f3be9c3c026a7182e58148a698c53a01174) | `amd64` `arm64` `armv7` |



## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/hello-world:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/hello-world:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/hello-world"
      },
      "image": {
        "docker-manifest-digest": "sha256:f24401e056414debacbc3eeb603d2f3be9c3c026a7182e58148a698c53a01174"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "1c6d1f40e4bf57625e85c57dfc0d86dd04553904",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/hello-world",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDTeGXNsutLRmqrDMXDSNQ3EFbT/eIGR1xjFp/j5LUqtwIhAKmrNQYQYUdEyNw6P9ym/BROY7v2lnNoh5//ww18yCBg",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI1MDk3NTUwMGJhNDU3NjA5ODM2ZGZhMDlmZTQ4NTAyMDQwNTk0MTAwYjcyMTdmYzQ2ODA0OTIwNWY4ODM3MDc3In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQWFTalBDRHRrb2VQOXE2QzN4QUovZ08zMTI5M2QwdEZOOTRyS1A2QU9oZEFpRUEveExwWXJVWFF2ZWVhTk1TYkExa0dVRjBGQlVDVzNzamUvRmgwSk40NWVZPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpWRU5EUVhwaFowRjNTVUpCWjBsVlQxWkhMMUYzTWpkSE9IQmxjM2RQTUhwNWFubHdOVWRYWVVNNGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhsTmFra3hUbXBOTlZkb1kwNU5ha2w0VFVSRmVVMXFUWGRPYWswMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVU0ZVZwUFVWUktSalZ1VEdkUGF6QlpWR05oZEdkd1REQkNTWFZzWmxvMU1rdG1RbE1LVGxGVWVWQjJUbnBUWkhGQkt6WlpSRzFpVmxwQ2RHSkpOV1lyVmxGTWMwZzNWVVZ1Um5oYUwxWmthWEVyYW5Cd01VdFBRMEZzVlhkblowcFNUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZVYTBrMUNpOUZNamRoUzNkUFQwTlZUSEZsVjJsMlZHdG1Ua2xSZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5YUd4aVIzaDJURmhrZG1OdGVHdE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJVMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRVkozWkZoT2J3cE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRFUm1wT2JWRjRXbXBSZDFwVVVtbGFhbFV6VG1wSk1WcFVaekZaZWxVeldrZGFhazFIVVRST2JWSnJDazFFVVRGT1ZFMDFUVVJSZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZExkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVV1JaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWmhSMVp6WWtjNGRHUXlPWGxpUjFGM1NGRlpTMHQzV1VKQ1FVZEVkbnBCUWdwQ1oxRlFZMjFXYldONU9XOWFWMFpyWTNrNWRGbFhiSFZOU1VkS1FtZHZja0puUlVWQlpGbzFRV2RSUTBKSWMwVmxVVUl6UVVoVlFVTkhRMU00UTJoVENpOHlhRVl3WkVaeVNqUlRZMUpYWTFseVFsazVkM3BxVTJKbFlUaEpaMWt5WWpOSlFVRkJSMFI2Ylc5SmRsRkJRVUpCVFVGU2FrSkZRV2xCZW5JclZuY0tRUzg1UTJSelpGSnJiMmw0UzNkdlJVazVTblkxTUhNeWIzTjNXa3BDVnpkeWFtcDNja0ZKWjFsQlNGTnpVblpsVG5Kbk9VOXNlblJhVmxkaU1YUXpZZ3AzT1VJeVNFSXpjMUE1V21SM01IUjRjMU13ZDBObldVbExiMXBKZW1vd1JVRjNUVVJoVVVGM1dtZEplRUZOUVdsQ1EwbE5aelJEWlM5U01HTmlXa014Q2xabE1tWmxVR0ozUzFveVJVTnNSekJ5VEdSNmVIbFFObUZTZFZGRmRIVkJhaXRRZWxOcmNuWlRLMjR6ZEZGSmVFRk9UVWgyYm5wUFZqaElSazFtVlcwS05IWlhUVWQzTkhBMlp5OTJZVWhHVkVVdlRGSXlOSFJsVFROSFQyTnpUME5pTHpKQ2JHNXhRVEpSTlZRclVXUlpiV2M5UFFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1665615416,
          "logIndex": 4990277,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/hello-world/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/hello-world",
      "githubWorkflowSha": "1c6d1f40e4bf57625e85c57dfc0d86dd04553904",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3238428523",
      "sha": "1c6d1f40e4bf57625e85c57dfc0d86dd04553904"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

