require 'waveapps/ruby/config'
require 'securerandom'
require 'net/http'
require 'json'

module WaveApps
  class Api
    def businesses
      binding.pry
      WaveApps::Object::Business.all(access_token: self.access_token).each do |business|
        WaveApps::Object::Business.new(business)
      end
    end

  end
end

require 'waveapps/ruby/version'
