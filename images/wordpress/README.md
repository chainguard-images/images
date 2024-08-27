<!--monopod:start-->
# wordpress
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/wordpress` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/wordpress/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
Minimalist Wolfi-based WordPress images.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/wordpress:latest
```
<!--getting:end-->

<!--body:start-->
This image was designed to work as a drop-in replacement for the official [WordPress FPM-Alpine](https://hub.docker.com/_/wordpress) image, with a distroless variant for increased security on production environments. 

The `latest-dev` variant should be used to install and customize WordPress with themes and plugins. It has the same features from the upstream WordPress image, with an entrypoint script to set up the database via environment variables. The `latest` variant is a production-ready distroless image that should be used to run the WordPress site in a multi-stage build.

### Example Docker Compose Setup

You can use the following `docker-compose.yml` file to set up a **development environment** to install and customize WordPress:

```yaml
services:
  app:
    image: cgr.dev/chainguard/wordpress:latest-dev
    restart: unless-stopped
    environment:
      WORDPRESS_DB_HOST: mariadb
      WORDPRESS_DB_USER: wp-user
      WORDPRESS_DB_PASSWORD: wp-password
      WORDPRESS_DB_NAME: wordpress
    volumes:
      - document-root:/var/www/html
    networks:
      - wolfi

  nginx:
    image: cgr.dev/chainguard/nginx
    restart: unless-stopped
    ports:
      - 8000:8080
    volumes:
      - document-root:/var/www/html
      - ./nginx.conf:/etc/nginx/nginx.conf
    networks:
      - wolfi

  mariadb:
    image: cgr.dev/chainguard/mariadb
    restart: unless-stopped
    environment:
      MARIADB_ALLOW_EMPTY_ROOT_PASSWORD: 1
      MARIADB_USER: wp-user
      MARIADB_PASSWORD: wp-password
      MARIADB_DATABASE: wordpress
    ports:
      - 3306:3306
    networks:
      - wolfi

networks:
  wolfi:
    driver: bridge

volumes:
  document-root:
```

For this setup to work, you'll need an `nginx.conf` file with the following content:

```nginx
pid /var/run/nginx.pid;

events {
  worker_connections  1024;
}

http {
    server {
        listen 8080;
        index index.php index.html;
        root /var/www/html;
        charset utf-8;
        client_max_body_size 100M;
        timeout 300;

        location / {
            include  /etc/nginx/mime.types;
            try_files $uri $uri/ /index.php?$query_string;
        }

        location = /favicon.ico { access_log off; log_not_found off; }
        location = /robots.txt  { access_log off; log_not_found off; }

        location ~ \.php$ {
            try_files $uri =404;
            fastcgi_split_path_info ^(.+\.php)(/.+)$;
            fastcgi_pass app:9000;
            fastcgi_index index.php;
            include fastcgi_params;
            fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
            fastcgi_param PATH_INFO $fastcgi_path_info;
        }

        location ~ /\.(?!well-known).* {
            deny all;
        }
    }
}

```

After running `docker compose up`, your WordPress site will be available at `http://localhost:8000`. You can follow the installation instructions to set up your site and test your setup, but persisting customizations such as themes and plugins will require a different strategy that requires either setting up a volume for your theme and plugins or copying the custom content to the image through a Dockerfile that uses `cgr.dev/chainguard/wordpress:latest-dev` as the base image.


<!--body:end-->
