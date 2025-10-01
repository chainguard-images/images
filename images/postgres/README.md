<!--monopod:start-->
# postgres
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/postgres` |


* [View container image in the Chainguard Containers Directory](https://images.chainguard.dev/directory/image/postgres/versions) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/contact?utm_source=readmes) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Container for REPO_NAME

Minimal image for PostgreSQL, an advanced object-relational database management system.

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
## Compatibility Notes

The Chainguard PostgreSQL Image is comparable to its upstream counterpart, [the official PostgreSQL Image from Docker Hub](https://hub.docker.com/_/postgres). However, the Chainguard image contains only the minimum set of tools and dependencies needed to function; for example, it does not include a package manager. Unlike many other Chainguard images, though, the PostgreSQL image does include a shell, allowing you to manage databases interactively.

### Migrating to the Chainguard PostgreSQL image

When migrating an existing PostgresSQL database to use the Chainguard PostgreSQL Container it is likely that the collation version in the Chainguard container image will be different from the collation version in the original image that created the database.  This may be due to different glibc versions, use of a different implementation of the C standard library (musl in Alpine for example), or the use of different locale configuration.

Chainguard recommends that you [re-index and refresh the collation version](https://wiki.postgresql.org/wiki/Locale_data_changes) when migrating to this image before the database is put back into production.

## Getting Started

This section provides a high-level overview of how you can use Chainguard's PostgreSQL image. For a more in-depth walkthrough of how you can use the image in practice, please refer to our guide on [getting started with the PostgreSQL Chainguard Image](https://edu.chainguard.dev/chainguard/chainguard-images/getting-started/getting-started-postgres/). This getting started guide outlines how to set up and run a PHP application that stores its data in a PostgreSQL database running within a containerized environment.

You can test the PostgreSQL Image by running the following command:

```sh
docker run --rm -e POSTGRES_PASSWORD=password -ti --name postgres-test cgr.dev/chainguard/postgres:latest
```

Note that the only mandatory environment variable needed by the PostgreSQL Image is `POSTGRES_PASSWORD`. 

This command will run the Image, but no data within the PostgreSQL database will persist after the Image stops running. To persist PostgreSQL data you can mount a volume mapped to the container's data folder:

```sh
docker run --rm -d -v $PWD/data:/var/lib/postgresql/data -e POSTGRES_PASSWORD=password -ti --name postgres-test cgr.dev/chainguard/postgres:latest
```

This command includes the `-d` flag, which causes the container to run in the background and keeps it from taking over your terminal like the previous example.

Following that you can `exec` into the running container:

```sh
docker exec -ti postgres-test bash
```

Then switch to using the `postgres` user:

```sh
su postgres
```

As the `postgres` user, run the `createdb` wrapper to create a test database:

```sh
createdb test
```

Then use the PostgreSQL client to Connect to the new database: 

```sh
psql test
```

From there you can interact with the database as you would with any other PostgreSQL database. For instance, you can create a sample table:

```sh
CREATE TABLE accounts (
	user_id serial PRIMARY KEY,
	username VARCHAR ( 50 ) UNIQUE NOT NULL,
	password VARCHAR ( 50 ) NOT NULL,
	email VARCHAR ( 255 ) UNIQUE NOT NULL,
	created_on TIMESTAMP NOT NULL,
	last_login TIMESTAMP
);
```

With the table created you can then insert data into it:

```sh
INSERT INTO accounts (username, password, email, created_on, last_login)
VALUES (
'Linky',
'p@$$w0rD',
'linky@example.com',
'2017-07-23',
'2017-07-23'
);
```

You can also use all of PostgreSQL's internal meta-commands. For example, `\dt` will list all the tables stored within the database:

```sh
\dt
```
```
          List of relations
 Schema |   Name   | Type  |  Owner
--------+----------+-------+----------
 public | accounts | table | postgres
(1 row)
```

### Customizing PostgreSQL with environment variables

You can extend Chainguard's Postgres image with environment variables. Chainguard's Postgres image is compatible with the environment variables available in the official PostgreSQL image, including the following:

* `PGDATA`: This variable allows you to define another location for database files. The default data directory is `/var/lib/postgresql/data`.
* `POSTGRES_PASSWORD`: This environment variable sets the superuser password for PostgreSQL. This variable is required to use the Postgres image.
* `POSTGRES_USER`: This is used with the `POSTGRES_PASSWORD` variable to set a superuser for the database and its password. If not specified, you can use the default `postgres` user.
*  `POSTGRES_DB`: Using this variable allows you to set a different name for the default database. If not specified, the default database will be `postgres` or the value set by `POSTGRES_USER`.
* `POSTGRES_INITDB_ARGS`: This variable allows you to send arguments to `postgres initdb`.
* `POSTGRES_INITDB_WALDIR`: You can set this variable to define the location for the PostgreSQL transaction log. By default, the transaction log is stored in a subdirectory of the main PostgresSQL data folder, which you can define with `PGDATA`.
* `POSTGRES_HOST_AUTH_METHOD`: This variable allows you to control the `auth-method` used to authenticate when connecting to the database.

Note that if you set the `POSTGRES_HOST_AUTH_METHOD` variable to `trust`, then the `POSTGRES_PASSWORD` variable is no longer required:

```sh
docker run --rm -e POSTGRES_HOST_AUTH_METHOD=trust -e POSTGRES_DB=linky -ti --name postgres-test cgr.dev/chainguard/postgres:latest
```

Additionally, be aware that the Docker specific variables will only have an effect if you start the container with an empty data directory; pre-existing databases won't be affected on container startup.

### Running PostgreSQL with a custom configuration file

You can also run the Chainguard Postgres image with a custom configuration file. The following example will mount a PostgreSQL configuration file named `my-postgres.conf` to the container. 

```sh
docker run --rm -v "$PWD/my-postgres.conf":/etc/postgresql/postgresql.conf -e POSTGRES_PASSWORD=password -ti --name postgres-test cgr.dev/chainguard/postgres:latest -c 'config_file=/etc/postgresql/postgresql.conf'
```

This command also uses the `postgres` server's `-c` flag to set the `config_file` runtime parameter.


## Documentation and Resources

* [Getting Started with the PostgreSQL Chainguard Image](https://edu.chainguard.dev/chainguard/chainguard-images/getting-started/postgres/)
* [Vulnerability Comparison: postgres](https://edu.chainguard.dev/chainguard/chainguard-images/vuln-comparison/postgres/)
* [Blog: How to Use the Postgres Docker Official Image](https://www.docker.com/blog/how-to-use-the-postgres-docker-official-image/)
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