# Changelog

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

## [0.4.0](https://github.com/inviqa/harness-go/tree/0.4.0) (2020-04-22)

[Full Changelog](https://github.com/inviqa/harness-go/compare/0.3.0...0.4.0)

**Merged pull requests:**

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
