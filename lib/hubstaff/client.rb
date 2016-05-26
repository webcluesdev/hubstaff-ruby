require 'pry'
require 'faraday'
require 'json'

class Hubstaff::Client

  def authenticate_client_and_return_auth_token
    @response ||= Faraday.post do |req|
      req.url "https://api.hubstaff.com/v1/auth"
      req.headers['Content-Type'] = 'application/json'
      req.headers['App-Token'] = ENV['APP_TOKEN']
      req.params['email'] = ENV['APP_EMAIL']
      req.params['password'] = ENV['APP_PASSWORD']
    end
    @auth_token = JSON.parse(@response.body)['user']['auth_token']
  end
end

