require 'spec_helper'

class Hubstaff::Client
  describe Activity do
    before(:all) do
      @client = Hubstaff::Client.new
    end

    describe '#activities' do
      it "returns a collection of activities" do
        expect(@client.activities("2016-05-24", "2016-05-24", "27572, 27573")).to be_an_instance_of(Hash)
      end
    end
  end
end
