class CreateTransactions < ActiveRecord::Migration
  def change
    enable_extension("citext")
    create_table :transactions do |t|
      t.citext :credit_card_number
      t.citext :result
      t.references :invoice, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
