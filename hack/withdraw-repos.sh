#!/usr/bin/env bash
set -eu -o pipefail

# Withdraw (delete) repos under the public "chainguard" org.
#
# Reads the repo-root withdrawn-repos.txt, which is mirrored from
# chainguard-dev/stereo containers/public/withdrawn-repos.txt.
# Each non-comment, non-empty line is either:
#   - a bare repo name, resolved as a direct child of the public org, or
#   - a full repo UIDP (for nested repos that cannot be addressed by name).
#
# Ported from chainguard-dev/stereo containers/hack/withdraw-repos.sh
# (CON-1963), adapted for the public org. Failures are accumulated and
# the script exits non-zero at the end, so one bad repo does not abort
# the rest but the run still goes red (CON-2596).

# cgr.dev/chainguard (the public org).
parent_id="720909c9f5279097d847ad02a2f24ba8f59de36a"

API_BASE="${API_BASE:-https://console-api.enforce.dev}"

withdrawn_file="$(realpath "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../withdrawn-repos.txt")"

unsafe=0
failed=0
for entry in $(grep -v '\#' "$withdrawn_file"); do
    if [[ "$entry" =~ ^[0-9a-f]{40}(/[0-9a-f]{16})+$ ]]; then
        # Full repo UIDP: it must live under the public org.
        if [[ "$entry" != "$parent_id"/* ]]; then
            echo "ERROR: $entry: repo UIDP is not under the public org $parent_id"
            failed=1
            continue
        fi
        repo_id="$entry"
    else
        repo_json=$(chainctl images repos list --parent "$parent_id" --repo "$entry" -o json) \
            || { echo "ERROR: $entry: failed to look up repo"; exit 1; }
        repo_id=$(echo "$repo_json" | jq -r '.items[0].id // empty')
        if [[ -z "$repo_id" ]]; then echo "WARNING: skipping $entry (repo not found)"; continue; fi
    fi

    # Safety check: ensure no customer repos are sourced from this repo.
    if [[ "${SKIP_SAFETY_CHECK:-false}" != "true" ]]; then
        response=$(curl -sSf -H "Authorization: Bearer $(chainctl auth token)" "${API_BASE}/registry/v1/repocountbysource/${repo_id}") \
            || { echo "ERROR: $entry: failed to query repo count by source"; exit 1; }
        count=$(echo "$response" | jq -re '.count') \
            || { echo "WARNING: $entry: could not determine customer repo count, skipping"; continue; }
        if [[ "$count" != "0" ]]; then
            echo "UNSAFE: $entry: $count customer repos are sourced from it"
            unsafe=1
            continue
        fi
        echo "SAFE: $entry: 0 customer repos sourced from it"
    fi

    # CI sets DRY_RUN=false on live runs; anything else is a dry run.
    if [[ "${DRY_RUN:-true}" == "false" ]]; then
        if (set -x; chainctl image repo rm "$repo_id"); then
            echo "WITHDRAWN: $entry"
        else
            echo "ERROR: $entry: failed to withdraw"
            failed=1
        fi
    else
        echo "DRY RUN: chainctl image repo rm $repo_id  # $entry"
    fi
done

if [[ "$unsafe" -ne 0 ]]; then
    echo "One or more repos are unsafe to withdraw. Set SKIP_SAFETY_CHECK=true to bypass."
    exit 1
fi
if [[ "$failed" -ne 0 ]]; then
    echo "One or more repo withdrawals failed."
    exit 1
fi
