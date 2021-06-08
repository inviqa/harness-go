# How to write integration tests

The Go harness provides some basic support for executing integration tests. Where unit tests aim to prove that individual types, methods and functions work as expected, integration tests allow us to test our application as a whole. Support for integration tests in the harness comes in two forms

1. Convention: where to place your integration tests
1. Commands: tools to execute your integration tests easily and as part of the default Jenkins pipeline

## Best practices

The integration test support in this harness aims to align with the [best practices] set out in the Inviqa engineering guidelines.

## Adding integration tests

Integration tests should be added inside a top-level `integration` directory (and package). When you create a new project with the Go harness it will create this directory for you, along with a `helper_test.go` file where you can write any test helpers you may need. For example, you may want to truncate a database table before your test suite begins.

Additionally, integration test files should have the `integration` [build constraint]. This is important, because without it we cannot run our integration tests, or unit tests, in isolation. As you are writing code you will want to run unit tests via `go test ./...` far more frequently, as this gives you immediate feedback. The execution of integration tests is usually done less frequently, and so this isolation is important.

### Example test file

`integration/create_product_test.go`:
```go
// +build integration

package integration

import "testing"

func TestSomething(t *testing.T) {
    // write test
}
```

### Connecting to services

When you run integration tests, they should be executed from your host machine. This is inline with Inviqa's [best practices], and it means you get much faster feedback as you do not need to do a docker image build (`ws recompile`) when you make changes. Because of this, you will need to make sure that when you connect to services like a database, or message broker, that you:

1. Use a `docker-compose.override.yml` to set fixed ports for services you need to connect to
1. Inspect the `GO_TEST_MODE` env var in your test config setup
1. When this value is `"docker"`, use connection details suitable for connecting within your `app` container
1. Otherwise, use connection details that will work from your host machine

This gives flexibility to run the integration tests in both ways, as they are always executed from within the `app` container in the CI pipeline.

#### Example setup

`integration/helper_test.go`:
```go
// +build integration

package integration

import (
	"net/http/httptest"
	
	"my-service/config"
)

var server *httptest.Server

func init() {
	server = httptest.NewServer(/* some handler */)
	
	cfg := createConfig()
	// here we are using a test http server to simulate an upstream 3rd party service
	cfg.EmarsysBaseUrl = server.URL
}

func  createConfig() *config.Config {
	cfg := &config.Config{
		DBHost: "localhost",
		// this will be your fixed port override in docker-compose.override.yml
		DBPort: 13306,
	}

	// when this is true, we are running integration tests in docker, so connect
	// to DB as if we are in the app container here...
	if os.Getenv("GO_TEST_MODE") == "docker" {
		cfg.DBHost = "mysql"
		cfg.DBPort = 3306
	}

    return cfg
}
```

## Running integration tests

The harness provides a few commands to make running integration tests easier.

### `ws go test integration`
This runs your integration tests on your host machine, it will likely be the most frequent integration test command that you use.

>_NOTE: In order to run this command, make sure you have completed an initial `ws install`, so that it can connect to any services that it needs to (e.g. database, Kafka etc.)_

### `ws go test integration <test-name>`
Similar to the above command, this one executes a single test in isolation. It will set the `LOG_LEVEL=debug` env var value so that you can get a more detailed log output and see what is going on.

### `ws go test integration docker`
This runs your integration tests inside the `app` container. Make sure you have completed a `ws install`, or a `ws recompile` if you have made code changes since the install.

>_NOTE: This is the command that is executed as part of the default Jenkins pipeline._

[best practices]: https://guidelines.invi.qa/#/language/go/testing/README?id=integration-tests
[build constraint]: https://golang.org/cmd/go/#hdr-Build_constraints
