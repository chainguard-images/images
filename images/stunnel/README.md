<!--monopod:start-->
# stunnel
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/stunnel` |


* [View container image in the Chainguard Containers Directory](https://images.chainguard.dev/directory/image/stunnel/overview).
* [View the Container Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/contact?utm_source=readmes) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Container for stunnel

This image contains the CLI for the [stunnel](https://www.stunnel.org/) networking tool

Chainguard Containers are regularly-updated, secure-by-default container images.
<!--overview:end-->

<!--getting:start-->
## Download this Container Image
For those with access, this container image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/stunnel:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard Registry.
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