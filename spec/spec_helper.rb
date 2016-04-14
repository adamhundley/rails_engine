require "codeclimate-test-reporter"
CodeClimate::TestReporter.start
require 'simplecov'
SimpleCov.start("rails")

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end

def top_merchants
  item1 = create(:item, name: "Item 1", unit_price: 20.34)
  item2 = create(:item, name: "Item 2", unit_price: 5.54)
  item3 = create(:item, name: "Item 3", unit_price: 50.43)

  customer1 = create(:customer, first_name: "Adam")
  customer2 = create(:customer, first_name: "David")
  customer3 = create(:customer, first_name: "Nick")

  invoice1 = create(:invoice, created_at: "2012-03-16 11:55:05", customer_id: customer1.id)
  invoice2 = create(:invoice, customer_id: customer2.id)
  invoice3 = create(:invoice, created_at: "2012-03-16 11:55:05", customer_id: customer3.id)
  invoice4 = create(:invoice, customer_id: customer1.id)
  invoice5 = create(:invoice, customer_id: customer2.id)
  invoice6 = create(:invoice, created_at: "2012-03-16 11:55:05", customer_id: customer3.id)

  invoice1.invoice_items << create(:invoice_item, quantity: 3, unit_price: 20.34, item_id: item1.id )
  invoice1.invoice_items << create(:invoice_item, quantity: 5, unit_price: 5.54, item_id: item2.id)
  invoice2.invoice_items << create(:invoice_item, quantity: 5, unit_price: 20.34, item_id: item1.id)
  invoice2.invoice_items << create(:invoice_item, quantity: 1, unit_price: 50.43, item_id: item3.id )
  invoice3.invoice_items << create(:invoice_item, quantity: 2, unit_price: 20.34, item_id: item1.id)
  invoice4.invoice_items << create(:invoice_item, quantity: 1, unit_price: 50.43, item_id: item3.id )
  invoice5.invoice_items << create(:invoice_item, quantity: 4, unit_price: 5.54, item_id: item2.id)
  invoice6.invoice_items << create(:invoice_item, quantity: 4, unit_price: 5.54, item_id: item2.id)
  invoice6.invoice_items << create(:invoice_item, quantity: 3, unit_price: 20.34, item_id: item1.id)

  invoice1.transactions << create(:transaction, result: "success")
  invoice2.transactions << create(:transaction, result: "success")
  invoice3.transactions << create(:transaction, result: "success")
  invoice4.transactions << create(:transaction, result: "success")
  invoice5.transactions << create(:transaction, result: "failed")
  invoice6.transactions << create(:transaction, result: "success")

  merchant1 = create(:merchant, name: "Merchant 1")
  merchant2 = create(:merchant, name: "Merchant 2")
  merchant3 = create(:merchant, name: "Merchant 3")

  merchant1.invoices << invoice1
  merchant1.invoices << invoice2
  merchant2.invoices << invoice3
  merchant2.invoices << invoice5
  merchant2.invoices << invoice6
  merchant3.invoices << invoice4
end
