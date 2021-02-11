# Upgrades

This document highlights breaking changes in releases that will require some migration effort in your project. As we move towards a `1.0.0` release these will be restricted to major upgrades only, but currently, whilst the API is still being fleshed out in the `0.x` releases, they may be more frequent. 

## 0.6.x -> 0.7.0

* If you have a project template override for `Dockerfile.twig` to execute `go install` commands after modules are downloaded, you can now remove that in favour of defining steps in the `go.modules.after.steps` attribute.
* The `image-dependencies.sh` file has been removed in favour of defining steps in the `go.modules.before.steps` attribute. 
* The `module_name` attribute has been moved to `go.module_name`. You will need to change this attribute in your `workspace.yml` prior to updating to the 0.7.0 version of the harness.
