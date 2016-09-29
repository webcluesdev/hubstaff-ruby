Dir[File.join(__dir__, 'modules', '*.rb')].each {|file| require file }

class Hubstaff::Client
  include User
  include Organization
  include Project
  include Activity
  include Screenshot
  include Note
  include Weekly
  include Task
  include Custom

  attr_accessor :app_token, :auth_token

  def initialize(app_token=nil)
    @app_token = app_token
    @auth_token = auth_token
  end

  def authenticate(email, password)
    reset_connection
    response = auth_conn.post do |req|
      req.headers['App-Token'] = app_token
      req.body = { email: email, password: password }
    end
      new_token = JSON.parse(response.body)['user']['auth_token']
      @auth_token = new_token
  end

  def auth_token=(new_token)
    @auth_token = new_token
    reset_connection
  end

  def reset_connection
    @connection = nil
  end

  def auth_conn
    @auth_conn ||= Faraday.new(:url => "https://api.hubstaff.com/v1/auth") do |req|
      req.request :multipart
      req.request :url_encoded
      req.response :json, content_type: /\bjson$/
      req.adapter :net_http
    end
  end

  def content_type
    "application/json"
  end

  def connection
   @connection ||= Faraday.new do |req|
      req.url_prefix = "https://api.hubstaff.com/v1/"
      req.response :json, content_type: /\bjson$/

      req.headers['Content-Type'] = content_type
      req.headers['User-Agent'] = "Hubstaff-Ruby v#{Hubstaff::VERSION}"
      req.headers['App-Token'] =  app_token
      req.headers['Auth-Token'] = auth_token

      req.adapter :net_http
    end
  end
end
