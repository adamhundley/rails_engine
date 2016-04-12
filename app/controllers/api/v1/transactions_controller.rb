module Api
  module V1
    class TransactionsController < ApiController
      respond_to :json

      def index
        respond_with Transaction.all
      end

      def show
        respond_with Transaction.find(params[:id])
      end

      def find
        respond_with Finder.find(controller, transaction_params)
      end

      def find_all
        respond_with Finder.find_all(controller, transaction_params)
      end

      def random
        respond_with Finder.random(controller)
      end

      private
        def transaction_params
          params.permit(:id, :name, :credit_card_number, :invoice_id, :result, :created_at, :updated_at)
        end

        def controller
          params[:controller]
        end
    end
  end
end
