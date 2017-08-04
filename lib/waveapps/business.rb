require 'waveapps/currency'
require 'waveapps/invoice'

module WaveApps
  class Business < Struct

    attribute :id, Types::String
    attribute :url, Types::String
    attribute :company_name, Types::String
    attribute :primary_currency, WaveApps::Currency
    attribute :is_owner, Types::Bool
    attribute :is_default_business, Types::Bool
    attribute :business_group, Types::String
    attribute :business_group_display, Types::String
    attribute :business_type, Types::String
    attribute :business_type_display, Types::String
    attribute :organization_type, Types::String
    attribute :organization_type_display, Types::String
    attribute :address1, Types::String
    attribute :address2, Types::String
    attribute :city, Types::String
    attribute :province, Types::Hash.schema(
      name: Types::String.default(''), 
      slug: Types::String.default('')
    ).default({})
    attribute :country, Types::Hash.schema(
      name: Types::String,
      country_code: Types::String,
      currency: WaveApps::Currency,
      url: Types::String
    )
    attribute :postal_code, Types::String
    attribute :phone_number, Types::String
    attribute :mobile_phone_number, Types::String
    attribute :toll_free_phone_number, Types::String
    attribute :fax_number, Types::String
    attribute :website, Types::String
    attribute :date_created, Types::String
    attribute :date_modified, Types::String
    attribute :scopes, Types::String
    attribute :attribs, Types::Hash.schema(
      eligible_payment_service: Types::String,
      connected_payment_service: Types::String
    )
    attribute :invoice_sending_emails, Types::Array.member(Types::Hash.schema(
      email: Types::String,
      default: Types::String,
      is_collaborator: Types::Bool,
      verified: Types::Bool
    ))

    def serialize
      
    end

    def invoices
      InvoiceTransport.new(business_id: self.id, client: @client)
    end
    
  end

  class BusinessTransport < Transport

    def find(id, options: {})
      self.make_request do
        Business.new(get("/businesses/#{id}/"))
      end
    end

    def list(options: {})
      self.make_request do
        get("/businesses/").map { |business| Business.new(business) }
      end
    end

  end
end