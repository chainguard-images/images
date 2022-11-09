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
| `latest` | `sha256:5cc5fd570d00e0365f53cb5b71ff37b2d129456faf05054637a469ab5b0bcecc`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:5cc5fd570d00e0365f53cb5b71ff37b2d129456faf05054637a469ab5b0bcecc) | `amd64` |


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
        "docker-manifest-digest": "sha256:5cc5fd570d00e0365f53cb5b71ff37b2d129456faf05054637a469ab5b0bcecc"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "5d364edfcaf5fa4fc16a47425a232491590c96d3",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/postgres",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIAK01uiCkOPzraPP3178LIWZC9c5O/8o0d6cK72JAijNAiB1Aq3aSQTlt/09vUkmyfC/TFb1tYwxgagBLhMLpfEviA==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJkZjlkYmIzNDU5ZWVjN2RlOWU1MzA4ZGZiMmZkODA4MzhmMTQ1Y2RjY2I3ZTliMWFkODFiZDMwZTdjYWM2MjZmIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJRFVVK1NuMlVjYVN4bDR6VmNXdDRYV1dhemRyeUo0dXJ1Z2JRMUVsOWpFU0FpRUEvcE9ZcENmcnZGQmIwWDFWZHJGTDkyWm5CT3c5RWlMUzhWaVl0KzY0UUNjPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlha05EUVhwVFowRjNTVUpCWjBsVllqaGtPRlJGZG1wTllYbzNOVUYyV21KQ1VWVlhXbGxVU0hscmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRWTlJFVXhUWHBCTkZkb1kwNU5ha2w0VFZSQk5VMUVTWGROZWtFMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZFVURsNlptSnBiMmRqVld0cFZEZEtVRlZuZUVrM1N6Vm1aMGcwVW5ScVREaGxabUVLTUdwSGNtUk5XaXM1ZG5acmQyMURSbU5OUXpCdGJtVldlaXRsZEd0QllVWlFVUzgwVWpCU1NUSkRWSE5IYTNoUmJXRlBRMEZzVFhkblowcFFUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZyWWxSaENrSnllRnAwY1RreVFsUTFWMlk1TVhSTlVYbHFNbWR6ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGbldVUldVakJTUVZGSUwwSkhRWGRZYjFwallVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UW5aak0xSnVZMjFXZWt4NU5XNWhXRkp2WkZkSmRtUXlPWGxoTWxwellqTmtla3d6U214aVIxWm9ZekpWZFdWWFJuUmlSVUo1Q2xwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1QxRlpTMHQzV1VKQ1FVZEVkbnBCUWtGUlVYSmhTRkl3WTBoTk5reDVPVEJpTW5Sc1ltazFhRmt6VW5BS1lqSTFla3h0WkhCa1IyZ3hXVzVXZWxwWVNtcGlNalV3V2xjMU1FeHRUblppVkVGWFFtZHZja0puUlVWQldVOHZUVUZGUTBKQmFIcFpNbWhzV2toV2N3cGFWRUV5UW1kdmNrSm5SVVZCV1U4dlRVRkZSRUpEWnpGYVJFMHlUa2RXYTFwdFRtaGFhbFp0V1ZSU2JWbDZSVEpaVkZFelRrUkpNVmxVU1hwTmFsRTFDazFVVlRWTlIwMDFUbTFSZWsxQ2QwZERhWE5IUVZGUlFtYzNPSGRCVVZGRlJHdE9lVnBYUmpCYVUwSlRXbGQ0YkZsWVRteE5RMmRIUTJselIwRlJVVUlLWnpjNGQwRlJWVVZIYlU1dldWZHNkVm96Vm1oamJWRjBZVmN4YUZveVZucE1NMEoyWXpOU2JtTnRWbnBOUWpCSFEybHpSMEZSVVVKbk56aDNRVkZaUlFwRU0wcHNXbTVOZG1GSFZtaGFTRTEyWWxkR2NHSnFRMEpwVVZsTFMzZFpRa0pCU0ZkbFVVbEZRV2RTTjBKSWEwRmtkMEl4UVU0d09VMUhja2Q0ZUVWNUNsbDRhMlZJU214dVRuZExhVk5zTmpRemFubDBMelJsUzJOdlFYWkxaVFpQUVVGQlFtaEdiMWhWVVd0QlFVRlJSRUZGV1hkU1FVbG5aWFZLUjJkTE5YQUtXR1k0U3psQmFHWjRTRzExTm10S09FUlhNRWxGUVZGWkswdEtWSE55Y1hZclYxbERTVVZySzBoSU56RkdOa1J5U0RGdFVtOVphRUZFUlZaUmVqVkpUQXAwTVZwclNtaFZlVkY1U0N0WU9YazVUVUZ2UjBORGNVZFRUVFE1UWtGTlJFRXlaMEZOUjFWRFRVWk9LMjlFU1daRk5IaEZXRE50ZFdsTVUybGpWRVJKQ2pCMGRIWmlTME0zTjJwUFdWVXlSM2hFV0VGdWRGYzRVVm8yUkhOMlZWZzNSMnhPUldJclEwSkRRVWw0UVVzMVNWSm5iVU41V1N0bU1VOTVOa2N3V1hRS05HTkhLelJhY1ZFeGFYbG5ZVnBNTTJObUsybFZUWHBPYXpGRFJrZzVkVlI2VkhSa1NVWkJNSFp2Wnk4d1p6MDlDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1667958795,
          "logIndex": 6758108,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/postgres/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/postgres",
      "githubWorkflowSha": "5d364edfcaf5fa4fc16a47425a232491590c96d3",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3424690571",
      "sha": "5d364edfcaf5fa4fc16a47425a232491590c96d3"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

