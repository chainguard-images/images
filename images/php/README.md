<!--monopod:start-->
# php
| | |
| - | - |
| **Status** | stable |
| **OCI Reference** | `cgr.dev/chainguard/php` |
| **Variants/Tags** | ![](https://storage.googleapis.com/chainguard-images-build-outputs/summary/php.svg) |
---
<!--monopod:end-->

Minimalist PHP images for building and running PHP applications (CLI).

- [Documentation](https://edu.chainguard.dev/chainguard/chainguard-images/reference/php)
- [Getting Started Guide](https://edu.chainguard.dev/chainguard/chainguard-images/reference/php/getting-started/)
- [Provenance Information](https://edu.chainguard.dev/chainguard/chainguard-images/reference/php/provenance_info/)

## Usage 

To try out the image, run:

```shell
docker run --rm cgr.dev/chainguard/php --version
```

This will automatically pull the image to your local system and execute the command `php --version`. You should see output similar to this:

```
PHP 8.2.1 (cli) (built: Jan  1 1970 00:00:00) (NTS)
Copyright (c) The PHP Group
Zend Engine v4.2.1, Copyright (c) Zend Technologies
```

### Application Setup for End Users

When creating a Dockerfile to extend from these images, the recommended approach is to set up a multi-stage build so that you're able to install your Composer dependencies on a separate environment and then copy the files over to a smaller production image.

The following example demonstrates how to do that:

```Dockerfile
FROM cgr.dev/chainguard/php:latest-dev AS builder
COPY . /app
RUN cd /app && \
    composer install --no-progress --no-dev --prefer-dist

FROM cgr.dev/chainguard/php:latest
COPY --from=builder /app /app

ENTRYPOINT [ "php", "/app/command" ]
```

For more detailed information on how to use these images, check the [Getting Started with the PHP Chainguard Images](https://edu.chainguard.dev/chainguard/chainguard-images/reference/php/getting-started/) guide.

## Detailed Environment Information

To obtain detailed information about the environment, you can run a `php --info` command on any of the image tags and use `grep` to look for a specific module or extension.

For instance, to check for `curl` settings, you can run:

```shell
docker run --rm cgr.dev/chainguard/php:latest --info | grep curl
```
