# myapp.rb
require 'sinatra'

get '/' do
	File.read(File.join('views','template.html'))
end

#how to create a route

get '/static/?' do	
	File.read(File.join('views','template.html'))
end

#route parameter/parameter variable

get '/params/:whatever/?' do
	"You entered #{params['whatever']} as a route parameter"
end

get '/tts/:whatever/?' do
	"TTS #{params['whatever']}"
end
#multiple params 
	#localhost:4567/mulitple/chloe/params/frank

get '/multiple/:this/params/:that/?' do
	"I see <strong>#{params['this']}</strong> and <strong>#{params['that']}</strong> in your route params!"
end

#using a static erb template (embedded ruby file) do not need to run server.  
	#looks like html file
get '/erb/?' do
	erb :template
end

#variables

get '/erb/:thing/?' do
	erb :variables, :locals => {:variable => params['thing']}
end

get '/vars/?' do
	@variable = {
		name: "Colin",
		class: "TTS",
		language: "Ruby"
	}
	erb :instance
end


#wildcard 

get '*' do
	status 404
end
