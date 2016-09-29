require 'spec_helper'

class Hubstaff::Client
  describe Weekly do
    before(:each) do
      @client = Hubstaff::Client.new(ENV['APP_TOKEN'])
      @client.auth_token = ENV['AUTH_TOKEN']
    end

    describe '#weekly_team' do
      it "returns a weekly team report with default settings" do
        VCR.use_cassette('weekly/weekly_team', re_record_interval: 1000) do
          req = @client.weekly_team
          expect(req.success?).to be_truthy
        end
      end

      it "returns a weekly team report with a specific date in week" do
        VCR.use_cassette('weekly/weekly_team_date', re_record_interval: 1000) do
          req = @client.weekly_team(date: "2016-05-24")
          expect(req.success?).to be_truthy
        end
      end

      it "returns a weekly team report with a specific orgnaization" do
        VCR.use_cassette('weekly/weekly_team_org', re_record_interval: 1000) do
          req = @client.weekly_team(date: "2016-05-24", orgs: "27572")
          expect(req.success?).to be_truthy
        end
      end

      it "returns a weekly team report with a specific project" do
        VCR.use_cassette('weekly/weekly_team_project', re_record_interval: 1000) do
          req = @client.weekly_team(date: "2016-05-24", projects: "112761")
          expect(req.success?).to be_truthy
        end
      end

      it "returns a weekly team report with a specific user" do
        VCR.use_cassette('weekly/weekly_team_user', re_record_interval: 1000) do
          req = @client.weekly_team(date: "2016-05-24", users: "61188")
          expect(req.success?).to be_truthy
        end
      end
    end

    describe '#weekly_my' do
      it "returns a weekly individual report with default settings" do
        VCR.use_cassette('weekly/weekly_my', re_record_interval: 1000) do
          req = @client.weekly_my
          expect(req.success?).to be_truthy
        end
      end

      it "returns a weekly individual report with a specific date in week" do
        VCR.use_cassette('weekly/weekly_my_date', re_record_interval: 1000) do
          req = @client.weekly_my(date: "2016-05-24")
          expect(req.success?).to be_truthy
        end
      end

      it "returns a weekly individual report with a specific orgnaization" do
        VCR.use_cassette('weekly/weekly_my_org', re_record_interval: 1000) do
          req = @client.weekly_my(date: "2016-05-24", orgs: "27572")
          expect(req.success?).to be_truthy
        end
      end

      it "returns a weekly individual report with a specific project" do
        VCR.use_cassette('weekly/weekly_my_project', re_record_interval: 1000) do
          req = @client.weekly_my(date: "2016-05-24", projects: "112761")
          expect(req.success?).to be_truthy
        end
      end

      it "returns a weekly individual report with a specific user" do
        VCR.use_cassette('weekly/weekly_my_user', re_record_interval: 1000) do
          req = @client.weekly_my(date: "2016-05-24", users: "61188")
          expect(req.success?).to be_truthy
        end
      end
    end
  end
end
