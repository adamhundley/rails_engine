require 'rails_helper'

RSpec.describe "ItemsActions", type: :request do
  describe "GET /api/v1/items" do
    before(:each) do
      @item = create(:item)
    end

    it "has 200 response code" do
      get '/api/v1/items'
      expect(response).to have_http_status(200)
    end

    it "renders json" do
      get '/api/v1/items'
      expect(response.content_type).to eq("application/json")
    end

    it "returns information on a item" do
      get '/api/v1/items'

      items = json_body
      parsed_item = items.first

      expect(parsed_item.keys). to eq [:id, :name, :unit_price, :merchant_id, :created_at, :updated_at, :description]
      expect(parsed_item[:name]).to eq(@item[:name])
      expect(parsed_item[:unit_price]).to eq(@item[:unit_price].to_s)
      expect(parsed_item[:merchant_id]).to eq(@item[:merchant_id])
      expect(parsed_item[:description]).to eq(@item[:description])
    end
  end

  describe "GET /api/v1/items/:id" do
    before(:each) do
      @item = create(:item)
    end

    it "has 200 response code" do
      get '/api/v1/items/1'
      expect(response).to have_http_status(200)
    end

    it "renders json" do
      get '/api/v1/items/1'
      expect(response.content_type).to eq("application/json")
    end

    it "returns information on a item" do
      get '/api/v1/items/1'

      item = json_body

      expect(item[:id]).to eq(@item[:id])
      expect(item[:name]).to eq(@item[:name])
      expect(item[:unit_price]).to eq(@item[:unit_price].to_s)
    end
  end

  describe "GET /api/v1/items/find?id=1" do
    before(:each) do
      @item = create(:item)
    end

    it "has 200 response code" do
      get '/api/v1/items/find?id=1'
      expect(response).to have_http_status(200)
    end

    it "renders json" do
      get '/api/v1/items/find?id=1'
      expect(response.content_type).to eq("application/json")
    end

    it "returns information on a item by name without case sensitivity" do
      get '/api/v1/items/find?name=test'
      item = json_body

      expect(item[:name]).to eq(@item[:name])
    end

    it "returns information on a item by name without case sensitivity" do
      get '/api/v1/items/find?name=test'
      item = json_body
      expect(item[:name]).to eq(@item[:name])
    end

    it "returns information on a item by id" do
      get '/api/v1/items/find?id=1'

      item = json_body

      expect(item[:id]).to eq(@item[:id])
    end

    it "returns information on a item by description" do
      get "/api/v1/items/find?description=#{@item.description}"

      item = json_body

      expect(item[:description]).to eq(@item[:description])
    end
  end

  describe "GET /api/v1/items/find_all?last_name=Cummings" do
    before(:each) do
      @item1 = create(:item)
      @item2 = create(:item)
    end

    it "has 200 response code" do
      get '/api/v1/items/find_all?name=test'
      expect(response).to have_http_status(200)
    end

    it "renders json" do
      get '/api/v1/items/find_all?id=1'
      expect(response.content_type).to eq("application/json")
    end

    it "returns information on a items by name without case sensitivity" do
      get '/api/v1/items/find_all?name=test'

      items = json_body

      expect(items.count).to eq 2
      expect(items.first[:name]).to eq(@item1[:name])
      expect(items.last[:name]).to eq(@item2[:name])
      expect(items.first[:id]).to eq(@item1[:id])
      expect(items.last[:id]).to eq(@item2[:id])
    end

    it "returns information on a items by description" do
      get "/api/v1/items/find_all?description=#{@item1.description}"

      items = json_body

      expect(items.count).to eq 2
      expect(items.first[:description]).to eq(@item1[:description])
      expect(items.last[:description]).to eq(@item2[:description])
    end
  end

  describe "GET /api/v1/items/random" do
    before(:each) do
      @item1 = create(:item)
      @item2 = create(:item)
      @item3 = create(:item)
    end

    it "has 200 response code" do
      get '/api/v1/items/random'
      expect(response).to have_http_status(200)
    end

    it "renders json" do
      get '/api/v1/items/random'
      expect(response.content_type).to eq("application/json")
    end

    it "returns information on a random item" do
      get '/api/v1/items/random'

      item = json_body
      ids = [@item1[:id], @item2[:id], @item3[:id]]
      names = [@item1[:name], @item2[:name], @item3[:name]]

      expect(names.include?(item[:name])).to eq(true)
      expect(ids.include?(item[:id])).to eq(true)
    end
  end
end
