$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'waveapps-ruby'
require 'waveapps/ruby/config'
require 'bundler/setup'
require 'pry'
require 'factory_girl'
require 'support/factory_girl'

RSpec.configure do |config|
  config.order = 'random'

  config.before :suite do
    # WaveApps.configure do |c|
    #   c.client_id = "234234"
    #   c.client_secret = "sdfkjnsdfkj"
    # end
  end
end


# client = WaveApps::Client.new(access_token)

# client.business.list(limit: 3)
# client.business.find(123)

# client.invoices.list({business: i})

# [WaveApps::Currency, WaveApps::Currency, WaveApps::Currency] = client.currency.list(limit: 10)
# currency = WaveApps::Currency = client.currency.find(123)
# currency.update(attributes)
# currency.delete
# client.currency.delete(123)

# client.invoice.list(limit: 10)
# client.invoice.find(123)