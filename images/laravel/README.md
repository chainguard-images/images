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
Minimalist Wolfi-based Laravel images for developing, building, and running Laravel applications.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/laravel:latest
```
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
