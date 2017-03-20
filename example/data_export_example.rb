require "hubstaff"

APP_TOKEN = "1u6rQ6kuB46U8kSYAXRPDaBvvAiB7GPMMxZVLii79KQ"
APP_EMAIL = "rkcudjoe@hookengine.com"
APP_PASSWORD = "hookdev001"

@client = Hubstaff::Client.new(APP_TOKEN)

@client.authenticate(APP_EMAIL,APP_PASSWORD)

puts @client.auth_token

screen_data = @client.screenshots("2017-03-10", "2017-03-15", projects: "112761")

puts screen_data['screenshots']
