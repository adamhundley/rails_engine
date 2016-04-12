FactoryGirl.define do
  factory :invoice do
    customer nil
    merchant nil
    status "shipped"
  end
end
