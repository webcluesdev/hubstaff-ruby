class Hubstaff::Client
  module Task
    def tasks(projects, offset=0)
      task_data = connection.get("tasks") do |req|
        req.params['projects'] = projects unless projects.empty?
        req.params['offset'] = offset
      end
      task_data.body
    end

    def find_task(task_id)
      task_data = connection.get("tasks/#{task_id}")
      task_data.body
    end
  end
end