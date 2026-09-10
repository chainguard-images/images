# Withdrawing Chainguard Images

Sometimes an image needs to be removed from the repository because it was erroneously added.

To do so:

- Add the full image refs that need to be removed to `withdrawn-images.txt`
- Run the ["Withdraw Images"](https://github.com/chainguard-images/images/blob/main/.github/workflows/withdraw-images.yaml) workflow on GitHub.

This ensures that these operations are only done using the Chainguard identity with permission, and not by any human user directly. This also provides an audit trail of such operations.

You can add items to the list with `crane`. For example:

```
echo "# uhoh tags were added by mistake" >> withdrawn-images.txt
crane ls cgr.dev/chainguard/foo --full-ref | grep uhoh >> withdrawn-images.txt
```

## Withdrawing Entire Repos

Sometimes an image repo needs to be removed entirely because it was erroneously added.

To do so:

- Add the repo basename to `containers/public/withdrawn-repos.txt` in
  [chainguard-dev/stereo](https://github.com/chainguard-dev/stereo). The repo-root
  `withdrawn-repos.txt` in this repo is a mirror of that file — do not edit it here,
  the mirror sync will overwrite it.
- When the mirrored change lands on `main`, the
  ["Withdraw Repos"](https://github.com/chainguard-images/images/blob/main/.github/workflows/withdraw-repos.yaml)
  workflow runs automatically. You can also dispatch it manually; manual dispatch
  defaults to a dry run.

Before deleting, the workflow verifies via the registry API that no customer repos
are sourced from the repo being withdrawn. Failed deletions fail the run and alert
`#chainguard-images-alerts`.

This ensures that these operations are only done using the Chainguard identity with permission, and not by any human user directly. This also provides an audit trail of such operations.
