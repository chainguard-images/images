<!--monopod:start-->
# laravel
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/laravel` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/laravel/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimalist Wolfi-based Laravel images for building and running Laravel applications.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/laravel:latest
```
<!--getting:end-->

<!--body:start-->

## PHP Version
This will automatically pull the image to your local system and execute the command `php --version`:

```shell
docker run --rm --entrypoint php cgr.dev/chainguard/laravel --version
```

You should see output similar to this:

```
PHP 8.2.17 (cli) (built: Mar 12 2024 17:12:35) (NTS)
Copyright (c) The PHP Group
Zend Engine v4.2.17, Copyright (c) Zend Technologies
```

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

## Detailed Environment Information

To obtain information about available modules, you can run:

```shell
docker run --rm --entrypoint php cgr.dev/chainguard/laravel-latest -m
```

And this will give you the list of PHP modules currently enabled in the `cgr.dev/chainguard/laravel-latest` image:

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
<!--body:end-->
