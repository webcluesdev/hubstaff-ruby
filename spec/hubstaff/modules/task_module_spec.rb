# require 'spec_helper'
#
# class Hubstaff::Client
#   describe Task do
#     before(:each) do
#       @client = Hubstaff::Client.new(ENV['APP_EMAIL'], ENV['APP_PASSWORD'], ENV['AUTH_TOKEN'])
#     end
#
#     describe '#tasks' do
#       it "returns a collection of notes" do
#         expect(@client.tasks).to be_an_instance_of(Array)
#       end
#     end
#
#     describe '#find_task' do
#       it "returns a specific note" do
#         expect(@client.find_task(716530)).to be_an_instance_of(Hash)
#       end
#     end
#
#   end
# end
#
#
