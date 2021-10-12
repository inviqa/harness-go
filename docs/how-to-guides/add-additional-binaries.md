# How to add additional binaries to your app

The Go harness will always produce a main binary for your application. This is your `main.go` file, usually in the root of your project directory. However, sometimes you may want to produce more than one binary on the final docker image. A good example of when you would want to do this is creating commands that can be executed on the container. A common Go pattern from the community is to place commands inside a `cmd` directory inside a `main.go` file, such as `cmd/foo/main.go`. Having these additional binaries compiled and copied into the root of the final production Docker image allows you to execute them fairly intuitively, for example:

```bash
$ docker-compose exec app cmd-foo --dry-run
```

>_NOTE: When the binaries are built and copied into place on the Docker image, slashes are replaced with `-`, so `cmd/foo` is executed as `cmd-foo`._

## Defining your additional binaries

The harness has an `app.additional_binaries` array attribute, that can be populated with as many additional binaries as you like. These will be compiled during the Docker build phase and copied into the final image. The location of the copied binary is the directory path of the binary that you defined, with slashes replaced with `-`.

### Example

With configuration of:
```yaml
attributes:
  app:
    additional_binaries:
      - "cmd/cleanup"
      - "cmd/sync"
```

Your source code for the `cleanup` command would look something like this:

`cmd/cleanup/main.go`:
```go
package main

import "fmt"

func main() {
	fmt.Println("Running cleanup...")
	// ...
	fmt.Println("Done.")
}
```

Now, when you run `ws install` or next rebuild your `app` container, two binaries will be available on the built Docker image, that will be under the `$PATH`: `cmd-cleanup` and `cmd-sync`. These could be executed locally under `docker-compose` as follows:

```bash
$ docker-compose exec app cmd-cleanup
$ docker-compose exec app cmd-sync
```

## Go modules

Even though your additional binaries have their own `main.go`, they will use the same `go.mod|sum` files as the main application, so you should not need to specify separate `go.mod|sum` files in the directories of your additional binaries.
