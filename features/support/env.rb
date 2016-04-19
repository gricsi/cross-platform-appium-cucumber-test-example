require 'appium_lib'
require 'cucumber/ast'
require 'test/unit/assertions'

def load_appium_configuration(platform)
  Appium.load_appium_txt :file => File.expand_path("./../../../config/#{platform}/appium.txt", __FILE__), verbose: true
end

def load_module(path)
  Dir[path].each { |file| require file }
end

# Create a custom World class so we don't pollute `Object` with Appium methods
class AppiumWorld

end

if ENV['PLATFORM_NAME'].nil?
  raise 'Please define the PLATFORM_NAME environment variable like: export PLATFORM_NAME=android'
else
  env = ENV['PLATFORM_NAME'].downcase
end

case env
  when 'android'
    caps = load_appium_configuration(env)
    caps[:appium_lib][:export_session]=true
    load_module('./features/pages/android/*.rb')

    $ENV = Android

  when 'ios'
    caps = load_appium_configuration(env)
    caps[:appium_lib][:export_session]=true
    load_module('./features/pages/ios/*.rb')

    $ENV = IOS

  else
    raise("Not supported platform #{ENV['PLATFORM_NAME']}")
end

Appium::Driver.new(caps)
Appium.promote_appium_methods AppiumWorld

# world settings
World(Test::Unit::Assertions)

World do
  AppiumWorld.new
  AssertExtension.new
end


#cucumber setup
Before('@wip, @bug') do
  pending
end

Before('@wip_android') do
  if $ENV == Android
    pending
  end
end

Before('@wip_ios') do
  if $ENV == IOS
    pending
  end
end

Before do
  $driver.start_driver
end

After do |scenario|
  if scenario.failed?
    encoded_img = $driver.driver.screenshot_as(:base64)
    embed("data:image/png;base64,#{encoded_img}", 'image/png')
  end
  $driver.driver_quit
end
