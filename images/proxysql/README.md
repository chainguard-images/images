<!--monopod:start-->
# proxysql
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/proxysql` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/proxysql/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimal image with [proxysql](https://github.com/sysown/proxysql).
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/proxysql:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

With `Helm`:

```shell
helm repo add dysnix https://dysnix.github.io/charts/
helm repo update
helm install proxysql dysnix/proxysql \
    --namespace proxysql \
    --create-namespace \
    --set image.registry=cgr.dev \
    --set image.repository=chainguard/proxysql \
    --set image.tag=latest \
    --wait
```

Please note that [official Helm chart](https://github.com/ProxySQL/kubernetes/tree/master) is outdated and no longer maintaining.

With `Docker`:

```shell
$ docker run cgr.dev/chainguard/proxysql:latest
2023-06-28 13:27:29 [INFO] Using config file /etc/proxysql.cnf
Renaming database file /var/lib/proxysql/proxysql.db
2023-06-28 13:27:29 [INFO] Current RLIMIT_NOFILE: 1048576
2023-06-28 13:27:29 [INFO] Using OpenSSL version: OpenSSL 3.1.0 14 Mar 2023
2023-06-28 13:27:29 [INFO] No SSL keys/certificates found in datadir (/var/lib/proxysql). Generating new keys/certificates.
2023-06-28 13:27:29 [INFO] ProxySQL version 2.5.3-89-g86ce115
2023-06-28 13:27:29 [INFO] Detected OS: Linux d90ca7f378f8 5.15.49-linuxkit-pr #1 SMP PREEMPT Thu May 25 07:27:39 UTC 2023 aarch64
2023-06-28 13:27:29 [INFO] ProxySQL SHA1 checksum: 491223ebbd1a1dd43c69f24cefa2b269dde73162
2023-06-28 13:27:29 [INFO] SSL keys/certificates found in datadir (/var/lib/proxysql): loading them.
2023-06-28 13:27:29 [INFO] Loaded built-in SQLite3
Standard ProxySQL MySQL Logger rev. 2.5.0421 -- MySQL_Logger.cpp -- Thu Jun 22 15:09:08 2023
Standard ProxySQL Cluster rev. 0.4.0906 -- ProxySQL_Cluster.cpp -- Thu Jun 22 15:09:08 2023
Standard ProxySQL Statistics rev. 1.4.1027 -- ProxySQL_Statistics.cpp -- Thu Jun 22 15:09:08 2023
Standard ProxySQL HTTP Server Handler rev. 1.4.1031 -- ProxySQL_HTTP_Server.cpp -- Thu Jun 22 15:09:08 2023
2023-06-28 13:27:29 [INFO] Using UUID: 588c8cc0-1168-46e5-93b9-c53a0923686f , randomly generated. Writing it to database
2023-06-28 13:27:29 [INFO] Computed checksum for 'LOAD ADMIN VARIABLES TO RUNTIME' was '0x3A8D4652D65FCE60', with epoch '1687958849'
2023-06-28 13:27:29 [INFO] Computed checksum for 'LOAD MYSQL VARIABLES TO RUNTIME' was '0xAA126AC5C26167ED', with epoch '1687958849'
Standard ProxySQL Admin rev. 2.0.6.0805 -- ProxySQL_Admin.cpp -- Thu Jun 22 15:09:08 2023
2023-06-28 13:27:29 [INFO] ProxySQL SHA1 checksum: 491223ebbd1a1dd43c69f24cefa2b269dde73162
Standard MySQL Threads Handler rev. 0.2.0902 -- MySQL_Thread.cpp -- Thu Jun 22 15:09:08 2023
Standard MySQL Authentication rev. 0.2.0902 -- MySQL_Authentication.cpp -- Thu Jun 22 15:09:08 2023
2023-06-28 13:27:29 [INFO] Computed checksum for 'LOAD MYSQL USERS TO RUNTIME' was '0x0000000000000000', with epoch '1687958849'
2023-06-28 13:27:29 [INFO] Dumping mysql_servers_incoming
+--------------+----------+------+-----------+--------+--------+-------------+-----------------+---------------------+---------+----------------+---------+
| hostgroup_id | hostname | port | gtid_port | weight | status | compression | max_connections | max_replication_lag | use_ssl | max_latency_ms | comment |
+--------------+----------+------+-----------+--------+--------+-------------+-----------------+---------------------+---------+----------------+---------+
+--------------+----------+------+-----------+--------+--------+-------------+-----------------+---------------------+---------+----------------+---------+
2023-06-28 13:27:29 [INFO] Dumping mysql_servers LEFT JOIN mysql_servers_incoming
+-------------+--------------+----------+------+
| mem_pointer | hostgroup_id | hostname | port |
+-------------+--------------+----------+------+
+-------------+--------------+----------+------+
2023-06-28 13:27:29 [INFO] Dumping mysql_servers JOIN mysql_servers_incoming
+--------------+----------+------+-----------+--------+--------+-------------+-----------------+---------------------+---------+----------------+---------+-------------+-----------+--------+--------+-------------+-----------------+---------------------+---------+----------------+---------+
| hostgroup_id | hostname | port | gtid_port | weight | status | compression | max_connections | max_replication_lag | use_ssl | max_latency_ms | comment | mem_pointer | gtid_port | weight | status | compression | max_connections | max_replication_lag | use_ssl | max_latency_ms | comment |
+--------------+----------+------+-----------+--------+--------+-------------+-----------------+---------------------+---------+----------------+---------+-------------+-----------+--------+--------+-------------+-----------------+---------------------+---------+----------------+---------+
+--------------+----------+------+-----------+--------+--------+-------------+-----------------+---------------------+---------+----------------+---------+-------------+-----------+--------+--------+-------------+-----------------+---------------------+---------+----------------+---------+
2023-06-28 13:27:29 [INFO] New mysql_group_replication_hostgroups table
2023-06-28 13:27:29 [INFO] New mysql_galera_hostgroups table
2023-06-28 13:27:29 [INFO] New mysql_aws_aurora_hostgroups table
2023-06-28 13:27:29 [INFO] New mysql_hostgroup_attributes table
2023-06-28 13:27:29 [INFO] MySQL_HostGroups_Manager::commit() locked for 3ms
2023-06-28 13:27:29 [INFO] Computed checksum for 'LOAD PROXYSQL SERVERS TO RUNTIME' was '0x0000000000000000', with epoch '1687958849'
Standard Query Processor rev. 2.0.6.0805 -- Query_Processor.cpp -- Thu Jun 22 15:09:08 2023
2023-06-28 13:27:29 [INFO] Computed checksum for 'LOAD MYSQL QUERY RULES TO RUNTIME' was '0x0000000000000000', with epoch '1687958849'
In memory Standard Query Cache (SQC) rev. 1.2.0905 -- Query_Cache.cpp -- Thu Jun 22 15:09:08 2023
Standard MySQL Monitor (StdMyMon) rev. 2.0.1226 -- MySQL_Monitor.cpp -- Thu Jun 22 15:09:08 2023
2023-06-28 13:27:29 [INFO] For information about products and services visit: https://proxysql.com/
2023-06-28 13:27:29 [INFO] For online documentation visit: https://proxysql.com/documentation/
2023-06-28 13:27:29 [INFO] For support visit: https://proxysql.com/services/support/
2023-06-28 13:27:29 [INFO] For consultancy visit: https://proxysql.com/services/consulting/
2023-06-28 13:27:29 [INFO] Latest ProxySQL version available: 2.5.3-89-g86ce115
```
<!--body:end-->
