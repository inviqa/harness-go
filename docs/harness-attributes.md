# Using harness attributes

The Go harness has several attributes that you can use in your own project to control how it behaves. This document outlines some of the most common attributes that you will need to use when developing an application with it.

> _NOTE: This document is a work-in-progress, and only a subset of all attributes have been documented. Please consider contributing._

## Required attributes

Some attribute values are required in order to create a working application. You will be asked to provide these whenever you create a project (`ws create-project ...`):

* `module_name` - this will be the name of the Go module for your created application, e.g. `github.com/inviqa/repo-name`. This is stored in the generated `go.mod` file.

## Overriding attributes

The harness has sensible defaults for all other attributes, but you will often need to override some of these in order to get the
Go harness to work for your particular application. To override an attribute, define an `attributes` property in your `workspace.yml` after your project has been created. It may look something like this:

    workspace('my-go-app'):
      description: generated local workspace for ci-go-sample.
      harness: inviqa/go

    attributes:
      # attributes should be added under here

You can then start to define attribute overrides.

### `go` attributes

These attributes control how Go behaves in the built docker image. A full picture of the attributes available under this node are as follows:  

    go:
      version: 1.15
      environment:
        CGO_ENABLED: '0'
        GOPRIVATE: github.com/inviqa/*
      modules:
        after:
          steps: []
        before:
          steps: []

#### `version`

This controls the Go version to use, in the format of `major.minor`. See [here](supported-go-versions.md) for the versions we support.

#### `environment`

This allows you to define various environment variables that are set in the docker image during build. 

#### `modules.before.steps` and `modules.after.steps`

Here you can set a bunch of arbitrary steps to execute before/after go modules have been downloaded. These are executed as you define them, from a shell context, so you can execute other shell scripts from here too. If you want to add a shell script and execute it from these before/after step attributes you can follow these steps:

1. Configure an overlay directory as described in step 1 of [overriding harness templates](overriding-files.md)
1. Inside your overlay directory (e.g. `tools/workspace`), add your shell script as `docker/image/app/root/lib/my-script.sh`, the full path will be `tools/workspace/docker/image/app/root/lib/my-script.sh`.
1. Populate your new shell script with whatever it is you want to execute
1. Run `ws harness prepare`, and verify that your file has been copied to `.my127ws/docker/image/app/root/lib/` (this directory and its contents are automatically copied onto the Docker image)
1. In the desired step attribute, e.g. `modules.after.steps`, add a call to your new shell script:

       attributes:
         go:
           modules:
             after:
               steps:
                 - ./lib/my-script.sh

1. Run a full `ws install` and make sure you are happy with the result
1. Commit your new shell script file, along with the `workspace.yml` change to define an overlay directory
