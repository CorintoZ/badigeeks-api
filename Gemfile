source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.2', '>= 6.0.2.1'
# Use mysql as the database for Active Record
gem 'pg', '>= 1.2.2'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use Grape as the framework for creating REST-like APIs
gem 'grape', '~> 1.2'
gem 'grape-entity'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false
# Enforces Rails best practices and coding conventions.
gem 'rubocop-rails', require: false
# Sharing configuration variables across environments
gem 'dotenv-rails', groups: %i[development test]
# Provides access to features of the PostGIS geospatial database from ActiveRecord
gem 'activerecord-postgis-adapter'
# Complete geocoding solution for Ruby
gem 'geocoder'
# Makes consuming restful web services dead easy.
gem 'faker'
gem 'httparty'
# Pagy is the ultimate pagination gem that outperforms the others in each and every benchmark and comparison
gem 'pagy'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  # Use Rspec to support Rspec examples for requests, controllers, models, etc
  gem 'rspec-rails', '~> 3.9'
  # Use Pry to debug
  gem 'pry-rails'
end

group :test do
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'shoulda-matchers'
  # Use SimpleCov to analyze the code coverage
  gem 'simplecov', require: false
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'brakeman'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
