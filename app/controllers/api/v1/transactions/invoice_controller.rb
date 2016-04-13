module Api
  module V1
    class Transactions::InvoiceController  < ApiController
      respond_to :json

      def index
        respond_with Transaction.find(params[:transaction_id]).invoice
      end
    end
  end
end
