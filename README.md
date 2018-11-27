# README

## Project Title

This project is for beginners like myself who're interested to learn a new framework - Ruby on Rails by doing and creating a simple blog aka Wizcool's blog:)

## Getting Started

To fully delete and rebuild the DB

```
rake db:reset db:migrate
```

To fully reset the database and reload the current schema,

```
rake db:drop db db:create db:migrate
```

## Deploying to Heroku

To seed data to heroku

```
heroku run rake db:seed
```

To check the data inside your table, you can run the console by

```
heroku run rails c
```

Check if there is a data by running

```
User.count
```

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version
  Ruby version is 2.5.1

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
