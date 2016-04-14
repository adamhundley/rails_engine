class InvoiceItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :invoice
  has_many :transactions, through: :invoice

  validates :quantity, presence: true
  validates :unit_price, presence: true

  default_scope { order(id: :asc) }

  def self.random
    all.order("RANDOM()").first
  end

end
