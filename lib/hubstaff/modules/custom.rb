require 'pry'
require 'faraday'
require 'json'

class Hubstaff::Client
  module Custom

    def custom_date_team(start_time, end_time, orgs="", projects="", users="", show_tasks=false, show_notes=false, show_activity=false, include_archieved=false)
      @custom_date_team = connection.get("custom/by_date/team") do |req|
        req.params['start_time'] = start_time
        req.params['stop_time'] = end_time
        req.params['organizations'] = orgs unless orgs.empty?
        req.params['projects'] = projects unless projects.empty?
        req.params['users'] = users unless users.empty?
        req.params['show_tasks'] = show_tasks
        req.params['show_notes'] = show_notes
        req.params['show_activity'] = show_activity
        req.params['include_archieved'] = include_archieved
      end
      @custom_date_team_json = JSON.parse(@custom_date_team.body)
    end

    def custom_date_my(start_time, end_time, orgs="", projects="", users="", show_tasks=false, show_notes=false, show_activity=false, include_archieved=false)
      @custom_date_my = connection.get("custom/by_date/my") do |req|
        req.params['start_time'] = start_time
        req.params['stop_time'] = end_time
        req.params['organizations'] = orgs unless orgs.empty?
        req.params['projects'] = projects unless projects.empty?
        req.params['users'] = users unless users.empty?
        req.params['show_tasks'] = show_tasks
        req.params['show_notes'] = show_notes
        req.params['show_activity'] = show_activity
        req.params['include_archieved'] = include_archieved
      end
      @custom_date_my_json = JSON.parse(@custom_date_my.body)
    end

    def custom_member_team(start_time, end_time, orgs="", projects="", users="", show_tasks=false, show_notes=false, show_activity=false, include_archieved=false)
      @custom_member_team = connection.get("custom/by_member/team") do |req|
        req.params['start_time'] = start_time
        req.params['stop_time'] = end_time
        req.params['organizations'] = orgs unless orgs.empty?
        req.params['projects'] = projects unless projects.empty?
        req.params['users'] = users unless users.empty?
        req.params['show_tasks'] = show_tasks
        req.params['show_notes'] = show_notes
        req.params['show_activity'] = show_activity
        req.params['include_archieved'] = include_archieved
      end
      @custom_member_team_json = JSON.parse(@custom_member_team.body)
    end

    def custom_member_my(start_time, end_time, orgs="", projects="", users="", show_tasks=false, show_notes=false, show_activity=false, include_archieved=false)
      @custom_member_my = connection.get("custom/by_member/my") do |req|
        req.params['start_time'] = start_time
        req.params['stop_time'] = end_time
        req.params['organizations'] = orgs unless orgs.empty?
        req.params['projects'] = projects unless projects.empty?
        req.params['users'] = users unless users.empty?
        req.params['show_tasks'] = show_tasks
        req.params['show_notes'] = show_notes
        req.params['show_activity'] = show_activity
        req.params['include_archieved'] = include_archieved
      end
      @custom_member_my_json = JSON.parse(@custom_member_my.body)
    end

    def custom_project_team(start_time, end_time, orgs="", projects="", users="", show_tasks=false, show_notes=false, show_activity=false, include_archieved=false)
      @custom_project_team = connection.get("custom/by_project/team") do |req|
        req.params['start_time'] = start_time
        req.params['stop_time'] = end_time
        req.params['organizations'] = orgs unless orgs.empty?
        req.params['projects'] = projects unless projects.empty?
        req.params['users'] = users unless users.empty?
        req.params['show_tasks'] = show_tasks
        req.params['show_notes'] = show_notes
        req.params['show_activity'] = show_activity
        req.params['include_archieved'] = include_archieved
      end
      @custom_project_team_json = JSON.parse(@custom_project_team.body)
    end

    def custom_project_my(start_time, end_time, orgs="", projects="", users="", show_tasks=false, show_notes=false, show_activity=false, include_archieved=false)
      @custom_project_my = connection.get("custom/by_project/my") do |req|
        req.params['start_time'] = start_time
        req.params['stop_time'] = end_time
        req.params['organizations'] = orgs unless orgs.empty?
        req.params['projects'] = projects unless projects.empty?
        req.params['users'] = users unless users.empty?
        req.params['show_tasks'] = show_tasks
        req.params['show_notes'] = show_notes
        req.params['show_activity'] = show_activity
        req.params['include_archieved'] = include_archieved
      end
      @custom_project_my_json = JSON.parse(@custom_project_my.body)
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
