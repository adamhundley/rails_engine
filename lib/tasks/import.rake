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
  end
end
