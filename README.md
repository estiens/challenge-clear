# Canopy Hiring Challenge
## Background
This repo is to help avoid the setup of the Canopy hiring challenge. It includes
a few helpful libraries to get you setup quickly. Read the commit history to see
what was added.

* Preconfigured to use Postgres (like the [RubyGems Data Dump](https://rubygems.org/pages/data))
* Access to the RubyGems database
* Support for bootstrap 3 and jquery

Removing anything should be as simple as git revert.

## Requirements
* Ruby 2.6.6
* Rails 6.0.3
* Postgres

If you need to install Ruby, the easiest way is [rbenv](https://github.com/rbenv/rbenv#installation). After that, `gem install rails -v 6.0.3`. To install Postgres on Ubuntu, follow their [official](https://www.postgresql.org/download/linux/ubuntu/). For OS X, [Postgres.app](https://postgresapp.com/) is the probably the simplest but you can use [Homebrew](https://www.robinwieruch.de/postgres-sql-macos-setup) too.

## RubyGems DB
Visit https://rubygems.org/pages/data. Download a dump. To load the dump into the database, run
`./lib/etl/load-pg-dump -d rubygems_development ~/Downloads/public_postgresql.tar`. The application
is preconfigured to look for a database called rubygems_development. We setup a basic script which
reads the data. Once you've loaded the data, verify that you can read it.
Run `bin/rails runner lib/etl/reader.rb` which should output
```
List of tables from RubyGems data dump.
["schema_migrations", "ar_internal_metadata", "libraries", "dependencies", "gem_downloads", "linksets", "rubygems", "versions"]
One record show should up here!
{"id"=>15102, "name"=>"hpriocot", "created_at"=>2009-07-25 17:46:41 UTC, "updated_at"=>2009-07-25 17:46:41 UTC, "slug"=>"hpriocot", "indexed"=>false}
The application tables should show up below.
["schema_migrations", "ar_internal_metadata", "libraries"]
```

Note: load-pg-dump is borrowed from https://github.com/rubygems/rubygems.org/blob/master/script/load-pg-dump
without any changes.

## Help
We don't want you to spend too much time on the environment. If you need help, feel free to reach out.
