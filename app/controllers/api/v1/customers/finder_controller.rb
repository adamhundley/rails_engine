module Api
  module V1
    class Customers::FinderController  < ApiController
      include ApiBaseMethods
      private
        def strong_params
          params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
        end

        def model
          Customer
        end
    end
  end
end
