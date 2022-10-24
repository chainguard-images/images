# busybox

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/busybox/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/busybox/actions/workflows/release.yaml)

Container image with only busybox and libc (available in both musl and glibc variants). Suitable for running any binaries that only have a dependency on glibc/musl.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/busybox:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `1.35.0-r2-glibc` | `sha256:a76760a49c6966fa0516404736d7949299433d959ab9910d841e2e3a0f301d48`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a76760a49c6966fa0516404736d7949299433d959ab9910d841e2e3a0f301d48) | `amd64` |
| `1.35.0-r3-glibc` | `sha256:c393a37e3a3279e766063c653580ee4fa12d5b9558482580e8daf1c9ea5bba37`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c393a37e3a3279e766063c653580ee4fa12d5b9558482580e8daf1c9ea5bba37) | `amd64` |
| `1.35.0-r27` `latest` | `sha256:b4258a3e34d94fea7ff3a7b96a3e5d92e87c0455304336ad8408538f0e7a8a12`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:b4258a3e34d94fea7ff3a7b96a3e5d92e87c0455304336ad8408538f0e7a8a12) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r25` | `sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |



## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/busybox:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/busybox:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/busybox"
      },
      "image": {
        "docker-manifest-digest": "sha256:b4258a3e34d94fea7ff3a7b96a3e5d92e87c0455304336ad8408538f0e7a8a12"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "e7a6e9e83c4ceb2610d5b145f09b7559d495d938",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/busybox",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIFnPe+bVJYQOJ9/Eyt7DifsW/jekUmRP24lqkwWLIk9PAiEAwKAqETyZRVuzZKuUxafGIy5epZMKhX7UDN9P9zYYEso=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJmMDE5YTlhZjRlZmMxYTYwMDAzOTEzZjg3ODYyMWVmZmIzNjAzNDNhNWY3OWFhYjQ0N2E3NDlhY2VhZWQ3YWYzIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURzTjlvWHZxNDF4QXR4Z09KMWZLa3BlSGdKZy95TnVxZnRCK21MVXlKdzFRSWhBTnlha045RTlaV1FPWUY4a1ZhWXQvVldnUURtWXREOGRvdTZvL2xFS0NwSiIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlWRU5EUVhwVFowRjNTVUpCWjBsVlRrdG1PRkU0TWpoS1ZsSXZWVGRLUjJnelRXTkpkVE5TWW5acmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1RCTlJFRXhUbnBKZVZkb1kwNU5ha2w0VFVSSk1FMUVSWGRPZWtsNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZtTmxCR2NEWTFiWGhPZWpoSlEwTm9abWxQVjJobUwwbGlNbTFGWTFoTGJXTlBhSEVLYTIxQ1NUQjVLMmxYVkZsQk5XVkdNaTlCUkhNelEweExNalpRU0RoeFpVMTNSVGh0UVVaSFpVcEZRelZqUkZsMlltRlBRMEZzVFhkblowcFFUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZGYnpZMkNtVkhVVUZRYVhOVVEwOVRNRVEzWm1WNU1rbENTMFJSZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5U2pGak0yeHBZak5uZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRIVlROWlZGcHNUMWRWTkUweVRUQlpNbFpwVFdwWmVFMUhVVEZaYWtVd1RsZFpkMDlYU1ROT1ZGVTFDbHBFVVRWT1YxRTFUWHBuZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWlpibFo2WlZkS2RtVkVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFpjMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZabEZTTjBGSWEwRmtkMEZKV1VwTWQwdEdUQzloUlZoU0NqQlhjMjVvU25oR1duaHBjMFpxTTBSUFRrcDBOWEozYVVKcVduWmpaMEZCUVZsUlNHWnZWa1JCUVVGRlFYZENTVTFGV1VOSlVVTnNhVlV3Um5OaFFsZ0tUbXBYZUZaWlZXNWhlV2d2TTI5Q2NFazJVazRyZUhOWVlsb3dVaTl0WkVWS1owbG9RVXhLZVVKNFNGWmtjVVZoTkVoT2NGWlNia1p5U3pnNWJqSlNTZ3BDWjFSV05saDJNRUpqUTJzdlpua3dUVUZ2UjBORGNVZFRUVFE1UWtGTlJFRXlZMEZOUjFGRFRVZERSbWRpTlVVeVFqbEhMeXR6YzJWUVVEQmhXQ3REQ25WeGNFSjVNMkZ1V1Rabk5ISmthMHRVY0U5cVQyVlVNVXhIU0dwQ1QxaEhTamhKVEhkcWQyVXdkMGwzU1RJNU9EWmFRVzUxVDFwMlFUQXlkakJGUlRZS1JYWkZkVlZ3ZW5GalYxWm5NWGRrYmt4UFNrZDJaRnBNYUZwa1lYbGFXWFJHYTNOaE16TkROblJPYjJZS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1666573061,
          "logIndex": 5729984,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/busybox/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/busybox",
      "githubWorkflowSha": "e7a6e9e83c4ceb2610d5b145f09b7559d495d938",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3309249279",
      "sha": "e7a6e9e83c4ceb2610d5b145f09b7559d495d938"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

