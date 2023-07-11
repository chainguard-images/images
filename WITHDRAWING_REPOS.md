# Withdrawing Chainguard Images (Entire Repos)

Sometimes an image repo needs to be removed entirely because it was erroneously added.

To do so:

- Add the repo basename that need to be removed to `withdrawn-repos.txt`
- Run the ["Withdraw Repos"](https://github.com/chainguard-images/images/os/blob/main/.github/workflows/withdraw-repos.yaml) workflow on GitHub.

This ensures that these operations are only done using the Chainguard identity with permission, and not by any human user directly. This also provides an audit trail of such operations.
