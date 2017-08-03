$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'waveapps-ruby'
require 'bundler/setup'
require 'pry'
require 'factory_girl'
require 'support/factory_girl'

RSpec.configure do |config|
  config.order = 'random'

  config.before :suite do
    WaveApps::Api.configure do |c|
      c.client_id = "234234"
      c.client_secret = "sdfkjnsdfkj"
    end
  end
end
