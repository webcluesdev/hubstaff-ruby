require 'spec_helper'

class Hubstaff::Client
  describe Activity do
    before(:each) do
      @client = Hubstaff::Client.new(ENV['APP_TOKEN'])
      @client.auth_token = ENV['AUTH_TOKEN']
    end

    describe '#activities' do
      it "returns a collection of all activities" do
        VCR.use_cassette 'activity/activities' do
          expect(@client.activities("2016-05-24", "2016-05-24")).to be_an_instance_of(Hash)
        end
      end

      it "returns a collection of activities for a specific org" do
        VCR.use_cassette 'activity/activities_org' do
          expect(@client.activities("2016-05-24", "2016-05-24", orgs: "27572")).to be_an_instance_of(Hash)
        end
      end

      it "returns a collection of activities for a specific project" do
        VCR.use_cassette 'activity/activities_project' do
          expect(@client.activities("2016-05-24", "2016-05-24", projects: "112761")).to be_an_instance_of(Hash)
        end
      end

      it "returns a collection of activities for a specific user" do
        VCR.use_cassette 'activity/activites_user' do
          expect(@client.activities("2016-05-24", "2016-05-24", users: "61188")).to be_an_instance_of(Hash)
        end
      end

      it "returns a collection of activities starting at a offset" do
        VCR.use_cassette 'activity/activites_offset' do
          expect(@client.activities("2016-05-24", "2016-05-24", offset: 0)).to be_an_instance_of(Hash)
        end
      end
    end
  end
end
