require 'spec_helper'

class Hubstaff::Client
  describe Note do
    before(:each) do
      @client = Hubstaff::Client.new(ENV['APP_TOKEN'],ENV['AUTH_TOKEN'])
    end

    describe '#notes' do
      it "returns a collection of notes" do
        VCR.use_cassette 'note/notes' do
          expect(@client.notes("2016-05-23", "2016-05-25")['notes']).to be_an_instance_of(Array)
        end
      end

      it "returns a collection of notes for a specific organization" do
        VCR.use_cassette 'note/notes_org' do
          expect(@client.notes("2016-05-23", "2016-05-25", orgs: "27572")["notes"][0]["description"]).to eq("Practice Notes")
        end
      end

      it "returns a collection of notes for a specific project" do
        VCR.use_cassette 'note/notes_project' do
          expect(@client.notes("2016-05-23", "2016-05-25", projects: "112761")["notes"][0]["description"]).to eq("Practice Notes")
        end
      end

      it "returns a collection of notes for a specific user" do
        VCR.use_cassette 'note/notes_user' do
          expect(@client.notes("2016-05-23", "2016-05-25", users: "61188")["notes"][0]["description"]).to eq("Practice Notes")
        end
      end

      it "returns a collection of notes with a offset" do
        VCR.use_cassette 'note/notes_offset' do
          expect(@client.notes("2016-05-23", "2016-05-25", offset: 0)["notes"][0]["description"]).to eq("Practice Notes")
        end
      end
    end

    describe '#find_note' do
      it "returns a specific note" do
        VCR.use_cassette 'note/find_note' do
          expect(@client.find_note(716530)["note"]["description"]).to eq("Practice Notes")
        end
      end
    end

  end
end
