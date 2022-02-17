# How to use Pact

[Pact] is often used as a tool for contract testing. This guide explains how to use it in your application.

## Prerequisites

You will need a Pact Broker, or a [Pactflow] account for your project. From the broker, you will need:

1. Broker base URL
2. Broker CI token (you should encrypt this using `ws secret encrypt <token>`)

## Enabling Pact

Update your attributes in `workspace.yml` to contain the following:

```yaml
attributes:
  # ...
  pact:
    enabled: true
    app_path: /app/integration/pacts # can be omitted, as this is the default
    broker:
      base_url: https://my-team.pactflow.io/
      token: = decrypt('<encrypted broker token>')
      
  services:
    app:
      # ...
      environment:
        #...
        PACT_BROKER_BASE_URL: = @('pact.broker.base_url')
        PACT_BROKER_TOKEN: = @('pact.broker.token')
```

Now, rebuild your application using `ws rebuild`. This will install the necessary tooling for Pact. Pact verification will also work as part of your Go tests, if you need it. Additionally, the default Jenkins pipeline will take care of publishing Pacts for you.

## Commands

### `ws pact publish <tag> <version>`

Publishes any Pact contracts under the configured `pact.app_path` location. If you are using a Jenkins pipeline, the default harness `Jenkinsfile` will take care of this for you.

[Pact]: https://pact.io/
[Pactflow]: https://pactflow.io/
