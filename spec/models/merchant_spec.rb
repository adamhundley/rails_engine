require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe Merchant do
    it { should validate_presence_of :name}
    it { should have_many :items}
    it { should have_many :invoices}
  end

  it "name can't be nil" do
    Merchant.create(name: "")

    expect(Merchant.count).to eq 0
  end

  it "should be valid" do
    merchant = create(:merchant)

    expect(merchant).to be_instance_of Merchant
    expect(merchant).to be_valid
  end
end
