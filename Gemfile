source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "~> 2.7.0"

gem "rails", "~> 6.1.0.rc1"
gem "pg", "~> 1.0"
gem "puma", "~> 5.0"

gem "bcrypt", "~> 3.1.7"

gem "bootsnap", ">= 1.4.2", require: false

group :development, :test do
  gem "pry-byebug"
  gem "pry-rails"
end

group :development do
  gem "listen", "~> 3.2"

  gem "standard", "~> 0.8.0"
  gem "rubocop-rspec"
  gem "rubocop-rails"
end
