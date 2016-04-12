require 'rails_helper'

RSpec.describe "CustomerActions", type: :request do
  describe "GET /api/v1/customers" do
    before(:each) do
      @customer = create(:customer)
    end

    it "has 200 response code" do
      get '/api/v1/customers'
      expect(response).to have_http_status(200)
    end
  #
    it "renders json" do
      get '/api/v1/customers'
      expect(response.content_type).to eq("application/json")
    end

    it "returns information on a customer" do
      get '/api/v1/customers'

      customers = json_body
      parsed_customer = customers.first

      expect(parsed_customer.keys). to eq [:id, :first_name, :last_name, :created_at, :updated_at]
      expect(parsed_customer[:name]).to eq(@customer[:name])
    end
  end

  describe "GET /api/v1/customers/:id" do
    before(:each) do
      @customer = create(:customer)
    end

    it "has 200 response code" do
      get '/api/v1/customers/1'
      expect(response).to have_http_status(200)
    end

    # it "has empty arry for unknown customer" do
    #   get '/api/v1/customers/12'
    #
    #   response = json_body
    #   expect(response).to have_http_status(404)
    #   expect(response).to eq([])
    # end

    it "renders json" do
      get '/api/v1/customers/1'
      expect(response.content_type).to eq("application/json")
    end

    it "returns information on a customer" do
      get '/api/v1/customers/1'

      customer = json_body

      expect(customer.keys). to eq [:id, :first_name, :last_name, :created_at, :updated_at]
      expect(customer[:id]).to eq(@customer[:id])
      expect(customer[:first_name]).to eq(@customer[:first_name])
      expect(customer[:last_name]).to eq(@customer[:last_name])
    end
  end

  describe "GET /api/v1/customers/find?id=1" do
    before(:each) do
      @customer = create(:customer)
    end

    it "has 200 response code" do
      get '/api/v1/customers/find?id=1'
      expect(response).to have_http_status(200)
    end

    it "renders json" do
      get '/api/v1/customers/find?id=1'
      expect(response.content_type).to eq("application/json")
    end

    it "returns information on a customer by name without case sensitivity" do
      get '/api/v1/customers/find?first_name=test'
      customer = json_body

      expect(customer[:first_name]).to eq(@customer[:first_name])
    end

    it "returns information on a customer by name without case sensitivity" do
      get '/api/v1/customers/find?last_name=test'
      customer = json_body
      expect(customer[:last_name]).to eq(@customer[:last_name])
    end

    it "returns information on a customer by id" do
      get '/api/v1/customers/find?id=1'

      customer = json_body

      expect(customer[:id]).to eq(@customer[:id])
    end
  end

  describe "GET /api/v1/customers/find_all?last_name=Cummings" do
    before(:each) do
      @customer1 = create(:customer)
      @customer2 = create(:customer)
    end
    #
    # it "has 200 response code" do
    #   get '/api/v1/customers/find_all?first_name=test'
    #   expect(response).to have_http_status(200)
    # end
    #
    # it "renders json" do
    #   get '/api/v1/customers/find_all?id=1'
    #   expect(response.content_type).to eq("application/json")
    # end

    it "returns information on a customers by name without case sensitivity" do
      get '/api/v1/customers/find_all?last_name=test'

      customers = json_body

      expect(customers.count).to eq 2
      expect(customers.first[:last_name]).to eq(@customer1[:last_name])
      expect(customers.last[:last_name]).to eq(@customer2[:last_name])
      expect(customers.first[:id]).to eq(@customer1[:id])
      expect(customers.last[:id]).to eq(@customer2[:id])
    end
  end

  describe "GET /api/v1/customers/random" do
    before(:each) do
      @customer1 = create(:customer)
      @customer2 = create(:customer)
      @customer3 = create(:customer)
    end

    it "has 200 response code" do
      get '/api/v1/customers/random'
      expect(response).to have_http_status(200)
    end

    it "renders json" do
      get '/api/v1/customers/random'
      expect(response.content_type).to eq("application/json")
    end

    it "returns information on a random customer" do
      get '/api/v1/customers/random'

      customer = json_body
      ids = [@customer1[:id], @customer2[:id], @customer3[:id]]
      names = [@customer1[:name], @customer2[:name], @customer3[:name]]

      expect(names.include?(customer[:name])).to eq(true)
      expect(ids.include?(customer[:id])).to eq(true)
    end
  end
end
