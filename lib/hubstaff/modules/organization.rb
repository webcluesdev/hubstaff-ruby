require 'faraday'
require 'json'

class Hubstaff::Client
  module Organization

    def organizations(offset=0)
      @orgs = connection.get("organizations") do |req|
        req.params['offset'] = offset
      end
      @org_json = JSON.parse(@orgs.body)
    end

    def find_organization(org_id)
      @found_org = get_url("organizations/#{org_id}")
    end

    def find_org_projects(org_id, offset=0)
      @org_projects = connection.get("organizations/#{org_id}/projects") do |req|
        req.params['offset'] = offset
      end
      @org_project_json = JSON.parse(@org_projects.body)
    end

    def find_org_members(org_id, offset=0)
      @org_members = connection.get("organizations/#{org_id}/members") do |req|
        req.params['offset'] = offset
      end
      @org_member_json = JSON.parse(@org_members.body)
    end

    private

    def connection
      Faraday.new(:url => "https://api.hubstaff.com/v1/") do |req|
        req.headers['Content-Type'] = 'application/json'
        req.headers['User-Agent'] = "Hubstaff-Ruby v#{Hubstaff::VERSION}"
        req.headers['Auth-Token'] = self.auth_token
        req.headers['App-Token'] = ENV['APP_TOKEN']
        req.adapter Faraday.default_adapter
      end
    end

    def get_url(url)
      JSON.parse(connection.get(url).body)
    end
  end
end
