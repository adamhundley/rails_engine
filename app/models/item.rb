class Item < ActiveRecord::Base
  belongs_to :merchant
  validates :name, presence: true
  validates :unit_price, presence: true

  default_scope { order(id: :asc) }

end
