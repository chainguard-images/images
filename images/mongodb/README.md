<!--monopod:start-->
# mongodb
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/mongodb` |


* [View container image in the Chainguard Containers Directory](https://images.chainguard.dev/directory/image/mongodb/overview).
* [View the Container Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/contact?utm_source=readmes) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Container for mongodb

[MongoDB](https://www.mongodb.com/) is a document-oriented database management system. MongoDB is a popular example of a NoSQL database, and stores data in JSON-like documents.

Chainguard Containers are regularly-updated, secure-by-default container images.
<!--overview:end-->

<!--getting:start-->
## Download this Container Image
For those with access, this container image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/mongodb:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard Registry.
<!--getting:end-->

<!--body:start-->
## Compatibility Notes
Chainguard's MongoDB container image is comparable to [the official `mongo` image](https://hub.docker.com/_/mongo) available on Docker Hub. 

Like most of Chainguard's images, the MongoDB image does not operate as the root user and includes only the minimum packages needed to function. This means it doesn't include things like a shell or package manager.


## Getting Started

Here's one example of how Chainguard's MongoDB container image can be run:

```shell
docker run -d --rm -it -p 27017:27017 cgr.dev/chainguard/mongodb --bind_ip_all --noauth
```

This example includes Docker's `-d` argument, which will cause the container to run in the background, as well as the `-p` argument, which publishes the container's port `27017` to the host machine's port `27017`. It also includes MongoDB's `--bind_ip_all` and `--noauth` arguments. These bind the `mongod` process to all IP addresses and instruct it to run without security, respectively. 

> [!WARNING]
> These selections are not recommended for production environments, but they are useful for testing that the MongoDB image is working properly.

Following that, connect to the MongoDB deployment with `mongosh`, the MongoDB shell:

```shell
mongosh --port 27017
```

Once connected, you can interact with the running MongoDB instance. For example, you can insert a new document:

```
test> db.products.insertOne( { item: "card", qty: 15 } )
{
  acknowledged: true,
  insertedIds: { '0': ObjectId('662141e9a1519b8bd2ac3fc4') }
}
```

You can also run `mongosh` methods and commands to interact with the MongoDB deployment. For example, `show collections` will list the collection you just created with the previous `insertOne` method:

```
test> show collections
products
```

## Documentation and Resources
* [MongoDB Documentation](https://www.mongodb.com/docs/)
* [Upstream `mongo` image](https://hub.docker.com/_/mongo)
<!--body:end-->

## What are Chainguard Containers?

[Chainguard Containers](https://www.chainguard.dev/containers?utm_source=readmes) are minimal container images that are secure by default. 

In many cases, the Chainguard Containers tagged as `:latest` contain only an open-source application and its runtime dependencies. These minimal container images typically do not contain a shell or package manager. Chainguard Containers are built with [Wolfi](https://edu.chainguard.dev/open-source/wolfi/overview?utm_source=readmes), our Linux _[undistro](https://edu.chainguard.dev/open-source/wolfi/overview/#why-undistro)_ designed to produce container images that meet the requirements of a more secure software supply chain.

The main features of Chainguard Containers include:

* Minimal design, without unnecessary software bloat
* Daily builds to ensure container images are up-to-date with available security patches
* [High quality build-time SBOMs](https://edu.chainguard.dev/chainguard/chainguard-images/working-with-images/retrieve-image-sboms/?utm_source=readmes) attesting to the provenance of all artifacts within the image
* [Verifiable signatures](https://edu.chainguard.dev/chainguard/chainguard-images/working-with-images/retrieve-image-sboms/) provided by [Sigstore](https://edu.chainguard.dev/open-source/sigstore/cosign/an-introduction-to-cosign/?utm_source=readmes)
* Reproducible builds with Cosign and apko ([read more about reproducibility](https://www.chainguard.dev/unchained/reproducing-chainguards-reproducible-image-builds?utm_source=readmes))

For cases where you need container images with shells and package managers to build or debug, most Chainguard Containers come paired with a `-dev` variant.

Although the `-dev` container image variants have similar security features as their more minimal versions, they feature additional software that is typically not necessary in production environments. We recommend using multi-stage builds to leverage the `-dev` variants, copying application artifacts into a final minimal container that offers a reduced attack surface that won’t allow package installations or logins.

## Learn More

To better understand how to work with Chainguard Containers, please visit [Chainguard Academy](https://edu.chainguard.dev/?utm_source=readmes) and [Chainguard Courses](https://courses.chainguard.dev/?utm_source=readmes).

In addition to [Containers](https://www.chainguard.dev/containers?utm_source=readmes), Chainguard offers [VMs](https://www.chainguard.dev/vms?utm_source=readmes) and [Libraries](https://www.chainguard.dev/libraries?utm_source=readmes). [Contact Chainguard](https://www.chainguard.dev/contact?utm_source=readmes) to access additional products. 

## Trademarks

_This software listing is packaged by Chainguard. The trademarks set forth in this offering are owned by their respective companies, and use of them does not imply any affiliation, sponsorship, or endorsement by such companies._