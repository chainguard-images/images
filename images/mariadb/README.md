<!--monopod:start-->
# mariadb
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/mariadb` |


* [View container image in the Chainguard Containers Directory](https://images.chainguard.dev/directory/image/mariadb/versions) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/contact?utm_source=readmes) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Container for REPO_NAME

[MariaDB](https://mariadb.org) is one of the most popular open source relational databases.

Chainguard Containers are regularly-updated, secure-by-default container images.
<!--overview:end-->

<!--getting:start-->
## Download this Container Image
For those with access, this container image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/REPO_NAME:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard Registry.
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

## What are Chainguard Containers?

Chainguard's free tier of Starter container images are built with [Wolfi](https://edu.chainguard.dev/open-source/wolfi/overview?utm_source=readmes), our minimal Linux _[undistro](https://edu.chainguard.dev/open-source/wolfi/overview/#why-undistro)_.

All other Chainguard Containers are built with [Chainguard OS](https://edu.chainguard.dev/chainguard/chainguard-os/overview/?utm_source=readmes), Chainguard's minimal Linux operating system designed to produce container images that meet the requirements of a more secure software supply chain.

The main features of Chainguard Containers include:

* Minimal design, without unnecessary software bloat
* Daily builds to ensure container images are up-to-date with available security patches
* [High quality build-time SBOMs](https://edu.chainguard.dev/chainguard/chainguard-images/working-with-images/retrieve-image-sboms/?utm_source=readmes) attesting to the provenance of all artifacts within the image
* [Verifiable signatures](https://edu.chainguard.dev/chainguard/chainguard-images/working-with-images/retrieve-image-sboms/) provided by [Sigstore](https://edu.chainguard.dev/open-source/sigstore/cosign/an-introduction-to-cosign/?utm_source=readmes)
* Reproducible builds with Cosign and apko ([read more about reproducibility](https://www.chainguard.dev/unchained/reproducing-chainguards-reproducible-image-builds?utm_source=readmes))

For cases where you need container images with shells and package managers to build or debug, most Chainguard Containers come paired with [a *development*, or `-dev`, variant](https://edu.chainguard.dev/chainguard/chainguard-images/about/differences-development-production/).

In all other cases, including Chainguard Containers tagged as `:latest` or with a specific version number, the container images include only an open-source application and its runtime dependencies. These minimal container images typically do not contain a shell or package manager.

Although the `-dev` container image variants have similar security features as their more minimal versions, they include additional software that is typically not necessary in production environments. We recommend using multi-stage builds to copy artifacts from the `-dev` variant into a more minimal production image.

## Need additional packages?

To improve security, Chainguard Containers include only essential dependencies. Need more packages? Chainguard customers can use [Custom Assembly](https://edu.chainguard.dev/chainguard/chainguard-images/features/ca-docs/custom-assembly/) to add packages, either through the Console, `chainctl`, or API.

To use Custom Assembly in the Chainguard Console: navigate to the image you'd like to customize in [your Organization's list of images](https://console.chainguard.dev/images/organization), and click on the **Customize image** button at the top of the page.

## Learn More

Refer to our Chainguard Containers documentation on [Chainguard Academy](https://edu.chainguard.dev/?utm_source=readmes). Chainguard also offers [VMs](https://www.chainguard.dev/vms?utm_source=readmes) and [Libraries](https://www.chainguard.dev/libraries?utm_source=readmes) — [contact us](https://www.chainguard.dev/contact?utm_source=readmes) for access.
 

## Trademarks

_This software listing is packaged by Chainguard. The trademarks set forth in this offering are owned by their respective companies, and use of them does not imply any affiliation, sponsorship, or endorsement by such companies._