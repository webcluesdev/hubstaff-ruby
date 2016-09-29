require 'spec_helper'

class Hubstaff::Client
  describe User do
    before(:each) do
      @client = Hubstaff::Client.new(ENV['APP_TOKEN'])
      @client.auth_token = ENV['AUTH_TOKEN']
    end

    describe "#users" do
      it "returns a collection of users" do
        VCR.use_cassette('user/users', re_record_interval: 1000) do
          req = @client.users
          expect(req.success?).to be_truthy
          expect(req.body).to  eql({"users"=>[{"id"=>61188,"name"=>"Raymond Cudjoe","last_activity"=>"2016-05-24T01:25:21Z","email"=>"rkcudjoe@hookengine.com"}]})
        end
      end

      it "contains the correct data" do
        VCR.use_cassette('user/users', re_record_interval: 1000) do
          req = @client.users
          expect(req.success?).to be_truthy
          expect(req.body['users'][0]['email']).to eq(ENV['APP_EMAIL'])
        end
      end

      it "returns organizations if org_member is set to true" do
        VCR.use_cassette('user/users_orgs', re_record_interval: 1000) do
          req = @client.users(true,false)
          expect(req.success?).to be_truthy
          expect(req.body).to eql({"users"=>[{"id"=>61188,"name"=>"Raymond Cudjoe","last_activity"=>"2016-05-24T01:25:21Z","email"=>"rkcudjoe@hookengine.com","organizations"=>[{"id"=>27572,"name"=>"Hook Engine","last_activity"=>"2016-05-24T01:25:21Z"}]}]})
        end
      end

      it "returns projects if project_member is set to true" do
        VCR.use_cassette('user/users_projects', re_record_interval: 1000) do
          req = @client.users(false,true)
          expect(req.success?).to be_truthy
          expect(req.body).to eql({"users"=>[{"id"=>61188,"name"=>"Raymond Cudjoe","last_activity"=>"2016-05-24T01:25:21Z","email"=>"rkcudjoe@hookengine.com","projects"=>[{"id"=>112761,"name"=>"Build Ruby Gem","last_activity"=>"2016-05-24T01:25:21Z","status"=>"Active"},{"id"=>120320,"name"=>"Hubstaff API tutorial","last_activity"=>nil,"status"=>"Active"}]}]})
        end
      end
    end

    describe "#find_user" do
      it "returns a specific user in a hash" do
        VCR.use_cassette('user/find_user', re_record_interval: 1000) do
          req = @client.find_user(61188)
          expect(req.success?).to be_truthy
          expect(req.body).to eql({"user"=>{"id"=>61188,"name"=>"Raymond Cudjoe","last_activity"=>"2016-05-24T01:25:21Z","email"=>"rkcudjoe@hookengine.com"}})
        end
      end
    end

    describe "#find_user_orgs" do
      it "returns all user orgs in a array" do
        VCR.use_cassette('user/find_user_orgs', re_record_interval: 1000) do
          req = @client.find_user_orgs(61188)
          expect(req.success?).to be_truthy
          expect(req.body).to eql({"organizations"=>[{"id"=>27572,"name"=>"Hook Engine","last_activity"=>"2016-05-24T01:25:21Z"}]})
        end
      end
    end

    describe "#find_user_projects" do
      it "returns all user projects in a array" do
        VCR.use_cassette('user/find_user_projects', re_record_interval: 1000) do
          req = @client.find_user_projects(61188)
          expect(req.success?).to be_truthy
          expect(req.body).to eql({"projects"=>[{"id"=>112761,"name"=>"Build Ruby Gem","last_activity"=>"2016-05-24T01:25:21Z","status"=>"Active","description"=>nil},{"id"=>120320,"name"=>"Hubstaff API tutorial","last_activity"=>nil,"status"=>"Active","description"=>nil}]})
        end
      end
    end
  end
end
