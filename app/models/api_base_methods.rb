module ApiBaseMethods
  def show
    respond_with model.find_by(strong_params)
  end

  def index
    respond_with model.where(strong_params)
  end

  def random
    respond_with model.random
  end
end
