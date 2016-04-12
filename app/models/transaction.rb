class Transaction < ActiveRecord::Base
  belongs_to :invoice
  validates :result, presence: true
  validates :credit_card_number, presence: true
end
