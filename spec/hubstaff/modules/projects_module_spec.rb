require 'spec_helper'

class Hubstaff::Client
  describe Project do
    before(:each) do
      @client = Hubstaff::Client.new(ENV['APP_TOKEN'])
      @client.auth_token = ENV['AUTH_TOKEN']
    end

    describe '#projects' do
      it "returns a collection of projects" do
        VCR.use_cassette('project/projects', re_record_interval: 1000) do
          req = @client.projects
          expect(req.success?).to be_truthy
          expect(req.body).to be_an_instance_of(Hash)
        end
      end

      it "returns only active projects" do
        VCR.use_cassette('project/projects_active', re_record_interval: 1000) do
          req = @client.projects("active")
          expect(req.success?).to be_truthy
          expect(req.body).to be_an_instance_of(Hash)
        end
      end

      it "returns only archieved projects" do
        VCR.use_cassette('project/projects_archieved', re_record_interval: 1000) do
          req = @client.projects("archieved")
          expect(req.success?).to be_truthy
          expect(req.body).to be_an_instance_of(Hash)
        end
      end
    end

    describe '#find_project' do
      it "returns a specific project" do
        VCR.use_cassette('project/find_project', re_record_interval: 1000) do
          req = @client.find_project("112761")
          expect(req.success?).to be_truthy
          expect(req.body).to be_an_instance_of(Hash)
        end
      end
    end

    describe '#find_project_members' do
      it "returns a collection of members for a specific project" do
        VCR.use_cassette('project/find_project_members', re_record_interval: 1000) do
          req = @client.find_project_members("112761")
          expect(req.success?).to be_truthy
          expect(req.body).to be_an_instance_of(Hash)
        end
      end
    end
  end
end
