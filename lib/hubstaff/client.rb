require 'pry'
require 'faraday'
require 'json'
<<<<<<< HEAD
require 'hubstaff/modules/user.rb'

class Hubstaff::Client
  include User
=======
require 'hubstaff/modules/organization'

class Hubstaff::Client
  include Organization
>>>>>>> e7c508f7625e351f54e37de15331ea619032d41d

  def authenticate_client_and_return_auth_token(email, password)
    @response ||= Faraday.post do |req|
      req.url "https://api.hubstaff.com/v1/auth"
      req.headers['Content-Type'] = 'application/json'
      req.headers['App-Token'] = ENV['APP_TOKEN']
      req.params['email'] = email
      req.params['password'] = password
    end
    @auth_token = JSON.parse(@response.body)['user']['auth_token']
  end
end
