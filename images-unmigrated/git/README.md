# git

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/distroless/readme-generator
-->

[![CI status](https://github.com/distroless/git/actions/workflows/release.yaml/badge.svg)](https://github.com/distroless/git/actions/workflows/release.yaml)

This is a minimal Git image based on Alpine, using up-to-date apks available on the Alpine Community repositories (not built from source). The image contains usage: git [-v | --version] [-h | --help] [-C <path>] [-c <name>=<value>]
           [--exec-path[=<path>]] [--html-path] [--man-path] [--info-path]
           [-p | --paginate | -P | --no-pager] [--no-replace-objects] [--bare]
           [--git-dir=<path>] [--work-tree=<path>] [--namespace=<name>]
           [--super-prefix=<path>] [--config-env=<name>=<envvar>]
           <command> [<args>]

These are common Git commands used in various situations:

start a working area (see also: git help tutorial)
   clone     Clone a repository into a new directory
   init      Create an empty Git repository or reinitialize an existing one

work on the current change (see also: git help everyday)
   add       Add file contents to the index
   mv        Move or rename a file, a directory, or a symlink
   restore   Restore working tree files
   rm        Remove files from the working tree and from the index

examine the history and state (see also: git help revisions)
   bisect    Use binary search to find the commit that introduced a bug
   diff      Show changes between commits, commit and working tree, etc
   grep      Print lines matching a pattern
   log       Show commit logs
   show      Show various types of objects
   status    Show the working tree status

grow, mark and tweak your common history
   branch    List, create, or delete branches
   commit    Record changes to the repository
   merge     Join two or more development histories together
   rebase    Reapply commits on top of another base tip
   reset     Reset current HEAD to the specified state
   switch    Switch branches
   tag       Create, list, delete or verify a tag object signed with GPG

collaborate (see also: git help workflows)
   fetch     Download objects and refs from another repository
   pull      Fetch from and integrate with another repository or a local branch
   push      Update remote refs along with associated objects

'git help -a' and 'git help -g' list available subcommands and some
concept guides. See 'git help <command>' or 'git help <concept>'
to read about a specific subcommand or concept.
See 'git help git' for an overview of the system., git-lfs/3.2.0 (GitHub; linux amd64; go 1.18.2)
git lfs <command> [<args>]

Git LFS is a system for managing and versioning large files in
association with a Git repository.  Instead of storing the large files
within the Git repository as blobs, Git LFS stores special "pointer
files" in the repository, while storing the actual file contents on a
Git LFS server.  The contents of the large file are downloaded
automatically when needed, for example when a Git branch containing
the large file is checked out.

Git LFS works by using a "smudge" filter to look up the large file
contents based on the pointer file, and a "clean" filter to create a
new version of the pointer file when the large file's contents change.
It also uses a pre-push hook to upload the large file contents to
the Git LFS server whenever a commit containing a new large file
version is about to be pushed to the corresponding Git server.

Commands
--------

Like Git, Git LFS commands are separated into high level ("porcelain")
commands and low level ("plumbing") commands.

High level porcelain commands
-----------------------------

* git lfs checkout:
    Populate working copy with real content from Git LFS files.
* git lfs dedup:
    De-duplicate Git LFS files.
* git lfs env:
    Display the Git LFS environment.
* git lfs ext:
    Display Git LFS extension details.
* git lfs fetch:
    Download Git LFS files from a remote.
* git lfs fsck:
    Check Git LFS files for consistency.
* git lfs install:
    Install Git LFS configuration.
* git lfs lock:
    Set a file as "locked" on the Git LFS server.
* git lfs locks:
    List currently "locked" files from the Git LFS server.
* git lfs logs:
    Show errors from the Git LFS command.
* git lfs ls-files:
    Show information about Git LFS files in the index and working tree.
* git lfs migrate:
    Migrate history to or from Git LFS
* git lfs prune:
    Delete old Git LFS files from local storage
* git lfs pull:
    Fetch Git LFS changes from the remote & checkout any required working tree
    files.
* git lfs push:
    Push queued large files to the Git LFS endpoint.
* git lfs status:
    Show the status of Git LFS files in the working tree.
* git lfs track:
    View or add Git LFS paths to Git attributes.
* git lfs uninstall:
    Uninstall Git LFS by removing hooks and smudge/clean filter configuration.
* git lfs unlock:
    Remove "locked" setting for a file on the Git LFS server.
* git lfs untrack:
    Remove Git LFS paths from Git Attributes.
* git lfs update:
    Update Git hooks for the current Git repository.
* git lfs version:
    Report the version number.
  
Low level plumbing commands
---------------------------

* git lfs clean:
    Git clean filter that converts large files to pointers.
* git lfs filter-process:
    Git process filter that converts between large files and pointers.
* git lfs merge-driver:
    Merge text-based LFS files
* git lfs pointer:
    Build and compare pointers.
* git lfs post-checkout:
    Git post-checkout hook implementation.
* git lfs post-commit:
    Git post-commit hook implementation.
* git lfs post-merge:
    Git post-merge hook implementation.
* git lfs pre-push:
    Git pre-push hook implementation.
* git lfs smudge:
    Git smudge filter that converts pointer in blobs to the actual content.
* git lfs standalone-file:
    Git LFS standalone transfer adapter for file URLs (local paths).
  
Examples
--------

To get started with Git LFS, the following commands can be used.

 1. Setup Git LFS on your system. You only have to do this once per
    repository per machine:

        git lfs install

 2. Choose the type of files you want to track, for examples all ISO
    images, with git lfs track:

        git lfs track "*.iso"

 3. The above stores this information in gitattributes(5) files, so
    that file needs to be added to the repository:

        git add .gitattributes

 4. Commit, push and work with the files normally:

        git add file.iso
        git commit -m "Add disk image"
        git push, and supporting libraries such as  (for -based auth), and  (for -based cloning).

## Get It!

The image is available on `distroless.dev`:

```
docker pull distroless.dev/git:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `2` `2-debian-11` `2.37.3` `2.37.3-debian-11-r5` `latest` | `sha256:88143e9d597b0eb533410b22058bcc64e3cfdd37cb84c3b224b52aca7a0e8b8e`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:88143e9d597b0eb533410b22058bcc64e3cfdd37cb84c3b224b52aca7a0e8b8e) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `2.37.3-r0` `root` | `sha256:9f8e60c9552f82a9f746b38faaf2515819c9cf049570191544b5fa9569b15ab7`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:9f8e60c9552f82a9f746b38faaf2515819c9cf049570191544b5fa9569b15ab7) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `2.37.3-debian-11-r4` | `sha256:890750a0a836d4612bf2361e2f6ceb0ee1f7688fd770da7b390f190120dc4675`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:890750a0a836d4612bf2361e2f6ceb0ee1f7688fd770da7b390f190120dc4675) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:88143e9d597b0eb533410b22058bcc64e3cfdd37cb84c3b224b52aca7a0e8b8e"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "60666ec0df0a7d0f2d7cfc5ddd716232dfbda0fa",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/git",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIAMgmpFKf42jFVj96NInCxRYYxpDg63WdPuTClq8NHCaAiBgwDnWS7foXdij8Ov4eHtA3E6YgFYTcggW3FSDbJXOCg==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIwNGY5NzQ1MTJkZTI2ODMzMjc1NzViMmE5OWQ0MzhjMDI5NzYzMDM1NDRkODYyZmJjMjc4N2RhZmM3NjFhNWUxIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJRVZBWkErb1BmVHl3Qlpzb3N1QW1tcU16enRTcFpYR0hVYTZzZk4ydDBuREFpRUFnNkdSZDlmRkNKcmN6MFl3SjUvbkE1L1JnOWxOU1JuUGVQTUQ5a0Y5VHNvPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnJla05EUVhodFowRjNTVUpCWjBsVlIxQXlkR280TkdFd2IyNXhRM1owVkZwb2F6aFVPVlJ1TjFGVmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRCTlZHTXhUMVJGTWxkb1kwNU5ha2wzVDFSRk1FMVVaM2RQVkVVeVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVY2TkdoTkwwcFFOWE4xTmprd01uVnNiMDFoVFdkekwwMUxaVlF6WTNaMFptdEZSa2NLUTFWNFpIUjVVa0VyZEhaV1dtZFdLMGxRSzB4aFNsaGxhalZEUW1WMk16bE1WVXBOUzNCbE1tVnNSM1pLYm5ReFFrdFBRMEZxWjNkblowa3dUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ6ZUUwd0NubGtTRU5xTmxoR1Z6Wk5hWFJ1WXpkR1l6Z3dXVmgzZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFobldVUldVakJTUVZGSUwwSkdVWGRWYjFwUllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BhTW13d1RIazFibUZZVW05a1YwbDJaREk1ZVdFeVduTmlNMlI2VEROS2JHSkhWbWhqTWxWMVpWZEdkR0pGUW5sYVYxcDZUREpvYkZsWFVucE1NakZvQ21GWE5IZFBVVmxMUzNkWlFrSkJSMFIyZWtGQ1FWRlJjbUZJVWpCalNFMDJUSGs1TUdJeWRHeGlhVFZvV1ROU2NHSXlOWHBNYldSd1pFZG9NVmx1Vm5vS1dsaEthbUl5TlRCYVZ6VXdURzFPZG1KVVFWTkNaMjl5UW1kRlJVRlpUeTlOUVVWRFFrRlNkMlJZVG05TlJGbEhRMmx6UjBGUlVVSm5OemgzUVZGTlJRcExSRmwzVG1wWk1scFhUWGRhUjFsM1dWUmthMDFIV1hsYVJHUnFXbTFOTVZwSFVtdE9la1V5VFdwTmVWcEhXbWxhUjBWM1dtMUZkMGhCV1V0TGQxbENDa0pCUjBSMmVrRkNRa0ZSVDFFelNteFpXRkpzU1VaS2JHSkhWbWhqTWxWM1NFRlpTMHQzV1VKQ1FVZEVkbnBCUWtKUlVVOWFSMng2WkVoS2RtSkhWbm9LWTNrNWJtRllVWGRJVVZsTFMzZFpRa0pCUjBSMmVrRkNRbWRSVUdOdFZtMWplVGx2V2xkR2EyTjVPWFJaVjJ4MVRVbEhTMEpuYjNKQ1owVkZRV1JhTlFwQloxRkRRa2gzUldWblFqUkJTRmxCUTBkRFV6aERhRk12TW1oR01HUkdja28wVTJOU1YyTlpja0paT1hkNmFsTmlaV0U0U1dkWk1tSXpTVUZCUVVkRUNsQlRaVEpvZDBGQlFrRk5RVko2UWtaQmFVRTFLMEpsUms1U1NHOTFaVkJ4ZWl0UFpqQkNka013TDNwNFdVZ3pNV3BOWm5sQmNFRm1Za2RuT0RSQlNXZ0tRVTE1ZUdGRk5XTTRkMDA0YlZaMFJFTldUR3RJU3paWlUweEpZWEpWY0c1MldteHZjWGxaWTB0SVIzZE5RVzlIUTBOeFIxTk5ORGxDUVUxRVFUSm5RUXBOUjFWRFRVRjBXWE5CUlVwb1YySmtXV1l5ZWxkek4wZzRNazlrY2s1a2JrSTJSamh6Tkc1U1JIcEplalJCWjNoaWVsSnFSbkoyYzFOd1pITXdha2hGQ2pCc1EzbHZRVWw0UVVzeGJVaExjVVpCZUU4cmRIQkpaekk0Wm1waFptTjNiMlpxVTA1NWJGaHVXV3hFT0dZd1NYZHdXblJ1YlRBd2FFTldZek51ZFdRS2VpdEZka3B5UVRnNFFUMDlDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1663178397,
          "logIndex": 3499340,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/git/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3054974440",
      "sha": "60666ec0df0a7d0f2d7cfc5ddd716232dfbda0fa"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

