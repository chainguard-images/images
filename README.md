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
| `latest` | `sha256:3b36d443c38a678f925ba862ab552dd70253f902e3056ff92c79ef9bdb6cff72`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:3b36d443c38a678f925ba862ab552dd70253f902e3056ff92c79ef9bdb6cff72) | `amd64` |


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
        "docker-manifest-digest": "sha256:3b36d443c38a678f925ba862ab552dd70253f902e3056ff92c79ef9bdb6cff72"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "02726fbfd2b1b05b1cb2624dffea00d2a0ed60e3",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/postgres",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDPjBKMwuffaBXQ1t7ldaUKG2IL3xZT97R4Pgu9lmtJYgIgH76vqjoyzVAv9+ACi+12xaEHWHzcQzRdq+7e3akwpg4=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI5NTgyNTc0Yjg3MDAwYmY5MDJmZjM4MGU5N2I5YTgxY2MyMmQ4YjFjMGJlNjc5NWVkZDdmYjY1MjNmODVkMTFmIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURMbHY0b1JkZTcrQll0dkNtYk9MbjhseEZUV1hSV2hLRkxXUG85QTNwalZRSWdJR3V3VEJHZmJoY1k4aU13eEd5QzJBbnZMYlRUejdoQnpoUlAwcUVOckVjPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlla05EUVhwWFowRjNTVUpCWjBsVlZtOUlObmN6Vm14elVFMTNaRkkzTkZaWE9GbDFjM2M0Tm0xWmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRKTlJFVXdUbnBKZVZkb1kwNU5ha2w0VFZSQk1rMUVSVEZPZWtsNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ5WW1JMlJHcDZXbTl1UnpoNUwwNUNXU3RUY2pSRlRXcFBVRXhMYTBSYVExbEhSR0VLUVVSclpVaFNVVXBaVm5oUFZXSTBjMmRRYW5seFlYZENSa2RoTmt0UVduTXdZV05XT0RVMVEwZE5OVWhLWnpaRVVUWlBRMEZzVVhkblowcFJUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZLVGxsbUNqbFphMnh4UlVaNGNYTnZTa1l4TURGWmVVaFlVMVk0ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGbldVUldVakJTUVZGSUwwSkhRWGRZYjFwallVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UW5aak0xSnVZMjFXZWt4NU5XNWhXRkp2WkZkSmRtUXlPWGxoTWxwellqTmtla3d6U214aVIxWm9ZekpWZFdWWFJuUmlSVUo1Q2xwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1QxRlpTMHQzV1VKQ1FVZEVkbnBCUWtGUlVYSmhTRkl3WTBoTk5reDVPVEJpTW5Sc1ltazFhRmt6VW5BS1lqSTFla3h0WkhCa1IyZ3hXVzVXZWxwWVNtcGlNalV3V2xjMU1FeHRUblppVkVGWFFtZHZja0puUlVWQldVOHZUVUZGUTBKQmFIcFpNbWhzV2toV2N3cGFWRUV5UW1kdmNrSm5SVVZCV1U4dlRVRkZSRUpEWjNkTmFtTjVUbTFhYVZwdFVYbFpha1pwVFVSV2FVMVhUbWxOYWxsNVRrZFNiVnB0Vm1oTlJFSnJDazF0UlhkYVYxRXlUVWRWZWsxQ2QwZERhWE5IUVZGUlFtYzNPSGRCVVZGRlJHdE9lVnBYUmpCYVUwSlRXbGQ0YkZsWVRteE5RMmRIUTJselIwRlJVVUlLWnpjNGQwRlJWVVZIYlU1dldWZHNkVm96Vm1oamJWRjBZVmN4YUZveVZucE1NMEoyWXpOU2JtTnRWbnBOUWpCSFEybHpSMEZSVVVKbk56aDNRVkZaUlFwRU0wcHNXbTVOZG1GSFZtaGFTRTEyWWxkR2NHSnFRMEpwWjFsTFMzZFpRa0pCU0ZkbFVVbEZRV2RTT0VKSWIwRmxRVUl5UVU0d09VMUhja2Q0ZUVWNUNsbDRhMlZJU214dVRuZExhVk5zTmpRemFubDBMelJsUzJOdlFYWkxaVFpQUVVGQlFtaEZjV1U1YWpSQlFVRlJSRUZGWTNkU1VVbG9RVTk2TkVobU5VUUtRbmt2UVVwU1p6aHZibXBXUjJGTVJuazJlRlppVGxNeFdVNTFNblpEVjFkbFVHSjZRV2xDZUZObFdHeDVkblJIVFhaWk5HMHlSbVpFZGl0VU56SjZjUW80UjJKRkwwUjRkbmhNYkdOaFVXdzNka1JCUzBKblozRm9hMnBQVUZGUlJFRjNUbTlCUkVKc1FXcENkMUVyTVhCcmFGYzRSbXh6YUVWalJWRTJTRkU1Q21aeVdrYzNMMnBpT1ZOa2EybHZValUwU2k4MGNYQm9lbmN2Y1dOVFJtRkNWMFpWUnpad1VXRnZVMk5EVFZGRGRuWjFURk0xVGtaaE1qaGpNQ3ROZGtzS1ZGbEpZMWxRWkVSYWVtVTRaSHA0UjBGa1NqUjFkWGQzU1VwcWNrTTNjRUpTWlVSRFFsSkllRkp1UlRVeWNHYzlDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1667699246,
          "logIndex": 6591977,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/postgres/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/postgres",
      "githubWorkflowSha": "02726fbfd2b1b05b1cb2624dffea00d2a0ed60e3",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3402476377",
      "sha": "02726fbfd2b1b05b1cb2624dffea00d2a0ed60e3"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

