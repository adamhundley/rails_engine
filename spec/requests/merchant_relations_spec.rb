require 'rails_helper'

RSpec.describe "MerchantRelations", type: :request do
  describe "GET /api/v1/merchants/:id/items" do
    before(:each) do
      @merchant = create(:merchant)
      @merchant.items << create(:item, name: "Item 1")
      @merchant.items << create(:item, name: "Item 2")
      create(:item, name: "Item 3")
    end

    it "has 200 response code" do
      get "/api/v1/merchants/#{@merchant.id}/items"
      expect(response).to have_http_status(200)
    end

    it "renders json" do
      get "/api/v1/merchants/#{@merchant.id}/items"
      expect(response.content_type).to eq("application/json")
    end

    it "returns information on a merchants items" do
      get "/api/v1/merchants/#{@merchant.id}/items"

      items = json_body
      names = items.map { |i| i[:name] }

      expect(items.count).to eq 2
      expect(names.include?("Item 1")).to eq true
      expect(names.include?("Item 2")).to eq true
      expect(names.include?("Item 3")).to eq false
    end
  end

  describe "GET /api/v1/merchants/:id/invoices" do
    before(:each) do
      @merchant = create(:merchant)
      @merchant.invoices << create(:invoice, status: "shipped")
      @merchant.invoices << create(:invoice, status: "pending")
      create(:invoice, status: "failed")
    end

    it "has 200 response code" do
      get "/api/v1/merchants/#{@merchant.id}/invoices"
      expect(response).to have_http_status(200)
    end

    it "renders json" do
      get "/api/v1/merchants/#{@merchant.id}/invoices"
      expect(response.content_type).to eq("application/json")
    end

    it "returns information on a merchant" do
      get "/api/v1/merchants/#{@merchant.id}/invoices"

      invoices = json_body
      status = invoices.map { |i| i[:status] }

      expect(invoices.count).to eq 2
      expect(status.include?("shipped")).to eq true
      expect(status.include?("pending")).to eq true
      expect(status.include?("failed")).to eq false
    end
  end
end
