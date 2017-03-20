class Hubstaff::Client
  module Screenshot

    def screenshots(start_time, stop_time, options={})
      screenshot_data = connection.get("screenshots") do |req|
        add_time_params(req,start_time,stop_time)
        add_filters_params(req,options)
      end
      screenshot_data.body
    end

    private

    def add_time_params(req,start_time,stop_time)
      req.params['start_time'] = start_time
      req.params['stop_time'] = stop_time
    end

    def add_filters_params(req,options)
      req.params['organizations'] = options[:orgs] unless options[:orgs].nil?
      req.params['projects'] = options[:projects] unless options[:projects].nil?
      req.params['users'] = options[:users] unless options[:users].nil?
      req.params['offset'] = options[:offset] unless options[:offset].nil?
    end
  end
end
