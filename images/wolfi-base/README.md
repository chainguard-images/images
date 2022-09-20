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
| `latest` | `sha256:e60c0716a7c1289d48ec030cbb0e337ba146314be0274ff02663f5e5fdb30485`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:e60c0716a7c1289d48ec030cbb0e337ba146314be0274ff02663f5e5fdb30485) | `amd64` |



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
        "docker-manifest-digest": "sha256:e60c0716a7c1289d48ec030cbb0e337ba146314be0274ff02663f5e5fdb30485"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "workflow_dispatch",
      "1.3.6.1.4.1.57264.1.3": "9910cc5f7321205ef0e952abf37578731cc871b5",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/wolfi-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQChAqf8hPLF1t8ze/+dSUD5NRsEvCOE4h/qdSzApxYcuQIgcUkc7cL8z/bez0otLV19cVt7YFE3I3QrUS7OjBgJQ7k=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI0OGY4OTY1MjM2MTg2MjVjZWJkMDdiYjM3YjI4OGVhMTBiY2JhZWJmOTQ4YWJmZjBkMTQyMWU3NDVmMjQzMjczIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURkbTc3cGNTRHZCRzF6U1ducGVVYUU4YmtNYytvQkcxSG1HMkZMVEk1dklRSWhBS1FxbHBmQUQzK1BzQkRmZm15bXB4Z0U2SXpVTHAxUVVOMDgwdCt2ZzFQUyIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlha05EUVhwWFowRjNTVUpCWjBsVlYyaDZaMVoyVW5GVFRHbE5hVUoxV25ST01rbFFUMGhOVmxvMGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hkTlZFbDVUWHBKTkZkb1kwNU5ha2wzVDFSSmQwMVVTWHBOZWtrMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZWUzBRd1F6TjZkMjQxWkhsbk5VSlVNbHBGWjA1NFQzZ3JOWFJYZW1GcWVFMXlUbEFLWVZwWk5uY3ZiRVJrT0hwRlRUSlBOazRyTmpaR1kwOTVOVXNyUlcwclExUkdVbmxESzBkd1pIaDJkVVZvV2poMU9XRlBRMEZzVVhkblowcFJUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlYwY1VsTENpOXBWMUl2YW1GNWJGQjRkMnBrVW5jM2VUSXlOVk13ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BrTWpseldtMXJkRmx0Um5wYVV6aDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwaDNXVXRMZDFsQ1FrRkhSSFo2UVVKQloxRlNaREk1ZVdFeVduTmlNMlJtV2tkc2VncGpSMFl3V1RKbmQwNW5XVXRMZDFsQ1FrRkhSSFo2UVVKQmQxRnZUMVJyZUUxSFRtcE9WMWt6VFhwSmVFMXFRVEZhVjFsM1dsUnJNVTF0Um1sYWFrMHpDazVVWXpST2VrMTRXVEpOTkU1NlJtbE9WRUZqUW1kdmNrSm5SVVZCV1U4dlRVRkZSVUpCTlVSamJWWm9aRWRWWjFWdFZuTmFWMFo2V2xSQmFrSm5iM0lLUW1kRlJVRlpUeTlOUVVWR1FrSldhMkZZVGpCamJUbHpXbGhPZWt3elpIWmlSMXB3VEZkS2FHTXlWWGRJVVZsTFMzZFpRa0pCUjBSMmVrRkNRbWRSVUFwamJWWnRZM2s1YjFwWFJtdGplVGwwV1Zkc2RVMUpSMHhDWjI5eVFtZEZSVUZrV2pWQloxRkRRa2d3UldWM1FqVkJTR05CUTBkRFV6aERhRk12TW1oR0NqQmtSbkpLTkZOalVsZGpXWEpDV1RsM2VtcFRZbVZoT0VsbldUSmlNMGxCUVVGSFJGZDBjSFpRZDBGQlFrRk5RVk5FUWtkQmFVVkJMMEpVVDI0eVpIWUtUSGxwTWtnNU1tNXBOVmhzTkdWWE1USkNiemRKWm5oR1VtVm5ibGxoUVhKMWVFMURTVkZEU2xKRk9FcG9jbGhVTTB4dE1FNXJPVmgwYm1Od1FUZGtlQXBVVjBSb1oxZHVSRFpsZVRBck0xaFRTWHBCUzBKblozRm9hMnBQVUZGUlJFRjNUbTVCUkVKclFXcENVMGgzVEVweE1sSTFhMjk2UjNNNVJFcFpNelp4Q2xoSGJVVnJOa05pY0VKSlVFWlBla1pXY0VsdWFXdzFWbko1Um1RNGFGTlVObmhRUlZFcldFTXhXRlZEVFVSTU1Ib3dUMVJ1Y0hwTU1IRkZPRll2ZUVJS1RHTkJTVTl2U2pGaGFWaG5hbUl6YzJOcmNGZHRkV2hYWm1aelpVWXlZM0I0YUhCQ1dVRmxZbXd4WW5sMlVUMDlDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1663676612,
          "logIndex": 3604485,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/wolfi-base/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3090071648",
      "sha": "9910cc5f7321205ef0e952abf37578731cc871b5"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

