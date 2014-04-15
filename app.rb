#! /usr/bin/env ruby

require 'sinatra'
require 'sinatra/reloader' if development?
require 'slim'
require 'sass'
require 'pry'

require_relative 'post'


get('/styles.css') { scss :styles }

get '/' do
  @title = "Hyperfocal"
  slim :home
end

get '/posts' do
  #binding.pry
  @posts = Post.all
  slim :posts
end

get '/posts/:id' do
  @post = Post.get(params[:id])
  slim :show_post
end

get '/gaming' do
  @title = "Gaming"
  slim :gaming
end

not_found do
  @title = "Four Oh Four"
  slim :not_found
end
