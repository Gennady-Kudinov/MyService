source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# ruby "3.0.4"
# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails'
gem "sprockets-rails" 
gem "sqlite3"
gem "puma"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "pry"
gem 'rubyzip'
gem 'caxlsx'
gem 'caxlsx_rails'

# gem 'bootstrap', '~> 5.2.0'
# добавил булма 
gem 'bulma-rails'
gem "bcrypt"

gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem "sassc-rails"

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'rspec-rails'
  gem 'factory_bot_rails' 
  gem 'faker'
end

# работа с файлами
gem 'carrierwave'
gem 'gravatar_image_tag'
gem 'mini_magick'
gem 'file_validators'
gem 'image_processing'

group :development do
  gem "web-console"
  gem "byebug"
end

# пагинация
gem 'kaminari'

# защита от CSRF-атак
#gem 'secure_headers', '~> 6.3'
# защита от SQL-инъекций
gem 'rack-attack', '~> 6.5'
# защита от XSS-атак
gem 'rails-html-sanitizer', '~> 1.4'
# защита от DoS-атак
gem 'rack-protection', '~> 2.1'

