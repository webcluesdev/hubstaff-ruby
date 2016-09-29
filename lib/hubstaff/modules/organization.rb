class Hubstaff::Client
  module Organization

    def organizations(offset=0)
      connection.get("organizations") do |req|
        req.params['offset'] = offset
      end
    end

    def find_organization(org_id)
      connection.get("organizations/#{org_id}")
    end

    def find_org_projects(org_id, offset=0)
      connection.get("organizations/#{org_id}/projects") do |req|
        req.params['offset'] = offset
      end
    end

    def find_org_members(org_id, offset=0)
      connection.get("organizations/#{org_id}/members") do |req|
        req.params['offset'] = offset
      end
    end
  end
end
