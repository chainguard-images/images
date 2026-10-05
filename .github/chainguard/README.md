# OctoSTS policies

## Public-copy production handover

The legacy `stereo-public-copy.sts.yaml` grant for stereo's GitHub Actions
publisher is retired after the production `public-copy-containers` reconciler
has completed its controlled handover. The replacement policy,
`public-copy-containers-production.sts.yaml`, must already trust the verified
numeric Google subject of the production runtime and grant only `contents: write`.

Before merging the legacy-policy removal, verify that stereo's old workflow is
removed and all of its runs are drained. Require evidence of a signed production
publication, an unchanged-input no-op, a watched-path push and an hourly resync
from the replacement. Follow the
[production handover runbook](https://github.com/chainguard-dev/mono/blob/main/env/enforce.dev/iac/400-public-copy-containers/README.md)
for ordering and rollback. Restoring Actions requires pausing and draining the
reconciler first; never authorize concurrent publishers.

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
