<!--monopod:start-->
# mariadb
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/mariadb` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/mariadb/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
[MariaDB](https://mariadb.org) is one of the most popular open source relational databases.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/mariadb:latest
```
<!--getting:end-->

<!--body:start-->
## Using MariaDb

The default MariaDB port is 3306.
To run with Docker and allow empty passwords:

```sh
$ docker run -p 3306:3306 --rm -e MARIADB_ALLOW_EMPTY_ROOT_PASSWORD=1 cgr.dev/chainguard/mariadb
Mon Jan 23 03:47:20 UTC 2023 [Note] [Entrypoint]: Entrypoint script for MariaDB Server  started.
Mon Jan 23 03:47:20 UTC 2023 [Note] [Entrypoint]: Initializing database files


PLEASE REMEMBER TO SET A PASSWORD FOR THE MariaDB root USER !
To do so, start the server, then issue the following command:

'/usr/bin/mysql_secure_installation'

which will also give you the option of removing the test
databases and anonymous user created by default.  This is
strongly recommended for production servers.

See the MariaDB Knowledgebase at https://mariadb.com/kb

Please report any problems at https://mariadb.org/jira

The latest information about MariaDB is available at https://mariadb.org/.

Consider joining MariaDB's strong and vibrant community:
https://mariadb.org/get-involved/

Mon Jan 23 03:47:21 UTC 2023 [Note] [Entrypoint]: Database files initialized
...
2023-01-23  3:47:23 0 [Note] Plugin 'FEEDBACK' is disabled.
2023-01-23  3:47:23 0 [Note] InnoDB: Buffer pool(s) load completed at 230123  3:47:23
2023-01-23  3:47:23 0 [Note] Server socket created on IP: '0.0.0.0'.
2023-01-23  3:47:23 0 [Note] Server socket created on IP: '::'.
2023-01-23  3:47:23 0 [Note] mariadbd: ready for connections.
Version: '10.6.11-MariaDB'  socket: '/run/mysqld/mysqld.sock'  port: 3306  MariaDB Server
```

## Users and Directories

By default, this image runs as a non-root user named `mysql` with a uid of 65532.

## Environment Variables

You can use environment variables to create a new database and user upon initialization, and also to set up the root account password.

- `MARIADB_ROOT_PASSWORD`: Sets the password for MariaDB's root superuser account. If this variable is not set, you'll need to use either `MARIADB_RANDOM_ROOT_PASSWORD` or `MARIADB_ALLOW_EMPTY_ROOT_PASSWORD` in order to initialize the database successfully.
- `MARIADB_RANDOM_ROOT_PASSWORD`: A non-zero value sets up a random password for the root superuser account.
- `MARIADB_ALLOW_EMPTY_ROOT_PASSWORD`: A non-zero value allows for an empty root password.
- `MARIADB_DATABASE`: Creates a new database upon initialization.
- `MARIADB_USER`: Together with `MARIADB_PASSOWORD`, this environment variable can be used to create a new database user and grant them full access to the database defined by `MARIADB_DATABASE`.
- `MARIADB_PASSWORD`: This should be used in conjunction with the `MARIADB_USER` environment variable to set up the database user's password.

## Docker Compose Example

This `docker-compose.yaml` sets up a MariaDB database with a default database and user. Other services can be added to create a local multi-node environment for development and tests.

```yaml
version: "3.7"
services:
  mariadb:
    image: cgr.dev/chainguard/mariadb
    restart: unless-stopped
    environment:
      MARIADB_RANDOM_ROOT_PASSWORD: yes
      MARIADB_USER: user
      MARIADB_PASSWORD: password
      MARIADB_DATABASE: test
    ports:
      - 3306:3306
    volumes:
      - ./:/app
    networks:
      - wolfi

networks:
  wolfi:
    driver: bridge
```
<!--body:end-->
