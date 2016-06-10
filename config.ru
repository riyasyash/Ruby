require './main'
require 'rubygems'
Bundler.require(:default)
require 'sass/plugin/rack'
Sass::Plugin.options[:style] = :compressed
use Sass::Plugin::Rack

# use coffeescript for javascript
use Rack::Coffee, root: 'public', urls: '/javascripts'
run Sinatra::Application