# How to add benchmarks to your app

When writing applications with Go, you should make use of the [benchmarking](https://pkg.go.dev/testing#hdr-Benchmarks) that is baked into the language. This will give you confidence that, as you make changes to your code, you are not affecting performance negatively without making a conscious decision that the trade-offs are acceptable.

You can read more about Inviqa's best practices on benchmarking in the [guidelines](https://guidelines.invi.qa/#/language/go/benchmarking).

## Adding benchmarks

The Go harness provides tools to make running benchmarks easier. When adding benchmarks to your application, make sure you use the `benchmarks` build tag, as the commands provided by this harness will only execute benchmarks with that tag. For example:

```go
// +build benchmarks

package foo

// ...
```

>_NOTE: You can see an example of benchmarks in the [sample Go repository]._

## Commands

### `ws go bench compare`

This command provides a comparison of your current branch changes against your stable branch changes using the [`benchstat`] tool. It will run benchmarks on your current branch, before then switching to your stable branch and running benchmarks there too. Each time, it will generate a report file and then compare them at the end to give you the delta comparison. At a high-level, this command will:

1. Check that you have [`benchstat`] installed on your host
1. Check there are no un-committed changes in your current branch
1. Prompt you for the name of your stable branch (e.g. "master")
1. Check that the branch name you have entered is valid
1. Confirm that you are happy for your environment to be destroyed and re-provisioned in order to run the benchmarks
1. Rebuild your environment
1. Run benchmarks on your current branch
1. Switch to your stable branch
1. Rebuild the environment again
1. Run the benchmarks again on your stable branch
1. Switch back to your original branch
1. Run the reports from the two benchmark runs through [`benchstat`] and display the results

#### Example output

The output from this command will help you determine the effect that your changes have had on the performance of your application.

```
name             old time/op  new time/op  delta
InsertReview-12  5.14ms ±12%  1.83ms ± 3%  -64.35%  (p=0.008 n=5+5)
UpdateReview-12  1.94ms ± 5%  1.59ms ± 7%  -18.02%  (p=0.008 n=5+5)
```

>_NOTE: The "old" time is the performance on your stable branch, whereas the "new" time is the branch where you started the `ws go bench compare` command._

### `ws go bench current` (`ws go bench`)

This command will produce a performance profile for your current branch. The output from this command does not provide much value on its own, as it should be compared against a baseline benchmark. This is what the `ws go bench compare` command does for us. However, this command can be useful when you are verifying that your benchmarks complete successfully, or when you do not have any benchmarks on your stable branch yet.

>_NOTE: This command will not affect your environment in any way._

#### Example output

The output from this command gives the raw benchmark numbers from `go test -bench=. ...`. There are multiple rows for each benchmark because the command specifies a `-count` value of 5, meaning that 5 iterations are completed to provide a more accurate delta when running through [`benchstat`].

```
goos: darwin
goarch: amd64
pkg: github.com/inviqa/go-sample/domain
cpu: Intel(R) Core(TM) i7-8750H CPU @ 2.20GHz
BenchmarkFoo-12         1000000000               0.2669 ns/op          0 B/op          0 allocs/op
BenchmarkFoo-12         1000000000               0.2657 ns/op          0 B/op          0 allocs/op
BenchmarkFoo-12         1000000000               0.2674 ns/op          0 B/op          0 allocs/op
BenchmarkFoo-12         1000000000               0.2708 ns/op          0 B/op          0 allocs/op
BenchmarkFoo-12         1000000000               0.2661 ns/op          0 B/op          0 allocs/op
PASS
```

### `ws go bench report`

This is used by `ws go bench compare`, and is not usually called directly. It will run `ws go bench current` and write the output to a report file. These report files are passed to [`benchstat`] to generate the delta output.

[sample Go repository]: https://github.com/inviqa/go-sample
[`benchstat`]: https://pkg.go.dev/golang.org/x/perf/cmd/benchstat
