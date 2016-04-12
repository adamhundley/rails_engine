require 'rails_helper'

RSpec.describe "Merchants actions", type: :request do
  describe "GET /api/v1/merchants" do
    before(:each) do
      @merchant = create(:merchant)
    end

    it "has 200 response code" do
      get '/api/v1/merchants'
      expect(response).to have_http_status(200)
    end

    it "renders json" do
      get '/api/v1/merchants'
      expect(response.content_type).to eq("application/json")
    end

    it "returns information on a merchant" do
      get '/api/v1/merchants'

      merchants = json_body
      parsed_merchant = merchants.first

      expect(parsed_merchant.keys). to eq [:id, :name, :created_at, :updated_at]
      expect(parsed_merchant[:name]).to eq(@merchant[:name])
    end
  end

  describe "GET /api/v1/merchants/:id" do
    before(:each) do
      @merchant = create(:merchant)
    end

    it "has 200 response code" do
      get '/api/v1/merchants/1'
      expect(response).to have_http_status(200)
    end

    # it "has empty arry for unknown merchant" do
    #   get '/api/v1/merchants/12'
    #
    #   response = json_body
    #   expect(response).to have_http_status(404)
    #   expect(response).to eq([])
    # end

    it "renders json" do
      get '/api/v1/merchants/1'
      expect(response.content_type).to eq("application/json")
    end

    it "returns information on a merchant" do
      get '/api/v1/merchants/1'

      merchant = json_body

      expect(merchant.keys). to eq [:id, :name, :created_at, :updated_at]
      expect(merchant[:name]).to eq(@merchant[:name])
      expect(merchant[:id]).to eq(@merchant[:id])
    end
  end

  describe "GET /api/v1/merchants/find?id=1" do
    before(:each) do
      @merchant = create(:merchant)
    end

    it "has 200 response code" do
      get '/api/v1/merchants/find?id=1'
      expect(response).to have_http_status(200)
    end

    it "renders json" do
      get '/api/v1/merchants/find?id=1'
      expect(response.content_type).to eq("application/json")
    end

    it "returns information on a merchant by name without case sensitivity" do
      get '/api/v1/merchants/find?name=test Merchant'

      merchant = json_body

      expect(merchant.keys). to eq [:id, :name, :created_at, :updated_at]
      expect(merchant[:name]).to eq(@merchant[:name])
    end

    it "returns information on a merchant by id" do
      get '/api/v1/merchants/find?id=1'

      merchant = json_body

      expect(merchant[:id]).to eq(@merchant[:id])
    end
  end

  describe "GET /api/v1/merchants/find_all?name=Cummings-Thiel" do
    before(:each) do
      @merchant1 = create(:merchant)
      @merchant2 = create(:merchant)
    end

    it "has 200 response code" do
      get '/api/v1/merchants/find_all?name=Test+Merchant'
      expect(response).to have_http_status(200)
    end

    it "renders json" do
      get '/api/v1/merchants/find_all?id=1'
      expect(response.content_type).to eq("application/json")
    end

    it "returns information on a merchants by name without case sensitivity" do
      get '/api/v1/merchants/find_all?name=Test merchant'

      merchants = json_body

      expect(merchants.count).to eq 2
      expect(merchants.first[:name]).to eq(@merchant1[:name])
      expect(merchants.last[:name]).to eq(@merchant2[:name])
      expect(merchants.first[:id]).to eq(@merchant1[:id])
      expect(merchants.last[:id]).to eq(@merchant2[:id])
    end
  end

  describe "GET /api/v1/merchants/random" do
    before(:each) do
      @merchant1 = create(:merchant)
      @merchant2 = create(:merchant)
      @merchant3 = create(:merchant)
    end

    it "has 200 response code" do
      get '/api/v1/merchants/random'
      expect(response).to have_http_status(200)
    end

    it "renders json" do
      get '/api/v1/merchants/random'
      expect(response.content_type).to eq("application/json")
    end

    it "returns information on a random merchant" do
      get '/api/v1/merchants/random'

      merchant = json_body
      ids = [@merchant1[:id], @merchant2[:id], @merchant3[:id]]
      names = [@merchant1[:name], @merchant2[:name], @merchant3[:name]]

      expect(names.include?(merchant[:name])).to eq(true)
      expect(ids.include?(merchant[:id])).to eq(true)
    end
  end
end
