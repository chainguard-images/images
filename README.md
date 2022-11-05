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
| `latest` | `sha256:1d07a81a0402c4c34aa346d0b4e92edb81203729120deed8f4205759e076535d`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:1d07a81a0402c4c34aa346d0b4e92edb81203729120deed8f4205759e076535d) | `amd64` |


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
        "docker-manifest-digest": "sha256:1d07a81a0402c4c34aa346d0b4e92edb81203729120deed8f4205759e076535d"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "c3ad46c31d4872b1527c6d4663158ec92984b7ab",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/postgres",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIDEwa0AFJ6lJX7Noul21CepZ2G+GCchphY02n2lzDcC0AiAj6LUqYmmwYePslA+LrDd7fLl6tApRMVOT2EnMj/tn3w==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIzMjRhYTk0MDY5ZGZhY2M4YjkwMjBlNTFjMDBmYmM2OGFlODU3ODZkYzA4YWM3YWY2NTczMDMxZjQ1Y2FlNWMwIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURraDNxMURHNFhTMUVxalFLTEwvMldSMWR3L3FYZGRieHBJOStiSFFDQ1VBSWhBUHphdWlPaGJXekpZN0JudWZCQkhCQ25abVAvWFJqaFdLOTB3NndlNC9KTyIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpSRU5EUVhwaFowRjNTVUpCWjBsVlQwMTJabWRRYTJNd1ZIQkdkWEZLUTNaelQyMWhMMlI1U2xGdmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRGTlJFVXdUbFJGZWxkb1kwNU5ha2w0VFZSQk1VMUVSVEZPVkVWNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVV4TVVGaFQzb3lZakZwSzNKblpqZFliSHBtTlhsaFZIbG5NM3BVYTI0cmIyUjBURFlLWm5OdWJEQk5WeXN6ZDNnMGFuRlBjbXBaYVhSTVdGQlFOVFl2UVVKaE56aHVkMVF2UjJGU2NYaG9USFphTW5GaU1IRlBRMEZzVlhkblowcFNUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlU1YmlzckNqUklNamcwUjA0clRYcG1RMVpoTUUxWWRscGlXRmRGZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGbldVUldVakJTUVZGSUwwSkhRWGRZYjFwallVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UW5aak0xSnVZMjFXZWt4NU5XNWhXRkp2WkZkSmRtUXlPWGxoTWxwellqTmtla3d6U214aVIxWm9ZekpWZFdWWFJuUmlSVUo1Q2xwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1QxRlpTMHQzV1VKQ1FVZEVkbnBCUWtGUlVYSmhTRkl3WTBoTk5reDVPVEJpTW5Sc1ltazFhRmt6VW5BS1lqSTFla3h0WkhCa1IyZ3hXVzVXZWxwWVNtcGlNalV3V2xjMU1FeHRUblppVkVGWFFtZHZja0puUlVWQldVOHZUVUZGUTBKQmFIcFpNbWhzV2toV2N3cGFWRUV5UW1kdmNrSm5SVVZCV1U4dlRVRkZSRUpEYUdwTk1rWnJUa1JhYWsxNlJtdE9SR2N6VFcxSmVFNVVTVE5aZWxwclRrUlpNazE2UlRGUFIxWnFDazlVU1RWUFJGSnBUakpHYVUxQ2QwZERhWE5IUVZGUlFtYzNPSGRCVVZGRlJHdE9lVnBYUmpCYVUwSlRXbGQ0YkZsWVRteE5RMmRIUTJselIwRlJVVUlLWnpjNGQwRlJWVVZIYlU1dldWZHNkVm96Vm1oamJWRjBZVmN4YUZveVZucE1NMEoyWXpOU2JtTnRWbnBOUWpCSFEybHpSMEZSVVVKbk56aDNRVkZaUlFwRU0wcHNXbTVOZG1GSFZtaGFTRTEyWWxkR2NHSnFRMEpwZDFsTFMzZFpRa0pCU0ZkbFVVbEZRV2RTT1VKSWMwRmxVVUl6UVU0d09VMUhja2Q0ZUVWNUNsbDRhMlZJU214dVRuZExhVk5zTmpRemFubDBMelJsUzJOdlFYWkxaVFpQUVVGQlFtaEZWakp2TTAxQlFVRlJSRUZGWjNkU1owbG9RVkJ2SzFWQ1FVSUtNbTF4ZWtNNFpEQlpXRWRDZW1VNE5tNXliRll3Ynk5WmJtdFFNMXBWV2l0WmRIQldRV2xGUVhOdGNXOVpZM2hTWWpRMVYxaFZVVGxvWmpsdFYxRlFVZ3B1YTBjd1ZqaE5kRGxPTVVoUGRubGlVazFCZDBObldVbExiMXBKZW1vd1JVRjNUVVJoUVVGM1dsRkplRUZOVkhVck1qbGhhakp5VjFZclFXWjVjRXROQ25aemJWVnpaMmR5UzJ4RE1YTTBTRGx3ZDJaVmNFNDBaakZ5VkVwV1ZUVlRXR05yYWpoSmIwSklRVEp2TUdkSmQyUnZNM2h6VFU1WWRsUmhaM295TmtFS2JHeGxkMlpyYjNnM0syUmpWVFJYYVVST2JFVlBWV3d5YmsxUkwxQktaWHB4VEZOVllXMXNTVXBTVVdKRlRYZERDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1667612718,
          "logIndex": 6531315,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/postgres/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/postgres",
      "githubWorkflowSha": "c3ad46c31d4872b1527c6d4663158ec92984b7ab",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3398206345",
      "sha": "c3ad46c31d4872b1527c6d4663158ec92984b7ab"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

