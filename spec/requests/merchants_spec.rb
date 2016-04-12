require 'rails_helper'

RSpec.describe "Merchants", type: :request do
  describe "GET /api/v1/merchants" do
    before(:each) do
      @merchant = create(:merchant)
    end

    it "has 200 response code" do
      get '/api/v1/merchants.json'
      expect(response).to have_http_status(200)
    end

    it "renders json" do
      get '/api/v1/merchants.json'
      expect(response.content_type).to eq("application/json")
    end

    it "returns information on a merchant" do
      get '/api/v1/merchants.json'

      merchants = json_body
      parsed_merchant = merchants.first

      expect(parsed_merchant.keys). to eq [:id, :name, :created_at, :updated_at]
      expect(parsed_merchant[:name]).to eq(@merchant[:name])
    end
  end

  describe "GET /api/v1/merchant/:id" do
    before(:each) do
      @merchant = create(:merchant)
    end

    it "has 200 response code" do
      get '/api/v1/merchants/1.json'
      expect(response).to have_http_status(200)
    end

    it "renders json" do
      get '/api/v1/merchants/1.json'
      expect(response.content_type).to eq("application/json")
    end

    it "returns information on a merchant" do
      get '/api/v1/merchants/1.json'

      merchant = json_body

      expect(merchant.keys). to eq [:id, :name, :created_at, :updated_at]
      expect(merchant[:name]).to eq(@merchant[:name])
    end
  end
end
