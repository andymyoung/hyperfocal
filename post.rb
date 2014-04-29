require 'dm-core'
require 'dm-migrations'

configure :development do
  DataMapper.setup(:default, "sqlite3:///#{Dir.pwd}/development.db")
end

class Post
  include DataMapper::Resource
  property :id, Serial
  property :date, DateTime
  property :title, String
  property :body, Text
end

DataMapper.finalize
