require 'appium_lib'
require 'rspec/expectations'
require 'faker'

desired_caps = {
  caps: {
    platformName: "Android",
    platformVersion: "7.0",
    deviceName: "emulator-5554",
    app: "./app/com.binar.jogjoin.apk",
    appPackage: "com.binar.jogjoin",
    appActivity: "com.binar.jogjoin.splashScreen.SplashScreenActivity"
  },
  appium_lib: {
    sauce_username: "",
    sauce_access_key: ""
  }
}
Appium::Driver.new(desired_caps, true)
Appium.promote_appium_methods self.class

Faker::Config.locale = 'id'

Before { @driver.start_driver }
After { @driver.driver_quit }