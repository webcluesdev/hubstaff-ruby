require 'spec_helper'

module Hubstaff
  describe Client do
    before(:each) do
      @client = Hubstaff::Client.new(ENV['APP_TOKEN'])
      @client.auth_token = ENV['AUTH_TOKEN']
    end

    describe  "#authenticate" do
      it "returns the users auth_token" do
        VCR.use_cassette('api/client', re_record_interval: 10000) do
          expect(@client.authenticate(ENV['APP_EMAIL'],ENV["APP_PASSWORD"])).to eq(ENV['AUTH_TOKEN'])
        end
      end
    end

    describe "#auth_token=" do
      it "sets a new auth_token" do
        @client.auth_token = ENV['APP_TOKEN']
        expect(@client.auth_token).to eq(ENV['APP_TOKEN'])
      end
    end

    describe "#reset_connection" do
      before { @client.reset_connection }

      it "resets the connection" do
        expect(@connection).to eq(nil)
      end
    end
  end
end
