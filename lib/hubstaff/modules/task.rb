require 'pry'
require 'faraday'
require 'json'

class Hubstaff::Client
  module Task

    def tasks(projects="", offset=0)
      @tasks = connection.get("tasks") do |req|
        req.params['projects'] = projects unless projects.empty?
        req.params['offset'] = offset
      end
      @task_json = JSON.parse(@tasks.body)
    end

    def find_task(task_id)
      @task = get_task("tasks/#{task_id}")
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

    def get_task(url)
      JSON.parse(connection.get(url).body)
    end

  end
end
