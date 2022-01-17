# Changelog

## [0.15.0](https://github.com/inviqa/harness-go/tree/0.15.0) (2022-01-17)

[Full Changelog](https://github.com/inviqa/harness-go/compare/0.14.0...0.15.0)

**Implemented enhancements:**
* Add horizontal pod autoscaler and pod disruption budgets by @andytson-inviqa in https://github.com/inviqa/harness-go/pull/206
* Switch and deprecate app.services to services.*.enabled by @andytson-inviqa in https://github.com/inviqa/harness-go/pull/205


## [0.14.0](https://github.com/inviqa/harness-go/tree/0.14.0) (2021-12-15)

[Full Changelog](https://github.com/inviqa/harness-go/compare/0.13.1...0.14.0)

**Implemented enhancements:**

- Add support for installing Pact tooling [\#197](https://github.com/inviqa/harness-go/issues/197)
- Create a test database in MySQL / Postgres for integration tests [\#188](https://github.com/inviqa/harness-go/issues/188)
- Add option to use a volume mount between app container and host [\#156](https://github.com/inviqa/harness-go/issues/156)

**Fixed bugs:**

- Set buildkit env vars for ws recompile [\#201](https://github.com/inviqa/harness-go/pull/201) ([jameshalsall](https://github.com/jameshalsall))

**Merged pull requests:**

- Automatically create a dedicated test database for MySQL [\#202](https://github.com/inviqa/harness-go/pull/202) ([jameshalsall](https://github.com/jameshalsall))
- Add pact support [\#200](https://github.com/inviqa/harness-go/pull/200) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Automatically create a dedicated test database for Postgres [\#199](https://github.com/inviqa/harness-go/pull/199) ([jameshalsall](https://github.com/jameshalsall))
- Use a volume mount by default to run everything in docker [\#196](https://github.com/inviqa/harness-go/pull/196) ([jameshalsall](https://github.com/jameshalsall))

## [0.13.1](https://github.com/inviqa/harness-go/tree/0.13.1) (2021-12-01)

[Full Changelog](https://github.com/inviqa/harness-go/compare/0.13.0...0.13.1)

**Fixed bugs:**

- Fix the github token inclusion [\#198](https://github.com/inviqa/harness-go/pull/198) ([dantleech](https://github.com/dantleech))

## [0.13.0](https://github.com/inviqa/harness-go/tree/0.13.0) (2021-11-30)

[Full Changelog](https://github.com/inviqa/harness-go/compare/0.12.1...0.13.0)

**Implemented enhancements:**

- Consider switching to bitnami/kafka and bitnami/zookeeper images [\#171](https://github.com/inviqa/harness-go/issues/171)
- Make it easy to use https://github.com/inviqa/kafka-outbox-relay in local stack [\#167](https://github.com/inviqa/harness-go/issues/167)
- Add option to copy additional arbitrary files to production image [\#175](https://github.com/inviqa/harness-go/pull/175) ([jameshalsall](https://github.com/jameshalsall))
- Switch Kafka and Zookeeper images to bitnami variants [\#173](https://github.com/inviqa/harness-go/pull/173) ([jameshalsall](https://github.com/jameshalsall))

**Fixed bugs:**

- ws go fmt check passes when there are syntax errors [\#133](https://github.com/inviqa/harness-go/issues/133)
- Provide GOOS/GOARCH by default [\#192](https://github.com/inviqa/harness-go/pull/192) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Bump docker-compose.yml version to 3.7 [\#177](https://github.com/inviqa/harness-go/pull/177) ([jameshalsall](https://github.com/jameshalsall))
- Wait longer in CI for containers to start before verifying [\#174](https://github.com/inviqa/harness-go/pull/174) ([jameshalsall](https://github.com/jameshalsall))
- Correctly detect CI env in 'external-images pull' command [\#172](https://github.com/inviqa/harness-go/pull/172) ([jameshalsall](https://github.com/jameshalsall))

**Closed issues:**

- Add support for gRPC health probe [\#168](https://github.com/inviqa/harness-go/issues/168)

**Merged pull requests:**

- Move Kafka and Zookeeper config to services attribute [\#191](https://github.com/inviqa/harness-go/pull/191) ([jameshalsall](https://github.com/jameshalsall))
- Make it easier to use inviqa/kafka-outbox-relay [\#187](https://github.com/inviqa/harness-go/pull/187) ([jameshalsall](https://github.com/jameshalsall))
- Use workspace name and short git ref for namespace attribute [\#185](https://github.com/inviqa/harness-go/pull/185) ([jameshalsall](https://github.com/jameshalsall))
- Use mysql/mysql-server image for arm64 architecture [\#184](https://github.com/inviqa/harness-go/pull/184) ([jameshalsall](https://github.com/jameshalsall))
- Simplify Jenkinsfile for docker buildkit usage [\#181](https://github.com/inviqa/harness-go/pull/181) ([jameshalsall](https://github.com/jameshalsall))
- Hide multiplatform builds behind an experimental attribute [\#178](https://github.com/inviqa/harness-go/pull/178) ([jameshalsall](https://github.com/jameshalsall))
- Support TLS in the harness [\#176](https://github.com/inviqa/harness-go/pull/176) ([dantleech](https://github.com/dantleech))
- Make it easier to do cross-platform builds in pipelines [\#170](https://github.com/inviqa/harness-go/pull/170) ([jameshalsall](https://github.com/jameshalsall))

## [0.12.1](https://github.com/inviqa/harness-go/tree/0.12.1) (2021-10-28)

[Full Changelog](https://github.com/inviqa/harness-go/compare/0.12.0...0.12.1)

**Fixed bugs:**

- Do not specify GOOS or GOARCH during build [\#169](https://github.com/inviqa/harness-go/pull/169) ([jameshalsall](https://github.com/jameshalsall))

## [0.12.0](https://github.com/inviqa/harness-go/tree/0.12.0) (2021-10-13)

[Full Changelog](https://github.com/inviqa/harness-go/compare/0.11.0...0.12.0)

**Implemented enhancements:**

- Add Go 1.17 support [\#159](https://github.com/inviqa/harness-go/issues/159)
- Make it easier to add multiple binaries in development + production image [\#151](https://github.com/inviqa/harness-go/issues/151)
- Make it possible to mount app volume [\#161](https://github.com/inviqa/harness-go/pull/161) ([jameshalsall](https://github.com/jameshalsall))

**Closed issues:**

- Missing timezone data in production image [\#150](https://github.com/inviqa/harness-go/issues/150)

**Merged pull requests:**

- Add option to bundle /usr/share/zoneinfo in prod image [\#164](https://github.com/inviqa/harness-go/pull/164) ([jameshalsall](https://github.com/jameshalsall))
- Add Go 1.17 to the CI pipeline [\#163](https://github.com/inviqa/harness-go/pull/163) ([jameshalsall](https://github.com/jameshalsall))
- Add support for additional binaries [\#162](https://github.com/inviqa/harness-go/pull/162) ([jameshalsall](https://github.com/jameshalsall))
- Use recreate stategy for MySQL and Postgres Deployment [\#160](https://github.com/inviqa/harness-go/pull/160) ([kierenevans](https://github.com/kierenevans))

## [0.11.0](https://github.com/inviqa/harness-go/tree/0.11.0) (2021-09-29)

[Full Changelog](https://github.com/inviqa/harness-go/compare/0.10.5-alpha...0.11.0)

**Implemented enhancements:**

- Add support for external image registries [\#155](https://github.com/inviqa/harness-go/pull/155) ([jameshalsall](https://github.com/jameshalsall))

**Fixed bugs:**

- Avoid leaking docker passwords in CI logs [\#154](https://github.com/inviqa/harness-go/pull/154) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Fix missing imagePullSecrets in jobs and cronjobs [\#152](https://github.com/inviqa/harness-go/pull/152) ([andytson-inviqa](https://github.com/andytson-inviqa))

**Merged pull requests:**

- Cleanup built docker images in Jenkins [\#153](https://github.com/inviqa/harness-go/pull/153) ([kierenevans](https://github.com/kierenevans))
- Fix benchmark report and vet commands [\#149](https://github.com/inviqa/harness-go/pull/149) ([hgajjar](https://github.com/hgajjar))
- Switch changelog generator docker image [\#148](https://github.com/inviqa/harness-go/pull/148) ([kierenevans](https://github.com/kierenevans))
- Fix for Values reference [\#147](https://github.com/inviqa/harness-go/pull/147) ([g-foster2](https://github.com/g-foster2))

## [0.10.5-alpha](https://github.com/inviqa/harness-go/tree/0.10.5-alpha) (2021-08-11)

[Full Changelog](https://github.com/inviqa/harness-go/compare/0.10.4...0.10.5-alpha)

## [0.10.4](https://github.com/inviqa/harness-go/tree/0.10.4) (2021-07-30)

[Full Changelog](https://github.com/inviqa/harness-go/compare/0.10.3...0.10.4)

**Implemented enhancements:**

- Use consistent pod volume name patterns for postgres [\#144](https://github.com/inviqa/harness-go/pull/144) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Add support for Jobs, CronJobs and memory limits [\#139](https://github.com/inviqa/harness-go/pull/139) ([andytson-inviqa](https://github.com/andytson-inviqa))

**Fixed bugs:**

- Ensure benchmarks run in isolation [\#146](https://github.com/inviqa/harness-go/pull/146) ([jameshalsall](https://github.com/jameshalsall))
- Fix remaining enableServiceLinks [\#145](https://github.com/inviqa/harness-go/pull/145) ([dantleech](https://github.com/dantleech))
- Fix volume mount name key [\#143](https://github.com/inviqa/harness-go/pull/143) ([dantleech](https://github.com/dantleech))
- Quote sub-shell output in 'ws go docker fmt check' [\#141](https://github.com/inviqa/harness-go/pull/141) ([jameshalsall](https://github.com/jameshalsall))
- Fix location of enableServiceLinks [\#140](https://github.com/inviqa/harness-go/pull/140) ([dantleech](https://github.com/dantleech))

## [0.10.3](https://github.com/inviqa/harness-go/tree/0.10.3) (2021-06-09)

[Full Changelog](https://github.com/inviqa/harness-go/compare/0.10.2...0.10.3)

**Fixed bugs:**

- Pass environment variables to all host integration test commands [\#137](https://github.com/inviqa/harness-go/pull/137) ([jameshalsall](https://github.com/jameshalsall))

## [0.10.2](https://github.com/inviqa/harness-go/tree/0.10.2) (2021-06-09)

[Full Changelog](https://github.com/inviqa/harness-go/compare/0.10.1...0.10.2)

**Fixed bugs:**

- Use php escapeshellarg for escaping data inserted into bash scripts [\#136](https://github.com/inviqa/harness-go/pull/136) ([andytson-inviqa](https://github.com/andytson-inviqa))

## [0.10.1](https://github.com/inviqa/harness-go/tree/0.10.1) (2021-06-09)

[Full Changelog](https://github.com/inviqa/harness-go/compare/0.10.0...0.10.1)

**Fixed bugs:**

- Quote environment variables in integration/run.sh [\#135](https://github.com/inviqa/harness-go/pull/135) ([jameshalsall](https://github.com/jameshalsall))

## [0.10.0](https://github.com/inviqa/harness-go/tree/0.10.0) (2021-06-09)

[Full Changelog](https://github.com/inviqa/harness-go/compare/0.9.0...0.10.0)

**Implemented enhancements:**

- Add commands to the harness for running integration test suites [\#126](https://github.com/inviqa/harness-go/issues/126)
- Add integration tests to the app skeleton [\#128](https://github.com/inviqa/harness-go/issues/128)
- Define kafka.host in the harness [\#127](https://github.com/inviqa/harness-go/issues/127)

**Merged pull requests:**

- Add integration test support [\#130](https://github.com/inviqa/harness-go/pull/130) ([jameshalsall](https://github.com/jameshalsall))
- Set kafka.host automatically [\#129](https://github.com/inviqa/harness-go/pull/129) ([jameshalsall](https://github.com/jameshalsall))

## [0.9.0](https://github.com/inviqa/harness-go/tree/0.9.0) (2021-05-25)

[Full Changelog](https://github.com/inviqa/harness-go/compare/0.8.0...0.9.0)

**Implemented enhancements:**

- Add gosec to the pipeline checks [\#112](https://github.com/inviqa/harness-go/issues/112)
- Consider bringing dev tools into skeleton project as module dependencies. [\#85](https://github.com/inviqa/harness-go/issues/85)
- Make it easy to add kafka to your local stack [\#114](https://github.com/inviqa/harness-go/issues/114)
- Lock the go.version attribute immediately after project creation [\#111](https://github.com/inviqa/harness-go/issues/111)
- Run CI jobs for MySQL and Postgres based projects [\#113](https://github.com/inviqa/harness-go/pull/113) ([jameshalsall](https://github.com/jameshalsall))

**Closed issues:**

- Add benchmarking tools [\#30](https://github.com/inviqa/harness-go/issues/30)

**Merged pull requests:**

- Lock go.version attribute on initial install [\#123](https://github.com/inviqa/harness-go/pull/123) ([jameshalsall](https://github.com/jameshalsall))
- Improve the benchmark docs [\#122](https://github.com/inviqa/harness-go/pull/122) ([jameshalsall](https://github.com/jameshalsall))
- Add benchmarking tools, commands and documentation [\#120](https://github.com/inviqa/harness-go/pull/120) ([jameshalsall](https://github.com/jameshalsall))
- Kafka support [\#119](https://github.com/inviqa/harness-go/pull/119) ([jameshalsall](https://github.com/jameshalsall))
- Add gosec to the Jenkins pipeline [\#117](https://github.com/inviqa/harness-go/pull/117) ([jameshalsall](https://github.com/jameshalsall))
- Remove support for Go 1.15 [\#116](https://github.com/inviqa/harness-go/pull/116) ([jameshalsall](https://github.com/jameshalsall))

## [0.8.0](https://github.com/inviqa/harness-go/tree/0.8.0) (2021-03-05)

[Full Changelog](https://github.com/inviqa/harness-go/compare/0.7.1...0.8.0)

**Implemented enhancements:**

- Add host versions of the `ws go docker ...` commands [\#107](https://github.com/inviqa/harness-go/issues/107)
- Make it easier to do a prod build and use it in your local docker-compose stack [\#97](https://github.com/inviqa/harness-go/issues/97)
- Add ws go fmt to format code in line with formatter [\#108](https://github.com/inviqa/harness-go/pull/108) ([jameshalsall](https://github.com/jameshalsall))
- Improve go mod init process [\#105](https://github.com/inviqa/harness-go/pull/105) ([jameshalsall](https://github.com/jameshalsall))
- Install dev tools in modules:before step [\#104](https://github.com/inviqa/harness-go/pull/104) ([jameshalsall](https://github.com/jameshalsall))
- Bump default Go version to 1.16 [\#103](https://github.com/inviqa/harness-go/pull/103) ([jameshalsall](https://github.com/jameshalsall))
- Output diff of go.mod/sum when mod check fails [\#102](https://github.com/inviqa/harness-go/pull/102) ([jameshalsall](https://github.com/jameshalsall))
- Add 'ws use prod' command to switch to production build [\#101](https://github.com/inviqa/harness-go/pull/101) ([jameshalsall](https://github.com/jameshalsall))

**Fixed bugs:**

- The go fmt check step in the pipeline does not return a non-zero exit code [\#106](https://github.com/inviqa/harness-go/issues/106)

**Closed issues:**

- Make Go 1.16 the default version after it has been assessed [\#100](https://github.com/inviqa/harness-go/issues/100)

## [0.7.1](https://github.com/inviqa/harness-go/tree/0.7.1) (2021-02-19)

[Full Changelog](https://github.com/inviqa/harness-go/compare/0.7.0...0.7.1)

**Fixed bugs:**

- In Go 1.16 the "go install" command needs a module version [\#96](https://github.com/inviqa/harness-go/issues/96)

**Merged pull requests:**

- Support Go 1.16 go install and module setup [\#98](https://github.com/inviqa/harness-go/pull/98) ([jameshalsall](https://github.com/jameshalsall))

## [0.7.0](https://github.com/inviqa/harness-go/tree/0.7.0) (2021-02-15)

[Full Changelog](https://github.com/inviqa/harness-go/compare/0.6.0...0.7.0)

**Implemented enhancements:**

- Add recompile command [\#31](https://github.com/inviqa/harness-go/issues/31)
- Add workspace command for consistency with PHP harness' "ws console" [\#82](https://github.com/inviqa/harness-go/issues/82)
- Make it easier to run `go install <module>` in the Docker image [\#69](https://github.com/inviqa/harness-go/issues/69)
- Add ineffassign to the pipeline checks [\#66](https://github.com/inviqa/harness-go/issues/66)
- Allow the use of goimports as an alternative to gofmt, if preferred [\#62](https://github.com/inviqa/harness-go/issues/62)
- Add "ws app" command for quick access to app container [\#94](https://github.com/inviqa/harness-go/pull/94) ([jameshalsall](https://github.com/jameshalsall))
- Add ineffassign to pipeline checks [\#84](https://github.com/inviqa/harness-go/pull/84) ([jameshalsall](https://github.com/jameshalsall))
- Add gocyclo [\#79](https://github.com/inviqa/harness-go/pull/79) ([jameshalsall](https://github.com/jameshalsall))
- Add recompile command [\#78](https://github.com/inviqa/harness-go/pull/78) ([jameshalsall](https://github.com/jameshalsall))
- Remove Apache license in README [\#77](https://github.com/inviqa/harness-go/pull/77) ([jameshalsall](https://github.com/jameshalsall))
- Add go.formatter option for changing formatter [\#76](https://github.com/inviqa/harness-go/pull/76) ([jameshalsall](https://github.com/jameshalsall))

**Fixed bugs:**

- Move the Jenkinsfile.twig to the overlay directory [\#86](https://github.com/inviqa/harness-go/issues/86)
- Apply overlay after ws install [\#93](https://github.com/inviqa/harness-go/pull/93) ([jameshalsall](https://github.com/jameshalsall))

**Closed issues:**

- Standardise `ws go` command naming to reflect where they are executed [\#89](https://github.com/inviqa/harness-go/issues/89)
- Write a "how to" guide on how to add a database to your project using the harness [\#83](https://github.com/inviqa/harness-go/issues/83)
- Write documentation on how to configure the harness for your project [\#70](https://github.com/inviqa/harness-go/issues/70)
- Add gocyclo to pipeline checks [\#65](https://github.com/inviqa/harness-go/issues/65)
- Do not remove the apt lists until after image-dependencies.sh is executed [\#35](https://github.com/inviqa/harness-go/issues/35)

**Merged pull requests:**

- Add how-to guide on adding a database to a project [\#95](https://github.com/inviqa/harness-go/pull/95) ([jameshalsall](https://github.com/jameshalsall))
- Add command to run unit tests with coverage [\#88](https://github.com/inviqa/harness-go/pull/88) ([jbarton123](https://github.com/jbarton123))
- Move module\_name attribute -\> go.module\_name [\#87](https://github.com/inviqa/harness-go/pull/87) ([jameshalsall](https://github.com/jameshalsall))
- Correct the approach to executing project shell scripts in image build [\#75](https://github.com/inviqa/harness-go/pull/75) ([jameshalsall](https://github.com/jameshalsall))
- Add attribute to allow installing arbitrary apt packages [\#74](https://github.com/inviqa/harness-go/pull/74) ([jameshalsall](https://github.com/jameshalsall))
- Start writing docs [\#73](https://github.com/inviqa/harness-go/pull/73) ([jameshalsall](https://github.com/jameshalsall))
- Add attribute to allow running arbitrary steps before go mod download [\#72](https://github.com/inviqa/harness-go/pull/72) ([jameshalsall](https://github.com/jameshalsall))
- Add option for running steps after go mod download [\#71](https://github.com/inviqa/harness-go/pull/71) ([jameshalsall](https://github.com/jameshalsall))
- Update go command naming convention [\#90](https://github.com/inviqa/harness-go/pull/90) ([jbarton123](https://github.com/jbarton123))

## [0.6.0](https://github.com/inviqa/harness-go/tree/0.6.0) (2021-02-01)

[Full Changelog](https://github.com/inviqa/harness-go/compare/0.5.1...0.6.0)

**Implemented enhancements:**

- Update external-images CI pull to skip pulling images locally existing [\#67](https://github.com/inviqa/harness-go/pull/67) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Use different namespaces for pipeline for parallel builds [\#64](https://github.com/inviqa/harness-go/pull/64) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Allow specifying cert, namespace and scope for sealed-secrets [\#63](https://github.com/inviqa/harness-go/pull/63) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Add alternative local/http sealed-secret seal certificate [\#59](https://github.com/inviqa/harness-go/pull/59) ([andytson-inviqa](https://github.com/andytson-inviqa))

**Fixed bugs:**

- Fix bug in processing non-interactive sealed-secret input [\#61](https://github.com/inviqa/harness-go/pull/61) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Fix probe spec [\#60](https://github.com/inviqa/harness-go/pull/60) ([andytson-inviqa](https://github.com/andytson-inviqa))

## [0.5.1](https://github.com/inviqa/harness-go/tree/0.5.1) (2020-09-03)

[Full Changelog](https://github.com/inviqa/harness-go/compare/0.5.0...0.5.1)

**Merged pull requests:**

- Defer cancellation of HTTP shutdown context [\#57](https://github.com/inviqa/harness-go/pull/57) ([jameshalsall](https://github.com/jameshalsall))
- Set content-type in example HTTP handler [\#56](https://github.com/inviqa/harness-go/pull/56) ([jameshalsall](https://github.com/jameshalsall))
- Switch main.go to use tabs [\#55](https://github.com/inviqa/harness-go/pull/55) ([jameshalsall](https://github.com/jameshalsall))
- Set indent\_style to tab for Go files [\#54](https://github.com/inviqa/harness-go/pull/54) ([jameshalsall](https://github.com/jameshalsall))

## [0.5.0](https://github.com/inviqa/harness-go/tree/0.5.0) (2020-09-01)

[Full Changelog](https://github.com/inviqa/harness-go/compare/0.4.0...0.5.0)

**Closed issues:**

- Update and bundle certificates if enabled [\#34](https://github.com/inviqa/harness-go/issues/34)
- Make DB service tags configurable, with a default of "latest" [\#32](https://github.com/inviqa/harness-go/issues/32)

**Merged pull requests:**

- Add an option to bundle certs on the production image [\#51](https://github.com/inviqa/harness-go/pull/51) ([jameshalsall](https://github.com/jameshalsall))
- Add a changelog, and some basic release process notes [\#49](https://github.com/inviqa/harness-go/pull/49) ([jameshalsall](https://github.com/jameshalsall))
- Gracefully shut down the HTTP server on SIGINT, SIGTERM [\#48](https://github.com/inviqa/harness-go/pull/48) ([jameshalsall](https://github.com/jameshalsall))
- Fix trailing newlines being added into secrets before encryption [\#47](https://github.com/inviqa/harness-go/pull/47) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Pull external images in parallel before building service images [\#46](https://github.com/inviqa/harness-go/pull/46) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Use more context related docker attribute paths [\#44](https://github.com/inviqa/harness-go/pull/44) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Bump default Go version to 1.14 [\#43](https://github.com/inviqa/harness-go/pull/43) ([jameshalsall](https://github.com/jameshalsall))
- Extract go env vars to be configurable [\#42](https://github.com/inviqa/harness-go/pull/42) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Abstract out git config for adding auth from twig [\#41](https://github.com/inviqa/harness-go/pull/41) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Add ability to define env vars from k8s secrets [\#40](https://github.com/inviqa/harness-go/pull/40) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Support image pull configuration using sealed-secrets [\#39](https://github.com/inviqa/harness-go/pull/39) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Support helm v3 cli by avoiding helm init [\#38](https://github.com/inviqa/harness-go/pull/38) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Deduce the docker registry\_url from repository [\#37](https://github.com/inviqa/harness-go/pull/37) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Disable k8s service links to reduce unused environment variables [\#36](https://github.com/inviqa/harness-go/pull/36) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Make versions for DB image attributes that can be easily overrided [\#33](https://github.com/inviqa/harness-go/pull/33) ([jameshalsall](https://github.com/jameshalsall))
- Replace prometheus annotations with operator podmonitor [\#29](https://github.com/inviqa/harness-go/pull/29) ([andytson-inviqa](https://github.com/andytson-inviqa))
- MISC Do not hardcode a version number in readme [\#28](https://github.com/inviqa/harness-go/pull/28) ([jameshalsall](https://github.com/jameshalsall))
- Allow overriding of istio virtualservice gateway with template support [\#24](https://github.com/inviqa/harness-go/pull/24) ([andytson-inviqa](https://github.com/andytson-inviqa))

## [0.4.0](https://github.com/inviqa/harness-go/tree/0.4.0) (2020-04-22)

[Full Changelog](https://github.com/inviqa/harness-go/compare/0.3.0...0.4.0)

## [0.3.0](https://github.com/inviqa/harness-go/tree/0.3.0) (2020-02-24)

[Full Changelog](https://github.com/inviqa/harness-go/compare/0.2.2...0.3.0)

**Merged pull requests:**

- Rename helm lint to helm kubeval [\#27](https://github.com/inviqa/harness-go/pull/27) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Make liveness/readiness probes configurable [\#26](https://github.com/inviqa/harness-go/pull/26) ([jameshalsall](https://github.com/jameshalsall))
- Add kubeval for linting the rendered helm templates against schema [\#25](https://github.com/inviqa/harness-go/pull/25) ([andytson-inviqa](https://github.com/andytson-inviqa))

## [0.2.2](https://github.com/inviqa/harness-go/tree/0.2.2) (2020-02-20)

[Full Changelog](https://github.com/inviqa/harness-go/compare/0.2.1...0.2.2)

**Merged pull requests:**

- Properly quote the prometheus.io/port annotation [\#23](https://github.com/inviqa/harness-go/pull/23) ([jameshalsall](https://github.com/jameshalsall))

## [0.2.1](https://github.com/inviqa/harness-go/tree/0.2.1) (2020-02-19)

[Full Changelog](https://github.com/inviqa/harness-go/compare/0.2.0...0.2.1)

**Merged pull requests:**

- Format Go code with gofmt [\#22](https://github.com/inviqa/harness-go/pull/22) ([jameshalsall](https://github.com/jameshalsall))
- Update README.md for 0.2.0 harness [\#21](https://github.com/inviqa/harness-go/pull/21) ([jameshalsall](https://github.com/jameshalsall))

## [0.2.0](https://github.com/inviqa/harness-go/tree/0.2.0) (2020-02-19)

[Full Changelog](https://github.com/inviqa/harness-go/compare/0.1.1...0.2.0)

**Merged pull requests:**

- Do not override existing project files on ws install [\#20](https://github.com/inviqa/harness-go/pull/20) ([jameshalsall](https://github.com/jameshalsall))
- Add basic prometheus instrumentation [\#19](https://github.com/inviqa/harness-go/pull/19) ([jameshalsall](https://github.com/jameshalsall))

## [0.1.1](https://github.com/inviqa/harness-go/tree/0.1.1) (2020-01-03)

[Full Changelog](https://github.com/inviqa/harness-go/compare/0.1.0...0.1.1)

**Merged pull requests:**

- Add missing "." from directory [\#18](https://github.com/inviqa/harness-go/pull/18) ([richardmiller-zz](https://github.com/richardmiller-zz))
- Test harness and allow projects not using go modules [\#17](https://github.com/inviqa/harness-go/pull/17) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Support defining the k8s service name and protocol [\#16](https://github.com/inviqa/harness-go/pull/16) ([andytson-inviqa](https://github.com/andytson-inviqa))
- HOTFIX: remove type from ingress templates [\#13](https://github.com/inviqa/harness-go/pull/13) ([sgrichards](https://github.com/sgrichards))
- Add a way to ensure external networks exist prior to enabling [\#12](https://github.com/inviqa/harness-go/pull/12) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Reverse the log level configuration change as it's already configurable [\#11](https://github.com/inviqa/harness-go/pull/11) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Add missing pipe to rebuild command definition [\#10](https://github.com/inviqa/harness-go/pull/10) ([richardmiller-zz](https://github.com/richardmiller-zz))
- Make LOG\_LEVEL configurable, and vary by local/pipeline [\#8](https://github.com/inviqa/harness-go/pull/8) ([jameshalsall](https://github.com/jameshalsall))
- BUG Fix helm persistence values [\#7](https://github.com/inviqa/harness-go/pull/7) ([jameshalsall](https://github.com/jameshalsall))
- Add build-prod step for building production image [\#6](https://github.com/inviqa/harness-go/pull/6) ([jameshalsall](https://github.com/jameshalsall))
- Run check on go mod tidy to make sure deps are up-to-date [\#5](https://github.com/inviqa/harness-go/pull/5) ([jameshalsall](https://github.com/jameshalsall))
- Add a script that can add build dependencies to image [\#4](https://github.com/inviqa/harness-go/pull/4) ([jameshalsall](https://github.com/jameshalsall))
- Allow configuring ingress type, protocol, and disabling the ingress [\#3](https://github.com/inviqa/harness-go/pull/3) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Add support for mysql/postgres database \(latter default\) [\#2](https://github.com/inviqa/harness-go/pull/2) ([andytson-inviqa](https://github.com/andytson-inviqa))

## [0.1.0](https://github.com/inviqa/harness-go/tree/0.1.0) (2019-10-29)

[Full Changelog](https://github.com/inviqa/harness-go/compare/fa7be42639e3a9b29a96736d9a64b37b5bba4027...0.1.0)

**Merged pull requests:**

- Add a configurable tag prefix to docker tags [\#1](https://github.com/inviqa/harness-go/pull/1) ([andytson-inviqa](https://github.com/andytson-inviqa))



\* *This Changelog was automatically generated by [github_changelog_generator](https://github.com/github-changelog-generator/github-changelog-generator)*
