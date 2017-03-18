require 'spec_helper'

class Hubstaff::Client
  describe Screenshot do
    before(:each) do
      @client = Hubstaff::Client.new(ENV['APP_TOKEN'])
      @client.auth_token = ENV['AUTH_TOKEN']
    end

describe '#screenshots' do
      it "returns a collection of screenshots for a specific organization" do
        VCR.use_cassette('screen/screenshots_org', re_record_interval: 1000) do
          req = @client.screenshots("2017-03-10", "2017-03-15", orgs: "27572")
          expect(req.success?).to be_truthy
        end
      end

      it "returns a collection of screenshots for a specific project" do
        VCR.use_cassette('screen/screenshots_project', re_record_interval: 1000) do
          req = @client.screenshots("2017-03-10", "2017-03-15", projects: "112761")
          expect(req.success?).to be_truthy
        end
      end

      it "returns a collection of screenshots for a specific user" do
        VCR.use_cassette('screen/screenshots_user', re_record_interval: 1000) do
          req = @client.screenshots("2017-03-10", "2017-03-15", users: "61188")
          expect(req.success?).to be_truthy
        end
      end
    end
  end
end
