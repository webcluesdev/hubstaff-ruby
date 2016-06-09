require 'spec_helper'

class Hubstaff::Client
  describe Custom do
    before(:each) do
      @client = Hubstaff::Client.new(ENV['APP_EMAIL'], ENV['APP_PASSWORD'], ENV['AUTH_TOKEN'])
    end

    describe '#custom_date_team' do
      it "returns a custom team report by date" do
        expect(@client.custom_date_team("2016-05-23", "2016-05-25")).to be_an_instance_of(Hash)
      end
    end

    describe '#custom_date_my' do
      it "returns a custom individual report by date" do
        expect(@client.custom_date_my("2016-05-23", "2016-05-25")).to be_an_instance_of(Hash)
      end
    end

    describe '#custom_member_team' do
      it "returns a custom team report by member" do
        expect(@client.custom_member_team("2016-05-23", "2016-05-25")).to be_an_instance_of(Hash)
      end
    end

    describe '#custom_member_my' do
      it "returns a custom individual report by member" do
        expect(@client.custom_member_my("2016-05-23", "2016-05-25")).to be_an_instance_of(Hash)
      end
    end

    describe '#custom_project_team' do
      it "returns a custom team report by project" do
        expect(@client.custom_project_team("2016-05-23", "2016-05-25")).to be_an_instance_of(Hash)
      end
    end

    describe '#custom_project_my' do
      it "returns a custom individual report by project" do
        expect(@client.custom_project_my("2016-05-23", "2016-05-25")).to be_an_instance_of(Hash)
      end
    end

  end
end


