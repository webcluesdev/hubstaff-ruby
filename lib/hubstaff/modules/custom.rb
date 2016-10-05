class Hubstaff::Client
  module Custom

    def custom_date_team(start_date, end_date, options={})
      connection.get("custom/by_date/team") do |req|
        add_date_params(req,start_date, end_date)
        add_filter_params(req, options)
        parse_response(req)
      end
    end

    def custom_date_my(start_date, end_date, options={})
      connection.get("custom/by_date/my") do |req|
        add_date_params(req,start_date, end_date)
        add_filter_params(req, options)
        parse_response(req)
      end
    end

    def custom_member_team(start_date, end_date, options={})
      connection.get("custom/by_member/team") do |req|
        add_date_params(req,start_date, end_date)
        add_filter_params(req, options)
        parse_response(req)
      end
    end

    def custom_member_my(start_date, end_date, options={})
      connection.get("custom/by_member/my") do |req|
        add_date_params(req,start_date, end_date)
        add_filter_params(req, options)
        parse_response(req)
      end
    end

    def custom_project_team(start_date, end_date, options={})
      connection.get("custom/by_project/team") do |req|
        add_date_params(req,start_date, end_date)
        add_filter_params(req, options)
        parse_response(req)
      end
    end

    def custom_project_my(start_date, end_date, options={})
      connection.get("custom/by_project/my") do |req|
        add_date_params(req,start_date, end_date)
        add_filter_params(req, options)
        parse_response(req)
      end
    end

    private

    def add_date_params(req,start_date,end_date)
      req.params['start_date'] = start_date
      req.params['end_date'] = end_date
    end

    def add_filter_params(req, options)
      req.params['organizations'] = options[:orgs] unless options[:orgs].nil?
      req.params['projects'] = options[:projects] unless options[:projects].nil?
      req.params['users'] = options[:users] unless options[:users].nil?
      req.params['show_tasks'] = options[:show_tasks] unless options[:show_tasks].nil?
      req.params['show_notes'] = options[:show_notes] unless options[:show_notes].nil?
      req.params['show_activity'] = options[:show_activity] unless options[:show_activity].nil?
      req.params['include_archieved'] = options[:include_archieved] unless options[:include_archieved].nil?
    end
  end
end
