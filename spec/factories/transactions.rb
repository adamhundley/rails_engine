FactoryGirl.define do
  factory :transaction do
    invoice nil
    credit_card_number "MyString"
    result "success"
  end
end
