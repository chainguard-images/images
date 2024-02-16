<!--monopod:start-->
# dependency-track
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/dependency-track` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/dependency-track/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
[Dependency Track](https://github.com/DependencyTrack/dependency-track) Dependency-Track is an intelligent Component Analysis platform that allows organizations to identify and reduce risk in the software supply chain.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/dependency-track:latest
```
<!--getting:end-->

<!--body:start-->

## Using Dependency Track

This image should be a drop-in replacement for the `bundled` variant of the upstream image.
Documentation is available there: https://hub.docker.com/r/dependencytrack/bundled

You can run it locally with:

```shell
$ docker run -p 8080:8080 cgr.dev/chainguard/dependency-track
2023-11-24 19:01:49,201 INFO [EmbeddedJettyServer] alpine-executable-war v2.2.3 (3aff068a-a1af-4e38-85dc-3a5ee66ee121) built on: 2023-09-21T16:07:30Z
2023-11-24 19:01:56,221 INFO [Config] --------------------------------------------------------------------------------
2023-11-24 19:01:56,223 INFO [Config] OS Name:      Linux
2023-11-24 19:01:56,223 INFO [Config] OS Version:   6.4.16-linuxkit
2023-11-24 19:01:56,224 INFO [Config] OS Arch:      aarch64
2023-11-24 19:01:56,224 INFO [Config] CPU Cores:    12
2023-11-24 19:01:56,228 INFO [Config] Max Memory:   18.9 GB (20,347,092,992.0 bytes)
2023-11-24 19:01:56,228 INFO [Config] Java Vendor:  wolfi
2023-11-24 19:01:56,229 INFO [Config] Java Version: 17.0.10+1-wolfi-r0
2023-11-24 19:01:56,230 INFO [Config] Java Home:    /usr/lib/jvm/java-17-openjdk
2023-11-24 19:01:56,230 INFO [Config] Java Temp:    /tmp
2023-11-24 19:01:56,230 INFO [Config] User:         dtrack
2023-11-24 19:01:56,230 INFO [Config] User Home:    /home/dtrack
2023-11-24 19:01:56,230 INFO [Config] --------------------------------------------------------------------------------
2023-11-24 19:01:56,230 INFO [Config] Initializing Configuration
2023-11-24 19:01:56,231 INFO [Config] System property alpine.application.properties not specified
2023-11-24 19:01:56,232 INFO [Config] Loading application.properties from classpath
2023-11-24 19:01:56,244 INFO [Config] --------------------------------------------------------------------------------
2023-11-24 19:01:56,244 INFO [Config] Application:  Dependency-Track
2023-11-24 19:01:56,244 INFO [Config] Version:      4.9.1
2023-11-24 19:01:56,244 INFO [Config] Built-on:     2023-11-24T16:33:29Z
2023-11-24 19:01:56,245 INFO [Config] --------------------------------------------------------------------------------
2023-11-24 19:01:56,245 INFO [Config] Framework:    Alpine
2023-11-24 19:01:56,245 INFO [Config] Version :     2.2.3
2023-11-24 19:01:56,245 INFO [Config] Built-on:     2023-09-21T16:07:30Z
2023-11-24 19:01:56,245 INFO [Config] --------------------------------------------------------------------------------
2023-11-24 19:01:56,389 INFO [RequirementsVerifier] Initializing requirements verifier
2023-11-24 19:01:56,389 INFO [UpgradeInitializer] Initializing upgrade framework
2023-11-24 19:01:58,102 INFO [PersistenceManagerFactory] Initializing persistence framework
2023-11-24 19:01:58,106 INFO [PersistenceManagerFactory] Creating transactional connection pool
2023-11-24 19:01:58,191 INFO [PersistenceManagerFactory] Creating non-transactional connection pool
2023-11-24 19:01:58,400 INFO [HealthCheckInitializer] Registering health checks
2023-11-24 19:01:58,403 INFO [DefaultObjectGenerator] Initializing default object generator
2023-11-24 19:01:58,405 INFO [DefaultObjectGenerator] Synchronizing permissions to datastore
2023-11-24 19:01:58,660 INFO [DefaultObjectGenerator] Adding default users and teams to datastore
2023-11-24 19:02:00,276 INFO [DefaultObjectGenerator] Synchronizing SPDX license definitions to datastore
2023-11-24 19:02:02,714 INFO [DefaultObjectGenerator] Adding default license group definitions to datastore
2023-11-24 19:02:03,137 INFO [DefaultObjectGenerator] Synchronizing default repositories to datastore
2023-11-24 19:02:03,192 INFO [DefaultObjectGenerator] Synchronizing config properties to datastore
2023-11-24 19:02:03,276 INFO [DefaultObjectGenerator] Synchronizing notification publishers to datastore
2023-11-24 19:02:03,458 INFO [CweImporter] Synchronizing CWEs with datastore
2023-11-24 19:02:05,447 INFO [CweImporter] CWE synchronization complete
2023-11-24 19:02:05,449 INFO [EventSubsystemInitializer] Initializing asynchronous event subsystem
2023-11-24 19:02:05,504 INFO [NotificationSubsystemInitializer] Initializing notification service
2023-11-24 19:02:05,507 INFO [IndexSubsystemInitializer] Building lucene indexes if required
2023-11-24 19:02:05,521 INFO [IndexManager] Checking the health of index PROJECT
2023-11-24 19:02:05,523 WARN [IndexManager] The index PROJECT does not exist
2023-11-24 19:02:05,523 INFO [IndexManager] (Re)Building index project
2023-11-24 19:02:05,536 INFO [IndexManager] Checking the health of index COMPONENT
2023-11-24 19:02:05,537 WARN [IndexManager] The index COMPONENT does not exist
2023-11-24 19:02:05,537 INFO [IndexManager] (Re)Building index component
2023-11-24 19:02:05,537 INFO [IndexManager] Checking the health of index SERVICECOMPONENT
2023-11-24 19:02:05,537 WARN [IndexManager] The index SERVICECOMPONENT does not exist
2023-11-24 19:02:05,537 INFO [IndexManager] (Re)Building index servicecomponent
2023-11-24 19:02:05,538 INFO [IndexManager] Checking the health of index VULNERABILITY
2023-11-24 19:02:05,538 WARN [IndexManager] The index VULNERABILITY does not exist
2023-11-24 19:02:05,538 INFO [IndexManager] (Re)Building index vulnerability
2023-11-24 19:02:05,538 INFO [IndexManager] Checking the health of index LICENSE
2023-11-24 19:02:05,538 WARN [IndexManager] The index LICENSE does not exist
2023-11-24 19:02:05,539 INFO [IndexManager] (Re)Building index license
2023-11-24 19:02:05,539 INFO [IndexManager] Checking the health of index CPE
2023-11-24 19:02:05,539 WARN [IndexManager] The index CPE does not exist
2023-11-24 19:02:05,540 INFO [IndexManager] (Re)Building index cpe
2023-11-24 19:02:05,540 INFO [IndexManager] Checking the health of index VULNERABLESOFTWARE
2023-11-24 19:02:05,541 WARN [IndexManager] The index VULNERABLESOFTWARE does not exist
2023-11-24 19:02:05,541 INFO [IndexManager] (Re)Building index vulnerablesoftware
2023-11-24 19:02:05,546 INFO [ProjectIndexer] Starting reindex task. This may take some time.
2023-11-24 19:02:05,546 INFO [IndexManager] Deleting project index
2023-11-24 19:02:05,594 INFO [AlpineServlet] Starting Dependency-Track
2023-11-24 19:02:05,758 INFO [ProjectIndexer] Reindexing complete
2023-11-24 19:02:05,762 INFO [ComponentIndexer] Starting reindex task. This may take some time.
2023-11-24 19:02:05,762 INFO [IndexManager] Deleting component index
2023-11-24 19:02:05,779 INFO [ComponentIndexer] Reindexing complete
2023-11-24 19:02:05,781 INFO [ServiceComponentIndexer] Starting reindex task. This may take some time.
2023-11-24 19:02:05,781 INFO [IndexManager] Deleting servicecomponent index
2023-11-24 19:02:05,794 INFO [ServiceComponentIndexer] Reindexing complete
2023-11-24 19:02:05,795 INFO [VulnerabilityIndexer] Starting reindex task. This may take some time.
2023-11-24 19:02:05,795 INFO [IndexManager] Deleting vulnerability index
2023-11-24 19:02:05,811 INFO [VulnerabilityIndexer] Reindexing complete
2023-11-24 19:02:05,812 INFO [LicenseIndexer] Starting reindex task. This may take some time.
2023-11-24 19:02:05,813 INFO [IndexManager] Deleting license index
2023-11-24 19:02:06,587 INFO [LicenseIndexer] Reindexing complete
2023-11-24 19:02:06,589 INFO [CpeIndexer] Starting reindex task. This may take some time.
2023-11-24 19:02:06,590 INFO [IndexManager] Deleting cpe index
2023-11-24 19:02:06,601 INFO [CpeIndexer] Reindexing complete
2023-11-24 19:02:06,603 INFO [VulnerableSoftwareIndexer] Starting reindex task. This may take some time.
2023-11-24 19:02:06,603 INFO [IndexManager] Deleting vulnerablesoftware index
2023-11-24 19:02:06,613 INFO [VulnerableSoftwareIndexer] Reindexing complete
2023-11-24 19:02:08,402 INFO [KeyManager] Generating new key pair
2023-11-24 19:02:09,478 INFO [KeyManager] Saving key pair
2023-11-24 19:02:09,548 INFO [AlpineServlet] Dependency-Track is ready
2023-11-24 19:02:09,554 INFO [NvdMirrorServlet] Initializing NVD mirror
2023-11-24 19:02:09,554 INFO [FileSystemResourceServlet] Initializing filesystem resource servlet
```

The admin console should then be available in your browser at [http://localhost:8080](http://localhost:8080).

<!--body:end-->
