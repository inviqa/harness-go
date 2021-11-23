# How to create and publish multi-platform images

By default, the Go harness will produce an application and Jenkins pipeline that will create `linux/amd64` based images. If you are running a different architecture on your host machine, then your app will cross-compile without any problem. However, sometimes you may want to produce an image for a different platform in your CI pipeline, or produce images for multiple platforms. This document explains how to do that.

>_NOTE: Version 0.13.0 of the Go harness is required for this functionality. It is currently **experimental** and may change over time._

## Setting up

You will need to set an attribute in your `workspace.yml` to tell workspace which platforms you wish to build production images for: 

```yaml
attributes:
  # ...
  docker:
    experimental:
      multiplatform_build:
        enabled: "yes"
        platforms:
        - "linux/amd64"
        - "linux/arm64"

  pipeline:
    publish:
      enabled: "yes"
```

Now, whenever your Jenkins pipeline runs on your stable branch, a docker image will be built and published for the defined platforms.
