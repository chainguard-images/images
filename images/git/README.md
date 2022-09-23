# git

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/git/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/git/actions/workflows/release.yaml)

This is a minimal Git image based on Alpine, using up-to-date apks available on the Alpine Community repositories (not built from source). The image contains `git`, `git-lfs`, and supporting libraries such as `openssh` (for `ssh`-based auth), and `ca-certs` (for `https`-based cloning).

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/git:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `2.37.3-r0-root-glibc` | `sha256:03bff3e9d1558c609925cb20b8b2b30fabbee60f244a46a0da67051827c6479a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:03bff3e9d1558c609925cb20b8b2b30fabbee60f244a46a0da67051827c6479a) | `amd64` |
| `2` `2-debian-11` `2.37.3` `2.37.3-debian-11-r7` `latest` | `sha256:fecf20ec858defbd6577b95d50e072a3836d8f390e7955a8e9801444c75ca75f`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:fecf20ec858defbd6577b95d50e072a3836d8f390e7955a8e9801444c75ca75f) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `2.37.3-r0` `root` | `sha256:62bc13811279d0e270683cf131bdca926777e611ed35f233ff5b31e401ec8884`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:62bc13811279d0e270683cf131bdca926777e611ed35f233ff5b31e401ec8884) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `2.37.3-debian-11-r5` | `sha256:5bd9e1bc50745c14199118e2a393a39e54d615444c91c6f09c3763ec8169d129`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:5bd9e1bc50745c14199118e2a393a39e54d615444c91c6f09c3763ec8169d129) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `2.37.3-debian-11-r6` | `sha256:fdede9d61b563ccb0a378233218a0040d24b4a97e0418d736708caa8394c7f55`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:fdede9d61b563ccb0a378233218a0040d24b4a97e0418d736708caa8394c7f55) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `2.37.3-r0-glibc` | `sha256:5221dda0dcc52c85f3f2ff349f3021a9442ed37e90a1434c306c80bf19396ec0`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:5221dda0dcc52c85f3f2ff349f3021a9442ed37e90a1434c306c80bf19396ec0) | `amd64` |


## Usage

The Git image allows you to run ordinary Git commands in CI/CD pipelines and also locally via Docker.

### Docker Setup

To make sure you have the latest image version available, start by running a `docker pull` command:

```shell
docker pull cgr.dev/chainguard/git
```

Then, run the image with the `--version` flag to make sure it is functional:

```shell
docker run -it --rm cgr.dev/chainguard/git --version
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
docker run -it -v ~/workspace:/home/git --rm cgr.dev/chainguard/git clone https://github.com/chainguard-images/git.git
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

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/git:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/git:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/git"
      },
      "image": {
        "docker-manifest-digest": "sha256:fecf20ec858defbd6577b95d50e072a3836d8f390e7955a8e9801444c75ca75f"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "b22bc6a909dc51c8dd9403b53198b6aaa1894da3",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/git",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIC7slszG73SW3AbBYC5R7ml/n+TdlTVLKQ8uuZb45ZIlAiB7nScUikEnJyXaosy3AKwyiByqwsEtv+se6OBYv8QxXg==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI1MDZhMTAzMjMwNDk1YzYwMmY5NzQwZjIzYTU0YTdlMmIzZDJlYmIzOWQxNDIwNDQ0NmNmNWRiMjk1ODRiODljIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURUdkhUNlRVbnNkbjVtQ1FRTHJidE5kcVZPZkhiQU5IbnhUdDFrMEdpNEN3SWhBTDlKWHhhMGxaR1ArdFBCUG5WWXcwekdoRit3Qlg5UkpBNTh2ZTBBUEpUSiIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndWRU5EUVhsNVowRjNTVUpCWjBsVlNXMXlLMHcwVVRscU5ITlBjMVJqWm01Qk1rWmxOeTlMTWpOemQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hwTlJFa3dUa1JSTlZkb1kwNU5ha2wzVDFSSmVrMUVTVEZPUkZFMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZzTDFSM1RsTk9iM0V6YUZGRlYyMUlTalF4VEhCMmJYSmtkekUxY1daT2Jrd3ZXWFFLVDJaSWFDOUVXazlEVUdRMFNVb3JUbUZsWVZNcllsVXZRV2R2YlZsdU5pOTBNMnhwVlVsYVpGQm1ZWFZvY2xkeE5qWlBRMEZyYzNkblowcElUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZzT0RaMUNtcHVjMkpLTkVjMU1UQnFNM1Z6Um0xNWNqbFVaVVZaZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhCa1F6aDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdldXcEplVmx0VFRKWlZHdDNUMWRTYWs1VVJtcFBSMUpyVDFSUmQwMHlTVEZOZWtVMVQwZEpNbGxYUm1oTlZHYzFDazVIVW1oTmVrRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1Ym1GWVVYZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIweENaMjl5UW1kRlJVRmtXalZCWjFGRFFrZ3dSV1YzUWpWQlNHTkJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUkdGRWRTOVJaMEZCUWtGTlFWTkVRa2RCYVVWQmFFaDJkSEJ5VDJOMU4zZ3dTVEFyUmtkdlRIY0tjVkp3TVcxcVIyWllhMWxCWlhjMGNFODJVU3RYV1ZGRFNWRkRUUzkzVFhVemNWSkRWblYxTlVGYVozUldSbVZtV0doM1YxUTRVMlZ6VTA1MEswMVZkQXBHT1ZCRWFWUkJTMEpuWjNGb2EycFBVRkZSUkVGM1RtNUJSRUpyUVdwQ1VWVndRVmRWT0RsdmQweEJWbGd4Y2tacVIwWjFhVWRFYm5oNVVGSkJTamxwQ21OdU1GTlRVRmhKWVdwaVN6RjVOVXB3U1RoRlYyUnhRWEZ4YUc1SFowMURUVUZKTkdwd1RtOUlTMkZYV2tjMlJuQXhORll4VjJSbVMyOU5USFZUZWtrS05HaGliMjVNV0d3MFRYWkxSMlY2V25CVmVqQTRZa2RST0ZGMlltTnRXRVJEVVQwOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1663901110,
          "logIndex": 3784126,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/git/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3110070164",
      "sha": "b22bc6a909dc51c8dd9403b53198b6aaa1894da3"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

