# A sample Gemfile
source "https://rubygems.org"

gem "sinatra"
gem "sinatra-contrib"
gem "rake"
gem "slim"
gem "sass"
gem "data_mapper"
gem "xml-simple"
gem "kramdown"

group :development, :test do
  gem "sqlite3"
  gem "dm-sqlite-adapter"
  gem "pry"
  #gem "pry-plus" # No Ruby 2 support in pry-debug
  gem "pry-byebug" # Ruby 2 compat. pry-debug
  gem "rspec"
  gem "better_errors"
  gem "rack-test"
  gem "rb-fsevent", :require => false if RUBY_PLATFORM =~ /darwin/i
  gem "guard-rspec"
  gem "debugger-xml"

end
