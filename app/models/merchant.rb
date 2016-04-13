class Merchant < ActiveRecord::Base
  validates :name, presence: true
  has_many :items
  has_many :invoices

  def self.random
    all.order("RANDOM()").first
  end
end
