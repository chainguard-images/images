# pytorch images should only contain the latest *Stable CUDA* variant for
# the associated version of PyTorch. Use the following table to update
# this list for new PyTorch releases:
#  https://github.com/pytorch/pytorch/blob/main/RELEASE.md#release-compatibility-matrix

import sys
import torch

# pytorch - cuda mapping can be found in the dockerhub image source, eg:
# https://hub.docker.com/layers/pytorch/pytorch/2.10.0-cuda12.8-cudnn9-runtime/images/sha256-b85566342b86d13a67712e9315d40cdc2dad7f8d86df1aff3831f80835edbcca
PyTorchLatestStableCudaVariants = [
    ('2.6.', '+cu118'), # for request-5190 arm64
    ('2.7.', '+cu126'), # CUDA 12.6
    ('2.8.', '+cu128'), # CUDA 12.8
    ('2.9.', '+cu128'), # CUDA 12.8
    ('2.10.', '+cu128'), # CUDA 12.8
]

if __name__ == '__main__':
    ver = torch.__version__
    for prefix, suffix in PyTorchLatestStableCudaVariants:
        if ver.startswith(prefix) and ver.endswith(suffix):
            print(
                f"INFO: Found expected CUDA variant: [{ver}]",
            )
            exit(0)
    print(
        f"ERROR: Found unexpected CUDA variant: [{ver}]",
        file=sys.stderr,
    )
    print(
        "ERROR: Please update expected-cuda-variant.py",
        file=sys.stderr,
    )
    exit(1)
