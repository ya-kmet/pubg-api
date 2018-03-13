source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem 'httparty'
gem 'plissken'
gem 'rake'

# Specify your gem's dependencies in pubg-api.gemspec
gemspec

group :development do
  gem 'dotenv'
  gem 'pry'
  gem 'pry-nav', require: true
  gem 'pry-rescue', require: true
  gem 'rubocop'
  gem 'ruby-prof', platforms: :mri
end

group :test do
  gem 'coveralls'
  gem 'rspec'
  gem 'simplecov'
  gem 'timecop'
  gem 'vcr'
  gem 'webmock'
  gem 'yardstick'
end

group :release do
  gem 'colorize'
  gem 'gem-release'
  gem 'git'
  gem 'redcarpet', platforms: :mri
  gem 'yard'
end
