require 'rails_helper'

RSpec.describe "InvoiceItemRelations", type: :request do
  describe "GET /api/v1/invoice_items/:id/invoice" do
    before(:each) do
      @invoice = create(:invoice, status: "shipped")
      @invoice_item = @invoice.invoice_items << create(:invoice_item)
    end

    it "has 200 response code" do
      get "/api/v1/invoice_items/#{@invoice_item.first.id}/invoice"
      expect(response).to have_http_status(200)
    end

    it "renders json" do
      get "/api/v1/invoice_items/#{@invoice_item.first.id}/invoice"
      expect(response.content_type).to eq("application/json")
    end

    it "returns information on a invoice_items invoice" do
      get "/api/v1/invoice_items/#{@invoice_item.first.id}/invoice"

      invoice = json_body

      expect(invoice[:status]).to eq "shipped"
      expect(invoice[:status]).to_not eq "pending"
      expect(invoice[:id]).to eq @invoice.id
    end
  end

  describe "GET /api/v1/invoice_items/:id/item" do
    before(:each) do
      @item = create(:item, name: "The Item")
      @invoice_item = @item.invoice_items << create(:invoice_item)

    end

    it "has 200 response code" do
      get "/api/v1/invoice_items/#{@invoice_item.first.id}/item"
      expect(response).to have_http_status(200)
    end

    it "renders json" do
      get "/api/v1/invoice_items/#{@invoice_item.first.id}/item"
      expect(response.content_type).to eq("application/json")
    end

    it "returns information on a invoice_items item" do
      get "/api/v1/invoice_items/#{@invoice_item.first.id}/item"

      item = json_body

      expect(item[:name]).to eq "The Item"
      expect(item[:id]).to eq @item.id
    end
  end
end
