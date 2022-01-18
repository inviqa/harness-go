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

### Performing a Release

1. Head to the [releases page] and create a new release:
    * Enter the tag name to be created
    * Give it a title containing the same tag name
    * Click "Auto-generate release notes"
    * Click `Publish Release`
1. Submit a pull request to [my127/my127.io] that adds the new release version and asset download URL for the
   Go harness to `harnesses.json`

[releases page]: https://github.com/inviqa/harness-go/releases
[my127/my127.io]: https://github.com/my127/my127.io
[Workspace]:https://github.com/my127/workspace
[upgrade doc]: UPGRADE.md
