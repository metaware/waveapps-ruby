require 'waveapps/currency'

module WaveApps
  class Invoice < Struct
    attribute :id, Types::Int
    attribute :url, Types::String
    attribute :customer, Types::Hash.schema(
      id: Types::Int,
      url: Types::String
    )
    attribute :invoice_date, Types::String
    attribute :invoice_number, Types::String
    attribute :invoice_currency, WaveApps::Currency
    attribute :invoice_total, Types::Int
    attribute :invoice_tax_total, Types::Int
    attribute :invoice_amount_paid, Types::Int
    attribute :invoice_amount_due, Types::Int
    attribute :status, Types::String
    attribute :disable_credit_card_payments, Types::Bool
    attribute :readonly_url, Types::String
    attribute :pdf_url, Types::String
    attribute :items_url, Types::String
    attribute :invoice_number_label, Types::String
    attribute :due_date, Types::String
    attribute :subhead, Types::String
    attribute :footer, Types::String
    attribute :po_so_number, Types::String 
    attribute :memo, Types::String
    attribute :address, WaveApps::Address    
    attribute :exchange_rate, Types::Int    
    attribute :date_created, Types::Json::DateTime

    attribute :date_modified, Types::Json::DateTime
    attribute :last_sent, Types::Json::DateTime
    attribute :last_sent_via, Types::Json::DateTime
    attribute :last_viewed, Types::Json::DateTime
    attribute :last_payment_date, Types::Json::DateTime
  end

  class InvoiceTransport < Transport

    def initialize(business_id:, client:)
      @business_id = business_id
      super(client)
    end

    def find(id, options: {})
      Invoice.new(get("/invoices/#{id}/"))
    end

    def list(options: {})
      self.make_request do
        get("/businesses/#{@business_id}/invoices/").map { |invoice| Invoice.new(invoice) }
      end
    end

  end
end