require 'waveapps/business'

module WaveApps
  class Client

    attr_accessor :access_token, :conn

    def initialize(access_token)
      @access_token = access_token
      @conn = Faraday.new(url: 'https://api.waveapps.com/') do |faraday|
        faraday.authorization :Bearer, @access_token
        faraday.adapter Faraday.default_adapter
      end
    end

    def business
      BusinessTransport.new(self)
    end

  end
end