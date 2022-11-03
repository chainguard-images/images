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
| `latest` | `sha256:2f4fd4b78dc4aaca6d00b8cad5e6b2310f4a5ca8ee0a0f0562a8077a34899a73`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:2f4fd4b78dc4aaca6d00b8cad5e6b2310f4a5ca8ee0a0f0562a8077a34899a73) | `amd64` |


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
        "docker-manifest-digest": "sha256:2f4fd4b78dc4aaca6d00b8cad5e6b2310f4a5ca8ee0a0f0562a8077a34899a73"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "f672e3cd9aa3b70ae1e42d92a34d397220e97bde",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/postgres",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIFMPuUInFBwbmurTocpyr79B2DxKV4K9ETKSP9VcA4FVAiEAoLOWf97SsvGX5JRIuLQlXeMOXSIltZ+PIYJ+i/HFJbM=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIwNzdiN2M1MjNiZWJlYjgwOTUzNWQ3ZThhYzM1OTAxMzc2NDNjNWRiMTVlZGZkNjc5M2U0ZTNlMTUwOTBiZDZjIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNJZm1CLzl4Yk90bjRhMFdmdDZzRmc4UkljWUE1ZEJ0ZzBpWnlIcHFlMFJRSWdWVkw1Nk8vWDdxVlVaR1VwV2gxMytPd1FXdVNSVGpoeFJFYTM3OUc0YUd3PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlla05EUVhwWFowRjNTVUpCWjBsVlprbGtia1ZvVkVoamJsbE9TbWN5VHpsRmRtUm1OVE5aVVc1UmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVhwTlJFVXdUbXBGTlZkb1kwNU5ha2w0VFZSQmVrMUVSVEZPYWtVMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZaV2tvM2FIVmlRa2g2ZDFOT1dUWkpNRnB3ZVRVeldtOUVlVVYzTVUwelZpOVZSVk1LWlUwd2FtdzRWVXB1UmpaRVJXZFBUVFpLUWxWSFdXdzJiSG9yV214cFkwZHhXbVJxVFVsVUwwZEdja1ZCY3l0WFVFdFBRMEZzVVhkblowcFJUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZGZEU1akNqWTFRbWxwUjFOSlJIbElXalJhUW1KYU9UWkZWU3M0ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGbldVUldVakJTUVZGSUwwSkhRWGRZYjFwallVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UW5aak0xSnVZMjFXZWt4NU5XNWhXRkp2WkZkSmRtUXlPWGxoTWxwellqTmtla3d6U214aVIxWm9ZekpWZFdWWFJuUmlSVUo1Q2xwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1QxRlpTMHQzV1VKQ1FVZEVkbnBCUWtGUlVYSmhTRkl3WTBoTk5reDVPVEJpTW5Sc1ltazFhRmt6VW5BS1lqSTFla3h0WkhCa1IyZ3hXVzVXZWxwWVNtcGlNalV3V2xjMU1FeHRUblppVkVGWFFtZHZja0puUlVWQldVOHZUVUZGUTBKQmFIcFpNbWhzV2toV2N3cGFWRUV5UW1kdmNrSm5SVVZCV1U4dlRVRkZSRUpEYUcxT2FtTjVXbFJPYWxwRWJHaFpWRTVwVG5wQ2FGcFVSbXhPUkVwclQxUkthRTE2VW10TmVtc3pDazFxU1hkYVZHc3pXVzFTYkUxQ2QwZERhWE5IUVZGUlFtYzNPSGRCVVZGRlJHdE9lVnBYUmpCYVUwSlRXbGQ0YkZsWVRteE5RMmRIUTJselIwRlJVVUlLWnpjNGQwRlJWVVZIYlU1dldWZHNkVm96Vm1oamJWRjBZVmN4YUZveVZucE1NMEoyWXpOU2JtTnRWbnBOUWpCSFEybHpSMEZSVVVKbk56aDNRVkZaUlFwRU0wcHNXbTVOZG1GSFZtaGFTRTEyWWxkR2NHSnFRMEpwWjFsTFMzZFpRa0pCU0ZkbFVVbEZRV2RTT0VKSWIwRmxRVUl5UVU0d09VMUhja2Q0ZUVWNUNsbDRhMlZJU214dVRuZExhVk5zTmpRemFubDBMelJsUzJOdlFYWkxaVFpQUVVGQlFtaEVjM0UyZUZWQlFVRlJSRUZGWTNkU1VVbG5UemxLWTB4MFVqZ0tSVFp3TUc1dlVGZHVSRXhQYXk5VFVIaHZlR0pRUlZOeFkwWlVja1YwVGk5bGJFMURTVkZEZW5wb1NGazVWbE0wYWswNFUzQkhSbEZJV0d0Sk9VSmxSQXByZEZoTFUwcEJOR1ZsYldKdGRscFJNMFJCUzBKblozRm9hMnBQVUZGUlJFRjNUbTlCUkVKc1FXcEJSWEJQTkVSQlVYTlRSR2xYYkZOWVZGbFhWR1Z0Q205TE1EVnVaV0pNYTFsdkwzZFFXalZSYkcxRFRtOXNSVFp4Ym01aGJsZzFXbU5pT1ZSaWFYUkdielJEVFZGRVdHWkZVRzF6TkdSdU5tNWFSU3RQZW5FS1NsRmtPVUZ4VTNoU2FXbDNTQzgwU2poT2IzUlBSWE50YjJocU1rbzBZMnBxYUdaTGVqWm9SVEpaUlVVeUswMDlDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1667439982,
          "logIndex": 6394647,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/postgres/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/postgres",
      "githubWorkflowSha": "f672e3cd9aa3b70ae1e42d92a34d397220e97bde",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3382427048",
      "sha": "f672e3cd9aa3b70ae1e42d92a34d397220e97bde"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

