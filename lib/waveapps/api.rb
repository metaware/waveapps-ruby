require 'waveapps/ruby/config'
require 'securerandom'
require 'net/http'
require 'json'
require 'waveapps/object/base'
require 'waveapps/http_service/base'

module WaveApps
  class Api

    def initialize(access_token)
    end

    def businesses
      WaveApps::HttpService::Business.new(access_token: self.access_token).all.each do |business|
        WaveApps::Object::Business.new(business)
      end
    end

  end
end

require 'waveapps/ruby/version'
