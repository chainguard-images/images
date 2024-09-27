<!--monopod:start-->
# mariadb
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/mariadb` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/mariadb/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for mariadb

[MariaDB](https://mariadb.org) is one of the most popular open source relational databases.

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/mariadb:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
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