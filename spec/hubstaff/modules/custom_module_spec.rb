require 'spec_helper'

class Hubstaff::Client
  describe Custom do
    before(:each) do
      @client = Hubstaff::Client.new(ENV['APP_TOKEN'])
      @client.auth_token = ENV['AUTH_TOKEN']
    end

    describe '#custom_date_team' do
      it "returns a custom team report grouped by date" do
        VCR.use_cassette 'custom/custom_data_team_date' do
          expect(@client.custom_date_team("2016-05-23", "2016-05-25")["organizations"]).to be_an_instance_of(Array)
        end
      end

      it "returns a custom team report grouped by date and specific organizations" do
        VCR.use_cassette 'custom/custom_data_team_date_and_org' do
          expect(@client.custom_date_team("2016-05-23", "2016-05-25", orgs: "27572")["organizations"][0]["name"]).to eq("Hook Engine")
        end
      end

      it "returns a custom team report grouped by date and specific projects" do
        VCR.use_cassette 'custom/custom_data_team_date_and_project' do
          expect(@client.custom_date_team("2016-05-23", "2016-05-25", projects: "112761")["organizations"][0]["name"]).to eq("Hook Engine")
        end
      end

      it "returns a custom team report grouped by date and specific users" do
        VCR.use_cassette 'custom/custom_data_team_date_and_user' do
          expect(@client.custom_date_team("2016-05-23", "2016-05-25", users: "61188")["organizations"][0]["name"]).to eq("Hook Engine")
        end
      end
      
      it "returns a custom team report grouped by date and show tasks" do
        VCR.use_cassette 'custom/custom_data_team_date_and_task' do
          expect(@client.custom_date_team("2016-05-23", "2016-05-25", show_tasks: true)["organizations"][0]["name"]).to eq("Hook Engine")
        end
      end
      
      it "returns a custom team report grouped by date and show notes" do
        VCR.use_cassette 'custom/custom_data_team_date_and_note' do
          expect(@client.custom_date_team("2016-05-23", "2016-05-25", show_notes: true)["organizations"][0]["name"]).to eq("Hook Engine")
        end
      end
      
      it "returns a custom team report grouped by date and show activities" do
        VCR.use_cassette 'custom/custom_data_team_date_and_activity' do
          expect(@client.custom_date_team("2016-05-23", "2016-05-25", show_activities: true)["organizations"][0]["name"]).to eq("Hook Engine")
        end
      end
      
      it "returns a custom team report grouped by date and show archieved" do
        VCR.use_cassette 'custom/custom_data_team_date_and_archieve' do
          expect(@client.custom_date_team("2016-05-23", "2016-05-25", include_archived: true)["organizations"][0]["name"]).to eq("Hook Engine")
        end
      end

      it "returns a custom team report grouped by date and show archieved" do
        VCR.use_cassette 'custom/custom_data_team_date_and_archieve' do
          expect(@client.custom_date_team("2016-05-23", "2016-05-25", include_archived: true)["organizations"][0]["name"]).to eq("Hook Engine")
        end
      end

    end

    describe '#custom_date_my' do
      it "returns a custom individual report by date" do
        VCR.use_cassette 'custom/custom_data_my_date' do
          expect(@client.custom_date_my("2016-05-23", "2016-05-25")["organizations"]).to be_an_instance_of(Array)
        end
      end

      it "returns a custom individual report grouped by date and specific organizations" do
        VCR.use_cassette 'custom/custom_data_my_date_and_orgs' do
          expect(@client.custom_date_my("2016-05-23", "2016-05-25", orgs: "27572")["organizations"][0]["name"]).to eq("Hook Engine")
        end
      end

      it "returns a custom individual report grouped by date and specific projects" do
        VCR.use_cassette 'custom/custom_data_my_date_and_projects' do
          expect(@client.custom_date_my("2016-05-23", "2016-05-25", projects: "112761")["organizations"][0]["name"]).to eq("Hook Engine")
        end
      end

      it "returns a custom individual report grouped by date and specific users" do
        VCR.use_cassette 'custom/custom_data_my_date_and_user' do
          expect(@client.custom_date_my("2016-05-23", "2016-05-25", users: "61188")["organizations"][0]["name"]).to eq("Hook Engine")
        end
      end

      it "returns a custom individual report grouped by date and show tasks" do
        VCR.use_cassette 'custom/custom_data_my_date_and_task' do
          expect(@client.custom_date_my("2016-05-23", "2016-05-25", show_tasks: true)["organizations"][0]["name"]).to eq("Hook Engine")
        end
      end

      it "returns a custom individual report grouped by date and show notes" do
        VCR.use_cassette 'custom/custom_data_my_date_and_note' do
          expect(@client.custom_date_my("2016-05-23", "2016-05-25", show_notes: true)["organizations"][0]["name"]).to eq("Hook Engine")
        end
      end

      it "returns a custom individual report grouped by date and show activity" do
        VCR.use_cassette 'custom/custom_data_my_date_and_activity' do
          expect(@client.custom_date_my("2016-05-23", "2016-05-25", show_activities: true)["organizations"][0]["name"]).to eq("Hook Engine")
        end
      end

      it "returns a custom individual report grouped by date and show archieved" do
        VCR.use_cassette 'custom/custom_data_my_date_and_archieve' do
          expect(@client.custom_date_my("2016-05-23", "2016-05-25", include_archived: true)["organizations"][0]["name"]).to eq("Hook Engine")
        end
      end
    end

    describe '#custom_member_team' do
      it "returns a custom team report group by member" do
        VCR.use_cassette 'custom/custom_team_member' do
          expect(@client.custom_member_team("2016-05-23", "2016-05-25")["organizations"]).to be_an_instance_of(Array)
        end
      end

      it "returns a custom team report group by member and specific organizations" do
        VCR.use_cassette 'custom/custom_team_member_and_org' do
          expect(@client.custom_member_team("2016-05-23", "2016-05-25", orgs: "27572")["organizations"][0]["name"]).to eq("Hook Engine")
        end
      end

      it "returns a custom team report group by member and specific projects" do
        VCR.use_cassette 'custom/custom_team_member_and_project' do
          expect(@client.custom_member_team("2016-05-23", "2016-05-25", projects: "112761")["organizations"][0]["name"]).to eq("Hook Engine")
        end
      end

      it "returns a custom team report group by member and specific users" do
        VCR.use_cassette 'custom/custom_team_member_and_user' do
          expect(@client.custom_member_team("2016-05-23", "2016-05-25", users: "61188")["organizations"][0]["name"]).to eq("Hook Engine")
        end
      end

      it "returns a custom team report group by member and show tasks" do
        VCR.use_cassette 'custom/custom_team_member_and_task' do
          expect(@client.custom_member_team("2016-05-23", "2016-05-25", show_tasks: true)["organizations"][0]["name"]).to eq("Hook Engine")
        end
      end

      it "returns a custom team report group by member and show notes" do
        VCR.use_cassette 'custom/custom_team_member_and_note' do
          expect(@client.custom_member_team("2016-05-23", "2016-05-25", show_notes: true)["organizations"][0]["name"]).to eq("Hook Engine")
        end
      end

      it "returns a custom team report group by member and show activities" do
        VCR.use_cassette 'custom/custom_team_member_and_activity' do
          expect(@client.custom_member_team("2016-05-23", "2016-05-25", show_activities: true)["organizations"][0]["name"]).to eq("Hook Engine")
        end
      end

      it "returns a custom team report group by member and show archieved" do
        VCR.use_cassette 'custom/custom_team_member_and_archieve' do
          expect(@client.custom_member_team("2016-05-23", "2016-05-25", include_archived: true)["organizations"][0]["name"]).to eq("Hook Engine")
        end
      end
    end

    describe '#custom_member_my' do
      it "returns a custom individual report group by member" do
        VCR.use_cassette 'custom/custom_my_member' do
        expect(@client.custom_member_my("2016-05-23", "2016-05-25")["organizations"]).to be_an_instance_of(Array)
        end
      end

      it "returns a custom individual report group by member and specific organizations" do
        VCR.use_cassette 'custom/custom_my_member_and_org' do
          expect(@client.custom_member_my("2016-05-23", "2016-05-25", orgs: "27572")["organizations"][0]["name"]).to eq("Hook Engine")
        end
      end

      it "returns a custom individual report group by member and specific projects" do
        VCR.use_cassette 'custom/custom_my_member_and_project' do
          expect(@client.custom_member_my("2016-05-23", "2016-05-25", projects: "112761")["organizations"][0]["name"]).to eq("Hook Engine")
        end
      end

      it "returns a custom individual report group by member and specific users" do
        VCR.use_cassette 'custom/custom_my_member_and_user' do
          expect(@client.custom_member_my("2016-05-23", "2016-05-25", users: "61188")["organizations"][0]["name"]).to eq("Hook Engine")
        end
      end

      it "returns a custom individual report group by member and show tasks" do
        VCR.use_cassette 'custom/custom_my_member_and_task' do
          expect(@client.custom_member_my("2016-05-23", "2016-05-25", show_tasks: true)["organizations"][0]["name"]).to eq("Hook Engine")
        end
      end

      it "returns a custom individual report group by member and show notes" do
        VCR.use_cassette 'custom/custom_my_member_and_note' do
          expect(@client.custom_member_my("2016-05-23", "2016-05-25", show_notes: true)["organizations"][0]["name"]).to eq("Hook Engine")
        end
      end

      it "returns a custom individual report group by member and show activity" do
        VCR.use_cassette 'custom/custom_my_member_and_activity' do
          expect(@client.custom_member_my("2016-05-23", "2016-05-25", show_activities: true)["organizations"][0]["name"]).to eq("Hook Engine")
        end
      end

      it "returns a custom individual report group by member and show archieved" do
        VCR.use_cassette 'custom/custom_my_member_and_archieve' do
          expect(@client.custom_member_my("2016-05-23", "2016-05-25", include_archived: true)["organizations"][0]["name"]).to eq("Hook Engine")
        end
      end
    end

    describe '#custom_project_team' do
      it "returns a custom team report group by project" do
        VCR.use_cassette 'custom/custom_team_project' do
          expect(@client.custom_project_team("2016-05-23", "2016-05-25")["organizations"]).to be_an_instance_of(Array)
        end
      end

      it "returns a custom team report group by project and specific organizations" do
        VCR.use_cassette 'custom/custom_team_project_and_org' do
          expect(@client.custom_project_team("2016-05-23", "2016-05-25", orgs: "27572")["organizations"][0]["name"]).to eq("Hook Engine")
        end
      end

      it "returns a custom team report group by project and specific projects" do
        VCR.use_cassette 'custom/custom_team_project_and_project' do
          expect(@client.custom_project_team("2016-05-23", "2016-05-25", projects: "112761")["organizations"][0]["name"]).to eq("Hook Engine")
        end
      end

      it "returns a custom team report group by project and specific users" do
        VCR.use_cassette 'custom/custom_team_project_and_user' do
          expect(@client.custom_project_team("2016-05-23", "2016-05-25", users: "61188")["organizations"][0]["name"]).to eq("Hook Engine")
        end
      end

      it "returns a custom team report group by project and show tasks" do
        VCR.use_cassette 'custom/custom_team_project_and_task' do
          expect(@client.custom_project_team("2016-05-23", "2016-05-25", show_tasks: true)["organizations"][0]["name"]).to eq("Hook Engine")
        end
      end

      it "returns a custom team report group by project and show notes" do
        VCR.use_cassette 'custom/custom_team_project_and_note' do
          expect(@client.custom_project_team("2016-05-23", "2016-05-25", show_notes: true)["organizations"][0]["name"]).to eq("Hook Engine")
        end
      end

      it "returns a custom team report group by project and show activity" do
        VCR.use_cassette 'custom/custom_team_project_and_activity' do
          expect(@client.custom_project_team("2016-05-23", "2016-05-25", show_activities: true)["organizations"][0]["name"]).to eq("Hook Engine")
        end
      end

      it "returns a custom team report group by project and show archieved" do
        VCR.use_cassette 'custom/custom_team_project_and_archieve' do
          expect(@client.custom_project_team("2016-05-23", "2016-05-25", include_archived: true)["organizations"][0]["name"]).to eq("Hook Engine")
        end
      end
    end

    describe '#custom_project_my' do
      it "returns a custom individual report group by project" do
        VCR.use_cassette 'custom/custom_my_project' do
          expect(@client.custom_project_my("2016-05-23", "2016-05-25")["organizations"]).to be_an_instance_of(Array)
        end
      end

      it "returns a custom individual report group by project and specific organizations" do
        VCR.use_cassette 'custom/custom_my_project_and_org' do
          expect(@client.custom_project_my("2016-05-23", "2016-05-25", orgs: "27572")["organizations"][0]["name"]).to eq("Hook Engine")
        end
      end

      it "returns a custom individual report group by project and specific projects" do
        VCR.use_cassette 'custom/custom_my_project_and_project' do
          expect(@client.custom_project_my("2016-05-23", "2016-05-25", projects: "112761")["organizations"][0]["name"]).to eq("Hook Engine")
        end
      end

      it "returns a custom individual report group by project and specific users" do
        VCR.use_cassette 'custom/custom_my_project_and_user' do
          expect(@client.custom_project_my("2016-05-23", "2016-05-25", users: "61188")["organizations"][0]["name"]).to eq("Hook Engine")
        end
      end

      it "returns a custom individual report group by project and show tasks" do
        VCR.use_cassette 'custom/custom_my_project_and_task' do
          expect(@client.custom_project_my("2016-05-23", "2016-05-25", show_tasks: true)["organizations"][0]["name"]).to eq("Hook Engine")
        end
      end

      it "returns a custom individual report group by project and show notes" do
        VCR.use_cassette 'custom/custom_my_project_and_note' do
          expect(@client.custom_project_my("2016-05-23", "2016-05-25", show_notes: true)["organizations"][0]["name"]).to eq("Hook Engine")
        end
      end

      it "returns a custom individual report group by project and show activity" do
        VCR.use_cassette 'custom/custom_my_project_and_activity' do
          expect(@client.custom_project_my("2016-05-23", "2016-05-25", show_activities: true)["organizations"][0]["name"]).to eq("Hook Engine")
        end
      end

      it "returns a custom individual report group by project and show archieved" do
        VCR.use_cassette 'custom/custom_my_project_and_archieve' do
          expect(@client.custom_project_my("2016-05-23", "2016-05-25", include_archived: true)["organizations"][0]["name"]).to eq("Hook Engine")
        end
      end
    end

  end
end
