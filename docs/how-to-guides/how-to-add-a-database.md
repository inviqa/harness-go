# How to add a database to your project

It is common for a Go application to require a database. In a microservices architecture it enables the [database-per-service] pattern.

## Supported databases

This harness supports the following databases by default:

* [MySQL](https://hub.docker.com/_/mysql)
* [Postgres](https://hub.docker.com/_/postgres)

## Recommended modules

Go does not have any built-in support for communicating to a particular database. Instead, it provides the `database/sql` package as an abstraction layer that we interact with, relying on 3rd party Go modules to provide support for particular databases. We need to import one of those Go module for our chosen database to be able to communicate with it in our application. Read more about that in the [`database/sql` package docs].

Here is a list of recommended Go modules for each database:
* MySQL
    * [`github.com/go-sql-driver/mysql`]
* Postgres
    * [`github.com/jackc/pgx/v4`]

## Adding a database

In order to add one of the above databases, we just need to update our project's attributes in `workspace.yml`, and then update our application code to use some environment variables that contain our database connection information. The Go harness takes care of the rest for us.

The below guide shows how to add the MySQL database to your application. In your project's `workspace.yml`:

1. Add MySQL to the `app.services` attribute:
   ```
   attributes:
     app:
       services: [mysql]
   ```
1. Set the `database` attribute with your desired database name, username and password
   ```
   attributes:
     # ...
     database:
       name: my_database
       host: mysql
       user: db-user
       pass: db-pass
       port: 3306
   ```
1. Configure your app container's environment variables so that it knows how to connect to the database, and define a `mysql.version`:
   ```
   attributes:
     # ...
     services:
       app:
         environment:
           DB_HOST: = @('database.host')
           DB_PORT: = @('database.port')
           DB_USER: = @('database.user')
           DB_PASS: = @('database.pass')
           DB_SCHEMA: = @('database.name')
       mysql:
         version: 8
   ```
   >_NOTE: The version number must match the docker image versions linked to in the [supported databases](#supported-databases) section above._

Now that we have configured the harness correctly, we just need to do a `ws rebuild`. Your local environment should now have a running `mysql` container, alongside your `app` container (check this with `docker-compose ps`).

>_NOTE: Now that you have a running database, you need to update your application to read the environment variables we defined above and connect to the database. Also, remember to import the correct Go module that supports your database driver, see the [recommended modules](#recommended-modules)._

[`database/sql` package docs]: https://pkg.go.dev/database/sql
[`github.com/go-sql-driver/mysql`]: https://pkg.go.dev/github.com/go-sql-driver/mysql
[`github.com/jackc/pgx/v4`]: https://pkg.go.dev/github.com/jackc/pgx/v4
[database-per-service]: https://microservices.io/patterns/data/database-per-service.html
