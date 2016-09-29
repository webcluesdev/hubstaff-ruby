require 'spec_helper'

class Hubstaff::Client
  describe Task do
    before(:each) do
      @client = Hubstaff::Client.new(ENV['APP_TOKEN'])
      @client.auth_token = ENV['AUTH_TOKEN']
    end

    describe '#tasks' do
      it "returns a collection of tasks" do
        VCR.use_cassette('task/tasks',re_record_interval: 10) do
          req = @client.tasks(projects: "112761")
          expect(req.success?).to be_truthy
          #expect(@client.tasks(projects: "112761")).to be_an_instance_of(Hash)
        end
      end

      it "returns a collection of tasks for a specific project" do
        VCR.use_cassette('task/tasks_project', re_record_interval: 10) do
          req = @client.tasks(projects:"112761")
          expect(req.success?).to be_truthy
          #expect(@client.tasks(projects: "112761")).to be_an_instance_of(Hash)
        end
      end

      it "returns a collection of tasks with a offset" do
        VCR.use_cassette('task/tasks_offset', re_record_interval: 10)do
          req = @client.tasks(offset: 0)
          expect(req.success?).to be_truthy
          #expect(@client.tasks(offset: 0)).to be_an_instance_of(Hash)
        end
      end
    end

    describe '#find_task' do
      it "returns a specific task" do
        VCR.use_cassette('task/find_task', re_record_interval: 10) do
          req = @client.find_task("716530")
          expect(req.success?).to be_truthy
          #expect(@client.find_task(716530)).to be_an_instance_of(Hash)
        end
      end
    end
  end
end
