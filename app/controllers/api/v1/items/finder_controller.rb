module Api
  module V1
    class Items::FinderController  < ApiController
      include ApiBaseMethods
      respond_to :json

      private
        def strong_params
          params.permit(:id, :name, :unit_price, :merchant_id, :description, :created_at, :updated_at)
        end

        def model
          Item
        end
    end
  end
end
