require './bin/app.rb'
require 'test/unit'
require 'rack/test'
require 'pry'

class MyAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_my_default
    get '/'
    # assert last_response.ok?
    # assert last_response.body.include?('Central Corridor')
    # assert last_response.body.include?(Room::CENTRAL_CORRIDOR.description)

  end

  def test_hello_form
    get '/hello/'
    # assert last_response.body.include?('Your Name')
  end

  def test_hello_form_post
    # post '/hello/', params={:name => 'Frank', :greeting => "Hi"}
    # assert last_response.ok?
    # assert last_response.body.include?('I just wanted to say')
  end
end
