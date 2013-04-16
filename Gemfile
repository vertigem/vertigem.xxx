source 'http://rubygems.org'

ruby '1.9.3', :engine => 'jruby', :engine_version => '1.7.3'


gem 'toto', github: 'vertigem/toto', branch: 'jruby-support'
gem 'puma'
gem 'rake'

group :production do
  gem 'newrelic_rpm'
end

group :development do
  gem 'shotgun'
  gem 'sass'
end
