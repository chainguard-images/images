# postgres

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/postgres/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/postgres/actions/workflows/release.yaml)

WORK IN PROGRESS

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/postgres:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:31ffd1ad303a0ccda30746546ae89fd768ed4e60ff93825b34116a8eb2d0c551`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:31ffd1ad303a0ccda30746546ae89fd768ed4e60ff93825b34116a8eb2d0c551) | `amd64` |


## Usage

## Running PostgreSQL

The only mandatory environment variable needed by the PosgreSQL image is `POSTGRES_PASSWORD`

To test and __not__ persist PostgreSQL data run...
```sh
docker run -e POSTGRES_PASSWORD=password -ti --name postgres-test cgr.dev/chainguard/postgres:latest
```

Alternatively, to persist PostgreSQL data you can mount a volume mapped to the data folder
```sh
docker run -v $PWD/data:/var/lib/postgresql/data -e POSTGRES_PASSWORD=password -ti --name postgres-test cgr.dev/chainguard/postgres:latest
```

In a __new__ terminal exec into the running container and use the PosgreSQL to create a DB and Table
```sh
docker exec -ti postgres-test bash
```

Connect using the postgres user
```sh
su postgres
```

Create a test DB
```sh
createdb test
```

Connect to the test DB
```sh
psql test
```

Create a table
```sh
CREATE TABLE accounts (
	user_id serial PRIMARY KEY,
	username VARCHAR ( 50 ) UNIQUE NOT NULL,
	password VARCHAR ( 50 ) NOT NULL,
	email VARCHAR ( 255 ) UNIQUE NOT NULL,
	created_on TIMESTAMP NOT NULL,
	last_login TIMESTAMP
);
```

List the tables
```sh
\dt
```

You should see the newly created `accounts` table
```sh
          List of relations
 Schema |   Name   | Type  |  Owner
--------+----------+-------+----------
 public | accounts | table | postgres
(1 row)
```


## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/postgres:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/postgres:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/postgres"
      },
      "image": {
        "docker-manifest-digest": "sha256:31ffd1ad303a0ccda30746546ae89fd768ed4e60ff93825b34116a8eb2d0c551"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "9b9d9da6597da51482eea8791f877381b0f914fa",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/postgres",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIEnvqhh7xNJ7c8M7rp7RsKMw1AvUXV/SQ9DNiVPzZ1i2AiBNdlLCXV0UuuE9dzLeP0wJZHuxsFlZWx5r+CCmWm5XJg==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI3YWU2N2Q5MzM5NDFmZGZmOWYwN2NjZDU1NDliYTZhN2ZlZWMwNDNmMzM2MGQ3ZGIzYmY5MmE2N2U0NmQ0ZWFhIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJRW5kVm1PbFh2NDlSQXFqZVRwTjgvcXdDSUFTVTlvT0RRaVZNOFV6dzVETUFpRUF1NVJQYXphc05seStiMTRKRnhzTnd0S2d1Tk9JRkhmSlZ2U01GSURhcG5RPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlWRU5EUVhwVFowRjNTVUpCWjBsVlVIcHhZMGhCTDIxaVlsRTBUa0ZCT1VOd1YxTlZPREZHWTNWVmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRCTlJFVXhUV3BCZWxkb1kwNU5ha2w0VFZSQk1FMUVTWGROYWtGNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZwUlZWSlZtSlZWbXRTY205aFpVWkVUVzgwY1dWUU1XUkhTVlEzYW5keVp6SmFWQzhLVURCNk5qbEhNRlJsTm5sRk0ySnRaak5tV1ZscWRURlNVR2xZYkhCSGFIWnJZV1pOYms5eGN6ZzRRMFZIYlVadU5UWlBRMEZzVFhkblowcFFUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZhYURSc0NsRldkWFo0VFVnMGMzSkVlRk5rUnpGRFFVOUZNSFozZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGbldVUldVakJTUVZGSUwwSkhRWGRZYjFwallVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UW5aak0xSnVZMjFXZWt4NU5XNWhXRkp2WkZkSmRtUXlPWGxoTWxwellqTmtla3d6U214aVIxWm9ZekpWZFdWWFJuUmlSVUo1Q2xwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1QxRlpTMHQzV1VKQ1FVZEVkbnBCUWtGUlVYSmhTRkl3WTBoTk5reDVPVEJpTW5Sc1ltazFhRmt6VW5BS1lqSTFla3h0WkhCa1IyZ3hXVzVXZWxwWVNtcGlNalV3V2xjMU1FeHRUblppVkVGWFFtZHZja0puUlVWQldVOHZUVUZGUTBKQmFIcFpNbWhzV2toV2N3cGFWRUV5UW1kdmNrSm5SVVZCV1U4dlRVRkZSRUpEWnpWWmFteHJUMWRTYUU1cVZUVk9NbEpvVGxSRk1FOUVTbXhhVjBVMFRucHJlRnBxWnpOT2VrMDBDazFYU1hkYWFtdDRUa2RhYUUxQ2QwZERhWE5IUVZGUlFtYzNPSGRCVVZGRlJHdE9lVnBYUmpCYVUwSlRXbGQ0YkZsWVRteE5RMmRIUTJselIwRlJVVUlLWnpjNGQwRlJWVVZIYlU1dldWZHNkVm96Vm1oamJWRjBZVmN4YUZveVZucE1NMEoyWXpOU2JtTnRWbnBOUWpCSFEybHpSMEZSVVVKbk56aDNRVkZaUlFwRU0wcHNXbTVOZG1GSFZtaGFTRTEyWWxkR2NHSnFRMEpwVVZsTFMzZFpRa0pCU0ZkbFVVbEZRV2RTTjBKSWEwRmtkMEl4UVU0d09VMUhja2Q0ZUVWNUNsbDRhMlZJU214dVRuZExhVk5zTmpRemFubDBMelJsUzJOdlFYWkxaVFpQUVVGQlFtaEZRbGRvYVZsQlFVRlJSRUZGV1hkU1FVbG5WbVJJU0dwUFNTOEtUV1JFUW5aMGJWUm5aa3RZTDNZelpFRlFhSFZaVTFCWlNGbERTV3BuU0RORE4yOURTVUpsZVdaWVdrUnlNbUU0ZUhaa1pWSlVTWGRvTjNaS1FXcERWQXBCUkZSYVpUZGpWRUkwTDNSb01taFBUVUZ2UjBORGNVZFRUVFE1UWtGTlJFRXlZMEZOUjFGRFRVUk5aRTB6ZFVKbU56bHhlVEJOTUZoVmRFcGtjRGg2Q2pWVFZXUnRMMjFZV2xSNVpUaFlZMWt5TUhSRlV6QnNOREZtUkRWWE0xcFpOaThyVWtWRWMyeHpkMGwzWkVVdk1FbHFXRTk1ZW1KRmIyZGhkVTVIY1U0S0syMVlkVXhLZVU4NU1HRnNaVGxSTUhNNWJYbzVkM05KV1hONWVWY3hlRmMxWjNCS05GVm9RVGd4U1dFS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1667526727,
          "logIndex": 6460655,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/postgres/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/postgres",
      "githubWorkflowSha": "9b9d9da6597da51482eea8791f877381b0f914fa",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3390642319",
      "sha": "9b9d9da6597da51482eea8791f877381b0f914fa"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

