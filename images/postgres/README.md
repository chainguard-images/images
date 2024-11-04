<!--monopod:start-->
# postgres
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/postgres` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/postgres/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for postgres

Minimal image for PostgreSQL, an advanced object-relational database management system.

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/postgres:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->
## Compatibility Notes

The Chainguard PostgreSQL Image is comparable to the [official PostgreSQL Image from Docker Hub](https://hub.docker.com/_/postgres). However, the Chainguard image does not run as the root user and contains only the minimum set of tools and dependencies needed to function; for example, it does not include a package manager. Unlike many other Chainguard images, though, the PostgreSQL image does include a shell, allowing you to manage databases interactively.

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


## Documentation and Resources

* [Getting Started with the PostgreSQL Chainguard Image](https://edu.chainguard.dev/chainguard/chainguard-images/getting-started/postgres/)
* [Vulnerability Comparison: postgres](https://edu.chainguard.dev/chainguard/chainguard-images/vuln-comparison/postgres/)
* [Blog: How to Use the Postgres Docker Official Image](https://www.docker.com/blog/how-to-use-the-postgres-docker-official-image/)
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