require 'rails_helper'

RSpec.describe "InvoiceRelations", type: :request do
  describe "GET /api/v1/invoices/:id/transactions" do
    before(:each) do
      @invoice = create(:invoice)
      @invoice.transactions << create(:transaction, result: "success")
      @invoice.transactions << create(:transaction, result: "pending")
      create(:transaction, result: "failed")
    end

    it "has 200 response code" do
      get "/api/v1/invoices/#{@invoice.id}/transactions"
      expect(response).to have_http_status(200)
    end

    it "renders json" do
      get "/api/v1/invoices/#{@invoice.id}/transactions"
      expect(response.content_type).to eq("application/json")
    end

    it "returns information on a invoices transactions" do
      get "/api/v1/invoices/#{@invoice.id}/transactions"

      transactions = json_body
      results = transactions.map { |i| i[:result] }

      expect(transactions.count).to eq 2
      expect(results.include?("success")).to eq true
      expect(results.include?("pending")).to eq true
      expect(results.include?("failed")).to eq false
    end
  end

  describe "GET /api/v1/invoices/:id/invoice_items" do
    before(:each) do
      @invoice = create(:invoice)
      @invoice.invoice_items << create(:invoice_item, quantity: 1)
      @invoice.invoice_items << create(:invoice_item, quantity: 2)
      create(:invoice_item, quantity: 3)
    end

    it "has 200 response code" do
      get "/api/v1/invoices/#{@invoice.id}/invoice_items"
      expect(response).to have_http_status(200)
    end

    it "renders json" do
      get "/api/v1/invoices/#{@invoice.id}/invoice_items"
      expect(response.content_type).to eq("application/json")
    end

    it "returns information on a invoices invoice_items" do
      get "/api/v1/invoices/#{@invoice.id}/invoice_items"

      invoice_items = json_body
      quantities = invoice_items.map { |i| i[:quantity] }

      expect(invoice_items.count).to eq 2
      expect(quantities.include?(1)).to eq true
      expect(quantities.include?(2)).to eq true
      expect(quantities.include?(3)).to eq false
    end
  end

  describe "GET /api/v1/invoices/:id/items" do
    before(:each) do
      invoice_item = create(:invoice_item)
      invoice_item.item = create(:item, name: "Test 1")
      @invoice = create(:invoice)
      @invoice.invoice_items << invoice_item
      create(:item, name: "Test 2")
    end

    it "has 200 response code" do
      get "/api/v1/invoices/#{@invoice.id}/items"
      expect(response).to have_http_status(200)
    end

    it "renders json" do
      get "/api/v1/invoices/#{@invoice.id}/items"
      expect(response.content_type).to eq("application/json")
    end

    it "returns information on a invoices items" do
      get "/api/v1/invoices/#{@invoice.id}/items"

      expect(Item.count).to eq 2

      items = json_body
      names = items.map { |i| i[:name] }

      expect(items.count).to eq 1
      expect(names.include?("Test 1")).to eq true
      expect(names.include?("Test 2")).to eq false
    end
  end

  describe "GET /api/v1/invoices/:id/customer" do
    before(:each) do
      @customer = create(:customer, first_name: "Adam", last_name: "Booger")
      @invoice = @customer.invoices << create(:invoice, status: "shipped")
    end

    it "has 200 response code" do
      get "/api/v1/invoices/#{@invoice.first.id}/customer"
      expect(response).to have_http_status(200)
    end

    it "renders json" do
      get "/api/v1/invoices/#{@invoice.first.id}/customer"
      expect(response.content_type).to eq("application/json")
    end

    it "returns information on a invoices customer" do
      get "/api/v1/invoices/#{@invoice.first.id}/customer"

      customer = json_body

      expect(customer[:first_name]).to eq "Adam"
      expect(customer[:last_name]).to eq "Booger"
      expect(customer[:id]).to eq @customer.id
    end
  end

  describe "GET /api/v1/invoices/:id/merchant" do
    before(:each) do
      @merchant = create(:merchant, name: "Adam the Merchant")
      @invoice = @merchant.invoices << create(:invoice)
    end

    it "has 200 response code" do
      get "/api/v1/invoices/#{@invoice.first.id}/merchant"
      expect(response).to have_http_status(200)
    end

    it "renders json" do
      get "/api/v1/invoices/#{@invoice.first.id}/merchant"
      expect(response.content_type).to eq("application/json")
    end

    it "returns information on a invoices merchant" do
      get "/api/v1/invoices/#{@invoice.first.id}/merchant"

      merchant = json_body

      expect(merchant[:name]).to eq "Adam the Merchant"
      expect(merchant[:id]).to eq @merchant.id
    end
  end
end
