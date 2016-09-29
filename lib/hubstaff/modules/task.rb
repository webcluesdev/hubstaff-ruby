class Hubstaff::Client
  module Task

    def tasks(projects, offset=0)
      connection.get("tasks") do |req|
        req.params['projects'] = projects #unless projects.empty?
        req.params['offset'] = offset
      end
    end

    def find_task(task_id)
      connection.get("tasks/#{task_id}")
    end
  end
end
