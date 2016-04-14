class Customer < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :merchants, through: :invoices

  def self.random
    all.order("RANDOM()").first
  end

  def favorite_merchant
    merchants.select('merchants.*', 'COUNT(transactions.id) AS transaction_count').joins(:transactions).group(:id).where(transactions:{result: "success"}).order("transaction_count DESC").limit(1).first
  end
end
