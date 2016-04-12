class AddDescriptionToItems < ActiveRecord::Migration
  def change
    enable_extension("citext")
    add_column :items, :description, :citext
  end
end
