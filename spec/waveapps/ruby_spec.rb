require 'spec_helper'

describe WaveApps::Ruby do
  it 'has a version number' do
    expect(WaveApps::Ruby::VERSION).not_to be nil
  end

  it 'has a client_id and client_secret' do
    expect(WaveApps::Ruby.config.client_id).not_to be nil
    expect(WaveApps::Ruby.config.client_secret).not_to be nil
  end

  it 'has a base_url' do
    expect(WaveApps::Ruby.config.base_url).not_to be nil
  end

  describe '#access_url' do
    it 'returns a URI::HTTP object' do
      expect(WaveApps::Ruby.access_url).not_to be nil
      expect(WaveApps::Ruby.access_url).to be_kind_of(URI::HTTP)
    end

    it 'must return URI:HTTP with required query_params' do
      query = WaveApps::Ruby.access_url.query
      params = CGI::parse(query)
      expect(params["client_id"]).not_to be nil
      expect(params["response_type"]).not_to be nil
      expect(params["scope"]).not_to be nil
      expect(params["state"]).not_to be nil
    end
  end

  describe '#get_access_token' do
    it 'must make a http post request to the server' do
      code = "123123123123123123"
      expect(WaveApps::Ruby.get_access_token(code)).to be_kind_of(Hash)
    end
  end
end
