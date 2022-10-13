# wolfi-base

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/wolfi-base/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/wolfi-base/actions/workflows/release.yaml)

WORK IN PROGRESS

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/wolfi-base:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:a0b32ab3849d792324eaf1a7fb515876eb870b2fe1aa74089ffcc919466c2738`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a0b32ab3849d792324eaf1a7fb515876eb870b2fe1aa74089ffcc919466c2738) | `amd64` |



## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

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
        "docker-reference": "ghcr.io/chainguard-images/wolfi-base"
      },
      "image": {
        "docker-manifest-digest": "sha256:a0b32ab3849d792324eaf1a7fb515876eb870b2fe1aa74089ffcc919466c2738"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "0ff5cb11c8340e1519e675ef97736771748e83dd",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/wolfi-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCICN+XPoaFquLpgdoTj0pO43hMjZ9RolukWxNkDAnegaOAiBjAGT1X56hL69FKAZFwrFV1dwEdbX47SEbz2vQ+a8bEw==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI3ZmM5YzcxZjZmMzNjYzliZjY5ZWZhNDBhNDViNDdkN2Q5YjY1MzViMjYzY2QzYjY2N2QxODM1N2M3YWU0MjkxIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJRG1aNm5GVGY1U1hZbkFId1ZMaWlQblBQZ1JnRHVOV0tvYUdaREpMeEJiRUFpRUF5Qm1kSjFicnd5T051bjQ2alhaZWdETThNTGhpUk16d3FpNEhGdVJBWkwwPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlha05EUVhwaFowRjNTVUpCWjBsVldVeG1hRGxLWTBSMlpITm1Ta1pZWlRoRlZtUmFSRmRuYmxGTmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhwTmFrRjVUMFJGTTFkb1kwNU5ha2w0VFVSRmVrMXFRWHBQUkVVelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVV3T0VSbGFtdDNiRWhXTmtsR1pVWTRWRzVNVGtVMFIxSk1iWGhVYlU1bVkwa3JkblFLWkZaTk1XZzRLMEY2TDFKbFpHVkNTbE16T1ZGV1YyMUtLekpJTWpSdE5YazFhM1poTHpkYVlubHlUVGhpZVhCcFZ6WlBRMEZzVlhkblowcFNUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZFYWtKVkNuTlpSemhuV0hKSmFscDZjVGc1WWtsV1p6WjRXa2RKZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKQldVUldVakJTUVZGSUwwSkhTWGRaU1ZwbFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6WkhaaVIxcHdURmRLYUdNeVZYWk1iV1J3WkVkb01WbHBPVE5pTTBweVdtMTRkbVF6VFhaamJWWnpXbGRHZWxwVE5UVlpWekZ6Q2xGSVNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcEJOVUpuYjNKQ1owVkZRVmxQTDAxQlJVSkNRM1J2WkVoU2QyTjZiM1pNTTFKMllUSldkVXh0Um1vS1pFZHNkbUp1VFhWYU1td3dZVWhXYVdSWVRteGpiVTUyWW01U2JHSnVVWFZaTWpsMFRVSkpSME5wYzBkQlVWRkNaemM0ZDBGUlNVVkNTRUl4WXpKbmR3cE9aMWxMUzNkWlFrSkJSMFIyZWtGQ1FYZFJiMDFIV20xT1YwNXBUVlJHYWs5RVRUQk5SMVY0VGxSRk5WcFVXVE5PVjFadFQxUmpNMDE2V1ROT2VrVXpDazVFYUd4UFJFNXJXa1JCWTBKbmIzSkNaMFZGUVZsUEwwMUJSVVZDUVRWRVkyMVdhR1JIVldkVmJWWnpXbGRHZWxwVVFYRkNaMjl5UW1kRlJVRlpUeThLVFVGRlJrSkNlR3BoUjBad1ltMWtNVmxZU210TVYyeDBXVmRrYkdONU9UTmlNbmh0WVZNeGFWbFlUbXhOUWpCSFEybHpSMEZSVVVKbk56aDNRVkZaUlFwRU0wcHNXbTVOZG1GSFZtaGFTRTEyWWxkR2NHSnFRMEpwZDFsTFMzZFpRa0pCU0ZkbFVVbEZRV2RTT1VKSWMwRmxVVUl6UVVGb1oydDJRVzlWZGpsdkNsSmtTRkpoZVdWRmJrVldia2RMZDFkUVkwMDBNRzB6YlhaRFNVZE9iVGw1UVVGQlFtYzVUVWxyYlRCQlFVRlJSRUZGWjNkU1owbG9RVTAxTVd0WmRpc0tOa2QyV2xsdUx6WjZia1o2VEdkd05EUjNPRTlQYVVST2VteGlibEIwTVhSRlVVdzNRV2xGUVd0dU9XdERLMGd6VkZOdVdVZFBTVUp0ZWtKNWIzVjNaZ3BTU1U1eFlrNXpTWEl5Y1RCM1QzWTNNRkZ6ZDBObldVbExiMXBKZW1vd1JVRjNUVVJhWjBGM1dYZEpkMGRSTkU5bVlrNXpSMFF4WmtWMmVVeG9iRkJOQ2pkUU0yeDJOMDk2TUdwa1YwdDVWalZxWjFFdmREQjJUWGxVYmpaRFV6bFRPV3N2UlV4M1l6RnZkMDV4UVdrNFFsWjBNV2RHTkhoS01tUnZZa05qUkRJS2VXZzNOMVZaYTNWWWRIVkNUMFY2YjJkUVJuRTRaR1ZyVlU5bGRWZHJUWFJPTW1GWmMybFpTVE5TVW5Sb1p6MDlDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1665692902,
          "logIndex": 5049632,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/wolfi-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/wolfi-base",
      "githubWorkflowSha": "0ff5cb11c8340e1519e675ef97736771748e83dd",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3245464287",
      "sha": "0ff5cb11c8340e1519e675ef97736771748e83dd"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

