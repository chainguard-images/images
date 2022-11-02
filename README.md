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
| `latest` | `sha256:b7f99ca6c2ecb55a65e3ea57ddaeba1668ed497feb8640e8131195ed8b6180c3`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:b7f99ca6c2ecb55a65e3ea57ddaeba1668ed497feb8640e8131195ed8b6180c3) | `amd64` |


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
        "docker-manifest-digest": "sha256:b7f99ca6c2ecb55a65e3ea57ddaeba1668ed497feb8640e8131195ed8b6180c3"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "8fa4f69a62f74ea242a98149a4b0610c9abfccd0",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/postgres",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQD7t8I3UrG9+qM6slUzmLP6f9Imv1bmmau7dwuTr9FPoAIgKWjbQLtaF4aiNC6WEsIXGNVfkoRf1RHX6fm6eTOe5Q4=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIzZjY4MmU2Mjk3NmJlYzExOTNkOTgxNDAxN2VhMDZlZTVhM2RmZDcwOTE4NjVkYWQ3ZTZmNWJiYTY4OTM2ODMzIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURCOEU2TERCeTFOSFJZOGN5ZHBBWnVqTk9xd2QxeWRWdDR1VWU1YS8yREFBSWhBS2dmQkw0Y1huVlBsMzFoVTA1NlJGRlNhcjk3VXNnQmF4OXNlblZzbmFLOSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhha05EUVhwSFowRjNTVUpCWjBsVlNpOUNTMGhsTldkVFFtYzBXbkpYU2pkdWIwaEZTamcyWlZOVmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVhsTlZFVjNUbnBKTUZkb1kwNU5ha2w0VFZSQmVVMVVSWGhPZWtrd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVY2VjA1WE5YZDRiazVUVGpZNGNEbHdaRTh4ZW05MGRXaDJVa3AxUjBSbmRGUmxZMnNLSzBkUmIwNTFWamt5V2pOa1JVRXJkMGhWV0hVNGVYWXpWMnhXUjNCSVVVMUxheXRrUTJsamMyRXZibTF6YkRNNGRqWlBRMEZzUVhkblowcE5UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV5TmpSeENsZzFUR2hwZG05d1Vtb3JZVlZYYlVnMFJWZEZUMHB2ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGbldVUldVakJTUVZGSUwwSkhRWGRZYjFwallVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UW5aak0xSnVZMjFXZWt4NU5XNWhXRkp2WkZkSmRtUXlPWGxoTWxwellqTmtla3d6U214aVIxWm9ZekpWZFdWWFJuUmlSVUo1Q2xwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1QxRlpTMHQzV1VKQ1FVZEVkbnBCUWtGUlVYSmhTRkl3WTBoTk5reDVPVEJpTW5Sc1ltazFhRmt6VW5BS1lqSTFla3h0WkhCa1IyZ3hXVzVXZWxwWVNtcGlNalV3V2xjMU1FeHRUblppVkVGVFFtZHZja0puUlVWQldVOHZUVUZGUTBKQlVuZGtXRTV2VFVSWlJ3cERhWE5IUVZGUlFtYzNPSGRCVVUxRlMwUm9iVmxVVW0xT2FteG9UbXBLYlU1NlVteFpWRWt3VFcxRk5VOUVSVEJQVjBVd1dXcEJNazFVUW1wUFYwWnBDbHB0VG1wYVJFRjNTRUZaUzB0M1dVSkNRVWRFZG5wQlFrSkJVVTlSTTBwc1dWaFNiRWxHU214aVIxWm9ZekpWZDB0QldVdExkMWxDUWtGSFJIWjZRVUlLUWxGUllWa3lhR2hoVnpWdVpGZEdlVnBETVhCaVYwWnVXbGhOZG1OSE9YcGtSMlI1V2xoTmQwaFJXVXRMZDFsQ1FrRkhSSFo2UVVKQ1oxRlFZMjFXYlFwamVUbHZXbGRHYTJONU9YUlpWMngxVFVsSFMwSm5iM0pDWjBWRlFXUmFOVUZuVVVOQ1NIZEZaV2RDTkVGSVdVRXpWREIzWVhOaVNFVlVTbXBIVWpSakNtMVhZek5CY1VwTFdISnFaVkJMTXk5b05IQjVaME00Y0Rkdk5FRkJRVWRGVDBGWksyVjNRVUZDUVUxQlVucENSa0ZwUVdWcU5GVXZRWG9yYWtKQ2JHMEtPR3AyUldGd0wyOXJObTkyWlVKT1ZtZDFVM2xQY21oQk5FZ3JhbWRSU1doQlNXcExNMFpEYmxwMFVuaDJRVXhXWlhoTlUwSmtkamgxWlVFdmJHcE5Zd3BMTDBaYVQxZExVbEppV2psTlFXOUhRME54UjFOTk5EbENRVTFFUVRKalFVMUhVVU5OUkZWQ2JtMVpSSEF4ZHpWVlIzaG5OazQzTTJocFRrTmxLM2d4Q2tweWJXTjRWMVJWUmtOMWNsbFJRbk5QVFhCTVUybHNhVEZ4YXpBd2JsaGpLM1ptTUhOUlNYZGtOM2sxVWpkWWFESnFXWG8yUW5sblQzWkxkek56UkZBS05XZzRSMWgzZEhJd2JIQlVhek5NY3pRNFRVRTRURXRaVEZaV05uQjRMMUo1YzNNclIxUjZLd290TFMwdExVVk9SQ0JEUlZKVVNVWkpRMEZVUlMwdExTMHRDZz09In19fX0=",
          "integratedTime": 1667387247,
          "logIndex": 6350416,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/postgres/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/postgres",
      "githubWorkflowSha": "8fa4f69a62f74ea242a98149a4b0610c9abfccd0",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3377013989",
      "sha": "8fa4f69a62f74ea242a98149a4b0610c9abfccd0"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

