class Transaction < ActiveRecord::Base
  belongs_to :invoice
  validates :result, presence: true
  validates :credit_card_number, presence: true

  def self.random
    all.order("RANDOM()").first
  end
end
