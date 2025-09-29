<!--monopod:start-->
# REPO_NAME
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/REPO_NAME` |


* [View container image in the Chainguard Containers Directory](https://images.chainguard.dev/directory/image/REPO_NAME/versions) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/contact?utm_source=readmes) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Container for REPO_NAME

Minimalist Wolfi-based [Valkey](https://github.com/valkey-io/valkey) image.

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
Minimalist Wolfi-based [Valkey](https://github.com/valkey-io/valkey) image.

Valkey is an open source (BSD) high-performance key/value datastore that supports a variety workloads such as caching, message queues, and can act as a primary database. Valkey can run as either a standalone daemon or in a cluster, with options for replication and high availability.

The data model is key-value, but many different kind of values are supported: Strings, Lists, Sets, Sorted Sets, Hashes, Streams, HyperLogLogs, Bitmaps.

- [Documentation](https://edu.chainguard.dev/chainguard/chainguard-images/reference/valkey)
- [Provenance Information](https://edu.chainguard.dev/chainguard/chainguard-images/reference/valkey/provenance_info/)

## Valkey Version
This will automatically pull the image to your local system and execute the command `valkey --version`:

```shell
docker run --rm cgr.dev/chainguard/valkey --version
```

You should see output similar to this:

```
valkey server v=7.0.8 sha=00000000:0 malloc=libc bits=64 build=736cb94cbb0b299
```

## Using Valkey

The default Valkey port is 6379.
To run with Docker using default configuration:

```sh
docker run -p 6379:6379 --rm cgr.dev/chainguard/valkey
1:C 18 Apr 2024 00:52:45.176 # WARNING Memory overcommit must be enabled! Without it, a background save or replication may fail under low memory condition. To fix this issue add 'vm.overcommit_memory = 1' to /etc/sysctl.conf and then reboot or run the command 'sysctl vm.overcommit_memory=1' for this to take effect.
1:C 18 Apr 2024 00:52:45.176 * oO0OoO0OoO0Oo Valkey is starting oO0OoO0OoO0Oo
1:C 18 Apr 2024 00:52:45.176 * Valkey version=7.2.5, bits=64, commit=26388270, modified=1, pid=1, just started
1:C 18 Apr 2024 00:52:45.176 # Warning: no config file specified, using the default config. In order to specify a config file use /usr/bin/valkey-server /path/to/valkey.conf
1:M 18 Apr 2024 00:52:45.177 * monotonic clock: POSIX clock_gettime
                .+^+.                                                
            .+#########+.                                            
        .+########+########+.           Valkey 7.2.5 (26388270/1) 64 bit
    .+########+'     '+########+.                                    
 .########+'     .+.     '+########.    Running in standalone mode
 |####+'     .+#######+.     '+####|    Port: 6379
 |###|   .+###############+.   |###|    PID: 1                     
 |###|   |#####*'' ''*#####|   |###|                                 
 |###|   |####'  .-.  '####|   |###|                                 
 |###|   |###(  (@@@)  )###|   |###|          https://valkey.io      
 |###|   |####.  '-'  .####|   |###|                                 
 |###|   |#####*.   .*#####|   |###|                                 
 |###|   '+#####|   |#####+'   |###|                                 
 |####+.     +##|   |#+'     .+####|                                 
 '#######+   |##|        .+########'                                 
    '+###|   |##|    .+########+'                                    
        '|   |####+########+'                                        
             +#########+'                                            
                '+v+'                                                

1:M 18 Apr 2024 00:52:45.177 * Server initialized
1:M 18 Apr 2024 00:52:45.177 * Ready to accept connections tcp
```

## Users and Directories

By default this image runs as a non-root user named `valkey` with a uid of 65532.
Valkey does not have a default data directory, it defaults to whatever the working directory is for the process.
We provide a default `WORKDIR` of `/data` that is writeable by the `valkey` user.

If you supply a different configuration file or change the user, UID, or `WORKDIR`, you'll need to ensure the user running the valkey process has permissions to write to that directory.

When running in Docker using a volume, that should also be taken care of automatically.
Here's an example of using a host volume:

```
% docker run -d -v $(pwd):/data -p 6379:6379 cgr.dev/chainguard/valkey
d029bfb291c7a00618342ab26702dc3788cfda24b85208de04464ccb06681797
$ valkey-cli set foo bar
OK
$ valkey-cli save
OK
$ valkey-cli get foo
"bar"
$ docker kill d029bfb291c7a00618342ab26702dc3788cfda24b85208de04464ccb06681797
d029bfb291c7a00618342ab26702dc3788cfda24b85208de04464ccb06681797
$ docker run -d -v $(pwd):/data -p 6379:6379 cgr.dev/chainguard/valkey
29845f88b862d8e337cf8183e8fb6ac1bd9b43c4ec2de37111bfe08b227e1caa
$ valkey-cli get foo
"bar"
```
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