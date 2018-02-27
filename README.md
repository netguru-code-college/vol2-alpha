# ..:: ITutor - Alpha Team Project ::..

[![forthebadge](https://forthebadge.com/images/badges/uses-badges.svg)](https://forthebadge.com) [![forthebadge](https://forthebadge.com/images/badges/made-with-crayons.svg)](https://forthebadge.com) [![forthebadge](https://forthebadge.com/images/badges/built-with-resentment.svg)](https://forthebadge.com)


## Project description:

The idea behind ITutor is to connect technology mentors with newbies looking for a reliable source of tech knowledge. The app is based on the belief that participating mentors can not stand keeping their knowledge unshared, and that hungry newbies are on their way to becoming mentors themselves.

Initial app version implies simple connection of two groups via either internal or email messages with potential further connection via platform controlled meetings. The mentors have ratings and opinions. Any user is able to search for a mentor with a specific skill set and capable of teaching in a specific human language.

### Steps to setup:

* `bundle install`
* `cp config/database.yml.example config/database.yml` (extra for collaborators: type yes to overwrite your old file)
* `rails db:setup` (this will create the database, load the schema and initialize it with the seed data)
