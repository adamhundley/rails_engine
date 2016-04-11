require 'rails_helper'

RSpec.describe "Merchants", type: :request do
  describe "GET /api/v1/merchants" do
    it "has 200 response code" do
      get '/api/v1/merchants.json'
      expect(response).to have_http_status(200)
    end

    it "renders json" do
      get '/api/v1/merchants.json'
      expect(response.content_type).to eq("application/json")
    end

    it "returns information on a merchant" do
      merchant = Merchant.create(name:"Test Merchant")

      get '/api/v1/merchants.json'

      merchants = JSON.parse(response.body, symbolize_names: true)
      parsed_merchant = merchants.first

      expect(parsed_merchant.keys). to eq [:id, :name, :created_at, :updated_at]
      expect(parsed_merchant[:name]).to eq(merchant[:name])
    end
  end
end
