class CreateCustomers < ActiveRecord::Migration
  def change
    enable_extension("citext")
    create_table :customers do |t|
      t.citext :first_name
      t.citext :last_name

      t.timestamps null: false
    end
  end
end
