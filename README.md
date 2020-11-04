# Canopy Hiring Challenge
## Background
**The best first step is to read the commit history.** This repo is to help avoid the setup
of the hiring challenge. It includes a few helpful libraries to get you setup quickly.

* Preconfigured to use Postgres (like the [RubyGems Data Dump](https://rubygems.org/pages/data))
* Access to the RubyGems database
* Support for bootstrap 3 and jquery
* Remove Spring to avoid caching errors
* Re-added sprockets (see below for instructions)

Removing anything should be as simple as git revert.

## Requirements
* Ruby 2.6.6
* Rails 6.0.3
* Postgres

If you need to install Ruby, the easiest way is [rbenv](https://github.com/rbenv/rbenv#installation).
After that, `gem install rails -v 6.0.3`. To install Postgres on Ubuntu, follow their
[official instructions](https://www.postgresql.org/download/linux/ubuntu/).
For OS X, [Postgres.app](https://postgresapp.com/) is the probably the simplest
but you can use [Homebrew](https://www.robinwieruch.de/postgres-sql-macos-setup) too.

## RubyGems DB
Visit https://rubygems.org/pages/data to download a database dump. Run the following command
in the directory of the application.
`./lib/etl/load-pg-dump -d rubygems_development ~/Downloads/public_postgresql.tar`. The application
is preconfigured to look for a database called rubygems_development. We setup a basic script which
reads the data. Once you've loaded the data, verify that you can read it.
Run `rails runner lib/etl/reader.rb` which should output
```
List of tables from RubyGems data dump.
["schema_migrations", "ar_internal_metadata", "libraries", "dependencies", "gem_downloads", "linksets", "rubygems", "versions"]
One record show should up here!
{"id"=>15102, "name"=>"hpriocot", "created_at"=>2009-07-25 17:46:41 UTC, "updated_at"=>2009-07-25 17:46:41 UTC, "slug"=>"hpriocot", "indexed"=>false}
The application tables should show up below.
["schema_migrations", "ar_internal_metadata", "libraries"]
```

Note: We created reader.rb and it can be useful example of how to switch between the rubygems and application database.
load-pg-dump is borrowed from https://github.com/rubygems/rubygems.org/blob/master/script/load-pg-dump
without any changes. Everytime you run it, it will drop the rubygems database and recreate it.

## Help
We don't want you to spend too much time on the environment. If you need help, feel free to reach out.

If you're not familiar with Rails, a good resource is the [official Rails Guide](https://guides.rubyonrails.org/).

## Tips
* If you want to run a file in the context of the rails application, use `rails runner path/to/file.rb`
* You can run all tests using `rails test`. Browser tests are called system tests (test/system/libraries_test.rb).
System tests do not run by default. You need to use `rails test:system`.
* Use a GUI for the database like PgAdmin or Postico to explore the data
* There's some old school typeahead / autocomplete libraries out there that work just fine. Getting these
libraries working with Webpack can be a pain. We re-added the javascript asset pipeline (it was removed in favor
of Webpacker).
Suppose you want to use typeahead.js. Download the dist into app/assets/javascript. In app/assets/application.js, add
```
//= typeahead
//= require_tree .
```
