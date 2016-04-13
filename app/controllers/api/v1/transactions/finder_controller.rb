module Api
  module V1
    class Transactions::FinderController  < ApiController
      include ApiBaseMethods
      private
        def strong_params
          params.permit(:id, :name, :credit_card_number, :invoice_id, :result, :created_at, :updated_at)
        end

        def model
          Transaction
        end
    end
  end
end
