require 'rails_helper'

RSpec.describe Invoice, type: :model do
  describe Invoice do
    it { should validate_presence_of :status}
    it { should belong_to :merchant}
    it { should belong_to :customer}
    it { should have_many :transactions}
    it { should have_many :invoice_items}
    it { should have_many :items}
  end

  it "name can't be nil" do
    Invoice.create(status: "")

    expect(Invoice.count).to eq 0
  end

  it "should be valid" do
    item = create(:invoice)

    expect(item).to be_instance_of Invoice
    expect(item).to be_valid
  end

end
