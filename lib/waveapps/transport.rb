
module WaveApps
  class Transport
    attr_accessor :client, :response, :endpoint, :request_params, :response_object, :entries

    def initialize(client)
      @client = client
    end

    def set_request(endpoint, request_params = {})
      @endpoint = endpoint
      @request_params = request_params
    end

    def get(endpoint, request_params = {})
      set_request(endpoint, request_params)
      @response_object = client.conn.get(@endpoint)
      raise TransportError.new(@response_object) if @response_object.status != 200
      @response = Oj.load(@response_object.body)
    end

    def post(endpoint, request_params = {})
      set_request(endpoint, request_params)
      @response_object = client.conn.post(@endpoint)
      raise TransportError.new(@response_object) if @response_object.status != 200
      @response = Oj.load(@response_object.body)
    end

    def set_client
      if @entries.is_a?(Array)
        @entries.map{ |entry| entry.client = @client }
      else
        @entries.client = @client
      end
    end

    def make_request(&block)
      return @entries if @entries
      @entries = yield
      set_client
      @entries
    end
  end

  class TransportError < StandardError

    attr_accessor :response_object, :error, :body

    def initialize(response_object)
      @body = @error = Oj.load(response_object.body)
      @response_object = response_object
      super(@body[:error][:message])
    end

  end
end
