module WaveApps
  class Business < Dry::Struct

    attribute :id, Types::String
    attribute :url, Types::String
    attribute :company_name, Types::String

  end

  class BusinessTransport
    attr_accessor :client

    def initialize(client)
      @client = client
    end

    def list(options: {})
      response = client.conn.get('/businesses/').body
      businesses = Oj.load(response)
      businesses.map { |business| Business.new(business) }
    end

  end
end