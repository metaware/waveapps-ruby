require 'waveapps/ruby/config'
require 'securerandom'
require 'net/http'
require 'json'

module WaveApps
  class Wrapper
    def initialize(access_token, *args)
      self.access_token = access_token
      self.params = args
    end
  end
end