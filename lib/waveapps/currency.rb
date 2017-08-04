module WaveApps
  class Currency < Dry::Struct
    attribute :url, Types::String
    attribute :code, Types::String
    attribute :symbol, Types::String
    attribute :name, Types::String
  end
end
