class Hubstaff::Client
  module Weekly
    def weekly_team(options={})
      weekly_data = connection.get("weekly/team") do |req|
        add_filter_params(req,options)
      end
      weekly_data.body
    end

    def weekly_my(options={})
      weekly_data = connection.get("weekly/my") do |req|
        add_filter_params(req,options)
      end
      weekly_data.body
    end

    def add_filter_params(req,options)
      req.params['date'] = options[:date] unless options[:date].nil?
      req.params['organizations'] = options[:orgs] unless options[:orgs].nil?
      req.params['projects'] = options[:projects] unless options[:projects].nil?
      req.params['users'] = options[:users] unless options[:users].nil?
    end
  end
end
