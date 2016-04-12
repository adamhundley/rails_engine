require 'rails_helper'

RSpec.describe "TransactionActions", type: :request do
  describe "GET /api/v1/transactions" do
    before(:each) do
      @transaction = create(:transaction)
    end

    it "has 200 response code" do
      get '/api/v1/transactions'
      expect(response).to have_http_status(200)
    end

    it "renders json" do
      get '/api/v1/transactions'
      expect(response.content_type).to eq("application/json")
    end

    it "returns information on a transaction" do
      get '/api/v1/transactions'

      transactions = json_body
      parsed_transaction = transactions.first

      expect(parsed_transaction.keys). to eq [:id, :credit_card_number, :result, :invoice_id, :created_at, :updated_at]
      expect(parsed_transaction[:id]).to eq(@transaction[:id])
      expect(parsed_transaction[:credit_card_number]).to eq(@transaction[:credit_card_number])
      expect(parsed_transaction[:result]).to eq(@transaction[:result])
      expect(parsed_transaction[:result]).to eq(@transaction[:result])
    end
  end

  describe "GET /api/v1/transactions/:id" do
    before(:each) do
      @transaction = create(:transaction)
    end

    it "has 200 response code" do
      get '/api/v1/transactions/1'
      expect(response).to have_http_status(200)
    end

    # it "has empty arry for unknown transaction" do
    #   get '/api/v1/transactions/12'
    #
    #   response = json_body
    #   expect(response).to have_http_status(404)
    #   expect(response).to eq([])
    # end

    it "renders json" do
      get '/api/v1/transactions/1'
      expect(response.content_type).to eq("application/json")
    end

    it "returns information on a transaction" do
      get '/api/v1/transactions/1'

      transaction = json_body

      expect(transaction[:id]).to eq(@transaction[:id])
      expect(transaction[:result]).to eq(@transaction[:result])
      expect(transaction[:credit_card_number]).to eq(@transaction[:credit_card_number])
    end
  end

  describe "GET /api/v1/transactions/find?id=1" do
    before(:each) do
      @transaction = create(:transaction)
    end

    it "has 200 response code" do
      get '/api/v1/transactions/find?id=1'
      expect(response).to have_http_status(200)
    end

    it "renders json" do
      get '/api/v1/transactions/find?id=1'
      expect(response.content_type).to eq("application/json")
    end

    it "returns information on a transaction by result" do
      get '/api/v1/transactions/find?result=success'
      transaction = json_body

      expect(transaction[:result]).to eq(@transaction[:result])
    end

    it "returns information on a transaction by result without case sensitivity" do
      get '/api/v1/transactions/find?result=success'
      transaction = json_body
      expect(transaction[:result]).to eq(@transaction[:result])
    end

    it "returns information on a transaction by id" do
      get '/api/v1/transactions/find?id=1'

      transaction = json_body

      expect(transaction[:id]).to eq(@transaction[:id])
    end
  end

  describe "GET /api/v1/transactions/find_all?result=success" do
    before(:each) do
      @transaction1 = create(:transaction)
      @transaction2 = create(:transaction)
    end

    it "has 200 response code" do
      get '/api/v1/transactions/find_all?result=success'
      expect(response).to have_http_status(200)
    end

    it "renders json" do
      get '/api/v1/transactions/find_all?result=success'
      expect(response.content_type).to eq("application/json")
    end

    it "returns information on a transactions by result" do
      get '/api/v1/transactions/find_all?result=success'

      transactions = json_body

      expect(transactions.count).to eq 2
      expect(transactions.first[:result]).to eq(@transaction1[:result])
      expect(transactions.last[:result]).to eq(@transaction2[:result])
      expect(transactions.first[:id]).to eq(@transaction1[:id])
      expect(transactions.last[:id]).to eq(@transaction2[:id])
    end
  end

  describe "GET /api/v1/transactions/random" do
    before(:each) do
      @transaction1 = create(:transaction)
      @transaction2 = create(:transaction)
      @transaction3 = create(:transaction)
    end

    it "has 200 response code" do
      get '/api/v1/transactions/random'
      expect(response).to have_http_status(200)
    end

    it "renders json" do
      get '/api/v1/transactions/random'
      expect(response.content_type).to eq("application/json")
    end

    it "returns information on a random transaction" do
      get '/api/v1/transactions/random'

      transaction = json_body
      ids = [@transaction1[:id], @transaction2[:id], @transaction3[:id]]
      names = [@transaction1[:result], @transaction2[:result], @transaction3[:result]]

      expect(names.include?(transaction[:result])).to eq(true)
      expect(ids.include?(transaction[:id])).to eq(true)
    end
  end

end
