require 'spec_helper'

class Hubstaff::Client
  describe Organization do
    before(:each) do
      @client = Hubstaff::Client.new(ENV['APP_TOKEN'])
      @client.auth_token = ENV['AUTH_TOKEN']
    end

    describe '#organizations' do
      it "returns a collection of organizations" do
        VCR.use_cassette('org/orgs', re_record_interval: 1000) do
          req = @client.organizations
          expect(req).to be_an_instance_of(Hash)
        end
      end
    end

    describe '#find_organization' do
      it "returns a specific organization" do
        VCR.use_cassette('org/find_org', re_record_interval: 1000) do
          req = @client.find_organization("27572")
          expect(req).to be_an_instance_of(Hash)
        end
      end
    end

    describe "find_org_projects" do
      it "returns active projects for a specific organization" do
        VCR.use_cassette('org/find_org_project', re_record_interval: 1000) do
          req = @client.find_org_projects("27572")
          expect(req).to be_an_instance_of(Hash)
        end
      end
    end

    describe "find_org_members" do
      it "returns a collection of users that are members of a specific org" do
        VCR.use_cassette('org/find_org_members', re_record_interval: 1000) do
          req = @client.find_org_members("27572")
          expect(req).to be_an_instance_of(Hash)
        end
      end
    end
  end
end
