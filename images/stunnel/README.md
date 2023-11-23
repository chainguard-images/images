<!--monopod:start-->
# stunnel
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/stunnel` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/stunnel/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
This image contains the CLI for the [stunnel](https://www.stunnel.org/) networking tool
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/stunnel:latest
```
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
