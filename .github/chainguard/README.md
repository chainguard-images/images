# OctoSTS policies

## Public-copy production

`public-copy-containers-production.sts.yaml` binds
`public-copy-containers@prod-enforce-fabc.iam.gserviceaccount.com` for
[OS-2869](https://linear.app/chainguard/issue/OS-2869). The policy trusts Google
issuer `https://accounts.google.com` and only numeric subject
`108056566238059936936`.

The `contents: write` grant permits the production reconciler to publish this
repository from `chainguard-dev/stereo`. Its source policy remains read-only.
Finish the production dry-run parity and read-only token checks, then disable
and drain Actions before installing this write grant. Keep reconciler producers
paused and drain the queue before deploying the separate worker write-mode
configuration. Verify a controlled signed publication and an unchanged-input
no-op before unpausing producers.

The legacy `stereo-public-copy.sts.yaml` Actions policy is absent. Its absence
does not drain previously issued tokens or workflow runs. Require evidence of a
signed production publication, an unchanged-input no-op, a watched-path push and
an hourly resync before retiring the disabled Actions workflow.

Follow the
[production handover runbook](https://github.com/chainguard-dev/mono/blob/main/env/enforce.dev/iac/400-public-copy-containers/README.md)
for runtime token and full-tree parity checks, ordering and rollback. Verify the
subject against the live service account and the stage's `service_account_unique_id`
and `octosts_policies` outputs. If the account is recreated, update the exact
subject and repeat validation and review. Restoring Actions requires pausing and
draining the reconciler first; never authorize concurrent publishers.

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
