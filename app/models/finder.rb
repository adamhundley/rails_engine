class Finder
  def self.find(controller, params)
    model = controller.split('/')[-1].classify.constantize
    if params[:name]
      model.find_by("name ILIKE ?", params[:name])
    elsif params[:first_name]
      model.find_by("first_name ILIKE ?", params[:first_name])
    elsif params[:last_name]
      model.find_by("last_name ILIKE ?", params[:last_name])
    else
      model.find_by(params)
    end
  end

  def self.find_all(controller, params)
    model = controller.split('/')[-1].classify.constantize
    if params[:name]
      model.where("name ILIKE ?", params[:name])
    elsif params[:first_name]
      model.where("first_name ILIKE ?", params[:first_name])
    elsif params[:last_name]
      model.where("last_name ILIKE ?", params[:last_name])
    else
      model.where(params)
    end
  end

  def self.random(controller)
    model = controller.split('/')[-1].classify.constantize
    model.all.order("RANDOM()").first
  end

end
