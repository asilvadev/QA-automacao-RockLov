require "capybara"
require "capybara/cucumber"
require "allure-cucumber"

Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.app_host = "http://127.0.0.1:3000"
  config.default_max_wait_time = 10
end

AllureCucumber.configure do |config|
  config.results_directory = "/logs"
  config.clean_results_directory = true
end
