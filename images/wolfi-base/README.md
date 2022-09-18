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
| `latest` | `sha256:ba17347b92f3cd915a1ee25ba515b69caac7f8fe809359e5120dea1837ef0e06`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ba17347b92f3cd915a1ee25ba515b69caac7f8fe809359e5120dea1837ef0e06) | `amd64` |



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
        "docker-manifest-digest": "sha256:ba17347b92f3cd915a1ee25ba515b69caac7f8fe809359e5120dea1837ef0e06"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "7132c1565a373d72e1c35890bcc044648fb939db",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/wolfi-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIF6cv23VdTjae1OYTa+AzYrGgGmFTM2lLJ46JhPclgH9AiAR4BXEAKa5i+xZhp4dyM1ePGDCqWIKQz30fGfPdwMGKQ==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJjNjdlNTJmNWM3YWMxM2NlNjFhZTMwYTI1ZTJhZmNlYWJlNzI2YWUzZjA1ODJhY2I0M2Y0MzU2MDUwNmQ3N2I2In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQ1Uyd3R2UnM5d3F2M3k1TkdITTY0djBpc21VQURjZXBrWWkxSnhoOUkyM0FpQXFTRnUvQk82SVNoaWZ3d2RFdkRQYnpaUC9hbC9adlRJNGV6cU52UCtXd3c9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndSRU5EUVhseFowRjNTVUpCWjBsVlZsTlFWVE0xYmtOTFdXTkJXRVpQWldoWWRVRTBOeTlrWjBKQmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRSTlJFbDNUbXBCTTFkb1kwNU5ha2wzVDFSRk5FMUVTWGhPYWtFelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVU0VTFsNE5ESXlVSFl2UW5SUFUxaFhMMlZHWmtwVGIxcG9jV051WXpJMWJXUkllbm9LVDNKRWVUaFJOVWxXUW1GalNuQmhPWG80Y2pOUlZGRm1TMVkxYVUxUk1YcERabFZJYlVwMmIyRlFUSGRRUVV3dlN6WlBRMEZyYTNkblowcEdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ3VGtaSkNrMTVja0UwZVhORVlVMUtkMUpVUkdjNWNVWkZOV05CZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BrTWpseldtMXJkRmx0Um5wYVV6aDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdlRucEZlazF0VFhoT1ZGa3hXVlJOTTAweVVUTk5iVlY0V1hwTk1VOUVhM2RaYlU1cVRVUlJNRTVxVVRSYWJVazFDazE2Ykd0WmFrRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2EyRllUakJqYlRseldsaE9la3d6WkhaaVIxcHdURmRLYUdNeVZYZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwcENaMjl5UW1kRlJVRmtXalZCWjFGRFFraHpSV1ZSUWpOQlNGVkJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUkZSc2FVZFpaMEZCUWtGTlFWSnFRa1ZCYVVFM1NubHpXVlpDZUVKNk5tTjZaMjVoYW1OR1NXY0tWRFkwY2psa1YxZHVTWGt3VjJnMVEyd3ZXbmN6VVVsblNqaDJWekZ1V0hoQ1NFOVdSR1JFUkc1aE5GbGxjRUphYjI5R1dVRlNUMEVyV2xwbmNVeEpUZ3BNTnpoM1EyZFpTVXR2V2tsNmFqQkZRWGROUkdGQlFYZGFVVWw0UVZCcFYxSlpkRkpNZEdKM1kwWlRhalZQWlVKRVNXd3pkMEZaWTJ3MFltUndZVGRzQ2xjMk5qY3ZiVlZZUWxjd2NXaE5aVXhEUWxOeGJrZHdOWEl6TDFkeVowbDNSREZVUVRBd1FscHpaazFyZUVSc1ZIVlNNbEZZV2s5eGRHaEthUzlUVkdFS2NWcEdZbEpHVUZOa1dHOXRTbGRqVGs5TVVWUjJWbEp4VTFSTVUydG9UMm9LTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1663466775,
          "logIndex": 3527910,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/wolfi-base/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3075518358",
      "sha": "7132c1565a373d72e1c35890bcc044648fb939db"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

