#! /usr/bin/env ruby

require 'sinatra'
require 'sinatra/reloader' if development?
require 'slim'
require 'sass'



get('/styles.css') { scss :styles }

get '/' do
  @title = "Hyperfocal"
  slim :home
end

get '/gaming' do
  @title = "Gaming"
  slim :gaming
end

not_found do
  @title = "Four Oh Four"
  slim :not_found
end
