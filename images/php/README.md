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
Minimalist Wolfi-based PHP images for building and running PHP applications. Includes both `dev` and `fpm` variants.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/php:latest
```
<!--getting:end-->

<!--body:start-->
## Image Variants

Our `latest` tags use the most recent build of the [Wolfi PHP](https://github.com/wolfi-dev/os/blob/main/php.yaml) package. All variants have `-dev` versions that include Composer and other utilities that are suitable for developing and building PHP applications. Check the [Tags](https://edu.chainguard.dev/chainguard/chainguard-images/reference/php/tags_history/) page for more details on available tags, and the [Details]() page for information about included packages per variant.

- `latest`: This is a distroless image for running command-line PHP applications.
- `latest-fpm`: This is the distroless `php-fpm` image variant, designed to be used together with our [Nginx](https://edu.chainguard.dev/chainguard/chainguard-images/reference/nginx) image.

### PHP Version
This will automatically pull the image to your local system and execute the command `php --version`:

```shell
docker run --rm cgr.dev/chainguard/php --version
```

You should get output similar to this:

```
PHP 8.2.1 (cli) (built: Jan  1 1970 00:00:00) (NTS)
Copyright (c) The PHP Group
Zend Engine v4.2.1, Copyright (c) Zend Technologies
```

## Running Composer

To install application dependencies from your host machine, you can use the `latest-dev` variant with a shared volume:

```shell
docker run --rm -v ${PWD}:/work --entrypoint composer --user root \
    cgr.dev/chainguard/php:latest-dev \
    install --working-dir=/work
```

## Application Setup for End Users

When creating a Dockerfile to extend from these images, the recommended approach is to set up a multi-stage build so that you're able to install your Composer dependencies on a separate environment and then copy the files over to a smaller production image.

### CLI Scripts and Applications
The following example demonstrates how to set up a multi-stage Dockerfile build in the context of command line PHP applications:

```Dockerfile
FROM cgr.dev/chainguard/php:latest-dev AS builder
COPY . /app
RUN cd /app && \
    composer install --no-progress --no-dev --prefer-dist

FROM cgr.dev/chainguard/php:latest
COPY --from=builder /app /app

ENTRYPOINT [ "php", "/app/command" ]
```
### Web Applications / APIs
For web applications, you should follow the same principle, but using the `php-fpm` variant for the final image. You'll also need a custom `nginx.conf` file to set up your Nginx service with PHP-FPM.

A good way to test your setup locally is by using [Docker Compose](https://docs.docker.com/compose/compose-file/). The following `docker-compose.yaml` file demonstrates how to create a web server environment using the [Nginx Chainguard Image](https://edu.chainguard.dev/chainguard/chainguard-images/reference/nginx) :

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

You'll notice the Nginx service has a volume share to set up a custom config file. The following `nginx.conf` file sets up Nginx to serve pages from a `/app/public` folder and redirects requests to `.php` files to the `app` service on port `9000`.

```
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

For more detailed information on how to use these images, check the [Getting Started with the PHP Chainguard Images](https://edu.chainguard.dev/chainguard/chainguard-images/reference/php/getting-started-php/) guide.

## Detailed Environment Information

To obtain information about available modules, you can run:

```shell
docker run --rm --entrypoint php cgr.dev/chainguard/php:latest -m
```

To obtain detailed information about the environment, you can run a `php --info` command on any of the image tags and use `grep` to look for a specific module or extension.

For instance, to check for `curl` settings, you can run:

```shell
docker run --rm cgr.dev/chainguard/php:latest --info | grep curl
```
<!--body:end-->
