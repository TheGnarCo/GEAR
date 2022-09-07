source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "bootsnap", require: false
gem "cssbundling-rails"
gem "devise"
gem "jbuilder"
gem "jsbundling-rails"
gem "omniauth-google-oauth2"
gem "omniauth-rails_csrf_protection", "~> 1.0"
gem "pg", "~> 1.1"
gem "puma", "~> 5.6"
gem "rails", "~> 7.0.2", ">= 7.0.2.3"
gem "redis", "~> 5.0"
gem "sprockets-rails"
gem "stimulus-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :development, :test do
  gem "axe-core-capybara"
  gem "axe-core-rspec"
  gem "bullet"
  gem "bundler-audit"
  gem "dotenv-rails"
  gem "factory_bot_rails"
  gem "faker"
  gem "launchy"
  gem "lol_dba"
  gem "okcomputer"
  gem "pry-byebug"
  gem "pry-rails"
  gem "rspec-its"
  gem "rspec-rails", "~> 6.0.0.rc1"
  gem "shoulda-matchers"
  gem "simplecov", require: false
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem 'webdrivers', '~> 5.0'
end

group :development do
  gem "foreman", "~> 0.87.2"
  gem "rubocop", "~> 1.36"
  gem "rubocop-performance", "~> 1.14"
  gem "rubocop-rails", "~> 2.15"
  gem "rubocop-rspec", "~> 2.12"
  gem "web-console"
end
