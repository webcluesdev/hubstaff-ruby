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

  def initialize(app_token=nil, auth_token=nil)
    @app_token = app_token
    @auth_token = auth_token
  end

  def authenticate(email, password)
    response = auth_conn.post do |req|
      req.headers['App-Token'] = app_token
      req.body = { email: email, password: password }
    end
    auth_token = JSON.parse(response.body)['user']['auth_token']
  end

  def auth_conn
    @auth_conn ||= Faraday.new(:url => "https://api.hubstaff.com/v1/auth") do |req|
      req.request :multipart
      req.request :url_encoded
      req.adapter :net_http
    end
  end

  def connection
   @connection ||= Faraday.new do |req|
      req.url_prefix = "https://api.hubstaff.com/v1/"
      req.adapter :net_http

      req.headers['Content-Type'] = "application/json"
      req.headers['User-Agent'] = "Hubstaff-Ruby v#{Hubstaff::VERSION}"
      req.headers['App-Token'] =  app_token
      req.headers['Auth-Token'] = auth_token
    end
  end

  def get_json(url)
    data = connection.get(url).body
    JSON.parse(data)
  end
end