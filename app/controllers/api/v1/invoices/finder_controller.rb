module Api
  module V1
    class Invoices::FinderController  < ApiController
      include ApiBaseMethods
      respond_to :json

      private
        def strong_params
          params.permit(:id, :status, :merchant_id, :customer_id, :created_at, :updated_at)
        end

        def model
          Invoice
        end
    end
  end
end
