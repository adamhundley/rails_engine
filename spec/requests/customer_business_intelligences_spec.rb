require 'rails_helper'

RSpec.describe "CustomerBusinessIntelligences", type: :request do
  context "GET /api/v1/customers/:id/favorite_merchant" do
    describe "returns a merchant where the customer has conducted the most successful transactions" do
      before(:each) do
        top_merchants
      end

      it "has 200 response code" do
        get '/api/v1/customers/1/favorite_merchant'
        expect(response).to have_http_status(200)
      end

      it "renders json" do
        get '/api/v1/customers/1/favorite_merchant'
        expect(response.content_type).to eq("application/json")
      end

      it "returns information on a merchant" do
        get '/api/v1/customers/1/favorite_merchant'

        merchant = json_body

        expect(merchant.keys). to eq [:id, :name, :created_at, :updated_at, :transaction_count]
        expect(merchant[:name]).to eq "Merchant 1"
      end
    end
  end
end
