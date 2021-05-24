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

Following the Inviqa engineering guidelines' recommendations, the commands provided by this harness make it easy to get a delta comparison of the performance of your new code (feature branch) against your stable branch. When executed, it will prompt you for the name of your stable branch.

### `ws go bench compare`

This will provide a comparison of your current branch changes against your stable branch changes using [`benchstat`]. The command itself will rebuild your local environment twice, to provide a completely clean and consistent state between each run. At a high-level, this command will:

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

This will help you determine what effect your changes have had on the performance of your application. The "old" time is the performance on your stable branch, whereas the "new" time is the branch where you started the `ws go bench compare` command.

```
name             old time/op  new time/op  delta
InsertReview-12  5.14ms ±12%  1.83ms ± 3%  -64.35%  (p=0.008 n=5+5)
UpdateReview-12  1.94ms ± 5%  1.59ms ± 7%  -18.02%  (p=0.008 n=5+5)
```

### `ws go bench current` (`ws go bench`)

This will produce a performance profile for your current branch using a standard `go test -bench=...` call. The numbers themselves do not provide much value, as they should be compared against a baseline, which is what `ws go bench compare` does for us. However, it can be useful to run this command when you are verifying that your benchmarks complete successfully, or when you do not have any benchmarks on your stable branch yet.

This command will not touch your environment in any way, so it is especially useful in that respect.

#### Example output

```
goos: darwin
goarch: amd64
pkg: github.com/inviqa/go-sample/domain/subdomain
cpu: Intel(R) Core(TM) i7-8750H CPU @ 2.20GHz
BenchmarkBar-12         1000000000               0.2577 ns/op
```

### `ws go bench report`

This is used by `ws go bench compare`, and should not usually be called directly. It will run `ws go bench current` and write the output to a report file. These report files are passed to [`benchstat`] to generate the delta output.

[sample Go repository]: https://github.com/inviqa/go-sample
[`benchstat`]: https://pkg.go.dev/golang.org/x/perf/cmd/benchstat
