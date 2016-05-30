require 'spec_helper'

class Hubstaff::Client
  describe Screenshot do
    before(:all) do
      @client = Hubstaff::Client.new
    end

    describe '#screenshots' do
      it "returns a collection of screenshots" do
      expect(@client.screenshots("2016-05-24", "2016-05-24")).to be_an_instance_of(Hash)
      end
    end
  end
end
