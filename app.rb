#! /usr/bin/env ruby

require 'sinatra'
require 'slim'
require 'sass'

require 'pry' if development?
require 'pry-byebug' if development?
require 'sinatra/reloader' if development?
require 'better_errors' if development?

require_relative 'post'
require_relative 'pinboard'

configure :development do
  use BetterErrors::Middleware
  # you need to set the application root in order to abbreviate filenames
  # within the application:
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

helpers do
  def css(*stylesheets)
    stylesheets.map do |stylesheet|
      "<link href=\"/#{stylesheet}.css\" media=\"screen, projection\" rel=\"stylesheet\" />"    end.join
  end
end

get('/styles.css') { scss :styles }

get '/' do
  config_file = YAML.load_file("config.yml")
  @title = "Home"
  @twitter_token = config_file["twitter"]
  @posts = Post.all(:order => [ :id.desc ], :limit => 5)
  slim :home
end

get '/error' do
  raise 'WTF?'
end

get '/posts' do
  @title = "Posts"
  @posts = Post.all
  slim :posts
end

post '/posts' do
  params[:post].merge!("date" => "#{Time.now}") # TODO: This is an ugly way to get the date in there
  post = Post.create(params[:post])
  redirect to("/posts/#{post.id}")
end

get '/posts/new' do
  @title = "Create Post"
  @post = Post.new
  slim :new_post
end

get '/posts/:id' do
  @title = "View Post"
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
