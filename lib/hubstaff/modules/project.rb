require 'faraday'
require 'json'

class Hubstaff::Client
  module Project

    def projects(active=nil, offset=0)
      if active == "active" || active == "archived"
        @projects = connection.get("projects?status=#{active}") do |req|
          req.params['offset'] = offset
        end
        @project_json = JSON.parse(@projects.body)
      else
        @projects = connection.get("projects") do |req|
          req.params['offset'] = offset
        end
        @project_json = JSON.parse(@projects.body)
      end
    end

    def find_project(project_id)
      @project = get_project("projects/#{project_id}")
    end

    def find_project_members(project_id, offset=0)
      @members = connection.get("projects/#{project_id}/members") do |req|
        req.params['offset'] = offset
      end
      @members_json = JSON.parse(@members.body)
    end

    private

    def connection
      Faraday.new(:url => "https://api.hubstaff.com/v1") do |req|
        req.headers['Content-Type'] = 'application/json'
        req.headers['User-Agent'] = "Hubstaff-Ruby v#{Hubstaff::VERSION}"
        req.headers['Auth-Token'] = self.auth_token
        req.headers['App-Token'] = ENV['APP_TOKEN']
        req.adapter Faraday.default_adapter
      end
    end

    def get_project(url)
      JSON.parse(connection.get(url).body)
    end
  end
end
