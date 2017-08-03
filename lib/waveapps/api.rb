require 'waveapps/ruby/config'
require 'securerandom'
require 'net/http'
require 'json'

module WaveApps
  class Api

    def initialize(access_token)
    end

    def businesses
      WaveApps::Wrapper::Business.new(access_token: self.access_token).all.each do |business|
        WaveApps::Object::Business.new(business)
      end
    end

  end
end

require 'waveapps/ruby/version'
