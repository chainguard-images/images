<!--monopod:start-->
# mongodb
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/mongodb` |


* [View container image in the Chainguard Containers Directory](https://images.chainguard.dev/directory/image/mongodb/versions) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/contact?utm_source=readmes) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Container for REPO_NAME

[MongoDB](https://www.mongodb.com/) is a document-oriented database management system. MongoDB is a popular example of a NoSQL database, and stores data in JSON-like documents.

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