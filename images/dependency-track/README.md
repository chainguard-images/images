<!--monopod:start-->
# dependency-track
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/dependency-track` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/dependency-track/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for dependency-track

[Dependency Track](https://github.com/DependencyTrack/dependency-track) Dependency-Track is an intelligent Component Analysis platform that allows organizations to identify and reduce risk in the software supply chain.

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/dependency-track:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
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