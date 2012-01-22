require 'sinatra'
require './lib/groszherd'

get '/' do
  'Hello there!'
end

get '/button/:year' do |year|
  begin
    content_type "image/png"
    button = GroszHerd::Button.new year 
    button.render
    button.image.to_blob
  rescue ArgumentError => e
    halt 400, {'Content-Type' => 'text/plain'}, e.message
  end
end

get '/sheet/:year' do |year|
  "Sheet of " + year
end