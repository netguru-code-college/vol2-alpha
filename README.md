# ..:: ITutor - Alpha Team Project ::..

[![forthebadge](https://forthebadge.com/images/badges/uses-badges.svg)](https://forthebadge.com) [![forthebadge](https://forthebadge.com/images/badges/made-with-crayons.svg)](https://forthebadge.com) [![forthebadge](https://forthebadge.com/images/badges/built-with-resentment.svg)](https://forthebadge.com)


## Project description

The idea behind ITutor is to connect technology mentors with newbies looking for a reliable source of tech knowledge. The app is based on the belief that participating mentors can not stand keeping their knowledge unshared, and that hungry newbies are on their way to becoming mentors themselves.

Initial app version implies simple connection of two groups via either internal or email messages with potential further connection via platform controlled meetings. The mentors have ratings and opinions. Any user is able to search for a mentor with a specific skill set and capable of teaching in a specific human language.

We're currently deployed on [Heroku](https://itutor-ncc.herokuapp.com/). The current build should be live there assuming nothing is broken.

## Stack

The application is built on **Ruby (v2.4.1)** on **Rails (v5.1.5)**. We use **Bootstrap 4** extensively for the front-end. We use **postgreSQL (v9.5)** for the database.

## Tests

Our tests are ran on the **rspec** gem, use `bundle exec rspec` in the console to run them locally. We also use **Rubocop** to enforce styling guidelines; run that with `rubocop`. The repo is preconfigured to work with **Travis CI**.

## Steps to set up locally

* `bundle install`
* `cp config/database.yml.example config/database.yml` (extra for collaborators: type yes to overwrite your old file)
* `rails db:setup` (this will create the database, load the schema and initialize it with the seed data)
* `cp .env.development.example .env.development` and:
  * set `GMAP_KEY` to Google maps API key
  * set `ITUTOR_DATABASE_PASSWORD` to a database password of your choice

## Contributing

### Code style

The project is checked by **Rubocop**. Make sure it passes the tests, I guess.
