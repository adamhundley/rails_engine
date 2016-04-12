FactoryGirl.define do
  factory :invoice_item do
    item nil
    invoice nil
    quantity 101
    unit_price "101"
  end
end
