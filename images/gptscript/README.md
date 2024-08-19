<!--monopod:start-->
# gptscript
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/gptscript` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/gptscript/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
Minimal [gptscript](https://github.com/gptscript-ai/gptscript) container image.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/gptscript:latest
```
<!--getting:end-->

<!--body:start-->

## Usage

Before using our gptscript image, you'll need an [OpenAI API key](https://platform.openai.com/api-keys).

After retrieving your key, run the container with the following command:

```bash
docker run -e "OPENAI_API_KEY=<YOUR OPENAI API KEY>" cgr.dev/chainguard/gptscript:latest
```

Azure OpenAI may also be used:

```bash
docker run \
  -e "OPENAI_API_KEY=<YOUR API KEY>" \
  -e "OPENAI_BASE_URL=<YOUR ENDPOINT>" \
  -e "OPENAI_API_TYPE=AZURE" \
  -e "OPENAI_AZURE_DEPLOYMENT=<YOUR DEPLOYMENT NAME>" \
  cgr.dev/chainguard/gptscript:latest
```

To run a basic hello world test, run the following:

```bash
docker run -e "OPENAI_API_KEY=<YOUR OPENAI API KEY>" cgr.dev/chainguard/gptscript:latest  https://get.gptscript.ai/echo.gpt --input 'Hello, World!'
```

<!--body:end-->
