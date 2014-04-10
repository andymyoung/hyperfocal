#! /usr/bin/env ruby

require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  erb :home
end

get '/clock' do
  erb :clock
end

__END__
@@layout
  <!doctype html>
  <html lang="en">
  <head>
    <title>Hyperfocal</title>
    <meta charset="utf-8">
  </head>
  <body>
  <%= yield %>
  </body>
  </html>

@@home
  <header>
  <h1>I am Andy's placeholder.</h1>
  </header>
  <section>
    <p>Welcome</p>
  </section>

@@clock
  <% time = Time.now %>
  <% print_time = time.strftime('%I:%M %p') %>
  <h1><%= print_time %></h1>

