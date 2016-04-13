require 'rails_helper'

RSpec.describe "TransactionRelations", type: :request do
  before(:each) do
    @invoice = create(:invoice, status: "paid")
    @transaction = @invoice.transactions << create(:transaction)
  end

  it "has 200 response code" do
    get "/api/v1/transactions/#{@transaction.first.id}/invoice"
    expect(response).to have_http_status(200)
  end

  it "renders json" do
    get "/api/v1/transactions/#{@transaction.first.id}/invoice"
    expect(response.content_type).to eq("application/json")
  end

  it "returns information on a invoice invoice" do
    get "/api/v1/transactions/#{@transaction.first.id}/invoice"

    invoice = json_body

    expect(invoice[:status]).to eq "paid"
  end
end
