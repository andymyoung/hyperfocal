#! /usr/bin/env ruby

require 'sinatra'
require 'sinatra/reloader' if development?
require 'better_errors' if development?
require 'slim'
require 'sass'
require 'pry'
require 'pry-byebug'

require_relative 'post'
require_relative 'pinboard'

configure :development do
  use BetterErrors::Middleware
  # you need to set the application root in order to abbreviate filenames
  # within the application:
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

get('/styles.css') { scss :styles }

get '/' do
  config_file = YAML.load_file("config.yml")
  @title = "Hyperfocal"
  @twitter_token = config_file["twitter"]
  @posts = Post.all
  slim :home
end

get '/error' do
  raise 'WTF?'
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

get '/about' do
  @title = "About"
  slim :about
end

get '/contact' do
  @title = "Contact"
  slim :contact
end

not_found do
  @title = "Four Oh Four"
  slim :not_found
end
