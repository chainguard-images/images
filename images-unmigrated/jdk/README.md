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
| `latest` | `sha256:d8f435ffab139985ab2d505031c8507fc25eedbae0f91bc71edc1914029263da`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:d8f435ffab139985ab2d505031c8507fc25eedbae0f91bc71edc1914029263da) |  |



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
        "docker-manifest-digest": "sha256:d8f435ffab139985ab2d505031c8507fc25eedbae0f91bc71edc1914029263da"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "bea6468f5bce06f453e7b63ae44b377091389fbd",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/jdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQC45K0XhD7335iyCIPN9faLIvHsyLggvCViG//Yeq+uswIgGaa/1kUtQ+TF8V8/P/mg4eYGAuyFTzNfzcWbbPvm5Nw=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJjNjM1YzRkMGViNDgyMjUyN2YzZDFhY2NhNmVlOWUwY2U3NjVmYTMxZTVjMDRjMDBjMmUyYjcwNGNkZjE3YTNhIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJRXlUbUhwS3AwQVNGN0JxWkgxSUUxWi8wd25BaGpMVllXY1N1cnV6YVVzZkFpQklrUUpNVk42dFlFMXlQWWN5WjlCdER2SU5YMmhGbXUwRmlDVkxWZlJRdEE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnZWRU5EUVhsbFowRjNTVUpCWjBsVlVtNDBVMmQxUkRSMWRHRmpSV1p3T1VaSGRGUkpTVkUyY1hwUmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlROTlZGa3hUVlJOTkZkb1kwNU5ha2w0VFVSRk0wMVVZM2ROVkUwMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZCY1Zod2JucG9hVTgyZEc5VlNEZEtZek5vYlcxWmJWVk9TSFJLZGxwVlNXcEZOa2NLVTJadVQzWTRWMjVFVjFOTldGa3hiaXRST0ZSa1dqaE1kMFpHV21sUk1YZzRiMHR0U21aaGJuaFJXakZSVUdobE5tRlBRMEZyV1hkblowcERUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ4V0ZKQ0NuZFlaVUZNYm5Gc09VZEdLMEphVmtsaWNDdEVZWEZWZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Y0d0aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwVm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkZZMGhXZW1GRVFUSkNaMjl5UW1kRlJRcEJXVTh2VFVGRlJFSkRhR2xhVjBVeVRrUlpORnBxVm1sWk1sVjNUbTFaTUU1VVRteE9Na2t5VFRKR2JFNUVVbWxOZW1NelRVUnJlRTE2WnpWYWJVcHJDazFDZDBkRGFYTkhRVkZSUW1jM09IZEJVVkZGUkd0T2VWcFhSakJhVTBKVFdsZDRiRmxZVG14TlEwMUhRMmx6UjBGUlVVSm5OemgzUVZGVlJVWlhUbThLV1Zkc2RWb3pWbWhqYlZGMFlWY3hhRm95Vm5wTU1uQnJZWHBCWkVKbmIzSkNaMFZGUVZsUEwwMUJSVWRDUVRsNVdsZGFla3d5YUd4WlYxSjZUREl4YUFwaFZ6UjNaMWx2UjBOcGMwZEJVVkZDTVc1clEwSkJTVVZtUVZJMlFVaG5RV1JuUVVsWlNreDNTMFpNTDJGRldGSXdWM051YUVwNFJscDRhWE5HYWpORUNrOU9TblExY25kcFFtcGFkbU5uUVVGQldWQnRNalpZVmtGQlFVVkJkMEpJVFVWVlEwbFJSRWhLSzJSM1VGRlFNR3ROVWtONGJHWlFhbWcwYzFremJXSUthWEZuU0RreFZWQndhVkJJWVVWcmJqVlJTV2RhUzBGQlJFMW9RbVpXVWxGQ2IzTnNTVkV4V1ZoMWJFTXhOalE0ZVhFNU56SllLMEpLTUZsRVJIUlJkd3BEWjFsSlMyOWFTWHBxTUVWQmQwMUVZVUZCZDFwUlNYZGxjME5VTUUxRmNtMTVRMjlaVFhGWVlsTmplVTAyWlVSNVdsQkxla1puYlZkTVVXOUNjalYzQ2tWT1dtWnVUR3hLVTIxcWIzQmhiRTFxTDJ4NFUxcFNha0ZxUlVGdldYaHdOV3hYVTNoaVIxRm9ZbkpOZVdGS1ZsRk9la2h6TjJwUmJqQnBLMWRKV1hJS1UyazJZbE5tTWpsR1JVNDJXR3hRWjBGM2FWRTFSbVJyY21aRGNRb3RMUzB0TFVWT1JDQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENnPT0ifX19fQ==",
          "integratedTime": 1666025499,
          "logIndex": 5290854,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/jdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/jdk",
      "githubWorkflowSha": "bea6468f5bce06f453e7b63ae44b377091389fbd",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3267003773",
      "sha": "bea6468f5bce06f453e7b63ae44b377091389fbd"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

