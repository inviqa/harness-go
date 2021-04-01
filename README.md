# Go Harness for [Workspace]

To use this Go harness:

1. Install [Workspace]
1. Run `ws create <projectName> inviqa/go:vX.Y.Z` (substitute `X.Y.Z` with a corresponding version from the [releases list](https://github.com/inviqa/harness-go/releases))
1. You will be prompted for any required attributes for the application
1. `cd <projectName>`
1. Create an initial commit, ensuring that `workspace.override.yml` is not added to git.
1. Store the `workspace.override.yml` contents in a suitable location (such as LastPass).

## Documentation

To read more about how to use this harness check out the [docs](docs).

## HTTP server

By default, new projects created with this harness will have a basic HTTP server listening on port 80. The following endpoints are available:

* `/` - returns a simple JSON response confirming the service is working
* `/metrics` - returns prometheus instrumentation data

## Upgrades

If you are upgrading your application's Go harness version, then you should consider any breaking changes mentioned in the [upgrade doc].   

## Releasing

### Changelog Generation

We keep a changelog, powered by [GitHub Changelog Generator].

When ready to tag a release, make a new branch from the `master` branch for the changelog entries:
1. Generate a `repo` scope token for use with the changelog generator: https://github.com/settings/tokens/new?description=GitHub%20Changelog%20Generator%20token
1. Export it in your environment: `export CHANGELOG_GITHUB_TOKEN=...`
1. Run the following docker command to generate the changelog, replacing `<nextReleaseTag>` with the version number you
   wish to release:
  ```bash
  docker run -e CHANGELOG_GITHUB_TOKEN="$CHANGELOG_GITHUB_TOKEN" -it --rm -v "$(pwd)":/usr/local/src/your-app -v "$(pwd)/github-changelog-http-cache":/tmp/github-changelog-http-cache ferrarimarco/github-changelog-generator --user inviqa --project harness-go --exclude-labels "duplicate,question,invalid,wontfix,skip-changelog" --release-branch master --future-release <nextReleaseTag>
  ```
1. Examine the generated `CHANGELOG.md`, verify the changes make sense.
1. Commit the resulting `CHANGELOG.md`, push and raise a pull request with the label `skip-changelog`.
1. Once merged, continue with the release process below.

### Performing a Release

Once the `CHANGELOG.md` is in the branch you wish to release:

1. Tag the release version with `git tag <releaseVersion>`
1. Push the tag to the repository: `git push origin <releaseVersion>`
1. Submit a pull request to [my127/my127.io] which adds the new release version and asset download URL for the
   Go harness to `harnesses.json`

[GitHub Changelog Generator]: https://github.com/github-changelog-generator/github-changelog-generator
[my127/my127.io]: https://github.com/my127/my127.io
[Workspace]:https://github.com/my127/workspace
[upgrade doc]: UPGRADE.md
