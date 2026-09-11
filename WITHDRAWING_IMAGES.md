# Withdrawing Chainguard Images

Sometimes an image or an entire image repo needs to be removed because it was
erroneously added.

Withdrawals are **no longer run from this repository**. This repo is public, so
the withdraw lists and workflows now live in the private
[chainguard-dev/stereo](https://github.com/chainguard-dev/stereo) repository
(CON-2865). Withdrawals for both the public (`cgr.dev/chainguard`) and private
(`cgr.dev/chainguard-private`) catalogs run from there.

## Withdrawing Images (tags)

- Add the full image refs to `containers/public/withdrawn-images.txt` in
  chainguard-dev/stereo (the private catalog uses
  `containers/withdrawn-images.txt`).
- Run the "Withdraw Images (containers)" workflow
  (`.github/workflows/withdraw-images-containers.yaml`) in chainguard-dev/stereo.

## Withdrawing Entire Repos

- Add the repo basename to `containers/public/withdrawn-repos.txt` in
  chainguard-dev/stereo. **Bare repo names only** — slashed entries (nested
  repos or UIDPs) are rejected and fail the run; nested repos are cleaned up
  manually. (The private catalog uses `containers/withdrawn-repos.txt`, where
  slashed entries are subgroup paths.)
- Run the "Withdraw Repos (containers)" workflow
  (`.github/workflows/withdraw-repos-containers.yaml`) in chainguard-dev/stereo.

Running withdrawals through these workflows ensures the operations are only
done using the Chainguard identity with permission, not by any human user
directly, and provides an audit trail.
