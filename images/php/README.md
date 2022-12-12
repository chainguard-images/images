# php

Minimalist PHP images for building and running PHP applications (CLI).

## Available Tags

- `latest`: Alpine-based image for production runtimes (distroless)
- `latest-glibc`: Wolfi-based image for production runtimes (distroless)
- `latest-dev`: Alpine-based image for development and build runtimes (includes Composer and busybox)
- `latest-glibc-dev`: Wolfi-based image for development and production runtimes (includes Composer and busybox)

## Usage 

To try out the image, run:

```shell
docker run --rm cgr.dev/chainguard/php --version
```

This will automatically pull the image to your local system and execute the command `php --version`. You should see output similar to this:

```
PHP 8.1.10 (cli) (built: Sep  1 2022 16:13:09) (NTS)
Copyright (c) The PHP Group
Zend Engine v4.1.10, Copyright (c) Zend Technologies
```

### Application Setup for End Users

When creating a Dockerfile to extend from these images, the recommended approach is to set up a multi-stage build so that you're able to install your Composer dependencies on a separate environment and then copy the files over to a smaller production image.

The following example demonstrates how to do that:

```Dockerfile
FROM cgr.dev/chainguard/php:latest-glibc-dev AS builder
COPY . /app
RUN cd /app && \
    composer install --no-progress --no-dev --prefer-dist

FROM cgr.dev/chainguard/php:latest-glibc
COPY --from=builder /app /app

ENTRYPOINT [ "php", "/app/minicli fact" ]

```

## Detailed Environment Information

To obtain detailed information about the environment, you can run a `php --info` command on any of the image tags and use `grep` to look for a specific module or extension.

For instance, to check for `curl` settings, you can run:

```shell
docker run --rm cgr.dev/chainguard/php:latest-glibc --info | grep curl
```