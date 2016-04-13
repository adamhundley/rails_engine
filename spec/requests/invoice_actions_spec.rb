require 'rails_helper'

RSpec.describe "InvoiceActions", type: :request do
  describe "GET /api/v1/invoices" do
    before(:each) do
      @invoice = create(:invoice)
    end

    it "has 200 response code" do
      get '/api/v1/invoices'
      expect(response).to have_http_status(200)
    end

    it "renders json" do
      get '/api/v1/invoices'
      expect(response.content_type).to eq("application/json")
    end

    it "returns information on a invoice" do
      get '/api/v1/invoices'

      invoices = json_body
      parsed_invoice = invoices.first

      expect(parsed_invoice.keys). to eq [:id, :customer_id, :merchant_id, :status, :created_at, :updated_at]
      expect(parsed_invoice[:name]).to eq(@invoice[:name])
      expect(parsed_invoice[:unit_price]).to eq(@invoice[:unit_price])
      expect(parsed_invoice[:merchant_id]).to eq(@invoice[:merchant_id])
    end
  end

  describe "GET /api/v1/invoices/:id" do
    before(:each) do
      @invoice = create(:invoice)
    end

    it "has 200 response code" do
      get '/api/v1/invoices/1'
      expect(response).to have_http_status(200)
    end

    it "renders json" do
      get '/api/v1/invoices/1'
      expect(response.content_type).to eq("application/json")
    end

    it "returns information on a invoice" do
      get '/api/v1/invoices/1'

      invoice = json_body

      expect(invoice[:id]).to eq(@invoice[:id])
      expect(invoice[:status]).to eq(@invoice[:status])
      expect(invoice[:merchant_id]).to eq(@invoice[:merchant_id])
      expect(invoice[:merchant_id]).to eq(@invoice[:merchant_id])
      expect(invoice[:customer_id]).to eq(@invoice[:customer_id])
    end
  end

  describe "GET /api/v1/invoices/find?id=1" do
    before(:each) do
      @invoice = create(:invoice)
    end

    it "has 200 response code" do
      get '/api/v1/invoices/find?id=1'
      expect(response).to have_http_status(200)
    end

    it "renders json" do
      get '/api/v1/invoices/find?id=1'
      expect(response.content_type).to eq("application/json")
    end

    it "returns information on a invoice by status" do
      get '/api/v1/invoices/find?status=shipped'
      invoice = json_body

      expect(invoice[:status]).to eq(@invoice[:status])
    end

    it "returns information on a invoice by id" do
      get '/api/v1/invoices/find?id=1'

      invoice = json_body

      expect(invoice[:id]).to eq(@invoice[:id])
    end
  end

  describe "GET /api/v1/invoices/find_all?last_name=Cummings" do
    before(:each) do
      @invoice1 = create(:invoice)
      @invoice2 = create(:invoice)
    end

    it "has 200 response code" do
      get '/api/v1/invoices/find_all?name=test'
      expect(response).to have_http_status(200)
    end

    it "renders json" do
      get '/api/v1/invoices/find_all?id=1'
      expect(response.content_type).to eq("application/json")
    end

    it "returns information on a invoices by status" do
      get '/api/v1/invoices/find_all?status=shipped'

      invoices = json_body

      expect(invoices.count).to eq 2
      expect(invoices.first[:status]).to eq(@invoice1[:status])
      expect(invoices.last[:status]).to eq(@invoice2[:status])
      expect(invoices.first[:id]).to eq(@invoice1[:id])
      expect(invoices.last[:id]).to eq(@invoice2[:id])
    end
  end

  describe "GET /api/v1/invoices/random" do
    before(:each) do
      @invoice1 = create(:invoice)
      @invoice2 = create(:invoice)
      @invoice3 = create(:invoice)
    end

    it "has 200 response code" do
      get '/api/v1/invoices/random'
      expect(response).to have_http_status(200)
    end

    it "renders json" do
      get '/api/v1/invoices/random'
      expect(response.content_type).to eq("application/json")
    end

    it "returns information on a random invoice" do
      get '/api/v1/invoices/random'

      invoice = json_body
      ids = [@invoice1[:id], @invoice2[:id], @invoice3[:id]]
      status = [@invoice1[:status], @invoice2[:status], @invoice3[:status]]

      expect(status.include?(invoice[:status])).to eq(true)
      expect(ids.include?(invoice[:id])).to eq(true)
    end
  end
end
