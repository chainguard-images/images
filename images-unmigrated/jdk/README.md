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
| `latest` | `sha256:c64c572c2b9447786727e24ffe0ab951a4db57e37874b86794ea09114e6b1232`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c64c572c2b9447786727e24ffe0ab951a4db57e37874b86794ea09114e6b1232) |  |



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
        "docker-manifest-digest": "sha256:c64c572c2b9447786727e24ffe0ab951a4db57e37874b86794ea09114e6b1232"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "b5bb4362c5575a2df7d3048c82c36e79dd355a8d",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/jdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIDpEv8wVNeoiyMCx4V/usmVn0YGGywbEs0sxEYlmHOXyAiEAxQWPXhDbLdi3UH9erDc8Ggld7LYkgoCvsjTzG4Y0T2Q=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJjM2EwZmRiZjc4ZTAwODYyYWVjZjBiZjg0OWYwNDkyOGMyYzNhYmRhODE4MGZiNzM2MTg2ZDE3NWQzYzk0OWQ5In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUN5M1FYWG9CMEhVVVNHYjBoSWpaMEZQQndGU2lKckxXbnlVME8xTE9jUVBBSWdEbXltQ21LNjhnZXhEU21XV3FwSUtobCs0U1RSN3RrNjF4cnl4UHJobGI4PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnZla05EUVhseFowRjNTVUpCWjBsVlZIVkdRalJNTmxaNVJWazJlVkUyVWk5bE9EUmFOMWxIUlRZd2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1RCTlJFbDZUV3BWZDFkb1kwNU5ha2w0VFVSSk1FMUVTVEJOYWxWM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVYyY200eVVEZGtWakI0WkhaUVdrWjZZM2xTYVZKTk1qbGFOVmQyUjNSblpDdG1jVThLYzNoNk5IWk1iazl5TVUxWVRuUm5lV05rTWpkNFEwZzRaRk5PZVdGcVZ6RjFaWEJzWnpOMmNYWlpRVVZWZVZkQ1ozRlBRMEZyYTNkblowcEdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZrVTBnd0NqTjNTU3RzTVNzMk0yaGlaWEpYV1ZaelpFMVNkR2xqZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Y0d0aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdldXcFdhVmxxVVhwT2FrcHFUbFJWTTA1WFJYbGFSMWt6V2tSTmQwNUVhR3BQUkVwcVRYcGFiRTU2Ykd0YVJFMHhDazVYUlRSYVJFRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1Y1ZwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwcENaMjl5UW1kRlJVRmtXalZCWjFGRFFraHpSV1ZSUWpOQlNGVkJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUlVJNVdISlhVVUZCUWtGTlFWSnFRa1ZCYVVKMWNDdFlSMHgzZEd4b01HZzRjRGc1T0hWTFQwY0tLMjlKWWk5T1ZIQkJXblpZVVhWdWJrZzVhWGgyZDBsbllWTmFaR2RKTVM5cU1Vd3hNVTVQVVVFMksxaENOMVkwUmt4cVlUQXlPR0pzUVZVd2JFWTNjZ3BSTWxsM1EyZFpTVXR2V2tsNmFqQkZRWGROUkZwM1FYZGFRVWwzVUhSTU5FaFBPREZtUmtaelZsaDRTaXRwUXpkM1RFeDBNSFY2WVc1T2JsRnNXWFp2Q2xSWFkwZHdSMncyWjBRNU9EbFZlbVpNT0doUmVTOXVUM0JPU1ZGQmFrSmxlSEkzUjNGYU16TXhWSGxRUVRobVJWWm1SSEpxWldGUVlrc3lVa3BMVEZFS01GTlRWVGxzYVZJM2FVaDFSMUZaY0ZkWFZGaElLMU5EVVVaWlJHaFVXVDBLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1666578771,
          "logIndex": 5734050,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/jdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/jdk",
      "githubWorkflowSha": "b5bb4362c5575a2df7d3048c82c36e79dd355a8d",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3309572630",
      "sha": "b5bb4362c5575a2df7d3048c82c36e79dd355a8d"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

