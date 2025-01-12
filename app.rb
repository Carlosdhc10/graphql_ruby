require 'sinatra'
require 'graphql'
require './graphql/schema'

set :bind, '0.0.0.0'
set :public_folder, 'public'

# Ruta para servir el archivo index.html
get '/' do
  send_file File.join(settings.public_folder, 'index.html')
end

post '/graphql' do
  request_payload = JSON.parse(request.body.read)
  query = request_payload["query"]
  result = MovieAPI.execute(query)
  content_type :json
  result.to_json
end
