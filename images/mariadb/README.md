<!--monopod:start-->
# mariadb
| | |
| - | - |
| **Status** | experimental |
| **OCI Reference** | `cgr.dev/chainguard/mariadb` |
| **Variants/Tags** | ![](https://storage.googleapis.com/chainguard-images-build-outputs/summary/mariadb.svg) |
---
<!--monopod:end-->

[MariaDB](https://mariadb.org) is one of the most popular open source relational databases.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/mariadb
```

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

By default this image runs as a non-root user named `mysql` with a uid of 65532.
