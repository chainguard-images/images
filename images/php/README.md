<!--monopod:start-->
# php
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/php` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/php/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for php

Minimalist Wolfi-based PHP images for building and running PHP applications. Includes both `dev` and `fpm` variants.

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/php:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->
## Compatibility Notes

The Chainguard PHP Image is comparable to the [official PHP Image from Docker Hub](https://hub.docker.com/_/php). However, the Chainguard image does not run as the root user and contains only the minimum set of tools and dependencies needed to function. This means it doesn't include things like a shell or a package manager.

Because PHP applications typically require the installation of third-party dependencies with Composer, using a fully distroless image for building your application would not work. In cases like this, it's recommended that you implement a [multi-stage Docker build](https://docs.docker.com/build/building/multi-stage/) that uses one of the PHP image's `-dev` variants to set up the application.

Note that chainguard also offers a `php:latest-fpm` image. This is the distroless `php-fpm` image variant, designed to be used together with our [Nginx](https://images.chainguard.dev/directory/image/nginx/overview) image.


## Getting Started

To better understand how you can work with the Chainguard PHP image, we encourage you to check out our guide on [getting started with PHP](https://edu.chainguard.dev/chainguard/chainguard-images/getting-started/php/). This resource demonstrates how you can use Chainguard's PHP Image to set up a distroless container image as a runtime to execute a command-line PHP application.

When creating a Dockerfile to extend Chainguard's PHP images, the recommended approach is to set up a multi-stage build so that you're able to install your Composer dependencies on a separate environment and then copy the files over to a smaller production image.


### Command-line Scripts and Applications

The following example demonstrates how to set up a multi-stage Dockerfile build in the context of command-line PHP applications:

```Dockerfile
FROM cgr.dev/chainguard/php:latest-dev AS builder
COPY . /app
RUN cd /app && \
    composer install --no-progress --no-dev --prefer-dist

FROM cgr.dev/chainguard/php:latest
COPY --from=builder /app /app

ENTRYPOINT [ "php", "/app/command" ]
```

### Web Applications and APIs

For web applications, you should follow the same principle, but using the `php-fpm` variant for the final image. You'll also need a custom `nginx.conf` file to set up your Nginx service with PHP-FPM.

A good way to test your setup locally is by using [Docker Compose](https://docs.docker.com/compose/compose-file/). The following `docker-compose.yaml` file demonstrates how to create a web server environment using the [Nginx Chainguard Image](https://images.chainguard.dev/directory/image/nginx/overview):

```yaml
version: "3.7"
services:
  app:
    image: cgr.dev/chainguard/php:latest-fpm
    restart: unless-stopped
    working_dir: /app
    volumes:
      - ./:/app
    networks:
      - wolfi

  nginx:
    image: cgr.dev/chainguard/nginx
    restart: unless-stopped
    ports:
      - 8000:80
    volumes:
      - ./:/app
      - ./nginx.conf:/etc/nginx/nginx.conf
    networks:
      - wolfi

networks:
  wolfi:
    driver: bridge
```

Notice that the Nginx service has a volume share to set up a custom config file. The following `nginx.conf` file sets up Nginx to serve pages from an `/app/public` folder and redirects requests to `.php` files to the `app` service on port `9000`.

```php
events {
  worker_connections  1024;
}

http {
    server {
        listen 80;
        index index.php index.html;
        root /app/public;
        location ~ \.php$ {
            try_files $uri =404;
            fastcgi_split_path_info ^(.+\.php)(/.+)$;
            fastcgi_pass app:9000;
            fastcgi_index index.php;
            include fastcgi_params;
            fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
            fastcgi_param PATH_INFO $fastcgi_path_info;
        }
        location / {
            try_files $uri $uri/ /index.php?$query_string;
            gzip_static on;
        }
    }
}
```


## Configuration

To install application dependencies from your host machine, you can use the `latest-dev` variant with a shared volume:

```shell
docker run --rm -v ${PWD}:/work --entrypoint composer --user root \
    cgr.dev/chainguard/php:latest-dev \
    install --working-dir=/work
```

To obtain information about modules available for the Chainguard PHP image, you can run the following command:

```shell
docker run --rm --entrypoint php cgr.dev/chainguard/php:latest -m
```

To obtain detailed information about the environment, you can run a `php --info` command on any of the image tags and use `grep` to look for a specific module or extension.

For instance, to check for `curl` settings, you can run:

```shell
docker run --rm cgr.dev/chainguard/php:latest --info | grep curl
```


## Documentation and Resources

* [Getting Started with the PHP Chainguard Image](https://edu.chainguard.dev/chainguard/chainguard-images/getting-started/php/)
* [Migrating to PHP Chainguard Images](https://edu.chainguard.dev/chainguard/migration/migrating-php/)
* [Vulnerability Comparison: php](https://edu.chainguard.dev/chainguard/chainguard-images/vuln-comparison/php/)
<!--body:end-->

## Contact Support

If you have a Zendesk account (typically set up for you by your Customer Success Manager) you can reach out to Chainguard's Customer Success team through our [Zendesk portal](https://support.chainguard.dev/hc/en-us).

## What are Chainguard Images?

[Chainguard Images](https://www.chainguard.dev/chainguard-images?utm_source=readmes) are a collection of container images designed for security and minimalism.

Many Chainguard Images are [distroless](https://edu.chainguard.dev/chainguard/chainguard-images/getting-started-distroless/); they contain only an open-source application and its runtime dependencies. These images do not even contain a shell or package manager. Chainguard Images are built with [Wolfi](https://edu.chainguard.dev/open-source/wolfi/overview), our Linux _undistro_ designed to produce container images that meet the requirements of a secure software supply chain.

The main features of Chainguard Images include:

* Minimal design, with no unnecessary software bloat
* Automated nightly builds to ensure Images are completely up-to-date and contain all available security patches
* [High quality build-time SBOMs](https://edu.chainguard.dev/chainguard/chainguard-images/working-with-images/retrieve-image-sboms/) (software bills of materials) attesting the provenance of all artifacts within the Image
* [Verifiable signatures](https://edu.chainguard.dev/chainguard/chainguard-images/working-with-images/retrieve-image-sboms/) provided by [Sigstore](https://edu.chainguard.dev/open-source/sigstore/cosign/an-introduction-to-cosign/)
* Reproducible builds with Cosign and apko ([read more about reproducibility](https://www.chainguard.dev/unchained/reproducing-chainguards-reproducible-image-builds))

### `-dev` Variants

As mentioned previously, Chainguard’s distroless Images have no shell or package manager by default. This is great for security, but sometimes you need these things, especially in builder images. For those cases, most (but not all) Chainguard Images come paired with a `-dev` variant which does include a shell and package manager.

Although the `-dev` image variants have similar security features as their distroless versions, such as complete SBOMs and signatures, they feature additional software that is typically not necessary in production environments. The general recommendation is to use the `-dev` variants only to build the application and then copy all application artifacts into a distroless image, which will result in a final container image that has a minimal attack surface and won’t allow package installations or logins.

That being said, it’s worth noting that `-dev` variants of Chainguard Images are completely fine to run in production environments. After all, the `-dev` variants are still **more secure** than many popular container images based on fully-featured operating systems such as Debian and Ubuntu since they carry less software, follow a more frequent patch cadence, and offer attestations for what they include.

## Learn More

To better understand how to work with Chainguard Images, we encourage you to visit [Chainguard Academy](https://edu.chainguard.dev/), our documentation and education platform.