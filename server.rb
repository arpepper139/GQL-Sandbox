require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader' if development?
require 'pry' if development? || test?

set :bind, '0.0.0.0'  # bind to all interfaces

Dir[File.join(File.dirname(__FILE__), 'app', '**', '*.rb')].each do |file|
  require file
  also_reload file
end

configure do
  set :views, 'app/views'
end

get '/' do
  erb :app
end
