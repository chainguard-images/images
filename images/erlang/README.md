<!--monopod:start-->
# erlang
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/erlang` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/erlang/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Container image for building Erlang applications.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/erlang:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

The image can be used to run the `erl` tool, or to compile and run Erlang scripts.

For example, a simple Hello World script in Erlang, `hello.erl`:

```
-module(hello).
-export([hello_world/0]).

hello_world() -> io:fwrite("hello, world\n").
```

can be compiled in Docker with:

```
FROM cgr.dev/chainguard/erlang
COPY . .
RUN erlc hello-world.erl
ENTRYPOINT [ "erl" ]
CMD [ "-noshell", "-eval", "hello:hello_world().", "-s", "init", "stop" ]
```

Running this image should output `hello, world`.
<!--body:end-->
