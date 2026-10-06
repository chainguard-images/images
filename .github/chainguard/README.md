# OctoSTS policies

## Public-copy production

`public-copy-containers-production.sts.yaml` grants `contents: read` to
`public-copy-containers@prod-enforce-fabc.iam.gserviceaccount.com` for
[OS-2869](https://linear.app/chainguard/issue/OS-2869). The policy trusts Google
issuer `https://accounts.google.com` and only numeric subject
`108056566238059936936`.

The production reconciler reads this repository as the destination base for
full-tree dry-run comparisons against `chainguard-dev/stereo`. Keep its producers
paused and dry-run enabled while installing and validating trust. The existing
`stereo-public-copy.sts.yaml` Actions policy remains in place for the current
publisher.

Follow the
[production handover runbook](https://github.com/chainguard-dev/mono/blob/main/env/enforce.dev/iac/400-public-copy-containers/README.md)
for runtime token and full-tree parity checks. A separate reviewed change grants
`contents: write` only after Actions is disabled and drained. Verify the subject
against the live service account and the stage's `service_account_unique_id` and
`octosts_policies` outputs. If the account is recreated, update the exact subject
and repeat validation and review.

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
