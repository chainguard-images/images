<!--monopod:start-->
# clickhouse
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/clickhouse` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/clickhouse/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
[Clickhouse](https://clickhouse.com) is the fastest and most resource efficient open-source database for real-time apps and analytics.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/clickhouse:latest
```
<!--getting:end-->

<!--body:start-->
## Using Clickhouse

The default Clickhouse listen_host is `127.0.0.1` and port is `8123`.

### start server instance

To run with Docker and allow empty passwords:

```
docker run -d --ulimit nofile=262144:262144 cgr.dev/chainguard/clickhouse:latest
```

By default, ClickHouse will be accessible only via the Docker network. See the networking section below.

By default, starting above server instance will be run as the default user without password.

## Users and Directories

By default, this image runs as a non-root user named `clickhouse` with a uid of `101` and a home directory of `/home/clickhouse`.

### Volumes

Typically you may want to mount the following folders inside your container to achieve persistency:

* /var/lib/clickhouse/ - main folder where ClickHouse stores the data
* /var/log/clickhouse-server/ - logs

```
docker run -d \
    -v $(realpath ./ch_data):/var/lib/clickhouse/ \
    -v $(realpath ./ch_logs):/var/log/clickhouse-server/ \
    --ulimit nofile=262144:262144 cgr.dev/chainguard/clickhouse:latest
```

You may also want to mount:

* /etc/clickhouse-server/config.d/*.xml - files with server configuration adjustmenets
* /etc/clickhouse-server/users.d/*.xml - files with user settings adjustmenets
* /docker-entrypoint-initdb.d/ - folder with database initialization scripts (see below).


## Docker Compose Example

This `docker-compose.yaml` sets up a Clickhouse database with a default database and user.

```yaml
version: "3.7"
services:
  clickhouse:
    image: cgr.dev/chainguard/clickhouse:latest
    restart: unless-stopped
    entrypoint: /usr/bin/clickhouse-server -- --listen_host 0.0.0.0
    working_dir: /home/clickhouse
    ports:
      - 8123:8123
    volumes:
      - ./data/clickhouse:/var/lib/clickhouse
      - ./logs/clickhouse:/var/log/clickhouse-server
    networks:
      - wolfi

networks:
  wolfi:
    driver: bridge
```

## Advanced Configuration

Please refer to [Clickhouse's documentation](https://clickhouse.com/docs/en/operations/configuration-files#configuration_files) for more advanced configuration.

<!--body:end-->
