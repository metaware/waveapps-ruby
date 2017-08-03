require 'waveapps/ruby/config'
require 'securerandom'
require 'net/http'
require 'json'
require 'business'

module WaveApps
  module HttpService
    class Base
      def initialize(access_token, *args)
        self.access_token = access_token
        self.params = args
      end
    end
  end
end
