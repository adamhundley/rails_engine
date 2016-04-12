class MerchantFinder
  def self.find(params)
    if params[:name]
      Merchant.find_by("name ILIKE ?", params[:name])
    else
      Merchant.find_by(params)
    end
  end

  def self.find_all(params)
    if params[:name]
      Merchant.where("name ILIKE ?", params[:name])
    else
      Merchant.where(params)
    end
  end

  def self.random
    Merchant.all.order("RANDOM()").first
  end
end
