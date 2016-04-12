class CreateItems < ActiveRecord::Migration
  def change
    enable_extension("citext")
    create_table :items do |t|
      t.citext :name
      t.string :unit_price
      t.references :merchant, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
