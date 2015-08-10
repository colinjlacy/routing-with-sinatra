# myapp.rb
require 'sinatra'

get '/' do
	"Responding with some basic text.  Like a boss."
end

#how to create a route

get '/static/?' do
	File.read(File.join('views','template.html'))
end

#route parameter variables

get '/params/:whatever/?' do
	"You entered #{params['whatever']} as a route parameter"
end

get '/tts/:whatever/?' do
	"TTS #{params['whatever']}"
end

#wildcard

get '*' do
	status 404
end
