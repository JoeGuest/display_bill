require 'capybara/cucumber'
require './display_bill'

Capybara.app = Sinatra::Application

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end
