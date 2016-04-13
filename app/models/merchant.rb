class Merchant < ActiveRecord::Base
  validates :name, presence: true
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices


  def self.random
    all.order("RANDOM()").first
  end

  def self.top_revenue(quantity)
      select( "merchants.*", "SUM(invoice_items.unit_price * invoice_items.quantity) AS revenue").joins(:invoices => [:transactions, :invoice_items]).where(transactions: {result: "success"}).group(:id).order("revenue DESC").take(quantity.to_i)
  end

  def self.most_items(quantity)
    select( "merchants.*", "SUM(invoice_items.quantity) AS total_items").joins(:invoices => [:transactions, :invoice_items]).where(transactions: {result: "success"}).group(:id).order("total_items DESC").take(quantity.to_i)
  end

  def self.total_revenue_by_date(date)
    select( "merchants.*", "SUM(invoice_items.unit_price * invoice_items.quantity) AS total_revenue").joins(:invoices => [:transactions, :invoice_items]).where(transactions: {result: "success"}).where("invoices.created_at = ?", date).group(:id).order("total_revenue DESC").first
  end
end
