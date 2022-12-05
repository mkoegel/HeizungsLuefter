require 'config'
require 'tuya_cloud'
require 'fritzbox/smarthome'
require 'rufus-scheduler'

Config.load_and_set_settings("./config/settings.yaml")
puts Settings.heater

HEATER = Settings.heater
PLUG = Settings.plug

# Connect to the Fritzbox and find the heater
Fritzbox::Smarthome.configure do |config|
    config.endpoint   = Settings.fritzbox.endpoint
    config.username   = Settings.fritzbox.username
    config.password   = Settings.fritzbox.password
    config.verify_ssl = false
end

heaters = Fritzbox::Smarthome::Heater.all
heater = heaters.select{|heater| heater.name==HEATER}.first

# Connect to Tuya and find the plug
username = Settings.tuya.username
password=Settings.tuya.password
country_code=Settings.tuya.country_code
brand=Settings.tuya.brand
api = TuyaCloud::API.new(username, password, country_code, brand)
plug = api.find_device_by_name(PLUG)

# Schedule regular checks
scheduler = Rufus::Scheduler.new

scheduler.every '10m' do
    temp_set = heater.hkr_temp_set
    temp_is = heater.hkr_temp_is

    puts "Checking temperatur at #{Time.now} - Set: #{temp_set} - Is: #{temp_is}"
    if (temp_set > temp_is) then
        puts "Turning fan on"
        plug.controls.turn_on
    else
        puts "Turning fan off"
        plug.controls.turn_off
    end
end

scheduler.join

puts "Exiting"

