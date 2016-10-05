class Hubstaff::Client
  module User

    def users(org_member=false, project_member=false, offset=0)
      connection.get("users") do |req|
        req.params['organization_memberships'] = org_member
        req.params['project_memberships'] = project_member
        req.params['offset'] = offset
        parse_response(req)
      end
    end

    def find_user(user_id)
      connection.get("users/#{user_id}")
    end

    def find_user_orgs(user_id, offset=0)
      connection.get("users/#{user_id}/organizations") do |req|
        req.params['offset'] = offset
        parse_response(req)
      end
    end

    def find_user_projects(user_id, offset=0)
      projects = connection.get("users/#{user_id}/projects") do |req|
        req.params['offset'] = offset
        parse_response(req)
      end
    end
  end
end
