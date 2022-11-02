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
| `latest` | `sha256:84f2f95de28182031750730edbfec55cba5adac8e69081d06b96d77a8b7e9000`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:84f2f95de28182031750730edbfec55cba5adac8e69081d06b96d77a8b7e9000) | `amd64` |


## Usage

## Running PostgreSQL

The only mandatory environment variable needed by the PosgreSQL image is `POSTGRES_PASSWORD`

To test and __not__ persist PostgreSQL data run...
```sh
docker run -e POSTGRES_PASSWORD=password -ti --name postgres-test cgr.dev/chainguard/postgres:latest
```

Alternatively, to persist PostgreSQL data you can mount a volume mapped to the data folder
```sh
docker run -v $PWD/data:/var/lib/postgresql/data -it -e POSTGRES_PASSWORD=password cgr.dev/chainguard/postgres:latest
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
        "docker-manifest-digest": "sha256:84f2f95de28182031750730edbfec55cba5adac8e69081d06b96d77a8b7e9000"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "e8dc6f9c08e4ad15b43691c313e68ad3193ada07",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/postgres",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIDGBm8BCEjKod8uFYeQ6c9tTxTSCK7B6aa54Hpzp6brVAiEA9aD+G/0UKFalM/NyRP1yNAoKXp1XNufAv+Yxm6FxlqE=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJmZTA4YzllZTA2OTMyYjgwMmFjYTE1OGViZTNkYTQ0NGZlNWZjYzJmZmI2NTI2NTU3YThlMTIxMGNmOTNjYmFkIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FTUNIMnpVc3ZxVEVQMzNOY1ptQS9xcDh5cVYwdTNMSFR3ZFo2eEpwYkZYcUdJQ0lCVzZ3bnZ3RzNMNXYwZlNyaVVLdlM1LzJkbHU0TTdkSUhtL2ZnQlpOSFlTIiwicHVibGljS2V5Ijp7ImNvbnRlbnQiOiJMUzB0TFMxQ1JVZEpUaUJEUlZKVVNVWkpRMEZVUlMwdExTMHRDazFKU1VSeVJFTkRRWHBIWjBGM1NVSkJaMGxWV2pGT2NHWnlWMFpzT1ZwVVdHVnlVMFp4U1VoVlowTjRkM2xWZDBObldVbExiMXBKZW1vd1JVRjNUWGNLVG5wRlZrMUNUVWRCTVZWRlEyaE5UV015Ykc1ak0xSjJZMjFWZFZwSFZqSk5ValIzU0VGWlJGWlJVVVJGZUZaNllWZGtlbVJIT1hsYVV6RndZbTVTYkFwamJURnNXa2RzYUdSSFZYZElhR05PVFdwSmVFMVVRWGxOVkVFeFQxUk5NVmRvWTA1TmFrbDRUVlJCZVUxVVJYZFBWRTB4VjJwQlFVMUdhM2RGZDFsSUNrdHZXa2w2YWpCRFFWRlpTVXR2V2tsNmFqQkVRVkZqUkZGblFVVnZaRzVEYnpZemNpOUtkbFJpVDIxTVlWZEhNRFZyVTI5Sk5raElNbUpEY1ZoMFFqZ0tVMFZFWm1SNmJVWlRUMlJTZDJ0WlFqbGFUemhGZFVGaEsyazJabGs1UXpsSFF5OUJTRzh4VURSSFJEVkRhQ3MyY1dGUFEwRnNRWGRuWjBwTlRVRTBSd3BCTVZWa1JIZEZRaTkzVVVWQmQwbElaMFJCVkVKblRsWklVMVZGUkVSQlMwSm5aM0pDWjBWR1FsRmpSRUY2UVdSQ1owNVdTRkUwUlVablVWVTFXRkJDQ200d2IwVlBiRmhVTjFoclExTnRlazlvTmxkSlZVRkpkMGgzV1VSV1VqQnFRa0puZDBadlFWVXpPVkJ3ZWpGWmEwVmFZalZ4VG1wd1MwWlhhWGhwTkZrS1drUTRkMkZuV1VSV1VqQlNRVkZJTDBKSFFYZFliMXBqWVVoU01HTklUVFpNZVRsdVlWaFNiMlJYU1hWWk1qbDBUREpPYjFsWGJIVmFNMVpvWTIxUmRBcGhWekZvV2pKV2Vrd3pRblpqTTFKdVkyMVdla3g1Tlc1aFdGSnZaRmRKZG1ReU9YbGhNbHB6WWpOa2Vrd3pTbXhpUjFab1l6SlZkV1ZYUm5SaVJVSjVDbHBYV25wTU1taHNXVmRTZWt3eU1XaGhWelIzVDFGWlMwdDNXVUpDUVVkRWRucEJRa0ZSVVhKaFNGSXdZMGhOTmt4NU9UQmlNblJzWW1rMWFGa3pVbkFLWWpJMWVreHRaSEJrUjJneFdXNVdlbHBZU21waU1qVXdXbGMxTUV4dFRuWmlWRUZUUW1kdmNrSm5SVVZCV1U4dlRVRkZRMEpCVW5ka1dFNXZUVVJaUndwRGFYTkhRVkZSUW1jM09IZEJVVTFGUzBkVk5GcEhUVEphYW14cVRVUm9iRTVIUm10TlZGWnBUa1JOTWs5VVJtcE5la1Y2V2xSWk5GbFhVWHBOVkd0NkNsbFhVbWhOUkdOM1NFRlpTMHQzV1VKQ1FVZEVkbnBCUWtKQlVVOVJNMHBzV1ZoU2JFbEdTbXhpUjFab1l6SlZkMHRCV1V0TGQxbENRa0ZIUkhaNlFVSUtRbEZSWVZreWFHaGhWelZ1WkZkR2VWcERNWEJpVjBadVdsaE5kbU5IT1hwa1IyUjVXbGhOZDBoUldVdExkMWxDUWtGSFJIWjZRVUpDWjFGUVkyMVdiUXBqZVRsdldsZEdhMk41T1hSWlYyeDFUVWxIUzBKbmIzSkNaMFZGUVdSYU5VRm5VVU5DU0hkRlpXZENORUZJV1VFelZEQjNZWE5pU0VWVVNtcEhValJqQ20xWFl6TkJjVXBMV0hKcVpWQkxNeTlvTkhCNVowTTRjRGR2TkVGQlFVZEZUaTg0V0hkM1FVRkNRVTFCVW5wQ1JrRnBRV1V4TlhWd01tbHBVWFo2V1cwS1JUaFpWbE5GUW5ORGVFMHlNalkyWjFKcGMyeENWWEJFYkVwMGJFVjNTV2hCVHpFdlYwaE9URW9yVW5wTVZEaGhaVUZvTTJKQ1FsTXplREJEYjNOTFpBcEJSVlZTUWxsYWIxcDJNMlpOUVc5SFEwTnhSMU5OTkRsQ1FVMUVRVEpyUVUxSFdVTk5VVVJEYUZKRFJIRlVWMDhyVFhBeFRISk1WMk56T1VSMk1sWjJDa3gwTlZkSk0wbHFMekpPYW1sUFpHMVVUaXQyZUV4T05VczJjakl2YjJSSVkzVnVTR05PWTBOTlVVUTFhMmx3S3pVM1JXSldNR2RWVFhkb2NuRlVWSE1LUWpWdVJGcDZURVJ2V1hsTGFEVlhPRzU1S3k5eVZFWllZWGhvZDNsbU5XeHBObTEwTDFKdU1sWllORDBLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1667386782,
          "logIndex": 6350075,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/postgres/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/postgres",
      "githubWorkflowSha": "e8dc6f9c08e4ad15b43691c313e68ad3193ada07",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3376958543",
      "sha": "e8dc6f9c08e4ad15b43691c313e68ad3193ada07"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

