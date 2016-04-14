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
      select( "merchants.*", "SUM(invoice_items.unit_price * invoice_items.quantity) AS revenue")
      .joins(:invoices => [:transactions, :invoice_items]).where(transactions: {result: "success"})
      .group(:id).order("revenue DESC")
      .take(quantity.to_i)
  end

  def merchant_revenue(date = nil)
    if date != nil
      return merchant_revenue_by_date(date)
    end
    successful_invoices.sum("invoice_items.unit_price * invoice_items.quantity")
  end

  def merchant_revenue_by_date(date)
    successful_invoices.where(created_at: date).sum("invoice_items.unit_price * invoice_items.quantity")
  end

  def successful_invoices
    invoices.joins(:transactions, :invoice_items)
    .where(transactions: {result: "success"})
  end

  def favorite_customer
    customers.select('customers.*', 'COUNT(transactions.id) AS transaction_count').joins(:transactions).group(:id).where(transactions:{result: "success"}).order("transaction_count DESC").limit(1).first
  end

  def customers_with_pending_invoices
    Customer.find(failed_invoices.pluck(:customer_id).uniq)
  end

  def failed_invoices
    invoices.joins(:transactions).where("result = 'failed'")
  end

  def self.most_items(quantity)
    select( "merchants.*", "SUM(invoice_items.quantity) AS total_items")
    .joins(:invoices => [:transactions, :invoice_items])
    .where(transactions: {result: "success"})
    .group(:id).order("total_items DESC")
    .take(quantity.to_i)
  end
end
