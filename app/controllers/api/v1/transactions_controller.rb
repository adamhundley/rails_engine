module Api
  module V1
    class TransactionsController < ApiController
      def index
        respond_with Transaction.all
      end

      def show
        respond_with Transaction.find(params[:id])
      end
    end
  end
end
