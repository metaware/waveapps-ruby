require 'waveapps/ruby/config'
require 'securerandom'
require 'net/http'
require 'json'
require 'virtus'
require 'business'

module WaveApps
  module Object
    class Base
      include Virtus.model
    end
  end
end  
