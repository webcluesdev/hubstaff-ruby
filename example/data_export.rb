require "hubstaff"

APP_TOKEN = "1u6rQ6kuB46U8kSYAXRPDaBvvAiB7GPMMxZVLii79KQ"
AUTH_TOKEN = "5WZ1SCto37HBhH-AR1jn0kC3FXROO4b39CREMSyt_1U"
APP_EMAIL = "rkcudjoe@hookengine.com"
APP_PASSWORD = "hookdev001"

@client = Hubstaff::Client.new(APP_TOKEN)
@client.authenticate(APP_EMAIL,APP_PASSWORD)
@client.auth_token = AUTH_TOKEN

puts "Your current auth token is: #{ @client.auth_token }"
puts

#retrieve activitiess
activity_data = @client.activities("2017-03-07", "2017-03-14")

puts "DISPLAYING ACTIVITY DATA: #{ activity_data }"
puts 

#retrieve screenshots
screenshot_data = @client.screenshots("2017-03-10", "2017-03-15", orgs: "27572")

puts "DISPLAY SCREENSHOTS DATA: #{ screenshot_data["screenshots"] }"
puts

screenshot_data['screenshots'].each do |screen_url| 
	puts "SCREENSHOT URL: #{ screen_url['url'] }"
	puts
end