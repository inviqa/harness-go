# How to add [Kafka Outbox Relay]

You may want to use the [Kafka Outbox Relay] as part of your local development stack, which will be used to provision the outbox table and allow you to write integration tests that verify messages are produced correctly. This guide explains how.

>_NOTE: You do not need to provision Kafka as part of your local stack, as the [Kafka Outbox Relay] does not poll the database for events in a local environment. It only exists to manage the database schema and allow you to test your application. However, you will **[need a database]** as it connects to this on startup._

## Pre-requisites

You will need a machine user with access to the [quay.io] image repository for the outbox relay. You should have one created for your project.

## Adding the relay

In order to add the outbox relay, you need to specify a few attributes in your `workspace.yml`:

1. Add the outbox relay to the `app.services` attribute:
   ```yaml
   attributes:
     app:
       services: [kafka-outbox-relay]
   ```
2. Make sure you have a `database.platform` attribute set relevant for your database server:
   ```yaml
   attributes:
     database:
       platform: "postgres" # can also be "mysql"
   ```
4. Set the `services.kafka-outbox-relay.tag` attribute. This is optional, as it defaults to `v1`.
   ```yaml
   attributes:
     services:
       kafka-outbox-relay:
         tag: v1
   ```
5. You will now need to configure your machine user so that the image can be pulled from [quay.io]
   ```yaml
   attributes:
     # ...
     external_image_registries:
       - url: quay.io
         username: my-project-machine-user
         password: = decrypt('<your encrypted password>')
   ```

Now that you have configured the harness correctly, you just need to do a `ws rebuild`. Your local environment should now have running `kafka-outbox-relay` container, alongside your `app` container (check this with `docker compose ps`).

[Kafka Outbox Relay]: https://github.com/inviqa/kafka-outbox-relay
[need a database]: add-a-database.md
[quay.io]: https://quay.io/
