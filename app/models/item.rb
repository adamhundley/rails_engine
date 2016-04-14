class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  validates :name, presence: true
  validates :unit_price, presence: true

  default_scope { order(id: :asc) }

  def self.random
    all.order("RANDOM()").first
  end

  def self.most_revenue(quantity)
    select("id", "name", "SUM(invoice_items.unit_price * invoice_items.quantity) AS revenue")
    .joins(invoices: [:transactions, :invoice_items])
    .where(transactions: {result: "success"})
    .group(:id)
    .reorder("revenue DESC")
    .take(quantity.to_i)
  end

  def self.most_items(quantity)
    select("id", "name", "SUM(invoice_items.quantity) AS total_items_sold")
    .joins(invoices: :transactions)
    .where(transactions: {result: "success"})
    .group(:id)
    .reorder("total_items_sold DESC")
    .take(quantity.to_i)
  end

  def best_day
    invoices.select("invoices.created_at", "SUM(invoice_items.quantity * invoice_items.unit_price) AS total").joins(:transactions).where(transactions: {result: "success"}).group(:created_at).reorder("total DESC").first
  end
end
