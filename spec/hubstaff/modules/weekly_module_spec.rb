require 'spec_helper'

class Hubstaff::Client
  describe Weekly do
    before(:each) do
      @client = Hubstaff::Client.new(ENV['APP_EMAIL'], ENV['APP_PASSWORD'], ENV['AUTH_TOKEN'])
    end

    describe '#weekly_team' do
      it "returns a weekly team report" do
        expect(@client.weekly_team("2016-05-24")).to be_an_instance_of(Hash)
      end
    end

    describe '#weekly_my' do
      it "returns a weekly individual report" do
        expect(@client.weekly_my("2016-05-24")).to be_an_instance_of(Hash)
      end
    end

  end
end


