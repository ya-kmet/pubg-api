source 'https://rubygems.org'

# Specify your gem's dependencies in pubg-api.gemspec
gemspec

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem 'httparty'
gem 'plissken'

group :development do
  gem 'dotenv'
  gem 'gem-release'
  gem 'git'
  gem 'pry'
  gem 'pry-nav', require: true
  gem 'pry-rescue', require: true
  gem 'redcarpet', platforms: :mri
  gem 'ruby-prof', platforms: :mri
  gem 'yard'
end

group :test do
  gem 'coveralls'
  gem 'rake'
  gem 'rspec'
  gem 'rubocop'
  gem 'simplecov'
  gem 'timecop'
  gem 'vcr'
  gem 'webmock'
  gem 'yardstick'
end
