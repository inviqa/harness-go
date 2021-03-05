# Changelog

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

- Add workspace command for consistency with PHP harness' "ws console" [\#82](https://github.com/inviqa/harness-go/issues/82)
- Make it easier to run `go install \<module\>` in the Docker image [\#69](https://github.com/inviqa/harness-go/issues/69)
- Add ineffassign to the pipeline checks [\#66](https://github.com/inviqa/harness-go/issues/66)
- Allow the use of goimports as an alternative to gofmt, if preferred [\#62](https://github.com/inviqa/harness-go/issues/62)
- Add recompile command [\#31](https://github.com/inviqa/harness-go/issues/31)
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
- Update go command naming convention [\#90](https://github.com/inviqa/harness-go/pull/90) ([jbarton123](https://github.com/jbarton123))
- Add command to run unit tests with coverage [\#88](https://github.com/inviqa/harness-go/pull/88) ([jbarton123](https://github.com/jbarton123))
- Move module\_name attribute -\> go.module\_name [\#87](https://github.com/inviqa/harness-go/pull/87) ([jameshalsall](https://github.com/jameshalsall))
- Correct the approach to executing project shell scripts in image build [\#75](https://github.com/inviqa/harness-go/pull/75) ([jameshalsall](https://github.com/jameshalsall))
- Add attribute to allow installing arbitrary apt packages [\#74](https://github.com/inviqa/harness-go/pull/74) ([jameshalsall](https://github.com/jameshalsall))
- Start writing docs [\#73](https://github.com/inviqa/harness-go/pull/73) ([jameshalsall](https://github.com/jameshalsall))
- Add attribute to allow running arbitrary steps before go mod download [\#72](https://github.com/inviqa/harness-go/pull/72) ([jameshalsall](https://github.com/jameshalsall))
- Add option for running steps after go mod download [\#71](https://github.com/inviqa/harness-go/pull/71) ([jameshalsall](https://github.com/jameshalsall))

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

## [0.4.0](https://github.com/inviqa/harness-go/tree/0.4.0) (2020-04-22)

[Full Changelog](https://github.com/inviqa/harness-go/compare/0.3.0...0.4.0)

**Merged pull requests:**

- Replace prometheus annotations with operator podmonitor [\#29](https://github.com/inviqa/harness-go/pull/29) ([andytson-inviqa](https://github.com/andytson-inviqa))
- MISC Do not hardcode a version number in readme [\#28](https://github.com/inviqa/harness-go/pull/28) ([jameshalsall](https://github.com/jameshalsall))
- Allow overriding of istio virtualservice gateway with template support [\#24](https://github.com/inviqa/harness-go/pull/24) ([andytson-inviqa](https://github.com/andytson-inviqa))

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

- Add missing "." from directory [\#18](https://github.com/inviqa/harness-go/pull/18) ([richardmiller](https://github.com/richardmiller))
- Test harness and allow projects not using go modules [\#17](https://github.com/inviqa/harness-go/pull/17) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Support defining the k8s service name and protocol [\#16](https://github.com/inviqa/harness-go/pull/16) ([andytson-inviqa](https://github.com/andytson-inviqa))
- HOTFIX: remove type from ingress templates [\#13](https://github.com/inviqa/harness-go/pull/13) ([sgrichards](https://github.com/sgrichards))
- Add a way to ensure external networks exist prior to enabling [\#12](https://github.com/inviqa/harness-go/pull/12) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Reverse the log level configuration change as it's already configurable [\#11](https://github.com/inviqa/harness-go/pull/11) ([andytson-inviqa](https://github.com/andytson-inviqa))
- Add missing pipe to rebuild command definition [\#10](https://github.com/inviqa/harness-go/pull/10) ([richardmiller](https://github.com/richardmiller))
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
