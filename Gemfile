source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby File.read(".ruby-version")

gem "awesome_print"
gem "bootsnap", "~> 1", require: false
gem "cssbundling-rails", "~> 1"
gem "devise", "~> 4"
gem "jbuilder", "~> 2"
gem "jsbundling-rails", "~> 1"
gem "omniauth-google-oauth2", "~> 1"
gem "omniauth-rails_csrf_protection", "~> 1"
gem "pg", "~> 1"
gem "propshaft", "~> 0"
gem "puma", "~> 6"
gem "rails", "~> 7"
gem "redis", "~> 5"
gem "stimulus-rails", "~> 1"
gem "turbo-rails", "~> 1"
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :development, :test do
  gem "axe-core-capybara", "~> 4"
  gem "axe-core-rspec", "~> 4"
  gem "bullet", "~> 7"
  gem "bundler-audit", "~> 0"
  gem "factory_bot_rails", "~> 6"
  gem "faker", "~> 3"
  gem "launchy", "~> 2"
  gem "lol_dba", "~> 2"
  gem "okcomputer", "~> 1"
  gem "pry-byebug", "~> 3"
  gem "pry-rails", "~> 0"
  gem "rspec-its", "~> 1"
  gem "rspec-rails", "~> 6.0.3"
  gem "shoulda-matchers"
  gem "simplecov", "~> 0", require: false
end

group :test do
  gem "capybara", "~> 3"
  gem "selenium-webdriver", "~> 4"
  gem "webdrivers", "~> 5.2"
end

group :development do
  gem "foreman", "~> 0.87"
  gem "rubocop", "~> 1"
  gem "rubocop-performance", "~> 1"
  gem "rubocop-rails", "~> 2"
  gem "rubocop-rspec", "~> 2"
  gem "web-console", "~> 4"
end

gem "sidekiq", "~> 7.1"
