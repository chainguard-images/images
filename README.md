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
| `latest` | `sha256:c90026f5820117eb72508bd1e5b10418b880bb08fc44b93fc2fc2006473bc0f9`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c90026f5820117eb72508bd1e5b10418b880bb08fc44b93fc2fc2006473bc0f9) | `amd64` |


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
        "docker-manifest-digest": "sha256:c90026f5820117eb72508bd1e5b10418b880bb08fc44b93fc2fc2006473bc0f9"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "68f5682062d92d544a8a72ab608013f4736f2ed5",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/postgres",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDSaF+N9hLFVr/0MC0PYUrj5ZQph/b2DZebF76x10GZRAIhAIUUWAD1KokKexlyzJoYPwxY6ijfDcERkrVVfcJBc2Sn",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJkMDYyNzI5MTQ1N2M4YWE2ZmU0NjE2ZGE4NmY2ZWNiODIyNTc0MGFlNDQ4ZGNiNTk2NWYzYjM5ZjkyZTJkMGRmIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJRkNFMW1QRFI5OFJqamgvRW52ZzhKVHk2Wjg0d2dncG53VTZtb3ROZ3lTaEFpRUFqUGJlWTJCWGpaNjZyRnhMYUZSTFhxdnBlWTZ5clg1R0FhWVRXaTVtVUp3PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhha05EUVhwSFowRjNTVUpCWjBsVlJGWndXSGhITjNCMlZEYzRaRkIyVm1GR1JHbzJkSE54YlcxbmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRSTlJFRXdUWHBKTlZkb1kwNU5ha2w0VFZSQk5FMUVRVEZOZWtrMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZoYWtWS1V6Z3JielIxVVRaSVowNTBaVWgxZEc5NFNteHJUMjlVZGxWVU5rNUlUV0VLVFdoaVFtaDViMFZJV1ZJNFNGbERNMHhWZDJaamFFRXhPRTV6TlM5dVJqUmxSMlJsVXpKemNsbGxOMWhISzNRclVrdFBRMEZzUVhkblowcE5UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlYyTTBaYUNrbFJlVUl2WTBVNGNHVkNkREZxUkhCaFRYVlZhekZSZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGbldVUldVakJTUVZGSUwwSkhRWGRZYjFwallVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UW5aak0xSnVZMjFXZWt4NU5XNWhXRkp2WkZkSmRtUXlPWGxoTWxwellqTmtla3d6U214aVIxWm9ZekpWZFdWWFJuUmlSVUo1Q2xwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1QxRlpTMHQzV1VKQ1FVZEVkbnBCUWtGUlVYSmhTRkl3WTBoTk5reDVPVEJpTW5Sc1ltazFhRmt6VW5BS1lqSTFla3h0WkhCa1IyZ3hXVzVXZWxwWVNtcGlNalV3V2xjMU1FeHRUblppVkVGVFFtZHZja0puUlVWQldVOHZUVUZGUTBKQlVuZGtXRTV2VFVSWlJ3cERhWE5IUVZGUlFtYzNPSGRCVVUxRlMwUlpORnBxVlRKUFJFbDNUbXBLYTA5VVNtdE9WRkV3V1ZSb2FFNTZTbWhaYWxsM1QwUkJlRTB5V1RCT2VrMHlDbHBxU214YVJGVjNTRUZaUzB0M1dVSkNRVWRFZG5wQlFrSkJVVTlSTTBwc1dWaFNiRWxHU214aVIxWm9ZekpWZDB0QldVdExkMWxDUWtGSFJIWjZRVUlLUWxGUllWa3lhR2hoVnpWdVpGZEdlVnBETVhCaVYwWnVXbGhOZG1OSE9YcGtSMlI1V2xoTmQwaFJXVXRMZDFsQ1FrRkhSSFo2UVVKQ1oxRlFZMjFXYlFwamVUbHZXbGRHYTJONU9YUlpWMngxVFVsSFMwSm5iM0pDWjBWRlFXUmFOVUZuVVVOQ1NIZEZaV2RDTkVGSVdVRXpWREIzWVhOaVNFVlVTbXBIVWpSakNtMVhZek5CY1VwTFdISnFaVkJMTXk5b05IQjVaME00Y0Rkdk5FRkJRVWRGVmt4RmVreDNRVUZDUVUxQlVucENSa0ZwUWtsVVUzSldTRzl2YjJ3clIxVUtORWwyVWtSWlF6SjBZaTg0Y2xGVEswbzFkVmxOVFhCNGMxQkZNVUZuU1doQlVIUTVkRTlKU0hFclEyNXVlRWhUYVd0WlJWVm9kRmh4UlRWSk5GSjFNQXAyYmxWT05HZFZjbnBtU1VSTlFXOUhRME54UjFOTk5EbENRVTFFUVRKalFVMUhVVU5OUkVwWU5ETnRWeTl4V1hGUmVVOTNWR3N4VWxsck9YRkxVak5UQ2paTlJEWkZObVJFUjNKcFJsaE9SRTFqTjB0SFJXMXlNMU5HTkdKcU9XWjJjV05RZDJ0UlNYZE9ReTlJUlVscFluUnpLMVZHZDI0NVNXVXdia1YxTDNVS1RXRklUMHRVUVZaQ01pc3dRM0V5YjB0UFpEbHBMemxhVkROUFFuQmFOMll2VEZkSFYyRnlZZ290TFMwdExVVk9SQ0JEUlZKVVNVWkpRMEZVUlMwdExTMHRDZz09In19fX0=",
          "integratedTime": 1667868213,
          "logIndex": 6703079,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/postgres/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/postgres",
      "githubWorkflowSha": "68f5682062d92d544a8a72ab608013f4736f2ed5",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3415347319",
      "sha": "68f5682062d92d544a8a72ab608013f4736f2ed5"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

