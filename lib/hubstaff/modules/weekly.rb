class Hubstaff::Client
  module Weekly
    def weekly_team(options={})
      connection.get("weekly/team") do |req|
        add_filter_params(req,options)
        parse_response(req)
      end
    end

    def weekly_my(options={})
      connection.get("weekly/my") do |req|
        add_filter_params(req,options)
        parse_response(req)
      end
    end

    def add_filter_params(req,options)
      req.params['date'] = options[:date] unless options[:date].nil?
      req.params['organizations'] = options[:orgs] unless options[:orgs].nil?
      req.params['projects'] = options[:projects] unless options[:projects].nil?
      req.params['users'] = options[:users] unless options[:users].nil?
    end
  end
end
