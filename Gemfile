source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

# Basic set of gems, aim for up to date versions.
gem 'rails'
gem 'pg', '~> 1.2.3'
gem 'puma', '~> 4.1'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'haml-rails', '~> 2.0', '>= 2.0.1'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'rails-i18n'
gem 'devise'
gem 'image_processing', '~> 1.2'
gem 'exifr'
gem 'aws-sdk-s3', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem "better_errors"
  gem "binding_of_caller"
  gem 'i18n-tasks', '~> 0.9.31'
end

