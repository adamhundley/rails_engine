require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do
  describe InvoiceItem do
    it { should validate_presence_of :quantity}
    it { should validate_presence_of :unit_price}
    it { should belong_to :item}
    it { should belong_to :invoice}
  end

  it "unit_price can't be nil" do
    InvoiceItem.create(unit_price: "")

    expect(InvoiceItem.count).to eq 0
  end

  it "quantity can't be nil" do
    InvoiceItem.create(quantity: "")

    expect(InvoiceItem.count).to eq 0
  end

  it "should be valid" do
    invoice_item = create(:invoice_item)

    expect(invoice_item).to be_instance_of InvoiceItem
    expect(invoice_item).to be_valid
  end

end
