# How to add a database to your app

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
       platform: "mysql"
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

## Example code

### Implementing connection retries to your database

It is important to make sure that your Go application is able to handle the case where a database is not available initially on startup. This is common in a local development environment, where your `app` container may start before your database container, but it is also really important in other environments where a connection attempt may fail for all kinds of reasons.

>_NOTE: This code example uses an arbitrary database driver and DSN. You can find examples of how to connect to specific databases in the other code examples further below._

```go
package data

import (
	"database/sql"
	"log"
	"time"
)

const retryAttempts = 10

func NewDB(driver, dsn string) *sql.DB {
	db, err := sql.Open(driver, dsn)

	if err != nil {
		log.Fatalf("cannot connect to database: %s", err)
	}

	tries := retryAttempts
	for {
		err := db.Ping()
		if err == nil {
			break
		}

		time.Sleep(time.Second * 1)
		tries--
		log.Printf("database is not available (err: %s), retrying %d more time(s)", err, tries)

		if tries == 0 {
			log.Fatalf("database did not become available within %d connection attempts", retryAttempts)
		}
	}

	return db
}
```

### Connecting to a MySQL database:

Building upon the [connection retry example] above, this shows a specific approach for MySQL.

```go
package data

import (
	"database/sql"

	_ "github.com/go-sql-driver/mysql"
)

func NewDB() *sql.DB {
	db, err := sql.Open("mysql", "user:pass@tcp(host:3306)/database-name?parseTime=true")

	// ...
}
```

### Connecting to a Postgres database:

Building upon the [connection retry example] above, this shows a specific approach for Postgres.

```go
package main

import (
	"database/sql"

	_ "github.com/jackc/pgx/v4/stdlib"
)

func NewDB() *sql.DB {
	db, err := sql.Open("pgx", "postgres://user:pass@host:5432/database-name?sslmode=disable")

	// ...
}
```

[`database/sql` package docs]: https://pkg.go.dev/database/sql
[`github.com/go-sql-driver/mysql`]: https://pkg.go.dev/github.com/go-sql-driver/mysql
[`github.com/jackc/pgx/v4`]: https://pkg.go.dev/github.com/jackc/pgx/v4
[database-per-service]: https://microservices.io/patterns/data/database-per-service.html
[connection retry example]: #implementing-connection-retries-to-your-database
