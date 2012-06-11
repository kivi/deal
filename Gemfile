source 'https://rubygems.org'

gem 'rails', '3.2.1'

gem 'thin'
gem 'heroku'

gem 'jquery-rails'

# for heroku
group :production do
 gem 'pg'
end

# oAuth
gem "oa-oauth", :require => "omniauth/oauth" 
gem 'oauth2'
gem 'devise'
#, :git => "http://github.com/plataformatec/devise.git"

# Facebook
gem 'koala'

# Payment
gem 'activemerchant'


# act as active state machine
gem 'state_machine', :require => 'state_machine/core'


# gem 'cancan'
# gem 'passenger'
# gem 'capistrano'
# gem "compass"

group :development, :test do
  gem 'mysql2'
  
  gem 'capybara'
  gem 'database_cleaner'
  gem 'cucumber-rails'
  gem 'cucumber'
  gem 'pickle'
  gem 'spork'
  #, '~> 0.9.0.rc9'
  gem 'launchy'

	gem 'guard-spork'
	gem 'guard-rspec'
	gem 'guard-cucumber'

  gem 'rspec-rails'
  gem 'watchr'
  gem 'factory_girl_rails'

  gem 'faker'
  gem 'ruby-debug19'


#  gem 'shoulda'
#  gem 'autotest'  
#  gem 'launchy'
#  gem 'haml-rails'
#  gem 'metric_fu'
end


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'

  #,   '~> 3.1.4'
  gem 'coffee-rails'
  #, '~> 3.1.1'
  gem 'uglifier'
  #, '>= 1.0.3'
end


# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

