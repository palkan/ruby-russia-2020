source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "~> 2.7.0"

gem "rails", "~> 6.1.0.rc1"
gem "pg", "~> 1.0"
gem "puma", "~> 5.0"
gem "webpacker"

gem "cable_ready"
gem "stimulus_reflex", ">= 3.4.0.pre3"

gem "dry-effects", "~> 0.1.5"
gem "dry-initializer", "~> 3.0"

gem "slim"
gem "view_component"
# We only need controllers integration
gem "turbolinks", require: "turbolinks/redirection"

gem "bcrypt", "~> 3.1.7"

gem "bootsnap", ">= 1.4.2", require: false

group :development, :test do
  gem "pry-byebug"
  gem "pry-rails"

  gem "rspec-rails"
end

group :development do
  gem "listen", "~> 3.2"

  gem "standard", "~> 0.8.0"
  gem "rubocop-rspec"
  gem "rubocop-rails"
end

group :test do
  gem "capybara"
  gem "cuprite"

  gem "test-prof"
end
