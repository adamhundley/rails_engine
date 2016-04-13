require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe Customer do
    it { should validate_presence_of :first_name}
    it { should validate_presence_of :last_name}
    it { should have_many :invoices}
  end

  it "name can't be nil" do
    Customer.create(first_name: "")

    expect(Customer.count).to eq 0
  end

  it "should be valid" do
    customer = create(:customer)

    expect(customer).to be_instance_of Customer
    expect(customer).to be_valid
  end
end
