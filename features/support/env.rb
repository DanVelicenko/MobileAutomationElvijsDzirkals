require "appium_lib"
require "cucumber"

opts = {
    caps: {
        deviceName: 'Test device',
        automationName: 'UiAutomator2',
        platformName: 'Android',
        udid: 'emulator-5554',
        app: '/Users/elvijsdzirkals/Downloads/Foreveryng.apk',
        autoGrantPermissions: true
    },
    appium_lib: {
        server_url: "http://localhost:4723/wd/hub"
    }
}

$driver = Appium::Driver.new(opts,true)
Selenium::WebDriver.logger.level = :error

Before do
  $driver.start_driver
  @screens = Screens.new
end

After do |scenario|
  begin
    add_screenshot(scenario.name) if scenario.failed?
  rescue => e
    p 'Failed to add screenshot'
    p e.message
  end
  $driver.quit_driver
end

def add_screenshot(scenario_name)
  scenario_name.tr!(" ", "_")
  local_name = "reports/screenshot-#{scenario_name}.png"
  $driver.screenshot(local_name)
  embed(local_name, 'image/png', "SCREENSHOT")
end


