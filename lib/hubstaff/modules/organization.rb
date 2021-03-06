class Hubstaff::Client
  module Organization

    def organizations(offset=0)
      org_data = connection.get("organizations") do |req|
        add_offset(req,offset)
      end
      org_data.body
    end

    def find_organization(org_id)
      org_data = connection.get("organizations/#{org_id}")
      org_data.body
    end

    def find_org_projects(org_id, offset=0)
      org_data = connection.get("organizations/#{org_id}/projects") do |req|
        add_offset(req,offset)
      end
      org_data.body
    end

    def find_org_members(org_id, offset=0)
     org_data = connection.get("organizations/#{org_id}/members") do |req|
        add_offset(req,offset)
      end
      org_data.body
    end

    private

    def add_offset(req,offset)
      req.params['offset'] = offset
    end
  end
end
