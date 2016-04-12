require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe Transaction do
    it { should validate_presence_of :result}
    it { should validate_presence_of :credit_card_number}
    it { should belong_to :invoice}

  end

  it "result can't be nil" do
    Transaction.create(result: "")

    expect(Transaction.count).to eq 0
  end

  it "should be valid" do
    transaction = create(:transaction)

    expect(transaction).to be_instance_of Transaction
    expect(transaction).to be_valid
  end
end
