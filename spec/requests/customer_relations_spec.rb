require 'rails_helper'

RSpec.describe "CustomerRelations", type: :request do
  describe "GET /api/v1/customers/:id/invoices" do
    before(:each) do
      @customer = create(:customer, first_name: "Adam", last_name: "Booger")
      @customer.invoices << create(:invoice, status: "shipped")
      @customer.invoices << create(:invoice, status: "pending")
      create(:invoice, status: "failed")
    end

    it "has 200 response code" do
      get "/api/v1/customers/#{@customer.id}/invoices"
      expect(response).to have_http_status(200)
    end

    it "renders json" do
      get "/api/v1/customers/#{@customer.id}/invoices"
      expect(response.content_type).to eq("application/json")
    end

    it "returns information on a customers invoices" do
      get "/api/v1/customers/#{@customer.id}/invoices"

      invoices = json_body
      status = invoices.map { |i| i[:status] }

      expect(status.include?("shipped")).to eq true
      expect(status.include?("pending")).to eq true
      expect(status.include?("failed")).to eq false
      expect(invoices.first[:customer_id]).to eq @customer.id
    end
  end

  describe "GET /api/v1/customers/:id/transactions" do
    before(:each) do
      @invoice = create(:invoice)
      @invoice.transactions << create(:transaction, result: "success")
      @invoice.transactions << create(:transaction, result: "pending")
      @customer = create(:customer, first_name: "Adam", last_name: "Booger")
      @customer.invoices << @invoice
    end

    it "has 200 response code" do
      get "/api/v1/customers/#{@customer.id}/transactions"
      expect(response).to have_http_status(200)
    end

    it "renders json" do
      get "/api/v1/customers/#{@customer.id}/transactions"
      expect(response.content_type).to eq("application/json")
    end

    it "returns information on a customers transactions" do
      get "/api/v1/customers/#{@customer.id}/transactions"

      transactions = json_body
      results = transactions.map { |i| i[:result] }

      expect(results.include?("success")).to eq true
      expect(results.include?("pending")).to eq true
      expect(results.include?("failed")).to eq false
      expect(transactions.first[:invoice_id]).to eq @invoice.id
    end
  end
end
