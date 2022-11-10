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
| `latest` | `sha256:aede83944fd3368505004771f4591336268fde5dbc1ba4c990f6a26f0c6faf7f`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:aede83944fd3368505004771f4591336268fde5dbc1ba4c990f6a26f0c6faf7f) | `amd64` |


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
        "docker-manifest-digest": "sha256:aede83944fd3368505004771f4591336268fde5dbc1ba4c990f6a26f0c6faf7f"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "672522588de44cce592a3fecaf12b1f9ef7d7139",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/postgres",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIDBZU6QkowbgDzjzlPoNfITpvicYHGhVhOdx68R8TBitAiAEiCKIcJtQk+TdLexdZsXLyyjzTcux1diGN4hBKYfq/w==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI3MDFlNjdmNWMwNWM3MjkwYTg3ZGI1N2YzNzAyZGYyM2UxZTVmNzRjZjlmZTRiOTc4NWExNDg2ODgxODgyMzQ2In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNKem43TUhycndSM0ViVGM4VWxmVUhPTit6VEQ1aGFqYTI3MkNtOXFNR0VRSWhBS0grenV5S3RLa0M2OVhLdGFhQTlVTHZwVGg4SWRnM0EzVGFoM0hUS05JUSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpSRU5EUVhwWFowRjNTVUpCWjBsVlJXMHpVUzlwVUM5SlFqUXJValJ4ZFdsNVkzcEhkV3BzTjBKUmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlhkTlJFVXdUbXBGZWxkb1kwNU5ha2w0VFZSRmQwMUVSVEZPYWtWNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVUwYkVkbldGTTNhVFJzUkhkS1QzaFVLM05UVVM5TlUxTkJha0kyZGpFdmMxRlhNa01LZUdOU1UxbGpkMmx6TkU5ak9FcGlRM1pOYzJvM1F6Sk5RbTlUYmtkbVIxWkxZVFJ1VlhsVWFGWlpVMkpSU1M5V1ZrdFBRMEZzVVhkblowcFJUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV4TlZZckNuaFJTSFl4Y3pKM2FDOUpOQzkzVjBkSFVITkVlRVU0ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGbldVUldVakJTUVZGSUwwSkhRWGRZYjFwallVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UW5aak0xSnVZMjFXZWt4NU5XNWhXRkp2WkZkSmRtUXlPWGxoTWxwellqTmtla3d6U214aVIxWm9ZekpWZFdWWFJuUmlSVUo1Q2xwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1QxRlpTMHQzV1VKQ1FVZEVkbnBCUWtGUlVYSmhTRkl3WTBoTk5reDVPVEJpTW5Sc1ltazFhRmt6VW5BS1lqSTFla3h0WkhCa1IyZ3hXVzVXZWxwWVNtcGlNalV3V2xjMU1FeHRUblppVkVGWFFtZHZja0puUlVWQldVOHZUVUZGUTBKQmFIcFpNbWhzV2toV2N3cGFWRUV5UW1kdmNrSm5SVVZCV1U4dlRVRkZSRUpEWnpKT2Vra3hUV3BKTVU5RWFHdGFWRkV3V1RKT2JFNVVhM2xaVkU1dFdsZE9hRnBxUlhsWmFrWnRDazlYVm0xT01sRXpUVlJOTlUxQ2QwZERhWE5IUVZGUlFtYzNPSGRCVVZGRlJHdE9lVnBYUmpCYVUwSlRXbGQ0YkZsWVRteE5RMmRIUTJselIwRlJVVUlLWnpjNGQwRlJWVVZIYlU1dldWZHNkVm96Vm1oamJWRjBZVmN4YUZveVZucE1NMEoyWXpOU2JtTnRWbnBOUWpCSFEybHpSMEZSVVVKbk56aDNRVkZaUlFwRU0wcHNXbTVOZG1GSFZtaGFTRTEyWWxkR2NHSnFRMEpwWjFsTFMzZFpRa0pCU0ZkbFVVbEZRV2RTT0VKSWIwRmxRVUl5UVU0d09VMUhja2Q0ZUVWNUNsbDRhMlZJU214dVRuZExhVk5zTmpRemFubDBMelJsUzJOdlFYWkxaVFpQUVVGQlFtaEdPRE5YWjNkQlFVRlJSRUZGWTNkU1VVbG9RVXBUU21sdmVHWUtjMGwzTW1aQ1UySkViRlZUTmpOa2VHNHpWMUpXVXpadFpFRlNiRmx1U2sxa2VEWk5RV2xDY2t4R1lsSlNUbE5wY1VsRE1XUTJXaXRGU1U5c1lXSmFVUXBaVEdaaVRIZFRLekUxVWk4clZWSlFhV3BCUzBKblozRm9hMnBQVUZGUlJFRjNUbkJCUkVKdFFXcEZRVzVMU2pCTFYwSjFVMVEwY2pGR2JFcDZjRzVvQ201cVpWTmxLM2wxYXpWWmVEQndaRmRsWjFjMFFXUTJaMDl0YmtOU2VFVTVlbGhUYzBwcGRVeE1UamcyUVdwRlFYSnRNMUZtYlVaaE9ETnViME5TWnpVS1ZFa3ZZMlZWZDBReVRVTnRWRFZMU1ZZelpUQnBNMFZMYzJWck9VOU9SWGt2WTJ0d05rWTBlVFEwYkRGNlVVbFdDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1668044780,
          "logIndex": 6806628,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/postgres/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/postgres",
      "githubWorkflowSha": "672522588de44cce592a3fecaf12b1f9ef7d7139",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3433311143",
      "sha": "672522588de44cce592a3fecaf12b1f9ef7d7139"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

