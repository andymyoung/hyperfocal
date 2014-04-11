#! /usr/bin/env ruby

require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  erb :home
end

not_found do
  erb :not_found
end
