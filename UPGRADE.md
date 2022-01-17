# Upgrades

This document highlights breaking changes in releases that will require some migration effort in your project. As we move towards a `1.0.0` release these will be restricted to major upgrades only, but currently, whilst the API is still being fleshed out in the `0.x` releases, they may be more frequent.

## `0.14.x` -> `0.15.0`

* app.services in workspace.yml is deprecated and replaced with services.*.enabled. It will still continue to function until obsoleted
* .Values.service in helm values is deprecated and replaced with .Values.docker.services.*.enabled. It will still continue to function until obsoleted.
* _twig/docker-compose.yml/application.yml.twig moved to _twig/docker-compose.yml/service/app.yml.twig, to match the same features as other services, enabled by default

## `0.13.x` -> `0.14.0`

* The default development workflow has now changed from host to `app` container. Before, the `app` container was still the default way to run your app, but all `ws go ...` commands executed on the host by default. These now run in the `app` container instead.
* The `ws recompile` command now does an in-place recompile, rather than rebuilding the whole `app` container.
* The `.my127ws/harness/scripts/integration/run.sh` was renamed to `.my127ws/harness/scripts/integration/host-run.sh` to reflect that it runs on the host.
* The `.my127ws/harness/scripts/integration/run-one.sh` file has been removed, as `.my127ws/harness/scripts/integration/host-run.sh` can handle both single and full integration suite test execution.

## `0.12.x` -> `0.13.0`

* The Dockerfiles have been restructured to make multi-platform images easier. You may need to restructure your own template overrides if you use a custom `Dockerfile` or `Dockerfile.prod`, as they have now been moved, see [here](https://github.com/inviqa/harness-go/tree/master/docker/image/app/include).
* The default Kafka and Zookeeper images have been switched to [bitnami/kafka](https://hub.docker.com/r/bitnami/kafka) and [bitnami/zookeeper](https://hub.docker.com/r/bitnami/zookeeper), respectively. If you want to continue using the legacy wurstmeister images, you will need to specify this in your `kafka.repository` and `zookeeper.repository` attributes.
* The configuration for Kafka and Zookeeper has moved from `kafka` and `zookeeper` attributes to `services.kafka` and `services.zookeeper`, respectively.
    * Additionally, the `kafka.image` and `zookeeper.image` attributes have been renamed during the move to `services.kafka.repository` and `services.zookeeper.repository`, respectively.
    * Similarly, the `kafka.version` and `zookeeper.version` attributes have been renamed during the move to `services.kafka.tag` and `services.zookeeper.tag`.

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
