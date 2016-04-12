class Merchant < ActiveRecord::Base
  validates :name, presence: true

  def self.random
    all.order("RANDOM()").first
  end
end
