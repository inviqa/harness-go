# Using harness attributes

The Go harness has several attributes that you can use in your own project to control how it behaves. This document outlines some of the most common attributes that you will need to use when developing an application with it.

> _NOTE: This document is a work-in-progress, and only a subset of all attributes have been documented. Please consider contributing._

## Required attributes

Some attribute values are required in order to create a working application. You will be asked to provide these whenever you create a project (`ws create ...`):

* `go.module_name` - this will be the name of the Go module for your created application, e.g. `github.com/inviqa/repo-name`. This is stored in the generated `go.mod` file.

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
      formatter: gofmt
      gocyclo:
         threshold: 10

#### `version`

This controls the Go version to use, in the format of `major.minor`. See [here](supported-go-versions.md) for the versions we support.

#### `environment`

This allows you to define various environment variables that are set in the docker image during build. 

#### `modules.before.steps` and `modules.after.steps`

Here you can set a bunch of arbitrary steps to execute before/after go modules have been downloaded. These are executed as you define them, from a shell context, so you can execute other shell scripts from here too. If you want to add a shell script and execute it from these before/after step attributes you can follow these steps:

1. Configure an overlay directory as described in step 1 of [overriding harness templates]
1. Inside your overlay directory (e.g. `tools/workspace`), add your shell script as `docker/image/app/root/lib/my-script.sh`, the full path will be `tools/workspace/docker/image/app/root/lib/my-script.sh`.
1. Give your script executable permission with `chmod +x tools/workspace/docker/image/app/root/lib/my-script.sh`
1. Populate your new shell script with whatever it is you want to execute
1. Run `ws harness prepare`, and verify that your file has been copied to `.my127ws/docker/image/app/root/lib` (this directory and its contents are automatically copied onto the Docker image)
1. In the desired step attribute, e.g. `modules.after.steps`, add a call to your new shell script:

       attributes:
         go:
           modules:
             after:
               steps:
                 - /lib/my-script.sh

1. Run a full `ws install` and make sure you are happy with the result
1. Commit your new shell script file, along with the `workspace.yml` change to define an overlay directory

#### `formatter`

This allows you to set your preferred formatter, which will be used in the Jenkins pipelines for your project. If a Jenkins pipeline detects that any of your files do not conform with the configured formatter's standard, then the whole pipeline will fail. Available options are [`gofmt`] or [`goimports`]. Defaults to `gofmt`.

#### `gocyclo.threshold`

This controls the cyclomatic complexity threshold for `gocyclo` checks in the Jenkins pipelines. If any function in your application exceeds this complexity threshold then the pipeline will fail. A lower setting is more strict, and a higher one is less so. See [`gocyclo`] for more information. Defaults to `10`.

### `app` attributes

These attributes control how the app container is built or how it behaves after it is built. Attributes available are as follows:

    app:
      binary: app
      src_path: .
      module_path: = @('app.src_path')
      health_port: 80
      services: []
      default_port:
        name: http
        port: 80
      ingress:
        # possible ingress types are standard, istio, or ~ for none
        # note istio requires a cluster that has istio configured as the ingress controller
        type: standard
        protocol: = @('app.default_port.protocol')
      bundle_certs: no
      additional_binaries: []
      packages: []
      copy_files: []

#### `binary`

This is the name of the compiled binary, there is usually no need to change this attribute.

#### `src_path`

You can place your application's source code anywhere within your repository by changing this attribute. For example, if you wanted to place your application code under `src` then you could set this attribute to `./src`.

#### `module_path`

This should remain the same as the `src_path`, and may be removed in a future harness version.

#### `health_port`

The port that health probes should use to talk to your application. If you change this value, then you will need to make sure that your HTTP server in your application is also listening on that new port.

#### `services`

This attribute is for adding additional services to your application stack. For example, if we wanted to introduce Kafka (and Zookeeper) we could do the following

1. Define a `tools/workspace` overlay directory as described in step 1 of [overriding harness templates]
1. Update this attribute to define these two new services:

       app:
         services: [kafka, zookeeper]

1. Add `docker compose` configuration for these under `tools/workspace/_twig/docker-compose.yml/services/kafka.yml.twig` (and `zookeeper.yml.twig`)
1. Run `ws harness prepare` to run the templating, and then check your `docker-compose.yml` to see if those services are now present.
1. Run a `ws rebuild` to bring those services up

#### `default_port`

This is used to control the containerPort definition in the Helm chart, used in Kubernetes deployments. Generally, you should never have to change this, but if you do please liaise with the DevOps team.

#### `ingress`

These settings are related to changing the ingress used for your application. Valid values are `istio`, `standard` and `none`, defaulting to `standard` As an engineer you should never need to change it, unless directed to do so by the DevOps team.

#### `bundle_certs`

This allows us to enable the bundling of certificates when the production image is being built. This will not affect your local development, because we do not use the production image locally, however, when CI pipelines prepare the production image (based on [Docker's scratch image](https://hub.docker.com/_/scratch/)), we will need to set this value to `'yes'` if we communicate with any services that use TLS. Without these, the application will not be able to complete a TLS handshake with those services. See [development and production](development-and-production.md) for more info.

#### `bundle_timezone_info` (deprecated)

Deprecated, since go 1.15 you can `import _ "time/tzdata"` into the application itself to bundle tzdata in the binary.

This allows the bundling of timezone info when the production image is being built. This will not affect your local development, because we do not use the production image locally, however, when CI pipelines prepare the production image (based on [Docker's scratch image](https://hub.docker.com/_/scratch/)), we will need to set this value to `true` if we want to access timezone info. Generally, this is only required if you want to operate across multiple timezones.

#### `additional_binaries`

An array attribute which, when populated, will instruct the harness to build binaries from the provided directories. These binaries will be copied to the production image also. For example:

```yaml
additional_binaries:
  - "cmd/foo"
  - "tool/bar"
```

See [the guide](/docs/how-to-guides/add-additional-binaries.md) for more on how to add additional binaries, and why you may need them.

#### `packages`

This array attribute allows you to define an arbitrary number of `apt` packages to be installed when the Docker image is being built. Please note that these packages are only installed on the development image, and not the production image.

#### `copy_files`

An array attribute that lets you specify additional file paths that should be copied onto the final production image. These files should be built on the base development image first, as they will be copied from that layer in the production docker build. The format for each entry is `from_path:to_path`, where `from_path` is the path on the base image layer. For example:

```yaml
copy_files:
  - "/go/bin/grpc_health_probe:/"
```

[overriding harness templates]: overriding-files.md
[`gofmt`]: https://pkg.go.dev/cmd/gofmt
[`goimports`]: https://pkg.go.dev/golang.org/x/tools/cmd/goimports
[`gocyclo`]: https://github.com/fzipp/gocyclo
