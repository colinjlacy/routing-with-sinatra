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
#multiple params

get '/multiple/:this/params/:that/?' do
	"I see <strong>#{params['this']}</strong> and <strong>#{params['that']}</strong> in your route params!"
end

#using a static erb template (embedded ruby file)
#looks like html file
get '/erb/?' do
	erb :template
end

#variables

get '/erb/:thing/?' do
	erb :variables, :locals => {:variable => params['thing']}
end

get '/instance/?' do
	@instance = {
		name: "Colin",
		class: "TTS",
		language: "PHP",
		freelance: "NO!"
	}
	erb :instance
end

get '/class/?' do
	erb :form
end

post '/class/?' do
	@data = {
		first_name: params[:first_name],
		last_name: params[:last_name]
	}
	erb :display
end

#wildcard

get '*' do
	status 404
end
