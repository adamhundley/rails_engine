require 'rails_helper'

RSpec.describe "ItemRelations", type: :request do
  describe "GET /api/v1/items/:id/invoice_items" do
    before(:each) do
      @item = create(:item)
      @item.invoice_items << create(:invoice_item, quantity: 1)
      @item.invoice_items << create(:invoice_item, quantity: 2)
      create(:invoice_item, quantity: 3)
    end

    it "has 200 response code" do
      get "/api/v1/items/#{@item.id}/invoice_items"
      expect(response).to have_http_status(200)
    end

    it "renders json" do
      get "/api/v1/items/#{@item.id}/invoice_items"
      expect(response.content_type).to eq("application/json")
    end

    it "returns information on a items invoice_items" do
      get "/api/v1/items/#{@item.id}/invoice_items"

      invoice_items = json_body
      results = invoice_items.map { |i| i[:quantity] }

      expect(invoice_items.count).to eq 2
      expect(results.include?(1)).to eq true
      expect(results.include?(2)).to eq true
      expect(results.include?(3)).to eq false
    end
  end

  describe "GET /api/v1/items/:id/merchant" do
    before(:each) do
      @merchant = create(:merchant, name: "Test Merchant")
      @item = @merchant.items << create(:item)
      create(:merchant, name: "Other Test Merchant")
    end

    it "has 200 response code" do
      get "/api/v1/items/#{@item.first.id}/merchant"
      expect(response).to have_http_status(200)
    end

    it "renders json" do
      get "/api/v1/items/#{@item.first.id}/merchant"
      expect(response.content_type).to eq("application/json")
    end

    it "returns information on a items merchant" do
      get "/api/v1/items/#{@item.first.id}/merchant"

      merchant = json_body

      expect(merchant[:name]).to eq "Test Merchant"
      expect(merchant[:name]).to_not eq "Other Test Merchant"
    end
  end
end
