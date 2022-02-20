# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

gem 'bootsnap', '>= 1.4.4', require: false
gem 'jbuilder', '~> 2.7'
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.4', '>= 6.1.4.4'
gem 'rollbar'
gem 'sass-rails', '>= 6'
gem 'simple_form'
gem 'slim-rails'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 5.0'
gem 'rollbar'
gem 'faker'

gem 'omniauth-github'
gem 'omniauth-rails_csrf_protection'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rubocop'
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'slim_lint'
  gem 'sqlite3', '~> 1.4'
  gem 'dotenv-rails'
end

group :development do
  gem 'html2slim'
  gem 'listen', '~> 3.3'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'spring'
  gem 'web-console', '>= 4.1.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

group :production do
  gem 'pg'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
