# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.6"

gem "pg", ">= 0.18", "< 2.0"
gem "puma", "~> 4.1"
gem "rails"

gem "hiredis"
gem "jbuilder", "~> 2.7"
gem "redis", ">= 4.0", require: ["redis", "redis/connection/hiredis"]
gem "turbolinks", "~> 5"
gem "webpacker", "~> 4.0"

gem "stimulus_reflex"

group :development, :test do
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "pry-rails"
end

group :development do
  gem "listen", "~> 3.2"
  gem "rubocop-performance"
  gem "rubocop-rails"
  gem "solargraph"
  gem "web-console", ">= 3.3.0"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "rspec-rails"
  gem "selenium-webdriver"
  gem "webdrivers"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
