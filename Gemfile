source 'https://rubygems.org'
ruby '1.9.3'
# Distribute your app as a gem
# gemspec

# Server requirements
gem 'thin' # or mongrel
# gem 'trinidad', :platform => 'jruby'

# Optional JSON codec (faster performance)
# gem 'oj'

# Project requirements
gem 'rake'
gem 'omniauth'
gem 'omniauth-twitter'

# Component requirements
gem 'slim'
gem 'haml'
#, :group => 'production'
gem 'dm-mysql-adapter'
#:group => 'production'
gem 'dm-validations'
gem 'dm-timestamps'
gem 'dm-migrations'
gem 'dm-constraints'
gem 'dm-aggregates'
gem 'dm-types'
gem 'dm-core'
gem 'dm-ar-finders'
gem 'tilt', '1.3.7'
gem 'spreadbase'

group :production do
  gem 'dm-postgres-adapter'
  gem 'pg'
end

# Test requirements
gem 'simplecov'
gem 'selenium-webdriver'
gem 'dm-sqlite-adapter', :group => 'test' 
gem 'rspec', :group => 'test'
gem 'capybara', :group => 'test'
gem 'cucumber', :group => 'test'
gem 'rack-test', :require => 'rack/test', :group => 'test'
#gem 'debugger'

# Padrino Stable Gem
gem 'padrino', '0.11.1'

# Or Padrino Edge
# gem 'padrino', :github => 'padrino/padrino-framework'

# Or Individual Gems
# %w(core gen helpers cache mailer admin).each do |g|
#   gem 'padrino-' + g, '0.11.1'
# end
