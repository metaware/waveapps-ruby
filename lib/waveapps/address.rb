module WaveApps
  class Address < Dry::Struct
    attribute :address1, Types::String
    attribute :address2, Types::String
    attribute :city, Types::String
    attribute :province_name, Types::String
    attribute :country_name, Types::String
    attribute :postal_code, Types::String
  end
end
