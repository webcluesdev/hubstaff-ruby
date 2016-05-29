require 'pry'
require 'faraday'
require 'json'

class Hubstaff::Client
  module User

    def users(org_member=false, project_member=false)
      @users ||= Faraday.get do |req|
        req.url "https://api.hubstaff.com/v1/users"
        req.headers['Content-Type'] = 'application/json'
        req.headers['Auth-Token'] = ENV['AUTH_TOKEN']
        req.headers['App-Token'] = ENV['APP_TOKEN']
        req.params['organization_memberships'] = org_member
        req.params['project_memberships'] = project_member
      end
      @users_json = JSON.parse(@users.body)
    end

    def find_user(user_id)
      @user = Faraday.get do |req|
        req.url "https://api.hubstaff.com/v1/users/#{user_id}"
        req.headers['Content-Type'] = 'application/json'
        req.headers['Auth-Token'] = ENV['AUTH_TOKEN']
        req.headers['App-Token'] = ENV['APP_TOKEN']
      end
      @found_user = JSON.parse(@user.body)
    end

    def find_user_orgs(user_id)
      @user_orgs = Faraday.get do |req|
        req.url "https://api.hubstaff.com/v1/users/#{user_id}/organizations"
        req.headers['Content-Type'] = 'application/json'
        req.headers['Auth-Token'] = ENV['AUTH_TOKEN']
        req.headers['App-Token'] = ENV['APP_TOKEN']
      end
      @orgs_json = JSON.parse(@user_orgs.body)
    end
    def find_user_projects(user_id)
      @user_projects = Faraday.get do |req|
        req.url "https://api.hubstaff.com/v1/users/#{user_id}/projects"
        req.headers['Content-Type'] = 'application/json'
        req.headers['Auth-Token'] = ENV['AUTH_TOKEN']
        req.headers['App-Token'] = ENV['APP_TOKEN']
      end
      @project_json = JSON.parse(@user_projects.body)
    end
  end
end
