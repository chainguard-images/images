# Withdrawing Chainguard Images

Sometimes an image needs to be removed from the repository because it was erroneously added.

To do so:

- Add the full image refs that need to be removed to `withdrawn-images.txt`
- Run the ["Withdraw Images"](https://github.com/chainguard-images/images/os/blob/main/.github/workflows/withdraw-images.yaml) workflow on GitHub.

This ensures that these operations are only done using the Chainguard identity with permission, and not by any human user directly. This also provides an audit trail of such operations.

You can add items to the list with `crane`. For example:

```
echo "# uhoh tags were added by mistake" >> withdrawn-images.txt
crane ls cgr.dev/chainguard/foo --full-ref | grep uhoh >> withdrawn-images.txt
```

## Withdrawing Entire Repos

Sometimes an image repo needs to be removed entirely because it was erroneously added.

To do so:

- Add the repo basename that need to be removed to `withdrawn-repos.txt`
- Run the ["Withdraw Repos"](https://github.com/chainguard-images/images/os/blob/main/.github/workflows/withdraw-repos.yaml) workflow on GitHub.

This ensures that these operations are only done using the Chainguard identity with permission, and not by any human user directly. This also provides an audit trail of such operations.
