# Adding Images

The following document outlines how to add a new image or image variant.

Note: for the remainder of the doc, "superimg" will be used
to imply the image you are working with.

Table of contents:
- [Adding a brand new image](#adding-a-brand-new-image)
- [Adding a new image variant](#adding-a-new-image-variant)
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
```

## Smoke testing

If a file is found at `images/<name>/test.sh`, CI will automatically run it as part of testing your image.

The environment variable `IMAGE_NAME` will be present, pointing to the image that has been built. You should start your `test.sh` file with something similar to the following:

```sh
#!/usr/bin/env bash

set -x
set -o errexit -o nounset -o errtrace -o pipefail

IMAGE_NAME=${IMAGE_NAME:-"unset"}
if [[ "${IMAGE_NAME}" == "unset" ]]; then
    echo "Must set IMAGE_NAME in the environment. Exiting."
    exit 1
fi
```

Also, be sure to make the script executable:

```
chmod +x images/superimg/test.sh
```

## Regenerating the README

Whether you are adding a new image or new image variant (or removing one),
you will need to regenerate the README file or else CI will complain.

First, build `monopod` and add it to your PATH:

```
(cd monopod/ && go build -o bin/monopod monopod.go)
export PATH="${PWD}/monopod/bin:${PATH}"
```

Run the following to regenerate the README:

```
monopod readme > README.md 
```

Then check in the modified README to git.
