FactoryGirl.define do
  factory :transaction do
    credit_card_number "MyString"
    result "success"
    invoice nil
  end
end
