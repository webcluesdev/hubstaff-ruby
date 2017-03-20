class Hubstaff::Client
  module Project

    def projects(status=nil, offset=0)
      case status
      when "active" || "archived"
        project_data = connection.get("projects?status=#{status}") do |req|
          add_offset(req,offset)
        end
        project_data.body
      else
      project_data = connection.get("projects") do |req|
          add_offset(req,offset)
        end
      project_data.body
      end
    end

    def find_project(project_id)
      project_data = connection.get("projects/#{project_id}")
      project_data.body
    end

    def find_project_members(project_id, offset=0)
      project_data = connection.get("projects/#{project_id}/members") do |req|
        add_offset(req,offset)
      end
      project_data.body
    end

    private

    def add_offset(req,offset)
      req.params['offset'] = offset
    end
  end
end
