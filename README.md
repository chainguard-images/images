# Chainguard Images

This repository holds the public build configuration for available [Chainguard Images](https://images.chainguard.dev) — minimal, hardened OCI images published to `cgr.dev/chainguard/<image>`.

## Using an image

Images are published at `cgr.dev/chainguard/<name>`. For example:

```sh
docker pull cgr.dev/chainguard/static:latest
docker pull cgr.dev/chainguard/nginx:latest
```

Browse the full catalog at [images.chainguard.dev](https://images.chainguard.dev). Each image's usage notes live in its own README under [`images/<name>/README.md`](./images).

## How images are built

Every image is produced with [`apko`](https://github.com/chainguard-dev/apko) from a pinned, reproducible configuration stored alongside the image:

```
images/<name>/
├── locked_config.json   # Pinned apko config per architecture (+ tags, repo)
├── README.md            # User-facing documentation for the image
├── tests/               # End-to-end tests
└── metadata.yaml        # Image metadata
```

`locked_config.json` is the source of truth for what goes into the published image. It contains a fully resolved apko configuration — exact package versions, accounts, entrypoint, environment, and annotations — for each supported architecture. Because the package versions are pinned, builds are reproducible: the same `locked_config.json` produces the same image content.

Publication is driven by the [`release.yaml`](./.github/workflows/release.yaml) workflow. When a `locked_config.json` changes on `main` (or on the daily schedule), the workflow shards the affected images and invokes the Terraform module at [`main.tf`](./main.tf), which:

1. Reads `images/<name>/locked_config.json`.
2. Builds each variant with the `apko` Terraform provider.
3. Publishes the resulting OCI images to `cgr.dev/chainguard/<name>` along with SBOMs and [cosign](https://github.com/sigstore/cosign) attestations.
4. Applies the `tags` declared in the lock file.

## Building an image locally

You can reproduce a build on your own machine using `apko` and the `locked_config.json` checked into this repo. See [`BUILDING.md`](./BUILDING.md) for a step-by-step example.

## Repository layout

| Path | Purpose |
| --- | --- |
| `images/<name>/` | Per-image build config, tests, and README |
| `tflib/` | Shared Terraform modules used by the release driver |
| `.github/workflows/release.yaml` | Workflow that runs the release |

## More

- [Image guidelines](./BEST_PRACTICES.md) — the design standards every image follows.
- [Withdrawing images](./WITHDRAWING_IMAGES.md) — how tags and repos are retired.
- [Security policy](./SECURITY.md) — reporting vulnerabilities.
- [Chainguard Images docs](https://edu.chainguard.dev/chainguard/chainguard-images/) — background and concepts.
- [Chainguard Console](https://console.chainguard.dev) — log in to view the full commercial catalog.
