<!--monopod:start-->
# openai
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/openai` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/openai/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimal image with the OpenAI CLI.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/openai:latest
```
<!--getting:end-->

<!--body:start-->
This image requires the `OPENAI_API_KEY` environment variable to be set to work correctly.
You can obtain this directly from openai.com, and set it with the `-e` flag to `docker run`, or the `--env-file` flag to specify it as a file.

```shell
$ docker run -e OPENAI_API_KEY=$OPENAI_API_KEY cgr.dev/chainguard/openai api
usage: openai api [-h]
                  {engines.list,engines.get,engines.update,engines.generate,chat_completions.create,completions.create,deployments.list,deployments.get,deployments.delete,deployments.create,models.list,models.get,models.delete,files.create,files.get,files.delete,files.list,fine_tunes.list,fine_tunes.create,fine_tunes.get,fine_tunes.results,fine_tunes.events,fine_tunes.follow,fine_tunes.cancel,fine_tunes.delete,image.create,image.create_edit,image.create_variation,audio.transcribe,audio.translate}
                  ...

positional arguments:
  {engines.list,engines.get,engines.update,engines.generate,chat_completions.create,completions.create,deployments.list,deployments.get,deployments.delete,deployments.create,models.list,models.get,models.delete,files.create,files.get,files.delete,files.list,fine_tunes.list,fine_tunes.create,fine_tunes.get,fine_tunes.results,fine_tunes.events,fine_tunes.follow,fine_tunes.cancel,fine_tunes.delete,image.create,image.create_edit,image.create_variation,audio.transcribe,audio.translate}
                        All API subcommands

options:
  -h, --help            show this help message and exit
```
<!--body:end-->
