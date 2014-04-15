ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'minitest/reporters'
require 'rack/test'
require_relative '../app'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

include Rack::Test::Methods

def app
  Sinatra::Application
end
