require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe Merchant do
    it { should validate_presence_of :name}
  end

  it "name can't be nil" do
    Merchant.create(name: "")

    expect(Merchant.count).to eq 0
  end
end
