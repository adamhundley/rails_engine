require 'rails_helper'

RSpec.describe "InvoiceItemsActions", type: :request do
  describe "GET /api/v1/invoice_items" do
    before(:each) do
      @invoice_item = create(:invoice_item)
    end

    it "has 200 response code" do
      get '/api/v1/invoice_items'
      expect(response).to have_http_status(200)
    end

    it "renders json" do
      get '/api/v1/invoice_items'
      expect(response.content_type).to eq("application/json")
    end

    it "returns information on a invoice_item" do
      get '/api/v1/invoice_items'

      invoice_items = json_body
      parsed_invoice_item = invoice_items.first

      expect(parsed_invoice_item.keys). to eq [:id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at]
      expect(parsed_invoice_item[:name]).to eq(@invoice_item[:name])
      expect(parsed_invoice_item[:unit_price]).to eq(@invoice_item[:unit_price])
      expect(parsed_invoice_item[:merchant_id]).to eq(@invoice_item[:merchant_id])
    end
  end

  describe "GET /api/v1/invoice_items/:id" do
    before(:each) do
      @invoice_item = create(:invoice_item)
    end

    it "has 200 response code" do
      get '/api/v1/invoice_items/1'
      expect(response).to have_http_status(200)
    end

    it "renders json" do
      get '/api/v1/invoice_items/1'
      expect(response.content_type).to eq("application/json")
    end

    it "returns information on a invoice_item" do
      get '/api/v1/invoice_items/1'

      invoice_item = json_body

      expect(invoice_item[:id]).to eq(@invoice_item[:id])
      expect(invoice_item[:name]).to eq(@invoice_item[:name])
      expect(invoice_item[:unit_price]).to eq(@invoice_item[:unit_price])
      expect(invoice_item[:quantity]).to eq(@invoice_item[:quantity])
      expect(invoice_item[:item_id]).to eq(@invoice_item[:item_id])
      expect(invoice_item[:invoice_id]).to eq(@invoice_item[:invoice_id])
    end
  end

  describe "GET /api/v1/invoice_items/find?id=1" do
    before(:each) do
      @invoice_item = create(:invoice_item)
    end

    it "has 200 response code" do
      get '/api/v1/invoice_items/find?id=1'
      expect(response).to have_http_status(200)
    end

    it "renders json" do
      get '/api/v1/invoice_items/find?id=1'
      expect(response.content_type).to eq("application/json")
    end

    it "returns information on a invoice_item by id" do
      get '/api/v1/invoice_items/find?id=1'
      invoice_item = json_body

      expect(invoice_item[:id]).to eq(@invoice_item[:id])
    end

  end

  describe "GET /api/v1/invoice_items/find_all?last_name=Cummings" do
    before(:each) do
      @invoice_item1 = create(:invoice_item)
      @invoice_item2 = create(:invoice_item)
    end

    it "has 200 response code" do
      get '/api/v1/invoice_items/find_all?id=1'
      expect(response).to have_http_status(200)
    end

    it "renders json" do
      get '/api/v1/invoice_items/find_all?id=1'
      expect(response.content_type).to eq("application/json")
    end

    it "returns information on a invoice_items by id" do
      get '/api/v1/invoice_items/find_all?unit_price=101'

      invoice_items = json_body

      expect(invoice_items.count).to eq 2
      expect(invoice_items.first[:unit_price]).to eq(@invoice_item1[:unit_price])
      expect(invoice_items.last[:unit_price]).to eq(@invoice_item2[:unit_price])
      expect(invoice_items.first[:id]).to eq(@invoice_item1[:id])
      expect(invoice_items.last[:id]).to eq(@invoice_item2[:id])
    end
  end

  describe "GET /api/v1/invoice_items/random" do
    before(:each) do
      @invoice_item1 = create(:invoice_item)
      @invoice_item2 = create(:invoice_item)
      @invoice_item3  = create(:invoice_item)
    end

    it "has 200 response code" do
      get '/api/v1/invoice_items/random'
      expect(response).to have_http_status(200)
    end

    it "renders json" do
      get '/api/v1/invoice_items/random'
      expect(response.content_type).to eq("application/json")
    end

    it "returns information on a random invoice_item" do
      get '/api/v1/invoice_items/random'

      invoice_item = json_body
      ids = [@invoice_item1[:id], @invoice_item2[:id], @invoice_item3[:id]]

      expect(ids.include?(invoice_item[:id])).to eq(true)
    end
  end
end
