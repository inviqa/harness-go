# Go Harness for [Workspace]

To use this Go harness:

1. Install [Workspace]
1. Run `ws create <projectName> inviqa/go:v0.2.0`
1. You will be prompted for any required attributes for the application
1. `cd <projectName>`
1. Create an initial commit, ensuring that `workspace.override.yml` is not added to git.
1. Store the `workspace.override.yml` contents in a suitable location (such as LastPass).

## Required attributes

When creating a new project, you will be asked to provide the following attributes

* `module_name` - this is the name of the Go module for you created application, e.g. github.com/inviqa/repo-name

## HTTP server

By default, new projects created with this harness will have a basic HTTP server listening on port 80. The following endpoints are available

* `/` - returns a simple JSON response confirming the service is working
* `/metrics` - returns prometheus instrumentation data

[Workspace]:https://github.com/my127/workspace
