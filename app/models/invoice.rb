class Invoice < ActiveRecord::Base
  belongs_to :customer
  belongs_to :merchant
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items
  validates :status, presence: true


  def self.random
    all.order("RANDOM()").first
  end

  def self.total_revenue_by_date(date)
    where(created_at: date).joins(:transactions, :invoice_items).where(transactions: {result: "success"}).sum("invoice_items.unit_price * invoice_items.quantity")
  end
end
