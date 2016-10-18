class Hubstaff::Client
  module Task
    def tasks(projects, offset=0)
      connection.get("tasks") do |req|
        req.params['projects'] = projects unless projects.empty?
        req.params['offset'] = offset
        parse_response(req)
      end
    end

    def find_task(task_id)
      connection.get("tasks/#{task_id}") do |req|
        parse_response(req)
      end
    end
  end
end
