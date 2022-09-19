# wolfi-base

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/distroless/readme-generator
-->

[![CI status](https://github.com/distroless/wolfi-base/actions/workflows/release.yaml/badge.svg)](https://github.com/distroless/wolfi-base/actions/workflows/release.yaml)

WORK IN PROGRESS

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/wolfi-base:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:060de21681ffacff82a970f1693dc9b156b8a1bfce2280bf064756c12bcc2d39`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:060de21681ffacff82a970f1693dc9b156b8a1bfce2280bf064756c12bcc2d39) | `amd64` |



## Signing

All distroless images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/wolfi-base:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/wolfi-base:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/distroless/wolfi-base"
      },
      "image": {
        "docker-manifest-digest": "sha256:060de21681ffacff82a970f1693dc9b156b8a1bfce2280bf064756c12bcc2d39"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "58998ffc9e5b3575a7abf03e6889b514e73c0416",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/wolfi-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIG8xTYJ4PxxF8n5qnNaYndH7P9m86tt67iRIZIoFB4imAiBD+tyhblOGbp2RtGgbo2aH1jn7FyXe5cuEePz4w+lvag==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJhMTdjMzA2Mzc2ZTUyZDk0MDdhMGU5ZTdhNTAzZDJmNTQzNDJjYjZiNmI2OTdhMGYzNDY2Yjc5MDBlNzJlZjk3In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJRTJJNVVNSHI3cHFodVVMOEpHMmJCMTdLcm54NlVLbFJGSzJ6UmNkcmt5Q0FpQTBPUUlhZUpFTnA1T3kydTdwNHY5ai84aVNOeU9HcDB4MHZudlZQV0VNcFE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnZla05EUVhseFowRjNTVUpCWjBsVlZqVjJVV0o1VURWdVQxSnlZVmxWY21sVEt6bFBhV3hwZWpCRmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRWTlJFbDNUVVJOTUZkb1kwNU5ha2wzVDFSRk5VMUVTWGhOUkUwd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ0TVZvM2NWUmxSazR4UVhWM2EweE5ZVWRwWjNwVVdIQjNSRzVWWVVKNmRsQm5LM2tLWVVjeE5tUTVlVXhvUlRJME5YTmlXVkpTUVZkT2RUaFJWeXR6TTNCTEx5dEdZbmQwV25GemMxRlZPSEJOVWxsR1NYRlBRMEZyYTNkblowcEdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlU0U0M5MkNsVkdiakpFWjFwRVNuUlRUV1pTYkVZcldraEVNQzg0ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BrTWpseldtMXJkRmx0Um5wYVV6aDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdlRsUm5OVTlVYUcxYWJVMDFXbFJXYVUxNlZUTk9WMFV6V1ZkS2JVMUVUbXhPYW1jMFQxZEpNVTFVVW14T2VrNXFDazFFVVhoT2FrRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2EyRllUakJqYlRseldsaE9la3d6WkhaaVIxcHdURmRLYUdNeVZYZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwcENaMjl5UW1kRlJVRmtXalZCWjFGRFFraHpSV1ZSUWpOQlNGVkJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUkZVemJrMU9kMEZCUWtGTlFWSnFRa1ZCYVVGNVoyWTRORWs0TTFsWVMycEVlRm8xZFRaNmFuVUtWV0ppYjNCdGExbHJOMFpGZVZsRVJrRTNTa3M1UVVsblRHTTJNa2x3ZVdkTmNpdHRUVzlUZW5Bclp6UjNiVFYxZDBGRE1GQk1ibFJETmtWS2MxcDBiZ3BUTmpSM1EyZFpTVXR2V2tsNmFqQkZRWGROUkZwM1FYZGFRVWwzUVROelJYYzJiR05yWW5oTk1YVTBSV1J5WjBzNVprNXJTVEJ5WW1SRVlUVkJaakpOQ2tJMmFWaGxVRGxwTjFveWFWSnlMMDFVWjFWVmFucFBOSGg2VmpOQmFrSjRXSGMxVFVReFVuVlBlakV5U1dKWk5UTk1SR2x4TlhjM2VtMTZZalV4TDJFS1RHTjNaa3h1UTFCU1drTkxUR042YTNOcWMydDNkU3R3V0UxcVJHbDNZejBLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1663552838,
          "logIndex": 3531385,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/wolfi-base/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3079462967",
      "sha": "58998ffc9e5b3575a7abf03e6889b514e73c0416"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

