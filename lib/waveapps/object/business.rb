require 'net/http'
require 'uri'
require 'json'

class WaveApps::Object::Business < WaveApps::Object::Base
  attribute :name, String

end
