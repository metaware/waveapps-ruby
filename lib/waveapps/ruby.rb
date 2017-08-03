require 'waveapps/ruby/config'
require 'securerandom'
require 'net/http'
require 'json'

module WaveApps
  module Ruby
    include Config

    ACCESS_URL = "/oauth2/authorize/"
    ACCESS_TOKEN_URL = "/oauth2/token/"
    BUSINESS_URL = "/businesses/"

    def self.access_url
      params = {
        client_id: config.client_id,
        response_type: 'code',
        scope: config.scope,
        state: SecureRandom.hex
      }
      params[:redirect_uri] = config.redirect_uri if config.redirect_uri
      URI::HTTPS.build(
        host: config.base_url,
        path: ACCESS_URL,
        query: URI.encode_www_form(params)
      )
    end

    def self.get_access_token(code, redirect_uri = config.redirect_uri)
      params = {
        client_id: config.client_id,
        client_secret: config.client_secret,
        code: code,
        grant_type: 'authorization_code'
      }
      params[:redirect_uri] = config.redirect_uri if config.redirect_uri
      uri = URI::HTTPS.build(
        host: config.base_url,
        path: ACCESS_TOKEN_URL,
        query: URI.encode_www_form(params)
      )
      return JSON.parse(Net::HTTP.post_form(uri, {}).body)
    end
  end
end