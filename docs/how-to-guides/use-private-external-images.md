# How to use private external docker images

Sometimes you may need to pull in a docker image that is not in a public registry. You may also need to pull in several docker images from different registries. This guide explains how to do that.

## Prerequisites

You will need a username and password for a robot/machine user in your desired registries. This should be a user that is used solely for the purposes of your application or project for pulling docker images from that registry.

## Configuring external image registries

1. Ensure that your `workspace.yml` has an overlay directory defined:
   ```yaml
   workspace('my-app'):
    harness: inviqa/go:v0.10
    overlay: tools/workspace
   ```
2. Create your `docker-compose.yml` configuration for your service that uses the private docker image:
   `tools/workspace/_twig/docker-compose.yml/service/my-service.yml.twig`:
   ```yaml
     my-service:
      image: quay.io/my_images/foo:latest
      environment:
        FOO: "bar"
    networks:
      private: {}
   ```
4. Add your  to the `app.services` attribute:
   ```
   attributes:
     app:
       services: [my-service]
   ```

Now, you need to update the `docker.external_image_registries` attribute with each of the registries that your private images use. For example, our `my-service` service above comes from `quay.io`, so we need to add that registry as follows:

`workspace.yml`:
```yaml
attributes:
  docker:
    external_image_registries:
      - url: quay.io
        username: my-user
        password: = decrypt('foo')
```

>_NOTE: The password values should be run through `ws secret encrypt` on the CLI, with the encrypted value being added to the `decrypt()` function call in place of foo/bar in the example above._

Now, you can run `ws install` or `ws rebuild` and it will pull your external image.
