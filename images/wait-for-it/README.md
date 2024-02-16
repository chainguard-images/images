<!--monopod:start-->
# wait-for-it
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/wait-for-it` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/wait-for-it/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Container image for testing whether a service is listening on an address/port combination.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/wait-for-it:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

### Simple Example

Test that a service is available!

```shell
$ docker run cgr.dev/chainguard/wait-for-it:latest -h google.com -p 80
wait-for-it: waiting 15 seconds for google.com:80
wait-for-it: google.com:80 is available after 0 seconds
```

### Timeout

You can optionally specify a timeout using the `-t` flag (in seconds):

```shell
$  docker run cgr.dev/chainguard/wait-for-it:latest -h fake.doesnotexist -p 80 -t 5
wait-for-it: waiting 5 seconds for fake.doesnotexist:80
wait-for-it: timeout occurred after waiting 5 seconds for fake.doesnotexist:80
```

### Subcommand

You can then run a command after the execution, using the `--` syntax.

```shell
$ docker run cgr.dev/chainguard/wait-for-it:latest -h fake.doesnotexist -p 80 -t 5 -- echo hello
wait-for-it: waiting 5 seconds for fake.doesnotexist:80
wait-for-it: timeout occurred after waiting 5 seconds for fake.doesnotexist:80
hello
```

Adding `-s` will only run the command if wait-for-it succeeds:

```shell
$ docker run cgr.dev/chainguard/wait-for-it:latest -h fake.doesnotexist -p 80 -t 5 -s -- echo hello
wait-for-it: waiting 5 seconds for fake.doesnotexist:80
wait-for-it: timeout occurred after waiting 5 seconds for fake.doesnotexist:80
wait-for-it: strict mode, refusing to execute subprocess
```
<!--body:end-->
