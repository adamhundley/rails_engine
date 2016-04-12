require 'rails_helper'

RSpec.describe Item, type: :model do
  describe Item do
    it { should validate_presence_of :name}
    it { should validate_presence_of :unit_price}
    it { should belong_to :merchant}
  end

  it "name can't be nil" do
    Item.create(name: "")

    expect(Item.count).to eq 0
  end

  it "should be valid" do
    item = create(:item)

    expect(item).to be_instance_of Item
    expect(item).to be_valid
  end

  it "should have a formatted price" do
    item = create(:item)

    expect(item).to be_instance_of Item
    expect(item).to be_valid
  end
  
end
