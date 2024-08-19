<!--monopod:start-->
# nemo
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/nemo` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/nemo/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

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
## Running the Image

To run the NeMo Chainguard Image interactively in an environment with connected GPU:

``` bash 
docker run -it --rm \
  --gpus all \
  --shm-size=8g \
  --ulimit memlock=-1 \
  --ulimit stack=67108864 \
  cgr.dev/chainguard/nemo:latest
```

These options allow access to connected GPU, allocate more shared memory to the container, and put an upper bound on container memory use. If you are running the image in an environment without connected GPU, omit the `  --gpus all` option.

## Testing GPU Access

If your environment has connected GPUs, you can check that NeMo has access. First, run the NeMo Chainguard Image interactively with the above command. At the container prompt, run:

```bash
$ python
Python 3.11.9 (main, Apr  2 2024, 15:40:32) [GCC 13.2.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> from nemo.core import pytorch_lightning
>>> len(pytorch_lightning.accelerators.find_usable_cuda_devices())
1
```

The above result shows that the environment has one connected GPU.

## Testing NeMo

You can run the below commands on your host machine to download and execute a script to test NeMo functionality. The script uses two pretrained models to generate audio output from plain text (text to speech). 

```bash
mkdir nemo-test && cd nemo-test
curl https://raw.githubusercontent.com/chainguard-dev/nemo-examples/main/tts.py > tts.py
docker run -it --rm \
  --gpus all \
  --user root \
  --shm-size=8g \
  --ulimit memlock=-1 \
 --ulimit stack=67108864 \
  -v $PWD:/home/nonroot/nemo-test \
  cgr.dev/chainguard/nemo:latest \
  -c "python /home/nonroot/nemo-test/tts.py"
```

After running the below, you should have a test.wav file in the current working directory on your host machine. The above example uses a root login in order to write the output to the volume. Remember not to use root or privileged access in a production scenario.

## Resources

For more information on using NVIDIA NeMo, see the following resources.

- [NeMo Overview](https://docs.nvidia.com/nemo-framework/user-guide/latest/index.html)
- [NeMo Tutorials](https://docs.nvidia.com/nemo-framework/user-guide/latest/nemotoolkit/starthere/tutorials.html)
- [NeMo Playbooks](https://docs.nvidia.com/nemo-framework/user-guide/latest/playbooks/index.html)
- [NeMo on GitHub](https://github.com/NVIDIA/NeMo)

<!--body:end-->
