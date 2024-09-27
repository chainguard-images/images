<!--monopod:start-->
# stunnel
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/stunnel` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/stunnel/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for stunnel

This image contains the CLI for the [stunnel](https://www.stunnel.org/) networking tool

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/stunnel:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->

This tool can be used to encrypt network connections between a client and server, without changing those programs.

`stunnel` requires a configuration file to run.
This image does not include a default configuration file.
You will need to provide your own configuration file and set it using the  at `/etc/conf/stunnel.conf` when running the container.
Note: this location can be overridden with the positional command line argument.

## Use It!

The image can be run directly and sets the `stunnel` binary as the entrypoint.

```
$ docker run cgr.dev/chainguard/stunnel:latest
Initializing inetd mode configuration
stunnel 5.70 on aarch64-unknown-linux-gnu platform
Compiled with OpenSSL 3.1.1 30 May 2023
Running  with OpenSSL 3.1.2 1 Aug 2023
Threading:PTHREAD Sockets:POLL,IPv6 TLS:ENGINE,OCSP,PSK,SNI

Global options:
chroot                 = directory to chroot stunnel process
EGD                    = path to Entropy Gathering Daemon socket
engine                 = auto|engine_id
engineCtrl             = cmd[:arg]
engineDefault          = TASK_LIST
foreground             = yes|quiet|no foreground mode (don't fork, log to stderr)
log                    = append|overwrite log file
output                 = file to append log messages
pid                    = pid file
RNDbytes               = bytes to read from random seed files
RNDfile                = path to file with random seed data
RNDoverwrite           = yes|no overwrite seed datafiles with new random data
syslog                 = yes|no send logging messages to syslog

Service-level options:
accept                 = [host:]port accept connections on specified host:port
CAengine               = engine-specific CA certificate identifier for 'verify' option
CApath                 = CA certificate directory for 'verify' option
CAfile                 = CA certificate file for 'verify' option
cert                   = certificate chain
checkEmail             = peer certificate email address
checkHost              = peer certificate host name pattern
checkIP                = peer certificate IP address
ciphers                = permitted ciphers for TLS 1.2 or older
ciphersuites           = permitted ciphersuites for TLS 1.3
client                 = yes|no client mode (remote service uses TLS)
config                 = command[:parameter] to execute
connect                = [host:]port to connect
CRLpath                = CRL directory
CRLfile                = CRL file
curves                 = ECDH curve names
debug                  = [facility].level (e.g. daemon.info)
delay                  = yes|no delay DNS lookup for 'connect' option
engineId               = ID of engine to read the key from
engineNum              = number of engine to read the key from
exec                   = file execute local inetd-type program
execArgs               = arguments for 'exec' (including $0)
failover               = rr|prio failover strategy
ident                  = username for IDENT (RFC 1413) checking
include                = directory with configuration file snippets
key                    = certificate private key
local                  = IP address to be used as source for remote connections
logId                  = connection identifier type
OCSP                   = OCSP responder URL
...
```
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