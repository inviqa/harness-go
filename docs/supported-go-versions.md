# Supported Go versions

This harness only ever tests one Go version, which is usually the latest. If you like, you can change your Go version to suit your project requirements by setting the `go.version` attribute in your `workspace.yml`. For example:

    attributes:
      go:
        version: 1.13

Be sure to change your generated `go.mod` file in your harness too, as that will contain the Go version that is expected to run your application.
