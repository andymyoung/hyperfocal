#! /usr/bin/env ruby

require 'sinatra'
require 'sinatra/reloader' if development?
require 'better_errors' if development?
require 'slim'
require 'sass'
require 'pry'

require_relative 'post'
require_relative 'pinboard'



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

get '/links' do
  @title = "Links"
  @pinboard = Pinboard.new
  slim :links
end

get '/links/:tag' do
  @title = "Links"
  if params[:tag].length > 0
    @tag = params[:tag]
  end
  @pinboard = Pinboard.new
  slim :links
end

not_found do
  @title = "Four Oh Four"
  slim :not_found
end
