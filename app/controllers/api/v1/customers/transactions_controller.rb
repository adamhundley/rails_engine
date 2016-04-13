module Api
  module V1
    class Customers::TransactionsController  < ApiController
      def index
        respond_with Customer.find(params[:customer_id]).transactions
      end
    end
  end
end
