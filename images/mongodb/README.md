<!--monopod:start-->
# mongodb
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/mongodb` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/mongodb/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
The MongoDB Database image
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/mongodb:latest
```
<!--getting:end-->

<!--body:start-->
## Using MongoDB
```shell
$ docker run cgr.dev/chainguard/mongodb
```

Connect to the MongoDB Deployment with mongosh and confirm your MongoDB instance is running by inserting a new document

```shell
$ mongosh --port 27017
$test> db.products.insert( { item: "card", qty: 15 } )
{
  acknowledged: true,
  insertedIds: { '0': ObjectId('662141e9a1519b8bd2ac3fc4') }
}
$test> show collections
products

```
<!--body:end-->
