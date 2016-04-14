require 'rails_helper'

RSpec.describe "MerchantBusinessIntelligences", type: :request do
  context "GET /api/v1/merchants/:id/revenue" do
    describe "returns the total revenue for that merchant across all transactions" do
      before(:each) do
        top_merchants
      end

      it "has 200 response code" do
        get '/api/v1/merchants/1/revenue'
        expect(response).to have_http_status(200)
      end

      it "renders json" do
        get '/api/v1/merchants/1/revenue'
        expect(response.content_type).to eq("application/json")
      end

      it "returns information on revenue" do
        get '/api/v1/merchants/1/revenue'

        revenue = json_body

        expect(revenue.keys). to eq [:revenue]
        expect(revenue[:revenue]).to eq "240.85"
      end
    end
  end

  context "GET /api/v1/merchants/:id/revenue?date=x" do
    describe "returns the total revenue for that merchant for a specific invoice date x" do
      before(:each) do
        top_merchants
        @date = "2012-03-16 11:55:05"
      end

      it "has 200 response code" do
        get "/api/v1/merchants/1/revenue?date=#{@date}"
        expect(response).to have_http_status(200)
      end

      it "renders json" do
        get "/api/v1/merchants/1/revenue?date=#{@date}"
        expect(response.content_type).to eq("application/json")
      end

      it "returns information on a revenue" do
        get "/api/v1/merchants/1/revenue?date=#{@date}"

        revenue = json_body

        expect(revenue.keys). to eq [:revenue]
        expect(revenue[:revenue]).to eq "88.72"
      end
    end
  end

  context "GET /api/v1/merchants/:id/favorite_customer" do
    describe "returns the customer who has conducted the most total number of successful transactions" do
      before(:each) do
        top_merchants
      end

      it "has 200 response code" do
        get "/api/v1/merchants/1/favorite_customer"
        expect(response).to have_http_status(200)
      end

      it "renders json" do
        get "/api/v1/merchants/1/favorite_customer"
        expect(response.content_type).to eq("application/json")
      end

      it "returns information on a customer" do
        get "/api/v1/merchants/1/favorite_customer"

        revenue = json_body

        expect(revenue.keys).to eq [:id, :first_name, :last_name, :created_at, :updated_at, :transaction_count]
        expect(revenue[:transaction_count]).to eq 2
        expect(revenue[:id]).to eq 1
        expect(revenue[:first_name]).to eq "Adam"
      end
    end
  end

  context "GET /api/v1/merchants/:id/customers_with_pending_invoices" do
    describe "returns a collection of customers which have pending (unpaid) invoices" do
      before(:each) do
        top_merchants
      end

      it "has 200 response code" do
        get "/api/v1/merchants/2/customers_with_pending_invoices"
        expect(response).to have_http_status(200)
      end

      it "renders json" do
        get "/api/v1/merchants/2/customers_with_pending_invoices"
        expect(response.content_type).to eq("application/json")
      end

      it "returns information on a customer" do
        get "/api/v1/merchants/2/customers_with_pending_invoices"

        customers = json_body
        customer = customers.first

        expect(customer.keys).to eq [:id, :first_name, :last_name, :created_at, :updated_at]
        expect(customer[:id]).to eq 2
        expect(customer[:first_name]).to eq "David"
      end
    end
  end
end
