# How to test a production image build locally

In the local development environment, this harness will do a development build of the `app` image. This is based on [DebianBuster], which has a shell and system utilities available for use. It also has all files in your project mounted into its filesystem.

When the CI pipeline builds the `app` image and pushes it to the Docker image registry for deployments, it builds a production image instead, so it is considered good practice to verify your application changes in a production image build locally before pushing your code. See the document on [development and production] for more information.

## Doing a production image build

When you have your development environment running locally (e.g. after running `ws install`), you can run the following to do a production image build and automatically switch to it in your `docker-compose` stack:

    ws use prod

You will notice that if you now try to access the `app` container with `ws app`, you will get an error, confirming that it has no shell in which we can exec into:

> OCI runtime exec failed: exec failed: container_linux.go:370: starting container process caused: exec: "bash": executable file not found in $PATH: unknown

This confirms that our development environment is now using the production build of the `app` image.

[DebianBuster]: https://wiki.debian.org/DebianBuster
[development and production]: /docs/development-and-production.md
