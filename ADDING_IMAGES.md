# Adding Images

The following document outlines how to add a new image or image variant.

Note: for the remainder of the doc, "superimg" will be used
to imply the image you are working with.

Table of contents:
- [Adding a brand new image](#adding-a-brand-new-image)
- [Adding a new image variant](#adding-a-new-image-variant)
- [Subvariants](#subvariants)
- [Smoke testing](#smoke-testing)
- [The image.yaml file](#the-imageyaml-file)
- [Regenerating the README](#regenerating-the-readme)

## Adding a brand new image

First, create a new directory at `images/<name>/`:

```
mkdir -p images/superimg/
```

Next, add your [apko](https://github.com/chainguard-dev/apko)
configuration(s) to `images/<name>/configs/`.
```
mkdir -p images/superimg/configs/
```

```
cat <<EOF > images/superimg/configs/demo.apko.yaml
contents:
  keyring:
    - https://packages.wolfi.dev/os/wolfi-signing.rsa.pub
  repositories:
    - https://packages.wolfi.dev/os
  packages:
    - wolfi-base
    - tree
entrypoint:
  command: /usr/bin/tree --version
archs:
- x86_64
EOF
```

Next, create a file at `images/<name>/image.yaml` pointing to your apko configs:

```
cat <<EOF > images/superimg/image.yaml
versions:
  - apko:
      config: configs/demo.apko.yaml
      extractTagsFrom:
        package: tree
      tags:
        - superduper1
        - superduper2
EOF
```

That's it! This will result in an image pushed with the following tags:
```
# Based on the name of the apko config file
ghcr.io/chainguard-images/superimg:demo

# Based on additional tags
ghcr.io/chainguard-images/superimg:superduper1
ghcr.io/chainguard-images/superimg:superduper2

# Based on the version of the "tree" package (e.g. 2.0.4)
ghcr.io/chainguard-images/superimg:2.0.4-rc0
ghcr.io/chainguard-images/superimg:2.0.4
ghcr.io/chainguard-images/superimg:2.0
ghcr.io/chainguard-images/superimg:2
```

## Adding a new image variant

To add a new image variant, simply update
`images/<name>/image.yaml` to contain new a variant.

Be sure that the apko config etc. exists too.

## Subvariants

By including a `subvariants` section for an image, you can produce multiple
images from the same variant (e.g. a "dev" variant).

In most cases, this can be achieved with something like below:

```yaml
versions:
  - apko:
      config: configs/latest.apko.yaml
      subvariants:
        - suffix: -dev
          options:
            - dev
```

This tells apko to add `--build-option dev` to the build. This option
is defined in [globals.yaml](./globals.yaml).

In some instances, a specific image may need more than the baseline for
the `dev` option (e.g. composer for PHP). To add a custom option for
a given image, you can achieve so with something like the following:

```yaml
versions:
  - apko:
      config: configs/latest.apko.yaml
      subvariants:
        - suffix: -dev
          options:
            - dev
            - php-dev
options:
  php-dev:
    contents:
      packages:
        add:
          - composer
```

This tells apko to add 2 build options
(`--build-option dev` and `--build-option php-dev`).

The will result in both the packages defined by the `dev` in
[globals.yaml](./globals.yaml), as well as the packages defined in
the image-specific `php-dev` option above to be added to the image
at build time.

## The image.yaml file

The `image.yaml` is the primary configuration file for a given image.

Here is an annotated example:

```yaml
versions:
  - melange:
      # The path to a custom melange configuration (optional)
      config: configs/openjdk-17.melange.yaml

    apko:
      # The path to the apko configuration. This filename is
      # used to determine the primary image tag ("openjdk-17")
      config: configs/openjdk-17.apko.yaml

      # Extract additional tags for the image, based on
      # a package that is included in the image, as well
      # as a prefix. This would produce additional tags like:
      #
      #   - openjdk-17.0.5.8-rc0
      #   - openjdk-17.0.5.8
      #   - openjdk-17.0.5
      #   - openjdk-17.0
      #
      extractTagsFrom:
        package: openjdk-17
        prefix: openjdk-

      # These are explicit static tags to add to the image
      tags:
        - latest

      # Subvariants of this image with additional build options
      # and a unique tag suffix
      subvariants:
        - suffix: -dev
          options:
            - dev
```

## Smoke testing

If a directory is found at `images/<name>/tests/`, CI will automatically run
each script found here in alphabetical order as part of testing your image.

Alternatively, if a file is found at `images/<name>/test.sh`, this single test will be run.

The environment variable `IMAGE_NAME` will be present, pointing to the image that has been built. You should start your `test.sh` file with something similar to the following:

```sh
#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

IMAGE_DIR="$(basename "$(cd "$(dirname ${BASH_SOURCE[0]})/.." && pwd )")"
IMAGE_NAME=${IMAGE_NAME:-"cgr.dev/chainguard/${IMAGE_DIR}:latest"}

```

Also, be sure to make the script(s) executable:

```
chmod +x images/superimg/test.sh
```

## Functional testing

In the same scripts as the section above, you may place the following comment
somewhere at the top of the script:

```
# monopod:tag:functional
```

This will indicate that this test requires a kind cluster, and will run
separately from other tests.

## Regenerating the README

Whether you are adding a new image or new image variant (or removing one),
you will need to regenerate the README file or else CI will complain.

First, install `monopod`. (This assumes that your `$GOBIN` is in your `$PATH`.)

```shell
(cd monopod && go install)
```

Run the following to regenerate the README.md at the root of the repo, as well as each individual image README.md:

```
monopod readme
```

Then check in all modified README.md files to git.

If you wish to check that everything is up-to-date,
you can use the `--check` flag:

```
monopod readme --check
```
