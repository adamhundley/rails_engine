require 'rails_helper'

RSpec.describe "MerchantsBusinessItelligences", type: :request do
  context "GET /api/v1/merchants/most_revenue?quantity=x" do
    describe "returns the top merchant by total revenue" do
      before(:each) do
        top_merchants
      end

      it "has 200 response code" do
        get '/api/v1/merchants/most_revenue?quantity=2'
        expect(response).to have_http_status(200)
      end

      it "renders json" do
        get '/api/v1/merchants/most_revenue?quantity=2'
        expect(response.content_type).to eq("application/json")
      end

      it "returns information on a transaction" do
        get '/api/v1/merchants/most_revenue?quantity=2'

        top_merchants = json_body

        expect(Merchant.count).to eq 3
        expect(top_merchants.count).to eq 2

        first_merchant = top_merchants.first
        second_merchant = top_merchants.second

        expect(first_merchant.keys). to eq [:id, :name, :created_at, :updated_at, :revenue]
        expect(first_merchant[:id]).to eq 1
        expect(first_merchant[:name]).to eq "Merchant 1"
        expect(second_merchant[:id]).to eq 2
        expect(second_merchant[:name]).to eq "Merchant 2"
      end
    end
  end

  context "GET /api/v1/merchants/most_items?quantity=x" do
    describe "returns the top merchant by most_items" do
      before(:each) do
        top_merchants
      end

      it "has 200 response code" do
        get '/api/v1/merchants/most_items?quantity=2'
        expect(response).to have_http_status(200)
      end

      it "renders json" do
        get '/api/v1/merchants/most_items?quantity=2'
        expect(response.content_type).to eq("application/json")
      end

      it "returns information on a transaction" do
        get '/api/v1/merchants/most_items?quantity=2'

        top_merchants = json_body

        expect(Merchant.count).to eq 3
        expect(top_merchants.count).to eq 2

        first_merchant = top_merchants.first
        second_merchant = top_merchants.second

        expect(first_merchant.keys). to eq [:id, :name, :created_at, :updated_at, :total_items]
        expect(first_merchant[:id]).to eq 1
        expect(first_merchant[:name]).to eq "Merchant 1"
        expect(second_merchant[:id]).to eq 2
        expect(second_merchant[:name]).to eq "Merchant 2"
      end
    end
  end

  context "GET /api/v1/merchants/revenue?date=x" do
    describe "returns the total revenue for date x across all merchants" do
      before(:each) do
        top_merchants
        @date = "2012-03-16 11:55:05"
      end

      it "has 200 response code" do
        get "/api/v1/merchants/revenue?date=#{@date}"
        expect(response).to have_http_status(200)
      end

      it "renders json" do
        get "/api/v1/merchants/revenue?date=#{@date}"
        expect(response.content_type).to eq("application/json")
      end

      it "returns information on a transaction" do
        get "/api/v1/merchants/revenue?date=#{@date}"

        revenue = json_body

        expect(revenue.keys). to eq [:total_revenue]
        expect(revenue[:total_revenue]).to eq "123.86"
      end
    end
  end
end
