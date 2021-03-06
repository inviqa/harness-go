# Upgrades

This document highlights breaking changes in releases that will require some migration effort in your project. As we move towards a `1.0.0` release these will be restricted to major upgrades only, but currently, whilst the API is still being fleshed out in the `0.x` releases, they may be more frequent. 

## `0.9.x` -> `0.10.0`

* The `kafka.host` attribute is automatically set to `kafka:29092` for your `app` container, which works with the default Kafka setup. You can remove this attribute from your `workspace.yml` file.
* If you have integration test commands, you can probably remove them now in favour of the commands provided by this harness. See the [guide on adding integration tests](docs/how-to-guides/write-integration-tests.md) for more info.

## `0.8.x` -> `0.9.0`

* Go version 1.15 is no longer supported, so make sure you are running 1.16+

## `0.6.x` -> `0.7.0`

* If you have a project template override for `Dockerfile.twig` to execute `go install` commands after modules are downloaded, you can now remove that in favour of defining steps in the `go.modules.after.steps` attribute.
* The `image-dependencies.sh` file has been removed in favour of defining steps in the `go.modules.before.steps` attribute. 
* The `module_name` attribute has been moved to `go.module_name`. You will need to change this attribute in your `workspace.yml` prior to updating to the 0.7.0 version of the harness.
* The `ws go` commands have been updated to make it clear whether they run on the container or on the host machine. Commands ran on the container now follow the `ws go docker...` convention.
