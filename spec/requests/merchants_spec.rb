require 'rails_helper'

RSpec.describe "Merchants", type: :request do
  describe "GET /api/v1/merchants" do
    it "has 200 response code" do
      get '/api/v1/merchants'
      expect(response).to have_http_status(200)
    end
    
    it "renders json" do
      get '/api/v1/merchants'
      expect(response.content_type).to eq("application/json")
    end
  end
end
