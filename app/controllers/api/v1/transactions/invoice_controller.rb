module Api
  module V1
    class Transactions::InvoiceController  < ApiController
      def index
        respond_with Transaction.find(params[:transaction_id]).invoice
      end
    end
  end
end
