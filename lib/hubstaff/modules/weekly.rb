require 'pry'
require 'faraday'
require 'json'

class Hubstaff::Client
  module Weekly

    def weekly_team(date="", orgs="", projects="", users="")
      @weekly_team_report = connection.get("weekly/team") do |req|
        req.params['date'] = date unless date.empty?
        req.params['organizations'] = orgs unless orgs.empty?
        req.params['projects'] = projects unless projects.empty?
        req.params['users'] = users unless users.empty?
      end
      @weekly_team_json = JSON.parse(@weekly_team_report.body)
    end

    def weekly_my(date="", orgs="", projects="", users="")
      @weekly_team_report = connection.get("weekly/my") do |req|
        req.params['date'] = date unless date.empty?
        req.params['organizations'] = orgs unless orgs.empty?
        req.params['projects'] = projects unless projects.empty?
        req.params['users'] = users unless users.empty?
      end
      @weekly_team_json = JSON.parse(@weekly_team_report.body)
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
  end
end


