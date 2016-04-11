require 'csv'

namespace :db do
  desc "Import Merchants from CSV"
  task load_csv: :environment do
    merchants = File.join Rails.root, "data/merchants.csv"
    CSV.foreach(merchants, headers: true) do |row|
      Merchant.create(row.to_h)
    end
  end
end
