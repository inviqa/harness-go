# Development and production

## Development

When working locally, doing a `ws create ...` or `ws install`, a development image will be produced based on the upstream [`go` image]. This is based on [DebianBuster], which has a shell and system utilities available for use. We can install more packages when running this container using `apt` (see the [`app.packages` attribute])

This works really well when we are developing, as we will want to be able to install packages quickly to test various things.

## Production

When we create a production image in our CI pipeline we want to produce a lighter weight image. We build this on top of [Docker's scratch image] which has no shell, and an empty files system without any packages. In our [`Dockerfile.prod.twig`] we:

1. Copy certificates from the development image to the production one  (if `app.bundle_certs` is set to `'yes'`)
2. Copy timezone info from the development image to the production one  (if `app.bundle_timezone_info` is set to `'yes'`)
3. Copy the compiled binary from the development image to the production one
4. Copy any [additional binaries] to the production image, if configured.

The second step is quite key, because when looking at the base [`Dockerfile`] it looks strange to see the `go build` step towards the end of it is different based on the build mode. This is hopefully clear from this description, we do that because the production build step is just a copy of the binary compiled during the development image build.

## Testing a production image build locally

You can find out how to do this in the [how to guide].

[`go` image]: https://hub.docker.com/_/golang
[DebianBuster]: https://wiki.debian.org/DebianBuster
[`app.packages` attribute]: harness-attributes.md
[Docker's scratch image]: https://hub.docker.com/_/scratch/
[`Dockerfile.prod`]: /docker/image/app/include/Dockerfile.prod.twig
[`Dockerfile`]: /docker/image/app/include/Dockerfile.base.twig
[how to guide]: /docs/how-to-guides/test-production-image-build-locally.md
[additional binaries]: /docs/how-to-guides/add-additional-binaries.md
