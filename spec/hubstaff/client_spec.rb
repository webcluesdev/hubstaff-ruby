require 'spec_helper'

module Hubstaff
  describe Client do
    before(:each) do
      @client = Hubstaff::Client.new(ENV['APP_TOKEN'],ENV['AUTH_TOKEN'])
    end
    describe  "#authenticate" do
      it "returns the users auth_token" do
        VCR.use_cassette('api/client', re_record_interval: 1000) do
          expect(@client.authenticate(ENV['APP_EMAIL'],ENV["APP_PASSWORD"])).to eq(ENV['AUTH_TOKEN'])
        end
      end
    end
  end
end