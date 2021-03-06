Dir[File.join(__dir__, 'modules', '*.rb')].each {|file| require file }

module Hubstaff
  class Client
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
      new_token = auth_conn.post do |req|
        req.headers['App-Token'] = app_token
        req.params = { email: email, password: password }
      end
      parse_token(new_token)
    end

    def parse_token(new_token)
      if new_token.body['error'].nil?
        @auth_token = new_token.body['user']['auth_token']
      else
        return new_token.body['error']
      end
    end

    def auth_token=(new_token)
      @auth_token = new_token
      reset_connection
    end

    def auth_token
      @auth_token
    end

    def reset_connection
      @connection = nil
    end

    def connection
      @connection ||= Faraday.new do |req|
        req.adapter :net_http
        req.url_prefix = "https://api.hubstaff.com/v1/"
        req_headers(req)
        req.headers['App-Token'] =  app_token
        req.headers['Auth-Token'] = auth_token
        req.response :json, content_type: /\bjson$/
      end
    end

    def auth_conn
      @auth_conn ||= Faraday.new(:url => "https://api.hubstaff.com/v1/auth") do |req|
        req.adapter :net_http
        req.request :multipart
        req.request :url_encoded
        req_headers(req)
        req.response :json, content_type: /\bjson$/
      end
    end

    def req_headers(req)
      req.headers['Content-Type'] = content_type
      req.headers['User-Agent'] = "Hubstaff-Ruby v#{Hubstaff::VERSION}"
      req.headers['Accept'] = "*/*"
    end

    def content_type
      "application/json"
    end
  end
end