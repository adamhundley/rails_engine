class Customer < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true

  def self.random
    all.order("RANDOM()").first
  end
end
