require 'rails_helper'

RSpec.describe "ItemsBusinessItelligences", type: :request do
  context "GET /api/v1/items/most_revenue?quantity=x" do
    describe "returns the top x items ranked by total revenue generated" do
      before(:each) do
        top_merchants
      end

      it "has 200 response code" do
        get '/api/v1/items/most_revenue?quantity=2'
        expect(response).to have_http_status(200)
      end

      it "renders json" do
        get '/api/v1/items/most_revenue?quantity=2'
        expect(response.content_type).to eq("application/json")
      end

      it "returns information on top items" do
        get '/api/v1/items/most_revenue?quantity=2'

        items = json_body
        item = items.first

        expect(items.count).to eq 2
        expect(item.keys). to eq [:id, :name, :revenue]
        expect(item[:name]).to eq "Item 1"
        expect(item[:revenue]).to eq "488.16"
      end
    end
  end

  context "GET /api/v1/items/most_items?quantity=x" do
    describe "returns the top x item instances ranked by total number sold" do
      before(:each) do
        top_merchants
      end

      it "has 200 response code" do
        get '/api/v1/items/most_items?quantity=2'
        expect(response).to have_http_status(200)
      end

      it "renders json" do
        get '/api/v1/items/most_items?quantity=2'
        expect(response.content_type).to eq("application/json")
      end

      it "returns information on top items" do
        get '/api/v1/items/most_items?quantity=2'

        items = json_body
        item = items.first

        expect(items.count).to eq 2
        expect(item.keys). to eq [:id, :name, :total_items_sold]
        expect(item[:name]).to eq "Item 1"
        expect(item[:total_items_sold]).to eq 13
      end
    end
  end

  context "GET /api/v1/items/:id/best_day" do
    describe "returns the date with the most sales for the given item using the invoice date" do
      before(:each) do
        top_merchants
      end

      it "has 200 response code" do
        get '/api/v1/items/1/best_day'
        expect(response).to have_http_status(200)
      end

      it "renders json" do
        get '/api/v1/items/1/best_day'
        expect(response.content_type).to eq("application/json")
      end

      it "returns information on most sales of an item by date" do
        get '/api/v1/items/1/best_day'

        date = json_body

        expect(date[:best_day]).to eq "2012-03-16T11:55:05.000Z"
      end
    end
  end
end
