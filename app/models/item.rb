class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items
  validates :name, presence: true
  validates :unit_price, presence: true

  default_scope { order(id: :asc) }

  def self.random
    all.order("RANDOM()").first
  end

end
