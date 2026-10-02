# OctoSTS policies

## Public-copy staging

`public-copy-containers-staging.sts.yaml` grants `contents: read` to
`public-copy-containers@staging-enforce-cd1e.iam.gserviceaccount.com` for
[OS-2868](https://linear.app/chainguard/issue/OS-2868). The policy trusts only
Google subject `100117912416404276169`.

The chainops.dev reconciler reads this repository to compare its current tree
with the public container configuration projected from
`chainguard-dev/stereo-staging`. The deployed worker uses this read grant for
dry-run comparison; this policy grants no write access. Signed-write validation
uses the separate private repository
`chainguard-sandbox/public-copy-containers-staging-proof` and that repository's
own write policy.

Follow mono's
[staging runbook](https://github.com/chainguard-dev/mono/blob/main/env/chainops.dev/iac/400-public-copy-containers/README.md)
for trust verification, validation, producer activation and rollback.
