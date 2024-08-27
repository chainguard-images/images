<!--monopod:start-->
# percona-server
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/percona-server` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/percona-server/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
Percona Server for MySQL is a free, fully compatible, enhanced, and open source drop-in replacement for any MySQL database. It provides superior performance, scalability, and instrumentation.'

To get more information about the image, please visit the GitHub [repository](https://github.com/percona/percona-server).

<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/percona-server:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

To get started with Percona Server for MySQL promptly, this Quickstart guide emphasizes using Docker or installing with APT or YUM. Also you can follow along the Quickstart guide on the [Percona website](https://docs.percona.com/percona-server/innovation-release/quickstart-overview.html) for more details.

### Docker

#### Starting a Detached Container

Start a container with the `--detached` or `-d` option to run it in the background. In detached mode, the container exits when the main process used to run it exits.

Start a container named `ps` with the latest version of Percona Server for MySQL 8.3. This example sets the root password to `root` (not secure).

```bash
$ docker run -d \
  --name ps \
  -e MYSQL_ROOT_PASSWORD=root \
  cgr.dev/chainguard/percona-server:latest
```

By default, Docker pulls the image from Docker Hub if it is not available locally.

To view the container’s logs, use:

```bash
$ docker logs ps --follow
```

<details>

<summary>Expected Output:</summary>

```bash
You can access the server when you see the "ready for connections" message in the log.
```
</details>

You can pass options with the docker run command. Example: Set UTF-8 as the default character set and collation for all databases.

```bash
$ docker run -d \
  --name ps \
  -e MYSQL_ROOT_PASSWORD=root \
  cgr.dev/chainguard/percona-server:latest \
  --character-set-server=utf8 \
  --collation-server=utf8_general_ci
```

#### Accessing the Percona Server Container

Use the docker exec command to get a shell inside the container. Example:

```bash
$ docker exec -it ps /bin/bash
```

For troubleshooting, the error log is located in /var/log/ or /var/log/mysql/, typically named error.log or mysqld.log.

View the error log with:

```bash
$ more /var/log/mysql/error.log
```

<details>

<summary>Expected Output:</summary>

```bash
...
2017-08-29T04:20:22.190474Z 0 [Warning] 'NO_ZERO_DATE', 'NO_ZERO_IN_DATE' and 'ERROR_FOR_DIVISION_BY_ZERO' sql modes should be used with strict mode. They will be merged with strict mode in a future release.
2017-08-29T04:20:22.190520Z 0 [Warning] 'NO_AUTO_CREATE_USER' sql mode was not set.
...
```

</details>

#### Accessing the Database
You can access the database using docker exec or the mysql command inside the container’s shell.

```bash
$ docker exec -ti ps mysql -uroot -proot
```

<details>

<summary>Expected Output:</summary>

```bash
mysql: [Warning] Using a password on the command line interface can be insecure.
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 9
...
```

</details>

You can also use the MySQL command-line client inside the container’s shell to access the database:

```bash
$ mysql -uroot -proot
```

<details>

<summary>Expected Output:</summary>

```bash
mysql: [Warning] Using a password on the command line interface can be insecure.
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.3.0-1 Percona Server (GPL), Release 21, Revision c59f87d2854

Copyright (c) 2009-2022 Percona LLC and/or its affiliates
Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.
```

</details>


<!--body:end-->
