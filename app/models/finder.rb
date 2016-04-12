class Finder
  def self.find(model, params)
    if params[:name]
      model.find_by("name ILIKE ?", params[:name])
    elsif params[:first_name]
      model.find_by("first_name ILIKE ?", params[:first_name])
    elsif params[:last_name]
      model.find_by("last_name ILIKE ?", params[:last_name])
    elsif params[:description]
      model.find_by("description ILIKE ?", params[:description])
    else
      model.find_by(params)
    end
  end

  def self.find_all(model, params)
    if params[:name]
      model.where("name ILIKE ?", params[:name])
    elsif params[:first_name]
      model.where("first_name ILIKE ?", params[:first_name])
    elsif params[:last_name]
      model.where("last_name ILIKE ?", params[:last_name])
    elsif params[:description]
      model.where("description ILIKE ?", params[:description])
    else
      model.where(params)
    end
  end

  def self.random(model)
    model.all.order("RANDOM()").first
  end

end
