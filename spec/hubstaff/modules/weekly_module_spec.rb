require 'spec_helper'

class Hubstaff::Client
  describe Weekly do
    before(:each) do
      @client = Hubstaff::Client.new(ENV['APP_TOKEN'])
      @client.auth_token = ENV['AUTH_TOKEN']
    end

    describe '#weekly_team' do
      it "returns a weekly team report with default settings" do
        VCR.use_cassette 'weekly/weekly_team' do
          expect(@client.weekly_team["organizations"]).to be_an_instance_of(Array)
        end
      end

      it "returns a weekly team report with a specific date in week" do
        VCR.use_cassette 'weekly/weekly_team_date' do
          expect(@client.weekly_team(date: "2016-05-24")["organizations"][0]["name"]).to eq("Hook Engine")
        end
      end

      it "returns a weekly team report with a specific orgnaization" do
        VCR.use_cassette 'weekly/weekly_team_org' do
          expect(@client.weekly_team(date: "2016-05-24", orgs: "27572")["organizations"][0]["name"]).to eq("Hook Engine")
        end
      end

      it "returns a weekly team report with a specific project" do
        VCR.use_cassette 'weekly/weekly_team_project' do
          expect(@client.weekly_team(date: "2016-05-24", projects: "112761")["organizations"][0]["name"]).to eq("Hook Engine")
        end
      end

      it "returns a weekly team report with a specific user" do
        VCR.use_cassette 'weekly/weekly_team_user' do
          expect(@client.weekly_team(date: "2016-05-24", users: "61188")["organizations"][0]["name"]).to eq("Hook Engine")
        end
      end

    end

    describe '#weekly_my' do
      it "returns a weekly individual report with default settings" do
        VCR.use_cassette 'weekly/weekly_my' do
          expect(@client.weekly_my["organizations"]).to be_an_instance_of(Array)
        end
      end

      it "returns a weekly individual report with a specific date in week" do
        VCR.use_cassette 'weekly/weekly_my_date' do
          expect(@client.weekly_my(date: "2016-05-24")["organizations"][0]["name"]).to eq("Hook Engine")
        end
      end

      it "returns a weekly individual report with a specific orgnaization" do
        VCR.use_cassette 'weekly/weekly_my_org' do
          expect(@client.weekly_my(date: "2016-05-24", orgs: "27572")["organizations"][0]["name"]).to eq("Hook Engine")
        end
      end

      it "returns a weekly individual report with a specific project" do
        VCR.use_cassette 'weekly/weekly_my_project' do
          expect(@client.weekly_my(date: "2016-05-24", projects: "112761")["organizations"][0]["name"]).to eq("Hook Engine")
        end
      end

      it "returns a weekly individual report with a specific user" do
        VCR.use_cassette 'weekly/weekly_my_user' do
          expect(@client.weekly_my(date: "2016-05-24", users: "61188")["organizations"][0]["name"]).to eq("Hook Engine")
        end
      end
    end

  end
end