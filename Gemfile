# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.1'

gem 'bootsnap', '>= 1.4.4', require: false
gem 'factory_bot', '~> 6.2'
gem 'faker'
gem 'httparty', '~> 0.18.1'
gem 'jbuilder', '~> 2.7'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.3', '>= 6.1.3.2'
gem 'rest-client'
gem 'rubocop', require: false
gem 'rubocop-rails'
gem 'sass-rails', '>= 6'
gem 'sidekiq'
gem 'sidekiq-scheduler', '~> 3.1'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 5.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'database_cleaner', '~> 2.0', '>= 2.0.1'
  gem 'factory_bot_rails', '~> 6.2'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'rubocop-rspec'
  gem 'simplecov', '~> 0.21.2', require: false
  gem 'vcr', '~> 6.0'
  gem 'webmock', '~> 3.13'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'spring'
  gem 'web-console', '>= 4.1.0'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
