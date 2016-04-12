require 'csv'

namespace :db do
  desc "Import data from CSV"
  task load_csv: :environment do
    merchants = File.join Rails.root, "data/merchants.csv"
    CSV.foreach(merchants, headers: true) do |row|
      Merchant.create(row.to_h)
    end

    customers = File.join Rails.root, "data/customers.csv"
    CSV.foreach(customers, headers: true) do |row|
      Customer.create(row.to_h)
    end

    items = File.join Rails.root, "data/items.csv"
    CSV.foreach(items, headers: true) do |row|
      unit_price = row["unit_price"].to_i / 100.to_f

      Item.create(id:          row["id"],
                  name:        row["name"],
                  description: row["description"],
                  unit_price:  unit_price,
                  merchant_id: row["merchant_id"],
                  created_at:  row["created_at"],
                  updated_at:  row["updated_at"])
    end
  end
end
