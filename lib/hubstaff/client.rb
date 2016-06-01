require 'pry'
require 'faraday'
require 'json'
require 'hubstaff/modules/user.rb'
require 'hubstaff/modules/organization'
require 'hubstaff/modules/project'
require 'hubstaff/modules/activity'
require 'hubstaff/modules/screenshot'


class Hubstaff::Client
  include User
  include Organization
  include Project
  include Activity
  include Screenshot


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
