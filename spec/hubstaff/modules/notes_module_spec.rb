require 'spec_helper'

class Hubstaff::Client
  describe Note do
    before(:each) do
      @client = Hubstaff::Client.new(ENV['APP_TOKEN'])
      @client.auth_token = ENV['AUTH_TOKEN']
    end

    describe '#notes' do
      it "returns a collection of notes" do
        VCR.use_cassette('note/notes', re_record_interval: 1000) do
          req = @client.notes("2016-05-23", "2016-05-25")
          expect(req.success?).to be_truthy
        end
      end

      it "returns a collection of notes for a specific organization" do
        VCR.use_cassette('note/notes_org', re_record_interval: 1000) do
          req = @client.notes("2016-05-23", "2016-05-25", orgs: "27572")
          expect(req.success?).to be_truthy
        end
      end

      it "returns a collection of notes for a specific project" do
        VCR.use_cassette('note/notes_project', re_record_interval: 1000) do
          req = @client.notes("2016-05-23", "2016-05-25", projects: "112761")
          expect(req.success?).to be_truthy
        end
      end

      it "returns a collection of notes for a specific user" do
        VCR.use_cassette 'note/notes_user' do
          req = @client.notes("2016-05-23", "2016-05-25", users: "61188")
          expect(req.success?).to be_truthy
        end
      end

      it "returns a collection of notes with a offset" do
        VCR.use_cassette('note/notes_offset', re_record_interval: 1000) do
          req = @client.notes("2016-05-23", "2016-05-25", offset: 0)
          expect(req.success?).to be_truthy
        end
      end
    end

    describe '#find_note' do
      it "returns a specific note" do
        VCR.use_cassette('note/find_note', re_record_interval: 1000) do
          req = @client.find_note("716530")
          expect(req.success?).to be_truthy
        end
      end
    end

  end
end
