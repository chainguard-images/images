<!--monopod:start-->
# laravel
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/laravel` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/laravel/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for laravel

Minimalist Wolfi-based Laravel images for developing, building, and running Laravel applications.

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/laravel:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->

## Obtaining Environment Information

Based on the `cgr.dev/chainguard/php:latest-fpm` image, our Laravel images include extensions required by Laravel and a dedicated `laravel` user with uid `1000`, reserved for development and build. To check the PHP version running on the `latest` variant, you can run:

```shell
docker run --rm --entrypoint php cgr.dev/chainguard/laravel:latest --version
```

You should get output similar to this:

```
PHP 8.2.17 (cli) (built: Mar 12 2024 17:12:35) (NTS)
Copyright (c) The PHP Group
Zend Engine v4.2.17, Copyright (c) Zend Technologies
```

To obtain information about available modules, you can run:

```shell
docker run --rm --entrypoint php cgr.dev/chainguard/laravel:latest -m
```

And this will give you the list of PHP modules currently enabled in the `cgr.dev/chainguard/laravel` image:

```
[PHP Modules]
Core
ctype
curl
date
dom
fileinfo
filter
hash
iconv
json
libxml
mbstring
mysqlnd
openssl
pcre
PDO
pdo_mysql
pdo_sqlite
Phar
random
readline
Reflection
session
SimpleXML
sodium
SPL
sqlite3
standard
tokenizer
xml
zlib
```
To obtain detailed information about the environment, you can run a `php --info` command on any of the image tags and use `grep` to look for a specific module or extension.

For instance, to check for `curl` settings, you can run:

```shell
docker run --rm --entrypoint php cgr.dev/chainguard/laravel:latest --info | grep curl
```

## Using the `latest-dev` image as Development Environment for Laravel Applications

You can use the `latest-dev` variant of the Laravel image to create and develop Laravel applications without having to install PHP on your host machine.

To create a new Laravel application from your host environment and get access to source files for development, you can run the `laravel-dev` image using a shared volume:

```shell
docker run --rm -v ${PWD}:/work --entrypoint composer --user laravel \
    cgr.dev/chainguard/laravel:latest-dev \
    create-project laravel/laravel demo-laravel --working-dir=/work
```

The **laravel** user has uid **1000**, which will typically match a non-root system user on Linux systems. This allows for a frictionless development environment using shared volumes. If you run into permission issues, it might be the case that your user has a different UID, and that won't match the ownership of files generated inside the container and shared through volumes. If that happens, you should use the `root` container user instead, and fix file permissions accordingly.

In a similar way, you can use the built-in Laravel server to preview the application on your host browser. You'll need a port redirect for that:

```shell
docker run -p 8000:8000 --rm -it -v ${PWD}:/work --entrypoint /work/demo-laravel/artisan --user laravel cgr.dev/chainguard/laravel:latest-dev serve --host=0.0.0.0
```
You can access the application at `http://localhost:8000` while the command runs.

## Example Docker Compose Setup
A good way to test your setup locally is by using [Docker Compose](https://docs.docker.com/compose/compose-file/). The following `docker-compose.yaml` file demonstrates how to create a web server environment using the [Nginx Chainguard Image](https://edu.chainguard.dev/chainguard/chainguard-images/reference/nginx) :

```yaml
version: "3.7"
services:
  app:
    image: cgr.dev/chainguard/laravel:latest-dev
    restart: unless-stopped
    working_dir: /app
    volumes:
      - ./app:/app
    networks:
      - wolfi

  nginx:
    image: cgr.dev/chainguard/nginx
    restart: unless-stopped
    ports:
      - 8000:8080
    volumes:
      - ./app:/app
      - ./nginx.conf:/etc/nginx/nginx.conf
    networks:
      - wolfi

  mariadb:
    image: cgr.dev/chainguard/mariadb
    restart: unless-stopped
    environment:
      MARIADB_ALLOW_EMPTY_ROOT_PASSWORD: 1
      MARIADB_USER: laravel
      MARIADB_PASSWORD: password
      MARIADB_DATABASE: php-test
    ports:
      - 3306:3306
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


You can get the environment up with:

```shell
docker composer up
```
This will give you a full LEMP experience in a persistent environment including a MariaDB database (drop-in replacement for MySQL).

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