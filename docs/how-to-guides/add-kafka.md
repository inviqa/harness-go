# How to add Kafka (and Zookeeper)

Sometimes we may want to write a Go service that consumes data from Kafka. In a microservices architecture this enables several patterns, including the [saga], [CQRS], [domain event] and [event sourcing] patterns.

## Kafka versions supported

You can configure your `kafka.version` attribute (see below) to use one of the available image tags on the [`bitnami/kafka`] image.

The format for the tags on this image is `X-Y`, where version `X` is the Scala version, and `Y` is the Kafka version.

The default version used by this harness, if the implementing service does not define one, will always be `latest`. Therefore, it is recommended that you define a fixed version in the `kafka.version` attribute in your repository.

## Zookeeper

When you run Kafka, you usually run it in a cluster made up of several nodes. Zookeeper is needed as an orchestrator for these nodes, a place they can store their metadata such as topics, partitions and other configuration.

In local development environments, we only run a single Kafka node, but we still need Zookeeper. When you enable Kafka as detailed below, Zookeeper will automatically be configured as well.

You can configure your `zookeeper.version` attribute to use one of the available image tags on the [`bitnami/zookeeper`] image. It always defaults to `latest`.

>_NOTE: In the future, it may well be the case that Kafka [no longer needs Zookeeper](https://www.confluent.io/blog/removing-zookeeper-dependency-in-kafka/)._

## Recommended modules

Go does not have any built-in support for working with Kafka. We recommend the use of [`github.com/Shopify/sarama`] as some reusable Inviqa modules are implemented using this Kafka module.

## Adding Kafka (and Zookeeper)

In order to add Kafka and Zookeeper to your application, you just need to update our project's attributes in `workspace.yml`, and then update your application code to use some environment variables that contain Kakfa host information. The Go harness takes care of the rest for us.

The below guide shows how to add Kafka and Zookeeper to your application. In your project's `workspace.yml`:

1. Add Kafka to the `app.services` attribute:
   ```
   attributes:
     app:
       services: [kafka]
   ```
1. Set the `kafka.version` attribute with your desired Kafka version from the [`wurstmeister/kafka`] tags list:
   ```
   attributes:
     # ...
     kafka:
       version: "2.13-2.7.0"
   ```
1. Configure your app container's environment variables so that it knows how to connect to Kafka:
   ```
   attributes:
     # ...
     services:
       app:
         environment:
           KAFKA_HOST: = @('kafka.host')
   ```

Now that you have configured the harness correctly, you just need to do a `ws rebuild`. Your local environment should now have running `kafka` and `zookeeper` containers, alongside your `app` container (check this with `docker-compose ps`).

>_NOTE: Now that you have Kafka running, you need to update your application to read the environment variables we defined above and connect to it. Also, remember to import the [`github.com/Shopify/sarama`] module._

[saga]: https://microservices.io/patterns/data/saga.html
[CQRS]: https://microservices.io/patterns/data/cqrs.html
[domain event]: https://microservices.io/patterns/data/domain-event.html
[event sourcing]: https://microservices.io/patterns/data/event-sourcing.html
[`bitnami/kafka`]: https://hub.docker.com/r/bitnami/kafka/tags
[`bitnami/zookeeper`]: https://hub.docker.com/r/bitnami/zookeeper/tags
[`github.com/Shopify/sarama`]: https://github.com/Shopify/sarama
