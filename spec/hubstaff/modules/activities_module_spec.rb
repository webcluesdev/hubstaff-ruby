require 'spec_helper'

class Hubstaff::Client
  describe Activity do
    before(:each) do
      @client = Hubstaff::Client.new(ENV['APP_TOKEN'])
      @client.auth_token = ENV['AUTH_TOKEN']
    end

    describe '#activities' do
      it "returns a collection of all activities" do
        VCR.use_cassette('activity/activities', re_record_interval: 1000) do
          req = @client.activities("2017-03-07", "2017-03-14")
          expect(req.success?).to be_truthy
          expect(req.body).to be_an_instance_of(Hash)
        end
      end

      it "returns a collection of activities for a specific org" do
        VCR.use_cassette('activity/activities_org', re_record_interval: 1000) do
          req = @client.activities("2017-03-07", "2017-03-14", orgs: "27572")
          expect(req.success?).to be_truthy
          expect(req.body).to be_an_instance_of(Hash)
        end
      end

      it "returns a collection of activities for a specific project" do
        VCR.use_cassette('activity/activities_project', re_record_interval: 1000) do
          req = @client.activities("2017-03-07", "2017-03-14", projects: "112761")
          expect(req.success?).to be_truthy
          expect(req.body).to be_an_instance_of(Hash)
        end
      end

      it "returns a collection of activities for a specific user" do
        VCR.use_cassette('activity/activites_user', re_record_interval: 1000) do
          req = @client.activities("2017-03-07", "2017-03-14", users: "61188")
          expect(req.success?).to be_truthy
          expect(req.body).to be_an_instance_of(Hash)
        end
      end

      it "returns a collection of activities starting at a offset" do
        VCR.use_cassette('activity/activites_offset', re_record_interval: 1000)do
          req = @client.activities("2017-03-07", "2017-03-14", offset: 0)
          expect(req.success?).to be_truthy
          expect(req.body).to be_an_instance_of(Hash)
        end
      end
    end
  end
end
