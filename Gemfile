source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
# A simple, fast Mysql library for Ruby, binding to libmysql
gem 'mysql2'
# Use Puma as the app server
gem 'puma', '~> 3.0'

gem 'active_model_serializers'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making
# cross-origin AJAX possible
# gem 'rack-cors'

# SHOUTcast API wrapper
gem 'shoutcast-api-client',
    github: 'marcferna/shoutcast-api-client',
    branch: 'master'

# High performance memcached
gem 'dalli'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger
  # console
  gem 'byebug', platform: :mri

  # Use RSpec for specs
  gem 'rspec-rails'

  # Use Factory Girl for generating random test data
  gem 'factory_girl_rails'

  # Loads environment variables from `.env`.
  gem 'dotenv-rails'

  # A Ruby static code analyzer, based on the community Ruby style guide
  gem 'rubocop', require: false
end

group :development do
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the
  # background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
