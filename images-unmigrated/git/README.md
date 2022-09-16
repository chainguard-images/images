# git

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/distroless/readme-generator
-->

[![CI status](https://github.com/distroless/git/actions/workflows/release.yaml/badge.svg)](https://github.com/distroless/git/actions/workflows/release.yaml)

This is a minimal Git image based on Alpine, using up-to-date apks available on the Alpine Community repositories (not built from source). The image contains `git`, `git-lfs`, and supporting libraries such as `openssh` (for `ssh`-based auth), and `ca-certs` (for `https`-based cloning).

## Get It!

The image is available on `distroless.dev`:

```
docker pull distroless.dev/git:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `2` `2-debian-11` `2.37.3` `2.37.3-debian-11-r5` `latest` | `sha256:e9b3fce3a42386b908e40e69ac42ac5ade1e3142e72739bf02e696f83264e0f3`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:e9b3fce3a42386b908e40e69ac42ac5ade1e3142e72739bf02e696f83264e0f3) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `2.37.3-r0` `root` | `sha256:1fc6af4d109023507e629e2b1fba979a495568b09c2437a0703b275738848769`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:1fc6af4d109023507e629e2b1fba979a495568b09c2437a0703b275738848769) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


## Usage

The Git distroless image allows you to run ordinary Git commands in CI/CD pipelines and also locally via Docker.

### Docker Setup

To make sure you have the latest image version available, start by running a `docker pull` command:

```shell
docker pull distroless.dev/git
```

Then, run the image with the `--version` flag to make sure it is functional:

```shell
docker run -it --rm distroless.dev/git --version
```
You should get output similar to this:

```
git version 2.37.1
```

### Cloning a Repository Locally

Because your local system user's ID (uid) might differ from that of the container image, if you want to clone repositories locally using this image you'll need to set up special permissions for the target dir. Then, you'll be able to set up a volume and have the contents of the cloned repo replicated on your host machine.

First, create a target directory somewhere in your home folder and set the required permissions:

```shell
mkdir ~/workspace
chmod go+wrx ~/workspace
```

Now you can use `docker run` to execute the clone command, using the directory you just set up as a volume share between your local machine and the container image on `/home/git`.

```shell
docker run -it -v ~/workspace:/home/git --rm distroless.dev/git clone https://github.com/distroless/git.git
```

You should get output like this:

```
Cloning into 'git'...
remote: Enumerating objects: 57, done.
remote: Counting objects: 100% (57/57), done.
remote: Compressing objects: 100% (47/47), done.
remote: Total 57 (delta 19), reused 35 (delta 10), pack-reused 0
Receiving objects: 100% (57/57), 15.23 KiB | 866.00 KiB/s, done.
Resolving deltas: 100% (19/19), done.
```

You can now check the contents of your `workspace` directory, where you should find the cloned repo.


## Signing

All distroless images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify distroless.dev/git:latest | jq
```

Output:
```
Verification for distroless.dev/git:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/distroless/git"
      },
      "image": {
        "docker-manifest-digest": "sha256:e9b3fce3a42386b908e40e69ac42ac5ade1e3142e72739bf02e696f83264e0f3"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "7f709bd6771abffff0573fb5d038a06186d5fed6",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/git",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCuMbHV9ZX+J+JbuirKb05GEoLcYZoIWQEwal0nA+7JXgIgS+UOSAsU0ygxYvympfAiBqhnh36pgAQLlWUWkWB9n68=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIyMmVjMzAyNjk4NWY2NTdhYWIyYjg3ZDQ4MDYxMjIzNGI1ZmRkYzAwYjIyZjAxZjYxMzNmNTI1NTU1OWU3YTFhIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURiQW5vQnRHcS9URSt0QVNYcXV1WllKeUpSdStmVDF0S29mcnVJc3M5SVNRSWhBTDJWY3NXVDVMMnFWNWtZVlBvak5UUUdyYk5VcEZjaGhyYmpjb2pqZ1lkdiIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnNla05EUVhneVowRjNTVUpCWjBsVlkyUllXRlpCVlROUVN6aDNMMGRUVXpGV2JYYzFZWFIyVUhGamQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRKTlJFa3dUMFJOTTFkb1kwNU5ha2wzVDFSRk1rMUVTVEZQUkUwelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZhUkV4d2VXa3dZa2RQY1hJdkszZFZZMHhOWjNobUswOXVNMFk0TVRJclNUVnFkVFFLV2pBNGRYUm1XbmhDVm1FNVVuUm1RblJvVlROUWFIcFVjekZSVm1JdmJUVlViRmQxUjNOR1ZXRktORFpTT0ZSUk5UWlBRMEZxZDNkblowazBUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV6ZUdSQ0NteENiWEJqZGprMU5rUTBhMG96WW0xaE1rOXdRemQzZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFobldVUldVakJTUVZGSUwwSkdVWGRWYjFwUllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BhTW13d1RIazFibUZZVW05a1YwbDJaREk1ZVdFeVduTmlNMlI2VEROS2JHSkhWbWhqTWxWMVpWZEdkR0pGUW5sYVYxcDZUREpvYkZsWFVucE1NakZvQ21GWE5IZFBVVmxMUzNkWlFrSkJSMFIyZWtGQ1FWRlJjbUZJVWpCalNFMDJUSGs1TUdJeWRHeGlhVFZvV1ROU2NHSXlOWHBNYldSd1pFZG9NVmx1Vm5vS1dsaEthbUl5TlRCYVZ6VXdURzFPZG1KVVFWZENaMjl5UW1kRlJVRlpUeTlOUVVWRFFrRm9lbGt5YUd4YVNGWnpXbFJCTWtKbmIzSkNaMFZGUVZsUEx3cE5RVVZFUWtObk0xcHFZM2RQVjBwclRtcGpNMDFYUm1sYWJWcHRXbXBCTVU1NlRtMVphbFpyVFVSTk5GbFVRVEpOVkdjeVdrUldiVnBYVVRKTlFuZEhDa05wYzBkQlVWRkNaemM0ZDBGUlVVVkVhMDU1V2xkR01GcFRRbE5hVjNoc1dWaE9iRTFDZDBkRGFYTkhRVkZSUW1jM09IZEJVVlZGUkcxU2NHTXpVbmtLWWpKNGJHTXpUWFphTW13d1RVSXdSME5wYzBkQlVWRkNaemM0ZDBGUldVVkVNMHBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUTBKcFoxbExTM2RaUWdwQ1FVaFhaVkZKUlVGblVqaENTRzlCWlVGQ01rRkJhR2RyZGtGdlZYWTViMUprU0ZKaGVXVkZia1ZXYmtkTGQxZFFZMDAwTUcwemJYWkRTVWRPYlRsNUNrRkJRVUpuTUZGNWRERTBRVUZCVVVSQlJXTjNVbEZKYUVGUFpUUlJUMGMzVlhJcldqbFpNamxCWm1reGMydFlTVkJQTVZodE1XVnhiR0pqVTBZMFVIWUtjSFJTTWtGcFFVbzFiMDlvUzJSQlFVTjFUMkpRUldSNU1VaHZhbmhwWkROSVRtaE1XRVpKVVhSc1dtdE9ZVlJhVjNwQlMwSm5aM0ZvYTJwUFVGRlJSQXBCZDA1dlFVUkNiRUZxUVhwV01XMTFTMk5CZUZCQmRFaHRPVmhOVmxSdldFbG1SMWwySzNGVVNFNWFUMWhLZWpjMmNGSmxTSE15ZGtRMFdYSkxZVzAwQ21wNVltUlNSbEJWWkdWUlEwMVJSRmRUVmpWSU4wNDVPVEJ2YW0xc2EzWkVhalZ1YWt0VlVHMUVNRWhWTm5GUlRFMWtTbmw0Y0c5bVozaDJjVFJEZEVVS2JEbE5VRVIyY0dGRlVsbDRObnBuUFFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1663296540,
          "logIndex": 3512620,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/git/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3065078661",
      "sha": "7f709bd6771abffff0573fb5d038a06186d5fed6"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

