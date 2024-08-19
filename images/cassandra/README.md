<!--monopod:start-->
# cassandra
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/cassandra` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/cassandra/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
[Cassandra](https://cassandra.apache.org) is a free and open-source, distributed, wide-column store, NoSQL database.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/cassandra:latest
```
<!--getting:end-->

<!--body:start-->

## Deploying
Deploy a new instance of Cassandra using this image:

```bash
docker run -d \
  --name cassandra \
  -e CASSANDRA_START_RPC=true \
  -p 9042:9042 cgr.dev/chainguard/cassandra:latest
```

You can use `nodetool status` command to check if Cassandra is running properly.
Note, it'll take a couple of minutes for Cassandra to become fully operational:

```bash
docker exec -it cassandra nodetool status

Datacenter: datacenter1
=======================
Status=Up/Down
|/ State=Normal/Leaving/Joining/Moving
--  Address    Load        Tokens  Owns (effective)  Host ID                               Rack
UN  127.0.0.1  104.38 KiB  16      100.0%            0e75f72d-d273-4fac-807e-2b230583458c  rack1
```

`cqlsh` is available on the image:

```bash
docker exec -i cassandra cqlsh -e "
CREATE KEYSPACE testkeyspace WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1};
USE testkeyspace;
CREATE TABLE users (user_id UUID PRIMARY KEY, name text);
INSERT INTO users (user_id, name) VALUES (uuid(), 'Chainguard');
SELECT * FROM users;
"

 user_id                              | name
--------------------------------------+------------
 3f13c6b4-4a22-4de7-a1f6-a3ac6e887ddb | Chainguard
 67e3be15-07f9-4dd6-b9b9-c00037d705ac | Chainguard

(2 rows)
```

For more information, refer to the [Cassandra documentation](https://cassandra.apache.org/_/quickstart.html).

<!--body:end-->
