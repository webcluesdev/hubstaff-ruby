class Hubstaff::Client
  module Project

    def projects(status=nil, offset=0)
      case status
      when "active" || "archived"
        connection.get("projects?status=#{status}") do |req|
          req.params['offset'] = offset
        end
      else
      connection.get("projects") do |req|
          req.params['offset'] = offset
        end
      end
    end

    def find_project(project_id)
      connection.get("projects/#{project_id}")
    end

    def find_project_members(project_id, offset=0)
      connection.get("projects/#{project_id}/members") do |req|
        req.params['offset'] = offset
      end
    end
  end
end
