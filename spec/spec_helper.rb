require_relative '../lib/sauce_connect'
require_relative 'data'

require 'rubygems'
require 'pry'

RSpec.configure do |config|
  config.include SauceConnect
  config.include SauceConnect::Data
end
