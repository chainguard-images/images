# Building Chainguard Images locally

Every image in this repository ships a `locked_config.json` — a lock file that contains the fully resolved, pinned build inputs for each supported architecture. It embeds per-architecture [`apko`](https://github.com/chainguard-dev/apko) configurations (packages at exact versions, accounts, entrypoint, annotations, and so on) that our release pipeline feeds directly to the `apko` Terraform provider to produce the images at `cgr.dev/chainguard`.

To build locally with the `apko` CLI, you first need to use `jq` to extract the raw apko config from the lock file — the CLI doesn't consume `locked_config.json` directly. The steps below walk through that.

> `apko` and Chainguard's public package repository (`apk.cgr.dev/chainguard`) are enough to build any image in this repo — no Chainguard account or internal tooling required.

## Prerequisites

- [`apko`](https://github.com/chainguard-dev/apko?tab=readme-ov-file#installation)
- [`jq`](https://jqlang.org/)
- Docker (or any tool that can load an OCI tarball) — optional, only needed to run the image afterwards

## What's inside `locked_config.json`

The top-level shape is:

```json
{
  "imageLocks": {
    "<variant-name>": {
      "configs": {
        "amd64":  "{\"config\": { ...apko config for amd64... }}",
        "arm64":  "{\"config\": { ...apko config for arm64... }}",
        "index":  "{\"config\": { ...merged config for the index... }}"
      },
      "devConfigs": { ... },
      "repo":  "public/<name>",
      "tags":  ["latest", ...]
    }
  }
}
```

Each entry under `imageLocks` is one publishable variant. The `configs` map holds a stringified JSON apko configuration per architecture — package list at pinned versions, accounts, entrypoint, annotations, paths, and so on. The release pipeline passes these directly to the `apko` Terraform provider; to use them with the `apko` CLI you extract the inner `.config` object with `jq` (see below).

## Build an image in three commands

The example below builds the `static` image. Swap `static` for any directory name under [`images/`](./images) to build a different image.

```sh
# 1. Extract the apko config for the desired variant.
jq -r '.imageLocks["static-public"].configs.index | fromjson | .config' \
  images/static/locked_config.json > static.apko.json

# 2. Build with apko. --arch host limits to your current architecture;
#    drop it to build the full multi-arch index.
apko build static.apko.json cgr.dev/chainguard/static:local static.tar --arch host

# 3. (Optional) Load into Docker and run.
docker load < static.tar
docker run --rm cgr.dev/chainguard/static:local
```

The variant key (`static-public` above) matches the key inside `imageLocks`. Most images have a single variant; a few publish multiple (for example a base and a `-dev` counterpart). To list the variants available for an image:

```sh
jq -r '.imageLocks | keys[]' images/<name>/locked_config.json
```

## Building for a specific architecture

`configs` exposes per-architecture entries (`amd64`, `arm64`) and a combined `index`. Pick whichever matches what you want to produce:

```sh
# Single arch, matching your machine.
jq -r '.imageLocks["static-public"].configs.amd64 | fromjson | .config' \
  images/static/locked_config.json > static.amd64.apko.json
apko build static.amd64.apko.json cgr.dev/chainguard/static:local static.tar

# Multi-arch index.
jq -r '.imageLocks["static-public"].configs.index | fromjson | .config' \
  images/static/locked_config.json > static.apko.json
apko build static.apko.json cgr.dev/chainguard/static:local static.tar
```

## Publishing to your own registry

`apko publish` pushes directly to a registry instead of writing a tarball:

```sh
apko publish static.apko.json ghcr.io/<you>/static:local
```

You'll need to be authenticated to the destination registry (`docker login`, `gh auth`, etc.).

### A note on digests

A locally built image will not produce the same digest as the corresponding `cgr.dev/chainguard` image, even from the same `locked_config.json`. `apko` stamps the current timestamp into the image config at build time, which changes the image digest. The package layers (filesystem contents) will be identical; only the config blob — and therefore the overall manifest digest — will differ.

You can use [`crane`](https://github.com/google/go-containerregistry/blob/main/cmd/crane/README.md) to compare the layer digests between a locally published image and the one in the registry:

```sh
diff \
  <(crane manifest cgr.dev/chainguard/static:latest | jq -r '[.layers[].digest] | sort[]') \
  <(crane manifest ghcr.io/<you>/static:local       | jq -r '[.layers[].digest] | sort[]')
```

An empty diff means the filesystem layers are identical. The SBOM and cosign attestations attached by our release pipeline are not reproduced by a local build.

## Further reading

- [`apko` documentation](https://github.com/chainguard-dev/apko/tree/main/docs) — full reference for the configuration format.
- [`apko` file format](https://github.com/chainguard-dev/apko/blob/main/docs/apko_file.md) — description of every field you'll see in `locked_config.json`.
- [Chainguard public APK repository](https://apk.cgr.dev/chainguard) — where the pinned packages come from.
