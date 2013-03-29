require 'bundler'
Bundler.require

path = File.expand_path(File.join(File.dirname(__FILE__), 'lib'))
$LOAD_PATH << path


require 'vertigem_toto'

# Rack config
use Rack::Static, :urls => ['/css', '/js', '/images', '/favicon.ico'], :root => 'public'
use Rack::CommonLogger

if ENV['RACK_ENV'] == 'development'
  use Rack::ShowExceptions
end

#
# Create and configure a toto instance
#
toto = Toto::Server.new do
  set :title,     "Vertigem" # site title
  set :summary,   :max => nil
  #set :markdown,  :smart                                    # use markdown + smart-mode
  set :disqus,    'hermesvertigemxxx'                                     # disqus id, or false
  set :ext,       'md'                                     # file extension for articles
  set :date, lambda {|now| now.strftime("%B #{now.day.ordinal} %Y") }
end

run toto


