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
    enabled: false
    app_path: /app/integration/pacts
    broker:
      base_url: https://my-team.pactflow.io/
      token: = decrypt('<encrypted broker token>')
```

Now, rebuild your application using `ws rebuild`. This will install the necessary tooling for Pact. Pact verification will also work as part of your Go tests, if you need it. Additionally, the default Jenkins pipeline will take care of publishing Pacts for you.

[Pact]: https://pact.io/
[Pactflow]: https://pactflow.io/
