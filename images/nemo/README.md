<!--monopod:start-->
# nemo
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/nemo` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/nemo/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
NVIDIA NeMo Framework is an end-to-end, cloud-native framework to build, customize, and deploy generative AI models anywhere.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/nemo:latest
```
<!--getting:end-->

<!--body:start-->
Documentation on how to use NeMo Framework is discussed in detail in [NVIDIA documentation](https://docs.nvidia.com/nemo-framework/user-guide/latest/index.html)

As a starting off point, to run Wolfi-based NeMo image,
``` bash 
docker run --gpus all -it --rm --shm-size=8g -p 8888:8888 -p 6006:6006 --ulimit memlock=-1 --ulimit stack=67108864 cgr.dev/chainguard/nemo:latest
```

To simply run a sample script to familiarize yourself with NeMo framework, [NVIDIA documentation](https://docs.nvidia.com/deeplearning/nemo/user-guide/docs/en/main/starthere/intro.html) is a good place to start.

To explore NeMo’s ASR, LLM and TTS functionality you may run this Audia Translation tutorial; the `nemo_quickstart.py` script to run this turorial is available [here](https://docs.nvidia.com/deeplearning/nemo/user-guide/docs/en/main/starthere/intro.html#quick-start-guide)

```bash
  docker run --rm -it -v "${my_d}/nemo_quickstart.py":/tmp/nemo_quickstart.py --name nemo-starter cgr.dev/chainguard/nemo:latest -c "python /tmp/nemo_quickstart.py"
```

## Note
There are various optimized variants of NeMo and PyTorch images available. Chainguard images are built referencing the open-source versions, determining which packages are included in our minimal, wolfi-based images.

<!--body:end-->
