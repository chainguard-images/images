# pytorch images should only contain the latest *Stable CUDA* variant for
# the associated version of PyTorch[*]. Use the following table to update
# this list for new PyTorch releases:
#  https://github.com/pytorch/pytorch/blob/main/RELEASE.md#release-compatibility-matrix
# [*] And CUDA 11.8 for pytorch-fips, until it is EOL

import sys
import torch

PyTorchLatestStableCudaVariants = [
    ('', '+cu118'),     # We'll support 11.8 for pytorch-fips until 11.x EOL
    ('2.7.', '+cu126'), # CUDA 12.6
    ('2.8.', '+cu128'), # CUDA 12.8
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
