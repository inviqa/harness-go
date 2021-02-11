# Development and production

## Development

When working locally, doing a `ws create ...` or `ws install`, a development image will be produced based on the upstream [`go` image]. This is based on [DebianBuster], which has a shell and system utilities available for use. We can install more packags when running this container using `apt` (see the [`app.packages` attribute])

This works really well when we are developing, as we will want to be able to install packages quickly to test various things.

## Production

When we create a production image in our CI pipeline we want to produce a lighter weight image. We build this on top of [Docker's scratch image] which has no shell, and an empty files system without any packages. In our [`Dockerfile.prod`] we do two things:

1. Copy certificates from the development image to the production one  (if `app.bundle_certs` is set to `'yes'`)
1. Copy the compiled binary from the development image to the production one

The second step is quite key, because when looking at the development [`Dockerfile`] it looks strange to see the `go build` step towards the end of it is different based on the build mode. This is hopefully clear from this description, we do that because the production build step is just a copy of the binary compiled during the development image build.

[`go` image]: https://hub.docker.com/_/golang
[DebianBuster]: https://wiki.debian.org/DebianBuster
[`app.packages` attribute]: harness-attributes.md
[Docker's scratch image]: https://hub.docker.com/_/scratch/
[`Dockerfile.prod`]: /docker/image/app/Dockerfile.prod.twig
[`Dockerfile`]: /docker/image/app/Dockerfile.twig
