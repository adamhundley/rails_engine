module Api
  module V1
    class FinderController < ApiController
      respond_to :json

      def find
        respond_with Finder.find(model, strong_params)
      end

      def find_all
        respond_with Finder.find_all(model, strong_params)
      end

      def random
        respond_with Finder.random(model)
      end

      private

        def strong_params
          params.permit(:id, :first_name, :last_name, :credit_card_number, :invoice_id, :result, :item_id, :invoice_id, :quantity, :unit_price, :description, :status, :merchant_id, :customer_id, :name, :created_at, :updated_at)
        end

        def model
          params[:model].classify.constantize
        end
    end
  end
end
