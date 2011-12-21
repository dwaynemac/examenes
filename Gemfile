source 'http://rubygems.org'

gem 'rails', '3.1.3'
gem 'execjs' # needed on rc5, maybe not needed later
gem 'therubyracer' # idem execjs

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'

gem 'spreadsheet'
gem 'carrierwave'
gem 'formtastic'
gem 'draper'

gem 'fog'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.5'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :development, :test do
  gem 'foreman'
  gem 'rspec-rails'
  gem 'shoulda'
  gem 'spork', '> 0.9.0.pre'
  gem 'guard-spork'
  gem 'guard-rspec'

  gem 'faker'
  gem 'machinist', '1.0.6'
  gem 'database_cleaner'

  gem 'cucumber-rails'
  gem 'guard-cucumber'
  gem 'capybara'
  gem 'minitest' # for cucumber
end

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
  gem 'rb-fsevent', :require => false if RUBY_PLATFORM =~ /darwin/i
  gem 'growl', :require => false if RUBY_PLATFORM =~ /darwin/i
  gem 'rb-inotify', :require => false if RUBY_PLATFORM =~ /linux/i
  gem 'libnotify', :require => false if RUBY_PLATFORM =~ /linux/i
end
