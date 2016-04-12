module Api
  module V1
    class Merchants::FinderController  < ApiController
      include ApiBaseMethods
      respond_to :json

      private
        def strong_params
          params.permit(:id, :name, :created_at, :updated_at)
        end

        def model
          Merchant
        end
    end
  end
end
