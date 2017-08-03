require 'waveapps/ruby/config'
require 'securerandom'
require 'net/http'
require 'json'

module WaveApps
  class Object
    include Virtus.model
  end
end