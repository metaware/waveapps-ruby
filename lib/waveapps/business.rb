require 'net/http'
require 'uri'
require 'json'

class WaveApps::Business < WaveApps::Object
  include Virtus.model
  attribute :name, String

  def self.all
    params = {
      access_token: access_token
    }
    params[:redirect_uri] = config.redirect_uri if config.redirect_uri
    uri = URI::HTTPS.build(
      host: config.base_url,
      path: ACCESS_TOKEN_URL,
      query: URI.encode_www_form(params)
    )
    return JSON.parse(Net::HTTP.get(uri).body)
  end
end
