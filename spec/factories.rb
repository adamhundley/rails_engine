# FactoryGirl.define do
#   factory :transaction do
#     invoice_id 1
#     credit_card_number 1
#     result "Test transaction"
#   end
#
#   factory :merchant do
#     name "Adam Hundley"
#
#     factory :merchant_with_items do
#
#       transient do
#         items_count 3
#       end
#
#       after(:create) do |merchant, evaluator|
#         create_list(:item, evaluator.items_count, merchant: merchant)
#       end
#     end
#
#     factory :merchant_with_invoices do
#
#       transient do
#         invoices_count 3
#       end
#
#       after(:create) do |merchant, evaluator|
#         create_list(:invoice, evaluator.invoices_count, merchant: merchant)
#       end
#     end
#   end
#
#   factory :item do
#     name "Test item"
#     description "Test description"
#     unit_price 1
#     merchant_id 1
#   end
#
#   factory :invoice do
#     customer_id 1
#     merchant_id 1
#     status "pending"
#
#
#     factory :invoice_with_transactions do
#
#       transient do
#         transactions_count 3
#       end
#
#       after(:create) do |invoice, evaluator|
#         create_list(:transaction, evaluator.transactions_count, invoice: invoice)
#       end
#     end
#
#     factory :invoice_with_invoice_items do
#
#       transient do
#         invoice_items_count 3
#       end
#
#       after(:create) do |invoice, evaluator|
#         create_list(:invoice_item, evaluator.invoice_items_count, invoice: invoice)
#       end
#     end
#
#     trait :with_items do
#       after(:create) do |invoice|
#         3.times do |i|
#           invoice.items << create(:item, name: "item #{i}")
#         end
#       end
#     end
#   end
#
#   factory :invoice_item do
#     item_id 1
#     invoice_id 1
#     quantity 1
#     unit_price 1
#   end
#
#   factory :customer do
#     first_name "Adam"
#     last_name  "Hundley"
#   end
# end
