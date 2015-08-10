# myapp.rb
require 'sinatra'

get '/' do
	"Responding with some basic text.  Like a boss."
end

#how to create a route

get '/static/?' do
	File.read(File.join('views','template.html'))
end

